using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace duo.CRM.Common
{
   public class Keys
    {
        public const string vcode = "crm15vcode";
        /// <summary>
        /// 用于存放登录成功的用户实体的session key
        /// </summary>
        public const string uinfo = "crm15uifo";

        /// <summary>
        /// 用于存放登录成功以后的用户id的cookie key
        /// </summary>
        public const string IsMember = "crm15IsMember";
        /// <summary>
        /// 用于缓存整个autofac的容器对象的缓存key
        /// </summary>
        public const string AutofacContainer = "crm15autofacContainer";

        /// <summary>
        /// 用于缓存某个用户的权限按钮数据的缓存key
        /// </summary>
        public const string PermissFunctionsForUser = "PermissFunctionsForUser";
    }
}
