

var helper = {
    //1.0给我们的ligergrid获取完服务器相应回来的数据后回调时使用
    //data:服务器相应回来的json数据被转换成js对象
    gridsu: function (data) {
        if ("1" == data.status) {
            //$.ligerDialog.error(data.msg);
            helper.errorTip(data.msg);
        }
        else if ("2" == data.status) {
            //用户点击确定按钮跳转到登录页面
            $.ligerDialog.warn(data.msg, "tip", function () {
                window.top.location = "/Admin/Login/Login";
            });
            //两秒后跳转到登录页面
            setTimeout(function () {
                window.top.location = "/Admin/Login/Login";
            }, 2000)
        }

    },
    //2.0错误提醒
    errorTip:function(msg)
    {
        $.ligerDialog.error(msg);
    },
    //3.0警告
    warnTip: function (msg) {
        $.ligerDialog.warn(msg);
    },
    //3.0警告
    successTip: function (msg) {
        $.ligerDialog.success(msg);
    },
    //5.0
    win:null,
    //6.0封装打开编辑和新增的面板方法
    openPanel:function(title,url,heigh,width)
    {
        var h = 450;
        var w = 450;
        if (heigh)
        {
            h = heigh;
        }
        if (width)
        {
            w = width;
        }
        helper.win= $.ligerDialog.open({ title: title, height: h, width: w, url: url });
    },
    //7.0封装统一判断服务器相应回来的具体状态值
    checkStatus:function(ajaxobj,callbackFun)
    {
        if (ajaxobj.status == "1") {//error
            helper.errorTip(ajaxobj.msg);
        }
        else if (ajaxobj.status == "2") {//未登录
            //用户点击确定按钮跳转到登录页面
            helper.warnTip(ajaxobj.msg, "tip", function () {
                window.top.location = "/Admin/Login/Login";
            });
            //两秒后跳转到登录页面
            setTimeout(function () {
                window.top.location = "/Admin/Login/Login";
            }, 2000)
        }
        else if (ajaxobj.status == "0") {
            //1.0刷新副业中的列表
            //grid.reload();
            callbackFun();//成功以后，回调
        }
        else {
            helper.errorTip("未知错误,请确认js属性名称是否存在");
        }
    
    },
    //8.0新增和编辑的回调函数封装
    ajaxSuccess:function(ajaxobj)
    {
        helper.checkStatus(ajaxobj, function () {
            //1.0刷新副业中的列表
            window.parent.grid.reload();
            //2.0关闭当前的新增面板
            window.parent.helper.win.close();
        })
    },
    //9.0 begin请求之前提示
    ajaxbegin:function()
    {
        $("#loading").show();
    },

    getFunctions: function (murl, callbackFun)
    {
        //1.0获取当前用户再次菜单页面中的权限按钮以ligergrid的toobar要求的格式返回
        $.post("/Admin/PermissOpt/getFunctions", "murl=" + murl, function (toobaritem) {

            //由于toobaritems中click存放的是一个字符串，此时不会当做函数调用
            //用eval（）
         
            for (var i = 0; i < toobaritem.length; i++) {

                //alert(toobaritem);
                if (toobaritem[i].click) {
                    //动态执行一个字符串，将结果覆盖原来的click的值
                toobaritem[i].click = eval("("+toobaritem[i].click+")");
                //alert(toobaritem[i].click.toString());
                }
            }
 
            callbackFun(toobaritem);
            //callbackFun(back);
        },"json");
    }

}