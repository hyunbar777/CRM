using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace duo.CRM.Common
{
    public class Enums
    {
        /// <summary>
        /// 负责标记ajax请求以后的json数据状态
        /// </summary>
        public enum EAjaxState
        {
            /// <summary>
            /// 成功
            /// </summary>
            sucess=0,
            /// <summary>
            /// 错误异常
            /// </summary>
            error=  1,
            /// <summary>
            /// 未登录
            /// </summary>
            nologin=2
        }

        public enum EState
        {
            /// <summary>
            /// 正常
            /// </summary>
            Nomal=0,
            /// <summary>
            /// 停用
            /// </summary>
            Stop=1,
        }
    }
}
