//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace duo.CRM.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class wfRequestForm
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public wfRequestForm()
        {
            this.wfProcess = new HashSet<wfProcess>();
        }
    
        public int wfRFID { get; set; }
        public int wfID { get; set; }
        public string wfRFTitle { get; set; }
        public string wfRFRemark { get; set; }
        public int wfRFPriority { get; set; }
        public int wfRFStatus { get; set; }
        public string wfRFExt1 { get; set; }
        public Nullable<int> wfRFExt2 { get; set; }
        public string wfRFLogicSymbol { get; set; }
        public decimal wfRFNum { get; set; }
        public int fCreateID { get; set; }
        public System.DateTime fCreateTime { get; set; }
        public Nullable<int> fUpdateID { get; set; }
        public string fUpdateTime { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<wfProcess> wfProcess { get; set; }
        public virtual wfWork wfWork { get; set; }
    }
}
