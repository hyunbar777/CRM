using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Security;
using System.Security.Cryptography;
namespace duo.CRM.Common
{
    public class Kits
    {
        /// <summary>
        /// 将字符串hash程MD5
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string MD5Entry(string str)
        {
            //return  FormsAuthentication.HashPasswordForStoringInConfigFile(str, "md5");
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            string outstr = BitConverter.ToString(md5.ComputeHash(UTF8Encoding.Default.GetBytes(str)));
            outstr = outstr.Replace("-", "");
            return outstr;
        }
    }
}
