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
    using System.Configuration;
    using System.Data.Entity.Validation;

    public class FunctionController : BaseController
    {
        public FunctionController(IsysFunctionServices fSer, IsysMenusServices mSer)
        {
            base._funSer = fSer;
            base._menuSer = mSer;
        }
        // GET: Admin/Function
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">sysFunction中的mID的值</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult getlist(int id)
        {
            try
            {
                //return Json(new { Rows = null, Total = 0 });
                var list = _funSer.QueryWhere(c => c.mID == id).Select(c => new
                {
                    c.fID,
                    c.fName,
                    c.fFunction,
                    c.fPicName,
                    c.fStatus
                });
                return Json(new { Rows = list, Total = 0 });
            }
            catch (Exception ex)
            {
                return WriteError(ex);//{status:1,msg:ex}
            }

        }

        [HttpPost, SkipCheckPermiss]
        public ActionResult getMenusTree()
        {
            var list = _menuSer.QueryWhere(c => c.mStatus == (int)Enums.EState.Nomal).Select(c => new
            {
                c.mParentID,
                c.mName,
                c.mID
            });
            return Json(list);
        }
        [HttpGet]
        public ActionResult add(int id)
        {
            base.SetStatus();
            return View();
        }
        [HttpPost]
        public ActionResult add(int id, sysFunctionView model)
        {
            try
            {
                if (ModelState.IsValid == false)
                {
                    return WriteError("实体验证失败");
                }
                model.mID = id;
                model.fCreateTime = DateTime.Now;
                model.fUpdateTime = DateTime.Now;
                model.fCreatorID = UserMgr.GetCurrentUserInfo().uID;

                var entity = model.EntityMap();
                _funSer.Add(entity);
                _funSer.SaveChanges();
                return WriteSuccess("新增成功");

            }
            catch (Exception ex)
            {
                return WriteError(ex);
            }
        }

        [HttpGet]
        public ActionResult edit(int id)
        {
            //1.0根据ID查询
            var model = _funSer.QueryWhere(c => c.mID == id).FirstOrDefault();
            //2.0将老数据传入视图

            return View(model.EntityMap());
        }
        [HttpPost]
        public ActionResult edit(int id, sysFunctionView model)
        {
            try
            {
                if (ModelState.IsValid == false)
                {
                    return WriteError("实体验证失败");
                }
                //1.0将model中的kid不全
                model.mID = id;
                sysFunction entity = model.EntityMap();
                _funSer.Edit(entity, new string[]
                {

                "mParentID",
                "mName",
                "mID"
                });
                _funSer.SaveChanges();
                return WriteSuccess("数据编辑成功");
            }
            catch (Exception ex)
            {

                return WriteError(ex);
            }
        }

    }
}