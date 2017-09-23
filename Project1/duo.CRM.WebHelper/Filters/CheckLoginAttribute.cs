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
    /// 统一登录验证过滤器
    /// </summary>
    public class CheckLoginAttribute : ActionFilterAttribute
    {
        /// <summary>
        /// 统一验证session【keys.uinfo】如果是null跳转到登录页
        /// </summary>
        /// <param name="filterContext"></param>
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            //判断是否有贴跳过登录检查的特性标签
            if (filterContext.ActionDescriptor.ControllerDescriptor.IsDefined(typeof(SkipCheckLogin), false))
            {
                return;
            }
            if (filterContext.ActionDescriptor.IsDefined(typeof(SkipCheckLogin), false))
            {
                return;
            }
            if (filterContext.HttpContext.Session[Keys.uinfo] == null)
            {
                //1.0查询cookie【keys.Ismember]是否为空，如果成立则模拟用户的登录，
                //在将用户实体数据存入session[keys.uinfo】中

                if (filterContext.HttpContext.Request.Cookies[Keys.IsMember] != null)
                {
                    //1.0取出cookie中存入的uid的值
                    string uid = filterContext.HttpContext.Request.Cookies[Keys.IsMember].Value;

                    //2.0根据uid查询出实体 
                    //2.00先从缓存中获取autofac的容器对象
                    var cont = CacheMgr.GetData<IContainer>(Keys.AutofacContainer);
                    //2.01找autofac容器获取IsysUserInfoServices
                    IsysUserInfoServices userSer = cont.Resolve<IsysUserInfoServices>();
                    //2.03根据userser集合uid查询数据
                    int iuserid = int.Parse(uid);
                    var userinfo = userSer.QueryWhere(c => c.uID == iuserid).FirstOrDefault();
                    if (userinfo != null)
                    {
                        filterContext.HttpContext.Session[Keys.uinfo] = userinfo;

                    }
                    else
                    {
                        ToLogin(filterContext);
                    }

                }

                ////法一：
                // filterContext.HttpContext.Response.Redirect("/Admin/Login/Login");
                //法二：
                //ContentResult cr = new ContentResult();
                //cr.Content = "<script>alert('您未登录');window.location='/Admin/Login/Login'</script>";
                //filterContext.Result = cr;
                else
                {
                    ToLogin(filterContext);
                }
            }
            base.OnActionExecuting(filterContext);
        }

        private static void ToLogin(ActionExecutingContext filterContext)
        {
            //1.0判断挡前请求是否为一个ajax请求
            bool isAjaxRequest = filterContext.HttpContext.Request.IsAjaxRequest();
            if(isAjaxRequest)
            {
                //ajax的请求，则返回json格式
                JsonResult json = new JsonResult();
                json.Data = new
                {
                    status = Enums.EAjaxState.nologin,
                    msg = "您未登录或者登录已经失效,请重新登录"
                };
                json.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
                filterContext.Result = json;
            }
            else
            {
                //浏览器的请求
                ViewResult view = new ViewResult();
                view.ViewName = "/Areas/Admin/Views/Shared/Tip.cshtml";
                filterContext.Result = view;
            }
        }
    }
}
