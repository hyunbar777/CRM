using duo.CRM.Site.App_Start;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace duo.CRM.Site
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            //0.0 利用autofac实现MVC的IOC和DI
            AutofacConfig.Register();
            //1.0注册区域路由
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            //3.0 注册全局过滤器
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);


        }
    }
}
