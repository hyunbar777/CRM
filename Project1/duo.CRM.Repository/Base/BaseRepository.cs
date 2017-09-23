using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Linq.Expressions;
using System.Data.Entity.Infrastructure;
using duo.CRM.IRepository;
using System.Runtime.Remoting.Messaging;
namespace duo.CRM.Repository
{
    /// <summary>
    /// 统一父类，负责CURD，分页
    /// </summary>
    /// <typeparam name="TEntity"></typeparam>
    public class BaseRepository<TEntity> :IBaseRepository<TEntity> where TEntity:class
    {

        BaseDBContext _db
        {
            //1.0 先从线程缓存CallContext中根据Key查找EF容器对象，如果没有则创建，同事保存到缓存中
            get
            {
                object obj = CallContext.GetData("BaseDBContext");
                if(obj==null)
                {
                    //实例化EF的上下文容器对象
                    obj = new BaseDBContext();
                    //将ef的上下文容器对象存入缓存CallContext
                    CallContext.SetData("BaseDBContext", obj);
                }
                //2.0将当前的EF上下文对象返回
                return obj as BaseDBContext;
            }

        }


        //1.0实例化EF上下文容器对象类
        //BaseDBContext _db = new BaseDBContext();
        DbSet<TEntity> _dbset;
        public BaseRepository()
        {
            _dbset = _db.Set<TEntity>();
        }
        #region 2.0 查询
        public List<TEntity> QueryWhere(Expression<Func<TEntity,bool>> where)
        {
            return _dbset.Where(where).ToList();
        }

        /// <summary>
        /// 连表操作
        /// </summary>
        /// <param name="where"></param>
        /// <param name="tableNames"></param>
        /// <returns></returns>
        public List<TEntity> QueryJoin(Expression<Func<TEntity, bool>> where,string[] tableNames)
        {
            if(tableNames ==null || tableNames.Any()==false)
            {
                throw new Exception("连表操作的表名至少要有一个");
            }
            DbQuery<TEntity> query = _dbset;
            foreach (var item in tableNames)
            {
                query = query.Include(item);
            }
            return query.Where(where).ToList();
        }
       
        /// <summary>
        /// 按照条件查询出数据以后，根据外部指定的字段进行升序排列
        /// </summary>
        /// <typeparam name="TKey">表示从TEntity中获取的属性类型</typeparam>
        /// <param name="where"></param>
        /// <param name="order"></param>
        /// <returns></returns>
        public List<TEntity> QueryOrderBy<TKey>(Expression<Func<TEntity,bool>> where,
            Expression<Func<TEntity, TKey>> order)
        {
            return _dbset.Where(where).OrderBy(order).ToList();
        }

        /// <summary>
        /// 按照条件查询出数据以后，根据外部指定的字段进行倒序排列
        /// </summary>
        /// <typeparam name="TKey">表示从TEntity中获取的属性类型</typeparam>
        /// <param name="where"></param>
        /// <param name="order"></param>
        /// <returns></returns>
        public List<TEntity> QueryOrderByDescending<TKey>(Expression<Func<TEntity, bool>> where,
            Expression<Func<TEntity, TKey>> order)
        {
            return _dbset.Where(where).OrderByDescending(order).ToList();
        }

        /// <summary>
        /// 分页查询
        /// </summary>
        /// <typeparam name="TKey"> 要指定的排序属性名称TEntity.property</typeparam>
        /// <param name="pageIndex">分页页码</param>
        /// <param name="pageSize">页容量</param>
        /// <param name="rowCount">总行数</param>
        /// <param name="order">排序lambda表达式</param>
        /// <param name="where">查询条件lambda表达式</param>
        /// <returns></returns>
        public List<TEntity> QueryByPage<TKey>(
            int pageIndex,
            int pageSize,
            out int rowCount,
            Expression<Func<TEntity, TKey>> order,
            Expression<Func<TEntity, bool>> where)
        {
            //1.0计算当前分页要跳过的数据行数
            int skipCount = (pageIndex - 1) * pageSize;
            //2.0获取当前满足条件的所有数据总条数
            rowCount = _dbset.Count(where);
            //3.0获取分页数据
            return _dbset.Where(where).OrderByDescending(order).Skip(skipCount).Take(pageSize).ToList();
        }

        #endregion

        #region 3.0 编辑
        

        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="model"></param>
        /// <param name="propertys"></param>
        public void Edit(TEntity model,string[] propertys)
        {
            if(model==null)
            {
                throw new Exception("实体不能为空");
            }
            if(propertys.Any() == false)
            {
                throw new Exception("要修改的属性至少要有一个");
            }
            //将model追加到EF容器
            DbEntityEntry entry = _db.Entry(model);
            entry.State = EntityState.Unchanged;
            foreach (var item in propertys)
            {
                entry.Property(item).IsModified = true;
            }
            //关闭EF对于实体的合法性参数验证
            _db.Configuration.ValidateOnSaveEnabled = false;
        }


        #endregion

        #region 4.0 删除
        public void Delete(TEntity model,bool isAdded)
        {
            //表示(!isAdded）当前model没有追加到EF容器中
            if (!isAdded)
            {
                _dbset.Attach(model);
            }
            _dbset.Remove(model);
        }
        #endregion

        #region 5.0 新增
        public void Add(TEntity model)
        {
            _dbset.Add(model);
        }
        #endregion

        #region 6.0 统一提交
        public int SaveChanges()
        {
            return _db.SaveChanges();
        }
        #endregion

        #region 7.0调用存储过程 返回自己指定的类型TResult
        public List<TResult> RunProc<TResult>(string sql,params object[] param)
        {
            return _db.Database.SqlQuery<TResult>(sql, param).ToList();
        }
        #endregion
    }
}





