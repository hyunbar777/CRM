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
    public partial class sysRoleView
    {
     
    
        public int rID { get; set; }
        public Nullable<int> eDepID { get; set; }
        public int RoleType { get; set; }
        public string rName { get; set; }
        public string rRemark { get; set; }
        public int rSort { get; set; }
        public int rStatus { get; set; }
        public int rCreatorID { get; set; }
        public System.DateTime rCreateTime { get; set; }
        public Nullable<int> rUpdateID { get; set; }
        public System.DateTime rUpdateTime { get; set; }
    
        public virtual sysKeyValueView sysKeyValue { get; set; }
        public virtual sysOrganStructView sysOrganStruct { get; set; }
        public virtual ICollection<sysPermissListView> sysPermissList { get; set; }
        public virtual ICollection<sysUserInfo_RoleView> sysUserInfo_Role { get; set; }
    }
}