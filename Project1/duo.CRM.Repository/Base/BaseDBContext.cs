using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
namespace duo.CRM.Repository
{
    /// <summary>
    /// 自定义EF上下文容器
    /// </summary>
    public class BaseDBContext:DbContext
    {
        public BaseDBContext() : base("name=ASPPROJECT1Entities") { }
    }
}
