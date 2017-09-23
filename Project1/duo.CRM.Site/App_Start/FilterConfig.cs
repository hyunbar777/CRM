using duo.CRM.WebHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace duo.CRM.Site.App_Start
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {

            filters.Add(new HandleErrorAttribute());

            //将登录验证过滤器 注册为全局过滤器，实现整个网站所有的action的登录检查
            filters.Add(new CheckLoginAttribute());
            //将权限过滤器注册为全局
            filters.Add(new CheckPermissAttr());
        }
    }
}