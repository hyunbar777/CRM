//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace duo.CRM.Services
{
    using System;
    using System.Collections.Generic;
    
    using Model;
    using IServices;
    using IRepository;
    public partial class sysOrganStructServices:BaseServices<sysOrganStruct>,IsysOrganStructServices
    {
    	public IsysOrganStructRepository _dal;
    	#region 定义构造函数，接受antuofac将仓储层的具体实现类的对象注入到此类中
    	public sysOrganStructServices(IsysOrganStructRepository dal)
    	{
    		this._dal=dal;
    		base._baseDal=dal;
    	}
    	#endregion
    }
}
