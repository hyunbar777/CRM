using duo.CRM.Model.ModelViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace duo.CRM.Site.Areas.Admin.Controllers
{
    using Common;
    using IServices;
    using WebHelper;
    using System.Web.WebPages;
    using duo.CRM.Model;

    [SkipCheckLogin, SkipCheckPermiss]
    public class LoginController : BaseController
    {
        public LoginController(IsysUserInfoServices userSer,IsysPermissListServices pSer)
        {
            base._userinfoSer = userSer;
            base._permissSer = pSer;
        }

        #region 1.0登录
        /// <summary>
        /// 负责将登录视图返回
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Login()
        {
            LoginInfo info = new LoginInfo()
            {
                uLoginName = "admin",
                IsMember = false
            };
            //1.0判断cookie[keys.IsMember]！=null将登录视图上的记住三天勾上
            if (Request.Cookies[Keys.IsMember] != null)
            {
                info.IsMember = true;
            }
            return View(info);
        }
        /// <summary>
        /// 负责接收页面提交过来的数据进行登录处理
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Login(LoginInfo model)
        {
            try
            {
                //1.0实体参数合法性验证
                if (ModelState.IsValid == false)
                {
                    return WriteError("实体验证失败");
                }
                //2.0检查验证码的合法性
                string vcodeFromSession = string.Empty;
                if (Session[Keys.vcode] != null)
                {
                    vcodeFromSession = Session[Keys.vcode].ToString();
                }
                if (model.VCode.IsEmpty() || vcodeFromSession.Equals(model.VCode, StringComparison.OrdinalIgnoreCase) == false)
                {
                    return WriteError("验证码不合法");
                }
                //3.0用户名和密码的正确性
                string md5PWD = Kits.MD5Entry(model.uLoginPWD);
                var userinfo = _userinfoSer.QueryWhere(
                    c => c.uLoginName == model.uLoginName
                && c.uLoginPWD == md5PWD).FirstOrDefault();
                if (userinfo == null)
                {
                    return WriteError("用户名或密码错误");
                }
                //4.0将userinfo存入session
                Session[Keys.uinfo] = userinfo;
                //5.0判断logininfo实体model中ismember是否为true，
                //如果成立则将用户id写入cookie中
                if (model.IsMember)
                {
                    //一般要将用户ID加密成密文DES（对称加密算法），自定义密码
                    HttpCookie cookie = new HttpCookie(Keys.IsMember, userinfo.uID.ToString());
                    cookie.Expires = DateTime.Now.AddDays(3);
                    Response.Cookies.Add(cookie);
                }
                else
                {//清除cookie操作
                    HttpCookie cookie = new HttpCookie(Keys.IsMember, "");
                    cookie.Expires = DateTime.Now.AddDays(-3);
                    Response.Cookies.Add(cookie);
                }


                //5.0将当前用户的所有按钮缓存起来，
                // 选择此缓存永久有效，当管理员操作用户分配角色和设置次用户所在角色的权限菜单的时候，要是缓存你失效
                _permissSer.GetFunctionsForUserByCache(userinfo.uID);

                //6.0 返回登录成功消息
                return WriteSuccess("登录成功");
            }
            catch (Exception ex)
            {
                return WriteError(ex);
            }

        }

        #endregion

        #region 2.0等出
        [HttpGet]
        public ActionResult Logout()
        {
            //1.0清空session【keys。uifo】对象
            Session[Keys.uinfo] = null;
            //2.0

            return RedirectToAction("Login", "Login");
        }
        #endregion
    }
}