using duo.CRM.Common;
using duo.CRM.IServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace duo.CRM.WebHelper
{
    public class BaseController:Controller
    {
        //1 定义当前系统中所有业务成员
        protected IsysFunctionServices _funSer;
        protected IsysKeyValueServices _keyvalSer;
        protected IsysMenusServices _menuSer;
        protected IsysOrganStructServices _organSer;
        protected IsysPermissListServices _permissSer;
        protected IsysRoleServices _roleSer;
        protected IsysUserInfoServices _userinfoSer;
        protected IsysUserInfo_RoleServices _userinfoRoleSer;
        protected IwfProcessServices _processSer;
        protected IwfRequestFormServices _requestformSer;
        protected IwfWorkServices _workSer;
        protected IwfWorkBranchServices _workbranchSer;
        protected IwfWorkNodesServices _worknodesSer;

        //2.0封装ajax请求的返回方法
        protected ActionResult WriteSuccess(string msg)
        {
            return Json(new { status = (int)Enums.EAjaxState.sucess, msg = msg});
        }
        protected ActionResult WriteSuccess(string msg,object obj)
        {
            return Json(new { status = (int)Enums.EAjaxState.sucess, msg = msg,datas=obj });
        }
        protected ActionResult WriteError(string errmsg)
        {
            return Json(new { status =(int) Enums.EAjaxState.error, msg = errmsg });
        }
        protected ActionResult WriteError(Exception ex)
        {
            return Json(new { status = (int)Enums.EAjaxState.error, msg = ex.Message });
        }

        protected virtual void SetStatus()
        {
            Dictionary<int, string> dic = new Dictionary<int, string>();
            dic.Add(0, "正常");
            dic.Add(1, "停用");
            
            SelectList clist = new SelectList(dic, "Key", "Value");
            ViewBag.status = clist;

        }
    }
}
