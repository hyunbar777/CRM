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
    
    public partial class sysPermissList
    {
        public int plID { get; set; }
        public int rID { get; set; }
        public int mID { get; set; }
        public int fID { get; set; }
        public int plCreateID { get; set; }
        public System.DateTime plCreateTime { get; set; }
    
        public virtual sysMenus sysMenus { get; set; }
        public virtual sysRole sysRole { get; set; }
        public virtual sysFunction sysFunction { get; set; }
    }
}
