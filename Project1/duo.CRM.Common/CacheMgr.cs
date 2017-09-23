using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace duo.CRM.Common
{
    public class CacheMgr
    {
        /// <summary>
        /// 根据cachekey获取缓存对象
        /// </summary>
        /// <param name="cacheKey"></param>
        /// <returns></returns>
        public static T GetData<T>(string cacheKey)
        {
            return (T)HttpRuntime.Cache[cacheKey];
        }
        /// <summary>
        /// 存入的数据不过期,在IIS重启后消失
        /// </summary>
        /// <param name="cachekey"></param>
        /// <param name="val"></param>
        public static void SetData(string cachekey,object val)
        {
            HttpRuntime.Cache[cachekey] = val;

        }
    }
}
