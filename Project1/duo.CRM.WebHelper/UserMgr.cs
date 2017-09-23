using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace duo.CRM.WebHelper
{
    using System.Web;
    using Model;
    using Common;

    public class UserMgr
    {
        public static sysUserInfo GetCurrentUserInfo()
        {
            if(HttpContext.Current.Session[Keys.uinfo] !=null)
            {
                return HttpContext.Current.Session[Keys.uinfo] as sysUserInfo;
            }
            return new sysUserInfo() { };
        }
    }
}
