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
    using System.Configuration;
    using System.Data.Entity.Validation;

    [SkipCheckPermiss]
    public class KeyvalController : BaseController
    {

        public KeyvalController(IsysKeyValueServices kser)
        {
            base._keyvalSer = kser;
        }
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        // GET: Admin/Keyval
        /// <summary>
        /// 返回视图
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult getlist()
        {
            //1.0获取一部对象传入的参数kname的值
            string kname = Request.Form["kname"];
            //2.0判断kname如果为空则执行全部查询，否则根据kname条件进行查询
            object list;
            if (kname.IsEmpty())
            {
                list = _keyvalSer.QueryOrderByDescending(c => true, c => c.KID).Select(c => new
                {
                    c.KID,
                    c.KName,
                    c.KType,
                    c.KValue
                });
            }
            else
            {
                list = _keyvalSer.QueryOrderByDescending(c => c.KName.Contains(kname), c => c.KID).Select(c => new
                {
                    c.KID,
                    c.KName,
                    c.KType,
                    c.KValue
                });
            }
            //返回json格式：{Rows：【】，Total：}
            return Json(new { Rows = list, Total = 0 });
        }

        #region  1.0新增

        
        /// <summary>
        /// 负责返回视图
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult add()
        {
            return View();
        }
        /// <summary>
        /// 负责接受参数，存入syskeyval，以json格式相应回异步对象
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult add(sysKeyValueView model)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return base.WriteError("实体验证失败");
                }
                //转换实体
                sysKeyValue entity = model.EntityMap();
                _keyvalSer.Add(entity);
                
                _keyvalSer.SaveChanges();
                return base.WriteSuccess("新增成功");
            }
       
            catch (Exception ex)
            {
                return base.WriteError(ex);
            }

        }
        #endregion

        #region 2.0编辑
        [HttpGet]
        public ActionResult edit(int id)
        {
            //1.0根据ID查询
            var model = _keyvalSer.QueryWhere(c => c.KID == id).FirstOrDefault();
            //2.0将老数据传入视图

            return View(model.EntityMap());
        }
        [HttpPost]
        public ActionResult edit(int id,sysKeyValueView model)
        {         
            try
            {
                if(ModelState.IsValid==false)
                {
                    return WriteError("实体验证失败");
                }
                //1.0将model中的kid不全
                model.KID = id;
                sysKeyValue entity = model.EntityMap();
                _keyvalSer.Edit(entity, new string[]
                {
                "KType","KName","KValue","KRemark"
                });
                _keyvalSer.SaveChanges();
                return WriteSuccess("数据编辑成功");
            }
            catch (Exception ex)
            {

                return WriteError(ex);
            }
        }
        #endregion

        #region 3.0删除
        [HttpPost]
        public ActionResult del(string id)
        {
            try
            {
                //1.0将ID打断成一个数组
                string[] ids = id.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                //2.0遍历数组，物理删除
                sysKeyValue model;
                foreach (var kid in ids)
                {
                    //实例化要删除的数据实体，此时没有追加到ef中
                    model = new sysKeyValue()
                    {
                        KID=int.Parse(kid),
                    };
                    //追加到ef容器
                    _keyvalSer.Delete(model, false);
                }
                //批量删除
                _keyvalSer.SaveChanges();
                return WriteSuccess("数据删除成功");
            }
            catch (Exception ex)
            {

                return WriteError(ex);
            }
        }
        #endregion
    }
}