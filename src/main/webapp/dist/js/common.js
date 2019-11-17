Date.prototype.format = function(fmt) {
    var o = {
        "M+" : this.getMonth()+1,                 //月份
        "d+" : this.getDate(),                    //日
        "h+" : this.getHours(),                   //小时
        "m+" : this.getMinutes(),                 //分
        "s+" : this.getSeconds(),                 //秒
        "q+" : Math.floor((this.getMonth()+3)/3), //季度
        "S"  : this.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt)) {
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }
    for(var k in o) {
        if(new RegExp("("+ k +")").test(fmt)){
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        }
    }
    return fmt;
};
//菜单actived
$(function(){
    $(".treeview a[href$='"+parseURL(window.location.href).path+"']").parents("li").addClass("active");
    $("#pswChange").on("click",function(){
        var pswChangeWin = layer.open({
            type: 1,
            title: false, //不显示标题
            content: $('#passwordChangeWin'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
            title: '密码修改',
            shade: 0.6,
            area: ['500px', '300px'],
            btn:["保存","取消"],
            btn1:function(){
                var formData = $('#passwordChangeWin form').serialize();
                var oldPsw = $('#passwordChangeWin form input[name="oldPsw"]').val();
                var newPsw = $('#passwordChangeWin form input[name="newPsw"]').val();
                var checkNewPsw = $('#passwordChangeWin form input[name="checkNewPsw"]').val();

                if(!oldPsw || oldPsw.length<1){
                    layer.alert("请输入原始密码!");
                    return false;
                }
                if(!newPsw || newPsw.length<1){
                    layer.alert("请输入新密码!");
                    return false;
                }
                if(newPsw != checkNewPsw){
                    layer.alert("两次输入新密码不一致!");
                    return false;
                }

                $.post(basePath+"rest/operator/passwordChange",formData,null,"json").done(function(rsp){
                    if(rsp.resultCode =="0000"){
                        layer.alert(rsp.description,{title:"操作成功",icon:1});
                        layer.close(pswChangeWin);
                    }else{
                        layer.alert(rsp.description,{title:"处理失败",icon:7})
                    }
                })
            },
            btn2:function(){
                layer.close(pswChangeWin);
            }
        });
    });
    $("#logout").on("click",function(){
        window.location.href = basePath + 'localLogout.html'
    });
})

/**
 * 加载依赖远程数据，
 * @param urls
 * @callback 依赖数据加载完毕回调
 */
var loadDeps = function (urls, callback) {
    var taskComplated = 0;
    var waitTask;
    var loadedDatas = {};
    var loadingMask = layer.msg('拼命加载中......', {shade: [0.8, '#393D49'], time: 0, icon: 16});
    if (urls && (urls instanceof Array)) {
        $.each(urls, function (index, item) {
            $.ajax({
                url: item,
                dataType: 'json',
                type: 'post',
                success: function (data) {
                    loadedDatas[index] = data;
                    taskComplated++;
                }
            })
        });

        waitTask = setInterval(waitForSynch, 500)
    }

    function waitForSynch() {
        // console.log("等待异步任务" + urls.length + "个，当前完成" + taskComplated + "个");
        if (taskComplated == urls.length) {
            taskComplated = 0;
            if (callback) {
                callback(loadedDatas)
            }
            clearInterval(waitTask);
            layer.close(loadingMask)
        }
    }
};

var findArrayValue = function (id, arr) {
    var result;
    $.each(arr, function (index, item) {
        if (item.id == id) {
            result = item;
            return false;
        }
    })
    return result
}

var parseURL = function parseURL(url) {
    var a =  document.createElement('a');
    a.href = url;
    return {
        source: url,
        protocol: a.protocol.replace(':',''),
        host: a.hostname,
        port: a.port,
        query: a.search,
        params: (function(){
            var ret = {},
                seg = a.search.replace(/^\?/,'').split('&'),
                len = seg.length, i = 0, s;
            for (;i<len;i++) {
                if (!seg[i]) { continue; }
                s = seg[i].split('=');
                ret[s[0]] = s[1];
            }
            return ret;
        })(),
        file: (a.pathname.match(/\/([^\/?#]+)$/i) || [,''])[1],
        hash: a.hash.replace('#',''),
        path: a.pathname.replace(/^([^\/])/,'/$1'),
        relative: (a.href.match(/tps?:\/\/[^\/]+(.+)/) || [,''])[1],
        segments: a.pathname.replace(/^\//,'').split('/')
    };
}