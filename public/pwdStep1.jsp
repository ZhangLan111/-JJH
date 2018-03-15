<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重置密码</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="/static/system/easyui/themes/default/easyui.css">
    <link rel="stylesheet" href="/static/system/easyui/themes/icon.css">
    <link rel="stylesheet" href="/static/system/css/news.css" />
    <script type="text/javascript" src="/static/system/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/static/system/easyui/jquery.easyui.min.js"></script>
    <script language="javascript" type="text/javascript" src="/static/system/js/common.js"></script>
    <script language="javascript" type="text/javascript" src="/static/system/js/validate_easyui.js"></script>
</head>
<body id="bg-wrap">
<div id="header">
    <div class="wrap">
        <div class="logo"></div>
    </div>
</div>
    <div id="c-w" class="float-wrapper">
        <div class="title">
            <span class="i-home"></span> <a href="/login.shtml">首页</a> <span class="i-arrow"></span> <a href="#">填写邮箱</a> <a href="/" class="r-l">返回首页</a>
        </div>
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center'" >
                <form id="user_password_form" style="margin: 3px">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td colspan="2" align="center"><img src="/static/system/img/step.png"></td>
                        </tr>
                        <tr>
                            <td class="label" align="right" width="420px" style="font-size: 18px">请输入邮箱(Email)地址</td>
                            <td class="value"><input name="email" type="text" class="easyui-validatebox easyui-textbox"
                                       data-options="required:true,missingMessage:'该输入项为必输项',validType:'email'"></td>
                        </tr>
                        </tbody>
                    </table>

                    <div style="padding:10px 0px 0px 415px;">
                        <a class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="updateUserPassword()">下一步</a>
                        <a href="/" class="easyui-linkbutton" data-options="iconCls:'icon-close',plain:true">返回</a>
                    </div>  
                </form>

            </div>
        </div>
    </div>
    <div class="line" style="margin-top: 20px;"></div>
    <div id="footer">
        版权所有:重庆市社会科学界联合会 	版本：1.01
    </div>
</body>
    <script>
        var runing=false;
        function updateUserPassword() {
            if (runing){return;}
            runing=true;
            var form = $('#user_password_form');
            if ($(form).form("validate")) {
                loadData("/pwd/backPwd.do", function (ret) {
                    if(ret==="1"){
                        window.location.href="/jjh/public/pwdStep2.shtml";
                    }else{
                        $.messager.alert("提示", "亲爱的用户，你还没注册过，或者邮箱和系统匹配不一致，如有疑问，请联系系统管理员");
                    }
                }, {data: form.serializeArray()});
            } else {
                $.messager.alert("提示", "请输入邮箱之后在进行下一步!");
            }
            runing=false;
        }
    </script>
</html>