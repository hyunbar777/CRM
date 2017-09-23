﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class ASPPROJECT1Entities : DbContext
    {
        public ASPPROJECT1Entities()
            : base("name=ASPPROJECT1Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<sysFunction> sysFunction { get; set; }
        public virtual DbSet<sysKeyValue> sysKeyValue { get; set; }
        public virtual DbSet<sysMenus> sysMenus { get; set; }
        public virtual DbSet<sysOrganStruct> sysOrganStruct { get; set; }
        public virtual DbSet<sysPermissList> sysPermissList { get; set; }
        public virtual DbSet<sysRole> sysRole { get; set; }
        public virtual DbSet<sysUserInfo> sysUserInfo { get; set; }
        public virtual DbSet<sysUserInfo_Role> sysUserInfo_Role { get; set; }
        public virtual DbSet<wfProcess> wfProcess { get; set; }
        public virtual DbSet<wfRequestForm> wfRequestForm { get; set; }
        public virtual DbSet<wfWork> wfWork { get; set; }
        public virtual DbSet<wfWorkBranch> wfWorkBranch { get; set; }
        public virtual DbSet<wfWorkNodes> wfWorkNodes { get; set; }
    
        public virtual ObjectResult<Usp_GetFunctionsForUserid_Result> Usp_GetFunctionsForUserid(Nullable<int> uid)
        {
            var uidParameter = uid.HasValue ?
                new ObjectParameter("uid", uid) :
                new ObjectParameter("uid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Usp_GetFunctionsForUserid_Result>("Usp_GetFunctionsForUserid", uidParameter);
        }
    
        public virtual ObjectResult<Usp_GetFunctionsForUsers_Result> Usp_GetFunctionsForUsers(Nullable<int> uid)
        {
            var uidParameter = uid.HasValue ?
                new ObjectParameter("uid", uid) :
                new ObjectParameter("uid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Usp_GetFunctionsForUsers_Result>("Usp_GetFunctionsForUsers", uidParameter);
        }
    
        public virtual ObjectResult<Usp_GetPermissMenusForUser_Result> Usp_GetPermissMenusForUser(Nullable<int> uid)
        {
            var uidParameter = uid.HasValue ?
                new ObjectParameter("uid", uid) :
                new ObjectParameter("uid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Usp_GetPermissMenusForUser_Result>("Usp_GetPermissMenusForUser", uidParameter);
        }
    }
}
