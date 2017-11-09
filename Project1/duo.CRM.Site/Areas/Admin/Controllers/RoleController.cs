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
        //[HttpPost]
        //public ActionResult add()
        //{
        //    return View();
        //}
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
            var list = _organSer.QueryWhere(c => c.osStatus == (int)Enums.EState.Nomal).Select(c => new
            {
                c.osID,
                c.osName,
                c.osParentID
            });
            return Json(list);
        }
        [HttpGet]
        public ActionResult setPermiss(int id)
        {
            ViewBag.rid = id;
            return View();
        }
        [HttpPost, SkipCheckPermiss]
        public ActionResult getmfTree()
        {
            var mlist = _menuSer.QueryWhere(c => c.mStatus == (int)Enums.EState.Nomal).Select(c => new
            {
                Name = c.mName,
                id = "m" + c.mID,
                pid = "m" + c.mParentID
            }).ToList();

            var flist = _funSer.QueryWhere(c => c.fStatus == (int)Enums.EState.Nomal && c.fID > 0).Select(c => new
            {
                Name = c.fName,
                id = "f" + c.fID,
                pid = "m" + c.mID
            }).ToList();

            mlist.AddRange(flist);

            return Json(mlist);
        }
    }
}