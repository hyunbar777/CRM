using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using duo.CRM.IServices;
using duo.CRM.WebHelper;
namespace duo.CRM.Site.Areas.Admin.Controllers
{
    [SkipCheckPermiss]
    public class PermissOptController : WebHelper.BaseController
    {
        public PermissOptController(IsysPermissListServices pSer)
        {
            base._permissSer = pSer;

        }
        /// <summary>
        /// 负责获取当前登录用户所在菜单的权限按钮
        /// </summary>
        /// <returns></returns>
        // GET: Admin/PermissOpt
        [HttpPost]
        public ActionResult getFunctions()
        {
            //1.0获取用户id
            int uid = UserMgr.GetCurrentUserInfo().uID;
            //2.0获取从前台传入的当前页面url
            string url = Request.Form["murl"];
            //3.0根据url从单钱用户的权限按钮缓存数据中获取指定的按钮
            var allFunctionsFromCache = _permissSer.GetFunctionsForUserByCache(uid);
            //3.0.1从allFunctionsFromCache集合中获取指定的url对应的按钮数据
            var functions = allFunctionsFromCache.Where(c => c.mUrl.ToLower() == url.ToLower());
            //4.0遍历functions拼接成ligerUIGrid中toolbar要求的json格式字符串

            System.Text.StringBuilder resJson = new System.Text.StringBuilder("[", 200);
            if (functions.Any())
            {
                foreach (var item in functions)
                {
                    //    { text: '增加', click: add, icon: 'add' },
                    resJson.Append("{ \"text\": \"" + item.fName + "\", \"click\": \"" + item.fFunction + "\", \"icon\": \"" + item.fPicName + "\" }, { \"line\": \"true\" },");
                }
                //将最后一个逗号移除
                if (resJson.Length > 1)
                {
                    resJson.Remove(resJson.Length - 1, 1);
                }
            }
            resJson.Append("]");
            var str = resJson.ToString();
            return Content(str);
        }
    }
}