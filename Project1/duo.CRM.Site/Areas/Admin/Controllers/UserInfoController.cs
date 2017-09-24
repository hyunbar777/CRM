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
    using EntityMapping;

    public class UserInfoController : BaseController
    {
        public UserInfoController(
            IsysUserInfoServices user,
            IsysOrganStructServices oser,
            IsysRoleServices rser,
            IsysUserInfo_RoleServices urser)
        {
            base._organSer = oser;
            base._userinfoSer = user;
            base._roleSer = rser;
            base._userinfoRoleSer = urser;
        }
        #region  1.0返回用户列表
        // GET: Admin/UserInfo
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// 接收ligerGrid的请求
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult getlist()
        {
            //page是ligerGrid固定传入的名称,表示当前的页码
            string pageindex = Request.Form["page"];
            //pagesize是ligerGrid固定传入的名称,表示当前的页容量
            string pagesize = Request.Form["pagesize"];
            string kname = Request.Form["kname"];

            //2.0 分页参数合法化验证
            int ipageindex = pageindex.AsInt();
            int ipagesize = pagesize.AsInt();
            int rowcount = 0;

            //3.0获取分页数据
            object list;
            if (kname.IsEmpty())
            {
                list = _userinfoSer.QueryByPage(ipageindex, ipagesize, out rowcount, c => c.uID, c => true).Select(
                    c => new
                    {
                        c.uID,
                        c.uLoginName,
                        c.uRealName,
                        c.uTelphone,
                        c.uMobile,
                        c.uEmail,
                        c.uQQ,
                        c.uGender,
                        c.uStatus,
                        c.uWorkGroup
                    }
                    );

            }
            else
            {
                list = _userinfoSer.QueryByPage(ipageindex, ipagesize, out rowcount, c => c.uID, c => c.uLoginName.Contains(kname) || c.uRealName.Contains(kname)).Select(
                    c => new
                    {
                        c.uID,
                        c.uLoginName,
                        c.uRealName,
                        c.uTelphone,
                        c.uMobile,
                        c.uEmail,
                        c.uQQ,
                        c.uGender,
                        c.uStatus
                    }
                    );
            }
            return Json(new { Rows = list, Total = rowcount });
        }
        #endregion


        #region 帮助方法
        private void SetCompany()
        {
            var list = _organSer.QueryWhere(c => c.osCateID == 6);
            list.Insert(0, new sysOrganStruct()
            {
                osID = -1,
                osName = "请选择"
            });
            SelectList clist = new SelectList(list, "osID", "osName");
            ViewBag.company = clist;
        }
        #endregion

        #region 2.0 新增
        public ActionResult add()
        {
            SetStatus();
            SetCompany();
            return View();
        }
        [HttpPost]
        public ActionResult add(UserInfoAdd model)
        {
            if (ModelState.IsValid == false)
            {
                return WriteError("验证失败");
            }
            try
            {
                sysUserInfo user = new sysUserInfo()
                {
                    uLoginName = model.uLoginName,
                    uStatus = model.uStatus,
                    uGender = model.uGender,
                    uEmail = model.uEmail,
                    uRealName = model.uRealName,
                    uMobile = model.uMobile,
                    uLoginPWD = Kits.MD5Entry("123456"),
                    uUpdateTime = DateTime.Now,
                    uCreateID = UserMgr.GetCurrentUserInfo().uID,
                    uCreateTime = DateTime.Now,
                    uCompanyID = model.uCompanyID,
                    uDepID = model.uDepID,
                    uWorkGroup = model.uWorkGroupID
                };

                _userinfoSer.Add(user);
                _userinfoSer.SaveChanges();
                return WriteSuccess("新增成功");
            }
            catch (Exception ex)
            {
                return WriteError(ex);
            }
        }
        #endregion

        /// <summary>
        /// 检查用户是否存在
        /// </summary>
        /// <returns></returns>
        [SkipCheckPermiss]
        public ActionResult checkuser()
        {
            string username = Request.Form["uLoginName"];

            bool isexist = _userinfoSer.QueryWhere(c => c.uLoginName == username).Any();
            if (isexist)
            {
                return Content("false");
            }
            return Content("true");
        }

        /// <summary>
        /// 根据公司id获取部门数据,或者部门下面的工作组数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>

        public ActionResult getDep(int id)
        {
            var deplist = _organSer.QueryWhere(c => c.osParentID == id);
            deplist.Insert(0, new sysOrganStruct()
            {
                osName = "请选择",
                osID = -1,
            });
            var dlist = deplist.Select(c => new { c.osID, c.osName });
            return WriteSuccess("OK", dlist);

        }

    }
}