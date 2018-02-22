using duo.CRM.WebHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace duo.CRM.Site.Areas.Admin.Controllers
{
    using System.Web.WebPages;
    using WebHelper;
    using Common;
    using IServices;
    using Model.ModelViews;
    using Model;
    using System.Transactions;

    public class RoleController : BaseController
    {
        public RoleController(
            IsysRoleServices roleSer,
            IsysOrganStructServices oSer,
            IsysMenusServices mSer,
            IsysFunctionServices fSer,
            IsysPermissListServices pSer)
        {
            base._organSer = oSer;
            base._roleSer = roleSer;
            base._menuSer = mSer;
            base._funSer = fSer;
            base._permissSer = pSer;
        }
        [HttpGet]
        // GET: Admin/Role
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult getlist(int id)
        {
            var list = _roleSer.QueryWhere(c => c.eDepID == id).Select(c => new
            {
                c.rID,
                c.rName,
                c.rRemark,
                c.rStatus,
                c.rSort
            });
            return Json(new { Rows = list, Total = 0 });
        }
        [HttpGet]
        public ActionResult add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult add(sysRoleView model)
        {
            return View();
        }
        public ActionResult edit()
        {
            return View();
        }
        //public ActionResult del()
        //{

        //}
        [HttpPost, SkipCheckPermiss]
        public ActionResult getOrganTree()
        {
            try
            {
                var list = _organSer.QueryWhere(c => c.osStatus == (int)Enums.EState.Nomal).Select(c => new
                {
                    c.osID,
                    c.osName,
                    c.osParentID
                });
                return Json(list);
            }
            catch (Exception ex)
            {
                return WriteError(ex);
            }

        }
        [HttpGet]
        public ActionResult setPermiss(int id)
        {
            ViewBag.rid = id;
            return View();
        }
        /// <summary>
        /// 格式：角色id-菜单id,按钮id|菜单id,按钮id|
        /// 19-m1,0|m4,0|m4,f1 -->Replace("m", "").Replace("f", "") -->19-1,0|4,0|4,1
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult setPermiss()
        {
            try
            {
                string id = Request.Form["p"];
                //1.0分解id值
                string[] arr = id.Split('-');
                int rid = arr[0].AsInt();
                string[] permissListRow = arr[1].Replace("m", "").Replace("f", "").Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);

                //2.0 先将syspermisslist中删除rid的权限数据
                _permissSer.QueryWhere(c => c.rID == rid).ForEach(c => _permissSer.Delete(c, true));

                //3.0批量将最新的数据插入
                string[] midfids;
                sysPermissList model;
                foreach (var midfid in permissListRow)
                {
                    midfids = midfid.Split(',');

                    //2.0
                    model = new sysPermissList()
                    {
                        rID = rid,
                        mID = midfids[0].AsInt(),
                        fID = midfids[1].AsInt(),
                        plCreateTime = DateTime.Now,
                        plCreateID = UserMgr.GetCurrentUserInfo().uID
                    };
                    //3.0 将model追加到EF容器
                    _permissSer.Add(model);
                }
                //4.0 开启分布式事务
                using(TransactionScope scop = new TransactionScope())
                {
                    _permissSer.SaveChanges();

                    //提交事务
                    scop.Complete();
                }
                return WriteSuccess("权限设置成功");
            }
            catch (Exception ex)
            {

                return WriteError(ex);
            }

        }
        [HttpPost, SkipCheckPermiss]
        public ActionResult getmfTree(int id)
        {
            //1.0根据id从表sysPermisslist中获取所有的权限数据
            var plist = _permissSer.QueryWhere(c => c.rID == id);

            //2.0获取sysMenus表中的所有有效数据
            var mlist = _menuSer.QueryWhere(c => c.mStatus == (int)Enums.EState.Nomal).Select(c => new
            {
                Name = c.mName,
                id = "m" + c.mID,
                pid = "m" + c.mParentID,
                ischecked = plist.Any(p => p.mID == c.mID)
            }).ToList();
            //3.0获取sysFunction表中的所有有效数据，通过过滤fid==0的数据
            var flist = _funSer.QueryWhere(c => c.fStatus == (int)Enums.EState.Nomal && c.fID > 0).Select(c => new
            {
                Name = c.fName,
                id = "f" + c.fID,
                pid = "m" + c.mID,
                ischecked = plist.Any(p => p.fID == c.fID)
            }).ToList();

            mlist.AddRange(flist);

            return Json(mlist);
        }
    }
}