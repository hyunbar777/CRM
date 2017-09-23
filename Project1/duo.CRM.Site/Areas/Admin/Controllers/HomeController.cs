using duo.CRM.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace duo.CRM.Site.Areas.Admin.Controllers
{
    using IServices;
    using Model;
    using WebHelper;
    [SkipCheckPermiss]
    public class HomeController : BaseController
    {
        public HomeController(IsysMenusServices mser)
        {
            base._menuSer = mser;
        }
        // GET: Admin/Home
        public ActionResult Index()
        {
            ////1.0获取菜单表的所有有效数据，并且按照排序号进行排列
            //var list = _menuSer.QueryOrderBy(c => c.mStatus == (int)Enums.EState.Nomal, c => c.mSortID);
            ////2.0将数据viewbag传入视图
            //ViewBag.mlist = list;
            //Usp_GetPermissMenusForUser
            var list = _menuSer.RunProc<sysMenus>("Usp_GetPermissMenusForUser " + UserMgr.GetCurrentUserInfo().uID);
            ViewBag.mlist = list;
            return View();
        }
    }
}