//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace duo.CRM.Model.ModelViews
{
    using System;
    using System.Collections.Generic;
    
    using System.ComponentModel;
     using System.ComponentModel.DataAnnotations;
    public partial class wfWorkView
    {
     
    
        public int wfID { get; set; }
        public string wfTitle { get; set; }
        public int wfStatus { get; set; }
        public string wfRemark { get; set; }
        public int fCreatorID { get; set; }
        public System.DateTime fCreateTime { get; set; }
        public Nullable<int> fUpdateID { get; set; }
        public System.DateTime fUpdateTime { get; set; }
    
        public virtual ICollection<wfRequestFormView> wfRequestForm { get; set; }
        public virtual ICollection<wfWorkNodesView> wfWorkNodes { get; set; }
    }
}