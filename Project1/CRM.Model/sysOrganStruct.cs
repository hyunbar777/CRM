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
    
    public partial class sysOrganStruct
    {
        public int osID { get; set; }
        public int osParentID { get; set; }
        public string osName { get; set; }
        public string osCode { get; set; }
        public int osCateID { get; set; }
        public Nullable<int> osLevel { get; set; }
        public string osShortName { get; set; }
        public string osRemark { get; set; }
        public Nullable<int> osStatus { get; set; }
        public Nullable<int> osCreateID { get; set; }
        public System.DateTime osCreateTime { get; set; }
        public Nullable<int> osUpdateID { get; set; }
        public System.DateTime osUpdateTime { get; set; }
    
        public virtual sysKeyValue sysKeyValue { get; set; }
    }
}