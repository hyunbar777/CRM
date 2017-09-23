using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace duo.CRM.WebHelper
{
    using Common;
    using IServices;
    using System.Web.Mvc;
    using Autofac;
    /// <summary>
    /// 检查权限的全局过滤器
    /// </summary>
    public class CheckPermissAttr:ActionFilterAttribute
    {

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            //判断是否有贴跳过登录检查的特性标签
            if (filterContext.ActionDescriptor.ControllerDescriptor.IsDefined(typeof(SkipCheckPermiss), false))
            {
                return;
            }
            if (filterContext.ActionDescriptor.IsDefined(typeof(SkipCheckPermiss), false))
            {
                return;
            }

            //1.0获取当前出发此OnActionExecuted的action
            string actionName = filterContext.ActionDescriptor.ActionName.ToLower();
            //2.0获取控制名称
            string controllerName = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName.ToLower();
            //3.0获取区域名
            string areaName = string.Empty;
            if(filterContext.RouteData.DataTokens.ContainsKey("area"))
            {
                areaName = filterContext.RouteData.DataTokens["area"].ToString().ToLower();

            }
            //4.0根据上三个条件去当前用户权限按钮缓存数据中查找，如果没有表示没有权限
            //2.00先从缓存中获取autofac的容器对象
            var cont = CacheMgr.GetData<IContainer>(Keys.AutofacContainer);
            IsysPermissListServices iperSer = cont.Resolve<IsysPermissListServices>();
            var list = iperSer.GetFunctionsForUserByCache(UserMgr.GetCurrentUserInfo().uID);
            var isOk = list.Any(c => c.mArea.ToLower() == areaName
              && c.mController.ToLower() == controllerName 
              && c.fFunction.ToLower() == actionName);
            if(isOk==false)
            {
                ToLogin(filterContext);
            }

        }
        private static void ToLogin(ActionExecutedContext filterContext)
        {
            //1.0判断挡前请求是否为一个ajax请求
            bool isAjaxRequest = filterContext.HttpContext.Request.IsAjaxRequest();
            if (isAjaxRequest)
            {
                //ajax的请求，则返回json格式
                JsonResult json = new JsonResult();
                json.Data = new
                {
                    status = Enums.EAjaxState.nologin,
                    msg = "您没有权限访问此页面"
                };
                json.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
                filterContext.Result = json;
            }
            else
            {
                //浏览器的请求
                ViewResult view = new ViewResult();
                view.ViewName = "/Areas/Admin/Views/Shared/NoPermiss.cshtml";
                filterContext.Result = view;
            }
        }
    }
}
