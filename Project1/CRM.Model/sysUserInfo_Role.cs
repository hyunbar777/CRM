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
    
    public partial class sysUserInfo_Role
    {
        public int urID { get; set; }
        public int uID { get; set; }
        public int rID { get; set; }
    
        public virtual sysRole sysRole { get; set; }
        public virtual sysUserInfo sysUserInfo { get; set; }
    }
}
