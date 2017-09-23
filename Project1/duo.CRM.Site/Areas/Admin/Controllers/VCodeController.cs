using duo.CRM.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace duo.CRM.Site.Areas.Admin.Controllers
{
    using System.Drawing;
    using WebHelper;
    [SkipCheckLogin, SkipCheckPermiss]
    public class VCodeController : Controller
    {
        // GET: Admin/VCode

        [HttpGet]
        public ActionResult VCode()
        {
            //1.0产生一个验证码的字符串
            string vcode = GetVCode(1);
            //2.0将验证码存入session中
            Session[Keys.vcode] = vcode;
            byte[] imgbuffer;
            //3.0将验证码画到图片上
            using (Image img = new Bitmap(65, 25))
            {
                using (Graphics g = Graphics.FromImage(img))
                {
                    g.Clear(Color.White);

                    g.DrawString(vcode,
                        new Font("黑体", 16, FontStyle.Bold | FontStyle.Strikeout | FontStyle.Italic),
                        new SolidBrush(Color.Red), 4, 4);
                }
                //定义一个空的内存流对象
                using (System.IO.MemoryStream ms = new System.IO.MemoryStream())
                {
                    //讲图片对象中的内存流写入ms中
                    img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                    //将ms中的数据转换程byte【】
                    imgbuffer = ms.ToArray();
                }
            }
                return File(imgbuffer,"image/jpeg");
        }
        Random r = new Random();
        public string GetVCode(int p)
        {
            //ctrl+U变大小写
            string str = "23456789abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ";
            string res = string.Empty;
            int length = str.Length;
            for (int i = 0;i<p;i++)
            {
                res += str[r.Next(length)];
            }
            return res;
        }
    }
}