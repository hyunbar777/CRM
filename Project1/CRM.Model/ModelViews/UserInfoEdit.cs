using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace duo.CRM.Model.ModelViews
{
    public class UserInfoEdit
    {
        public int uID { get; set; }
        [DisplayName("用户名"), Required(ErrorMessage = "非空")]
        public string uLoginName { get; set; }
        public string uLoginPWD { get; set; }
        [DisplayName("真是姓名")]
        public string uRealName { get; set; }
        [DisplayName("手机"), Required(ErrorMessage = "非空")]
        public string uMobile { get; set; }
        [DisplayName("电邮"), Required(ErrorMessage = "非空")]
        public string uEmail { get; set; }
        public string uQQ { get; set; }
        [DisplayName("性别")]
        public int uGender { get; set; }
        [DisplayName("状态")]
        public int uStatus { get; set; }
        [DisplayName("所属公司")]
        public int uCompanyID { get; set; }
        [DisplayName("所属部门")]
        public Nullable<int> uDepID { get; set; }
        [DisplayName("所属工作组")]
        public Nullable<int> uWorkGroupID { get; set; }
        public string uRemark { get; set; }
        public int uCreatorID { get; set; }
        public System.DateTime uCreateTime { get; set; }
        public Nullable<int> uUpdateID { get; set; }
        public System.DateTime uUpdateTime { get; set; }
    }
}
