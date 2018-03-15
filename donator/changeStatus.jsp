<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="easyui-layout" data-options="fit:true">

    <div data-options="region:'center'" style="padding: 12px 12px 0px 12px;">
        <form name="audit_form" method="post" class="c-form">

            <!--隐藏域-->
            <input type="hidden" name="donator_id"  value="${donator.donator_id}">
            <table class="table">
                <tr>
                    <td class="label">姓名：</td>
                    <td class="value">${donator.donator_name}</td>
                </tr>
                <tr>
                    <td class="label">状态：</td>
                    <td class="value">
                        <select name="donator_status" class="easyui-combobox easyui-validatebox"data-options="editable:false">
                        <option value="1">未捐赠</option>
                        <option value="2">已捐赠</option>
                    </select>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div class="c-w-t" data-options="region:'south'">
        <a class="auditsave easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a>
        <a class="easyui-linkbutton" data-options="iconCls:'icon-close',plain:true" onclick="closeCurrWin()">关闭</a>
    </div>

</div>



<script>
    !function () {
        getCurrWin().find('.auditsave').on('click', function (e) {
            var form = getCurrWin().find('[name=audit_form]');
            if ($(form).form('validate')) {
                    loadData('/jjh/donator/saveChange.do', function (ret) {
                    retMessage(ret, function () {closeCurrWin();refresh();},true);
                }, {data: form.serializeArray()});
            } else {
                $.messager.alert('提示', '数据没有输入完整，请输入完后再保存!');
            }

        });

    }();
</script>
