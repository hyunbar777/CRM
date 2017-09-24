using duo.CRM.EntityMapping;
using duo.CRM.IServices;
using duo.CRM.Model;
using duo.CRM.Model.ModelViews;
using duo.CRM.WebHelper;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace duo.CRM.Site.Areas.Admin.Controllers
{
    public class MenusController : BaseController
    {
        public MenusController(IsysMenusServices mSer)
        {
            base._menuSer = mSer;
        }
        /// <summary>
        /// 负责返回列表视图 index.cshtml
        /// </summary>
        /// <returns></returns>
        // GET: Admin/Menus
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// 负责接收index.cshtml中的 ligerGrid的ajax请求，post
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult getlist()
        {
            //1.0根据条件获取index.cshtml上所有字段
            //1.0获取当前post请求提交过来的参数
            string kname = Request.Form["kname"];
            //2.0根据kname的空值和非空进行逻辑获取操作
            object list = null;
            if (string.IsNullOrEmpty(kname))
            {
                list = _menuSer.QueryWhere(c=>true).Select( c => new { c.mID, c.mName, c.mUrl, c.mArea, c.mController, c.mAction, c.mSortID, c.mPicture, c.mStatus, c.mParentID }).ToList();
            }
            else
            {
                list = _menuSer.QueryWhere(c=>c.mName.Contains(kname)).Select(c => new { c.mID, c.mName, c.mUrl, c.mArea, c.mController, c.mAction, c.mSortID, c.mPicture, c.mStatus, c.mParentID }).ToList();
            }
            //3.0将查询出来的菜单数据封装成ligerGrid要求的json数据格式
            return Json(new { Rows = list, Total = 0 });
        }

        #region 新增
        public ActionResult add(int id)
        {
            SetStatus();
            return View();
        }
        [HttpPost]
        public ActionResult add(int id ,sysMenusView model)
        {
            try
            {
                //1.0实体属性合法性验证
                if (ModelState.IsValid == false)
                {
                    SetStatus();
                    return View();
                }
                //2.0保存数据
                model.mParentID = id;
                model.mCreateTime = DateTime.Now;
                model.mCreatorID = UserMgr.GetCurrentUserInfo().uID;
                model.mUpdateTime = DateTime.Now;
                model.mUpdateID= UserMgr.GetCurrentUserInfo().uID;
                model.mExp1 = null;
                model.mExp2 = null;


                sysMenus entity = model.EntityMap();
                
                //2.0.2 保存
                _menuSer.Add(entity);
                _menuSer.SaveChanges();
                return base.WriteSuccess("数据保存成功");
            }
            //catch (DbEntityValidationException dbEx)
            //{
            //    string s = null;
            //    foreach (var validationErrors in dbEx.EntityValidationErrors)
            //    {
            //        foreach (var validationError in validationErrors.ValidationErrors)
            //        {


            //            s += string.Format("Class: {0}, Property: {1}, Error: {2}",
            //                 validationErrors.Entry.Entity.GetType().FullName,
            //                 validationError.PropertyName,
            //                 validationError.ErrorMessage);
            //        }
            //    }
            //    return base.WriteError(s);
            //}
            catch (Exception ex)
            {
                return WriteError(ex.Message);
            }
        }
        #endregion


        #region 编辑
        public ActionResult edit(int id)
        {
            SetStatus();
            var model = _menuSer.QueryWhere(c => c.mID == id).FirstOrDefault();
            //将数据实体sysmenus 转换成 sysmenusview
            var modelview = model.EntityMap();

            //将modelview传给视图
            return View(modelview);
        }
        [HttpPost]
        public ActionResult edit(int id,sysMenusView model)
        {
            try
            {
                //1.0实体属性合法性验证
                if (ModelState.IsValid == false)
                {
                    SetStatus();
                    return View();
                }
                var entity = _menuSer.QueryWhere(c => c.mID == id).FirstOrDefault();


                entity.mName = model.mName;
                entity.mUrl = model.mUrl;
                entity.mArea = model.mArea;
                entity.mController = model.mController;
                entity.mAction = model.mAction;
                entity.mSortID = model.mSortid;
                entity.mStatus = model.mStatus;
                entity.mLevel = model.mLevel;
                entity.mPicture = model.mPicture;

                //3.0 保存
                _menuSer.SaveChanges();

                return base.WriteSuccess("数据更新成功");
            }
            catch (Exception ex)
            {
                return WriteError(ex.Message);
            }
        }
        #endregion
    }
}