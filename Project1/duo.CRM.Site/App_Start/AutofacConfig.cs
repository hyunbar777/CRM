namespace duo.CRM.Site
{
    using Autofac;
    using Autofac.Integration.Mvc;
    using Common;
    using System.Reflection;
    using System.Web.Mvc;
    public class AutofacConfig
    {

        /// <summary>
        /// 负责调用autofac框架实现业务逻辑层和数据仓储层程序集中的类型对象的创建
        /// 负责创建MVC控制器类的对象（调用控制器中的游蚕构造函数），接管DefaultControllerFactory工作
        /// </summary>
        public static void Register()
        {
            //1.0实例化一个autofac的创建容器
            var builder = new ContainerBuilder();
            //2.0告诉autofac框架，将来要创建控制器类存放在哪个程序集
            Assembly controllerAss = Assembly.Load("duo.CRM.Site");
            builder.RegisterControllers(controllerAss);
            //3.0告诉autofac框架注册仓储层所在程序集中的所有类的对象实例
            Assembly respAss = Assembly.Load("duo.CRM.Repository");
            //创建respAss中的所有类的instance以此类的实现接口存储
            builder.RegisterTypes(respAss.GetTypes()).AsImplementedInterfaces();

            //4.0告诉autofac框架注册业务逻辑所在程序集中的所有类的对象实例
            Assembly serAss = Assembly.Load("duo.CRM.Services");
            //创建respAss中的所有类的instance以此类的实现接口存储
            builder.RegisterTypes(serAss.GetTypes()).AsImplementedInterfaces();

            //builder.RegisterType(typeof(sysFunctionServices)).As(typeof(IsysFunctionServices));

            //5.0创建autofac的容器
            var container = builder.Build();
            //将container对象缓存到HttpRuntime.cache中，并且永久有效
            CacheMgr.SetData(Keys.AutofacContainer, container);
            //Resolve方法可以从autofac容器中获取指定IsysFunctionServices的具体实现类的实体对象
            //container.Resolve<IServices.IsysFunctionServices>();

            //6.0将MVC的控制器对象实例 交由autofa来创建
            DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
        }
    }
}