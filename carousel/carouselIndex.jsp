
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015-12-12
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="easyui-layout" data-options="fit:true">
  <div data-options="region:'center'" style="padding: 12px 12px 0 12px;">
    <form name="audit_form" method="post" class="c-form" enctype="multipart/form-data">
      <table class="table">
        <tr>
          <td class="label">图片编号</td>
          <td class="value">${pictureId}</td>
        </tr>
        <tr>
          <td class="label">图片说明</td>
          <td class="value">${pictureInfo}</td>
        </tr>

        <tr>
          <td class="label">图片</td>
          <td class="value"><img id="imgUrl" src="/static/system/img/carousel/${pictureId}.jpg?<%=new Date().getTime()%>" width="227"
                                     height="159"/>
          </td>
        </tr>
        <tr>
          <td class="label">选择图片</td>
          <td class="value"><input type="file" name="fileImg" id="pictureMemo"
                                   accept="image/gif, image/png , image/jpeg  ,image/bmp "/></td>
          </tr>
          <tr>
            <td class="label">图片说明</td>
            <td class="value">
              <input type="text" id = "pictureInfo" value="${pictureInfo}"/>
            </td>
          </tr>
      </table>

    </form>
  </div>
  <div class="c-w-t" data-options="region:'south'">
    <a class="auditsave easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-close',plain:true" onclick="closeThisWindow()">关闭</a>
  </div>

</div>

<script src="/static/system/js/ajaxfileupload.js"/>
<script>
  function closeThisWindow(){
    $("#ntc").window('close');
  }
  !function () {
    getCurrWin().find('.auditsave').on('click', function (e) {
      var pInfo=$("#pictureInfo").val();
      if(pInfo==""){
        pInfo="无";
      }
      $.ajaxFileUpload({
        url:"/system/carousel/updatePicture.do?pictureId=${pictureId}&info="+pInfo,
        fileElementId :'pictureMemo',
        dataType:'text',

        success:function(data){
          //for(var i=0;i<data.length;i++){
          //var body= data.notice_body;
          // $("#a").append("<image src='"+body+"' >");
          //}

          //弹出点机框  重新加载页面
          if(data!=""){
            alert("修改成功");
            closeThisWindow();
            refresh();
          }
          else{
            alert("修改失败");
          }
          //document.location.reload();
        },
        error:function(XMLHttpRequest, textStatus, errorThrown){
          alter("修改异常");
        }
      });


    });

  }();
</script>

