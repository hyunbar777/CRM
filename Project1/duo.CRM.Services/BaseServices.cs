using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace duo.CRM.Services
{
    using IRepository;
    using IServices;
    public class BaseServices<TEntity> :IBaseServices<TEntity> where TEntity:class
    {
        public IBaseRepository<TEntity> _baseDal;
        #region 2.0 查询
        public List<TEntity> QueryWhere(Expression<Func<TEntity, bool>> where)
        {
            return _baseDal.QueryWhere(where);
        }

        /// <summary>
        /// 连表操作
        /// </summary>
        /// <param name="where"></param>
        /// <param name="tableNames"></param>
        /// <returns></returns>
        public List<TEntity> QueryJoin(Expression<Func<TEntity, bool>> where, string[] tableNames)
        {
           
            return _baseDal.QueryJoin(where,tableNames);
        }

        /// <summary>
        /// 按照条件查询出数据以后，根据外部指定的字段进行升序排列
        /// </summary>
        /// <typeparam name="TKey">表示从TEntity中获取的属性类型</typeparam>
        /// <param name="where"></param>
        /// <param name="order"></param>
        /// <returns></returns>
        public List<TEntity> QueryOrderBy<TKey>(Expression<Func<TEntity, bool>> where,
            Expression<Func<TEntity, TKey>> order)
        {
            return _baseDal.QueryOrderBy(where,order);
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
            return _baseDal.QueryOrderByDescending(where,order);
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
           
            return _baseDal.QueryByPage(pageIndex,pageSize,out rowCount,order,where);
        }

        #endregion

        #region 3.0 编辑


        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="model"></param>
        /// <param name="propertys"></param>
        public void Edit(TEntity model, string[] propertys)
        {
            _baseDal.Edit(model, propertys);
        }


        #endregion

        #region 4.0 删除
        public void Delete(TEntity model, bool isAdded)
        {
            //表示(!isAdded）当前model没有追加到EF容器中
            _baseDal.Delete(model, isAdded);
        }
        #endregion

        #region 5.0 新增
        public void Add(TEntity model)
        {
           _baseDal.Add(model);
        }
        #endregion

        #region 6.0 统一提交
        public int SaveChanges()
        {
            return _baseDal.SaveChanges();
        }
        #endregion

        #region 7.0调用存储过程 返回自己指定的类型TResult
        public List<TResult> RunProc<TResult>(string sql, params object[] param)
        {
            return _baseDal.RunProc<TResult>(sql, param).ToList();
        }
        #endregion
    }
}
