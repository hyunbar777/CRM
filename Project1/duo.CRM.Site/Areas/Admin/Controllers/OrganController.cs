using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace duo.CRM.Site.Areas.Admin.Controllers
{
    using System.Web.WebPages;
    using WebHelper;
    using Common;
    using IServices;
    using Model.ModelViews;

    using Model;
    using EntityMapping;
    public class OrganController : BaseController
    {
        public OrganController(IsysOrganStructServices organSer)
        {
            base._organSer = organSer;
        }
        // GET: Admin/Organ
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult getlist()
        {
            //0.0获取kName的参数值
            string kname = Request.Form["kname"];
            object list;
            if(kname.IsEmpty())
            {
                //1.0获取组织结构中的正常数据
               list = _organSer.QueryJoin(c => true, new string[] { "sysKeyValue" }).Select(
                    c => new {
                        c.osID,
                        c.osCode,
                        c.osName,
                        c.sysKeyValue.KName,
                        c.osShortName,
                        c.osStatus,
                        c.osRemark,
                        c.osParentID
                    });
            }
            else
            {
                list = _organSer.QueryJoin(c => c.osName.Contains(kname), new string[] { "sysKeyValue" }).Select(
                  c => new {
                      c.osID,
                      c.osName,
                      c.osCode,
                      c.sysKeyValue.KName,
                      c.osShortName,
                      c.osStatus,
                      c.osRemark,
                      c.osParentID
                  });
            }
           
            //2.0  序列化 
            return Json(new { Rows = list, Total = 0 });
        }
    }
}