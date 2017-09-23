using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace duo.CRM.IServices
{
    public interface IBaseServices<TEntity> where TEntity:class
    {
        #region 2.0 查询
        List<TEntity> QueryWhere(Expression<Func<TEntity, bool>> where);


        /// <summary>
        /// 连表操作
        /// </summary>
        /// <param name="where"></param>
        /// <param name="tableNames"></param>
        /// <returns></returns>
        List<TEntity> QueryJoin(Expression<Func<TEntity, bool>> where, string[] tableNames);


        /// <summary>
        /// 按照条件查询出数据以后，根据外部指定的字段进行升序排列
        /// </summary>
        /// <typeparam name="TKey">表示从TEntity中获取的属性类型</typeparam>
        /// <param name="where"></param>
        /// <param name="order"></param>
        /// <returns></returns>
        List<TEntity> QueryOrderBy<TKey>(Expression<Func<TEntity, bool>> where,
           Expression<Func<TEntity, TKey>> order);


        /// <summary>
        /// 按照条件查询出数据以后，根据外部指定的字段进行倒序排列
        /// </summary>
        /// <typeparam name="TKey">表示从TEntity中获取的属性类型</typeparam>
        /// <param name="where"></param>
        /// <param name="order"></param>
        /// <returns></returns>
        List<TEntity> QueryOrderByDescending<TKey>(Expression<Func<TEntity, bool>> where,
           Expression<Func<TEntity, TKey>> order);


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
        List<TEntity> QueryByPage<TKey>(
           int pageIndex,
           int pageSize,
           out int rowCount,
           Expression<Func<TEntity, TKey>> order,
           Expression<Func<TEntity, bool>> where);


        #endregion

        #region 3.0 编辑


        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="model"></param>
        /// <param name="propertys"></param>
        void Edit(TEntity model, string[] propertys);



        #endregion

        #region 4.0 删除
        void Delete(TEntity model, bool isAdded);

        #endregion

        #region 5.0 新增
        void Add(TEntity model);

        #endregion

        #region 6.0 统一提交
        int SaveChanges();

        #endregion

        #region 7.0调用存储过程 返回自己指定的类型TResult
        List<TResult> RunProc<TResult>(string sql, params object[] param);
        #endregion
    }
}
