using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace duo.CRM.Model.ModelViews
{
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    public class LoginInfo
    {
        [DisplayName("Account"), Required(ErrorMessage = "必填")]
        public string uLoginName { get; set; }
        [DisplayName("Password"), Required(ErrorMessage = "必填")]
        public string uLoginPWD { get; set; }
        [DisplayName("Security code"), Required(ErrorMessage = "必填")]
        public string VCode { get; set; }
        //是否记住三天
        public bool IsMember{get;set;}
    }
}
