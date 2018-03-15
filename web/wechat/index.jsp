<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title></title>
	<script type="text/javascript" src="../web/js/jquery-2.1.0.js" ></script>
	<link rel="stylesheet" href="../web/css/wechat/new_file.css" />
</head>
<body>
<div class="option-jz">
	<ul>
		<li class="personal-jz act">个人捐赠</li>
		<li class="group-jz">团体捐赠</li>
		<li class="company-jz">公司捐赠</li>
	</ul>
</div>

<form id="form" method="post" onsubmit="return false;">
	<input class="openId" type="hidden" name="openid" value="${openId}"/>
	<input type="hidden" name="paytype" value="2"/>
	<div>
		<label>是否匿名：</label>
		<div class="anonymous">
			<input type="radio" name="visible" value="1" />是
			<input type="radio" name="visible" value="0" checked="checked" style="margin-left: 8px"/>否
		</div>
	</div>
	<div class="ishidden" style="width: 100%;margin-top: 10px">
		<div id="contact-div-username">
			<label id="username">姓&nbsp;&nbsp;名<span>*</span>：</label>
			<span name="must" class="mustWriteName" style="visibility:hidden">（必填）</span>
			<input id="usernameholder" type="text" placeholder="请填写姓名" name="personName" data-perverifi = "perxingming" class="perverifi mustWriteName_2 mustWrite">
		</div>
		<div id="contact-div" style="display: none">
			<div style="margin-top:0;width: 100%;">
				<label><div id="groupname" style="display: inline">团队名称<span>*</span>：</div></label>
				<span name="must" class="mustWriteGroup" style="visibility:hidden">（必填）</span>
				<input id="groupnameinput" type="text" placeholder="请填写团队名称" name="groupName" data-perverifi = "groupname" class="perverifi mustWriteGroup_2">
			</div>
			<div  style="width: 100%;">
				<label><span style="color:black;text-align:left;margin: 0;letter-spacing: 5.5px">联系人</span><span>*</span>：</label>
				<span name="must" class="mustWritePerson" style="visibility:hidden">（必填）</span>
				<input type="text" placeholder="请填写联系人" name="groupLinkMan" data-perverifi= "perxingming" class="perverifi mustWritePerson_2" >
			</div>
		</div>
		<div>
			<label>电子邮箱<span>*</span>：</label>
			<span name="must" class="mustWriteEmail" style="visibility:hidden">（必填）</span>
			<input type="text" placeholder="请填写电子邮箱" name="personEmail" data-perverifi = "peremail" class="perverifi mustWriteEmail_2 mustWrite">
		</div>
		<div style="position:relative;">
			<label>联系电话：</label>
			<input class="telPhone" type="text" placeholder="请填写联系电话" name="phone">
		</div>
		<div id="idcard-div" style="position:relative;">
			<label>身份证号：</label>
			<input class="IDCard" type="text" placeholder="请填写身份证号" name="idcard" >
		</div>
		<div style="position:relative;">
			<label>联系地址：</label>
			<input class="conAddress" type="text" placeholder="请填写联系地址" name="address">
		</div>
		<div class="schoolfellow" style="margin-top: 20px">
			<label class="schoolFriends">是否校友：</label><input type="radio" value="1" checked="checked" name="isclassmate"/>是
			<input type="radio" value="0" name="isclassmate" style="margin-left: 8px"/>否
		</div>
		<div style="margin-top: 3px">
			<label>年&nbsp;&nbsp;级：</label>
			<input class="grade" type="text" placeholder="请填写年级" name="grade">
		</div>
		<div>
			<label>学&nbsp;&nbsp;院：</label>
			<input class="academy" type="text" placeholder="请填写学院" name="academy">
		</div>
	</div>

	<div class="setmoney" style="margin-top: 10px">
		<label>捐赠金额：</label>
		<%--<input type="text" placeholder="请填写捐赠金额 " name="money" id="perdonatorMoney">--%>
		<input type="radio" value="10" name="money" checked="checked" >10
		<input type="radio" value="50" name="money" style="margin-left: 8px">50
		<input type="radio" value="100" name="money"  style="margin-left: 8px">100
		<input type="radio" value="0" name="money" id="perdonatorMoney" style="margin-left: 8px;">
		其他
		<br/>
		<span name="must" class="mustWriteMoney" style="visibility:hidden">（必填）</span>
		<input name="setmoney" class="personal-money" type="text" placeholder="请填写捐赠金额" maxlength="6" style="display: none;margin-top: 10px;height: 35px;width: 99%" value="" >
	</div>
	<div style="margin-top: 10px">
		<label>捐赠项目：</label>
		<select class="jzxx-dl" style="height: 35px;margin-right: 5px;width: 100%">
			<option>请选择</option>
		</select>
		<br/>
		<select style="height: 35px;width: 100%;margin-top: 10px" name="projectId" class="jzxx-xl">
			<option>请选择</option>
		</select>
	</div>
	<%--<div>--%>
	<%--<label>捐赠途径：</label><input type="radio" name="paytype" value="1" checked="checked"/>微信支付--%>
	<%--<input type="radio" name="paytype" value="0"/>线下支付--%>
	<%--</div>--%>

	<button type="submit" class="perform-btn" style="margin-top: 10px">提&nbsp;&nbsp;&nbsp;交</button>
</form>

<script>

	$(document).ready(function(){
		$(".personal-jz").click(function(){
			$("#contact-div-username").show();
			$("#contact-div").hide();
			$('input[type=text]').val('');
			$('input[type=number]').val('');
			$("#contact-div").hide();
			$("#idcard-div").show();
			$(".personal-jz").addClass("act").siblings().removeClass("act");
			$(".mustWriteName_2").addClass("mustWrite");
			$(".mustWriteGroup_2").removeClass("mustWrite");
			$(".mustWritePerson_2").removeClass("mustWrite");
			$(".ishidden span[name='must']").css("visibility","hidden");
			$(".perverifi").attr("style", "height: 35px;width: 99%");
			CheckPersonName = true;
			CheckPersonEmail = true;
			CheckGroupName = true;
			CheckGroupLinkName = true;
			checkMoneyEmpty = true;
			checkMoneyNum = true;

		});
		$(".group-jz").click(function(){
			$("#contact-div-username").hide();
			$("#contact-div").show();
			$("#groupname").html("团队名称<span>*</span>：");
			$("#groupnameinput").attr("placeholder","请填写团队名称");
			$('input[type=text]').val('');
			$('input[type=number]').val('');
			$("#contact-div").show();
			$("#idcard-div").hide();
			$(".group-jz").addClass("act").siblings().removeClass("act");
			$(".mustWriteName_2").removeClass("mustWrite");
			$(".mustWriteGroup_2").addClass("mustWrite");
			$(".mustWritePerson_2").addClass("mustWrite");
			$(".ishidden span[name='must']").css("visibility","hidden");
			$(".perverifi").attr("style", "height: 35px;width: 99%");
			CheckPersonName = true;
			CheckPersonEmail = true;
			CheckGroupName = true;
			CheckGroupLinkName = true;
			checkMoneyEmpty = true;
			checkMoneyNum = true;
		});
		$(".company-jz").click(function(){
			$("#contact-div-username").hide();
			$("#contact-div").show();
			$("#groupname").html("企业名称<span>*</span>：");
			$("#groupnameinput").attr("placeholder","请填写企业名称");
			$('input[type=text]').val('');
			$('input[type=number]').val('');
			$("#contact-div").show();
			$("#idcard-div").hide();
			$(".company-jz").addClass("act").siblings().removeClass("act");
			$(".mustWriteName_2").removeClass("mustWrite");
			$(".mustWriteGroup_2").addClass("mustWrite");
			$(".mustWritePerson_2").addClass("mustWrite");
			$(".ishidden span[name='must']").css("visibility","hidden");
			$(".perverifi").attr("style", "height: 35px;width: 99%");
			CheckPersonName = true;
			CheckPersonEmail = true;
			CheckGroupName = true;
			CheckGroupLinkName = true;
			checkMoneyEmpty = true;
			checkMoneyNum = true;
		});
		btn();

		/**
		 * 加载捐赠项目
		 */
		$.ajax({
			type: "GET",
			url: "/jjh/front/projectList.do",
			dataType: "json",
			success: function(data){
				if(data){
					$(".jzxx-dl").html('');

					for(i = 0;i<data.length;i++){
						if(data[i].pid == 1){
							$(".jzxx-dl").append("<option data-id="+ data[i].project_id +">" + data[i].name + "</option>")
						}
					}
					$.ajax({
						type: "get",
						url: "/jjh/front/projectList.do" + "?projectId=" + $(".jzxx-dl option:checked").attr("data-id"),
						success: function(data){
							if(data){
								$(".jzxx-xl").html('');
								for(i = 0;i<data.length;i++){
									$(".jzxx-xl").append("<option value="+ data[i].project_id +">" + data[i].name + "</option>");
								}
							}

						},
						erro: function(){
							alert("请重试")
						}
					});
				}
			},
			erro:function(){
				alert("请重试");
			}
		});

		/**
		 * 项目捐赠联动
		 */
		$(".jzxx-dl").change(function(){
			$.ajax({
				type: "get",
				url: "/jjh/front/projectList.do" + "?projectId=" + $(".jzxx-dl option:checked").attr("data-id"),
				success: function(data){
					if(data){
						$(".jzxx-xl").html('');
						for(i = 0;i<data.length;i++){
							$(".jzxx-xl").append("<option value="+ data[i].project_id +">" + data[i].name + "</option>");
						}
					}
				},
				erro: function(){
					alert("请重试");
				}
			});
		});

		//选择是否匿名
		$("input[name='visible']").click(function(){

			if($(this).val() == 1){
				$(".ishidden").hide();
				$(".ishidden span[name='must']").css("visibility","hidden");
				$(".perverifi").attr("style", "height: 35px;width: 99%");
				$("input[name='setmoney']").attr("style", "display: none;margin-top: 10px;height: 35px;width: 99%");//不为空且金额正确，删除红框
				$(".mustWriteMoney").css('visibility','hidden');

				CheckPersonName = true;
				CheckPersonEmail = true;
				CheckGroupName = true;
				CheckGroupLinkName = true;
				checkMoneyEmpty = true;
				checkMoneyNum = true;
			}else{
				$(".ishidden").show();

			}
		});

		//金额选择
		$("input[name='money']").click(function(){
			if($(this).attr("id")== "perdonatorMoney"){
				$(".personal-money").show();
				$(".personal-money").val('');
			}
			else{
				$(".personal-money").hide();
				$("input[name='setmoney']").attr("style", "display: none;margin-top: 10px;height: 35px;width: 99%");//不为空且金额正确，删除红框
				$(".mustWriteMoney").css('visibility','hidden');
				checkMoneyEmpty = true;
			}
		})
	});

	/*function btn(){
		$(".perform-btn").on("click",function(){
			var ishidden=$("input[name='visible']:checked").val();

			if(ishidden=="0"){
				var allinput = $(".perverifi");
				var verifiarray = [];

				$.map(allinput,function(obj,n){
					var verifidata = $(obj).data("perverifi");
					var value = $(obj).val();
					if(!perverifi(verifidata,value)){
						verifiarray.push("false");
					}
				});

				if(verifiarray.length>0){
					alert("为确保我们能顺利联系上您,请完善带*的内容");
					return false;
				}
			}
			$("#perdonatorMoney").val($(".personal-money").val());

//				var money = $("#perdonatorMoney").val();
			var money = $('input:radio[name="money"]:checked').val();
			if(!money){

				alert("请填写捐款金额");
			}
			if(money<=0){
				alert("捐款金额不能小于等于0");
				return;
			}
			else {
				console.log($("#form").serialize());
				$.ajax({
					type:"post",
					url:"/jjh/front/donate.do",
					data:$("#form").serialize(),
					success:function(data){
						if(data == "ERROR"){
							alert("请重试")
						}
						else{
							console.log(data);
							callPay(data);
						}

					},
					erro:function(){
						alert("请重试")
					}
				})
			}
		})
	}*/

	//点击提交后验证表单是否正确填写
	function btn() {
		$(".perform-btn").on("click", function () {

			$("#perdonatorMoney").val($(".personal-money").val());//将输入的金额值设置给“其他”输入框的值
			var money = $('input:radio[name="money"]:checked').val();//获取选中金额输入框的值

			if($("input[name='visible']:checked").val() == 0){
				var mustwrite = $(".mustWrite");//表单必填项的jQuery对象组
				var verifiarray = 0;//记录有多少个符合要求的必填项
				mustwrite.each(function (n,obj) {
					var value = $(obj).val();
					if (perverifi(value)) {
						verifiarray++;
					}
				});
				if ((verifiarray < (mustwrite.length)) || (money<10||money>100000)) {
					alert("为确保我们能顺利联系上您,请完善带*的内容");
				}else {
					console.log($("#form").serialize());
					$.ajax({
						type:"post",
						url:"/jjh/front/donate.do",
						data:$("#form").serialize(),
						success:function(data){
							if(data == "ERROR"){
								alert("请重试")
							}
							else{
								console.log(data);
								callPay(data);
							}
						},
						erro:function(){
							alert("请重试")
						}
					})
				}
			}else{
				if (money<10||money>100000) {
					alert("为确保我们能顺利联系上您,请完善带*的内容");
				}else {
					console.log($("#form").serialize());
					$.ajax({
						type:"post",
						url:"/jjh/front/donate.do",
						data:$("#form").serialize(),
						success:function(data){
							if(data == "ERROR"){
								alert("请重试")
							}
							else{
								console.log(data);
								callPay(data);
							}
						},
						erro:function(){
							alert("请重试")
						}
					})
				}
			}

		})
	}

	function onBridgeReady(pay) {
		var appId = pay.appid;
		var timeStamp = pay.timeStamp;
		var nonceStr =pay.nocester;
		var wepackage = pay.package;
		var signType = pay.signType;
		var paySign = pay.paySign;
		WeixinJSBridge.invoke('getBrandWCPayRequest', {
			"appId" : appId,//"wx2421b1c4370ec43b", //公众号名称，由商户传入
			"timeStamp" : timeStamp,//"1395712654", //时间戳，自1970年以来的秒数
			"nonceStr" : nonceStr,//"e61463f8efa94090b1f366cccfbbb444", //随机串
			"package" : wepackage,//"prepay_id=u802345jgfjsdfgsdg888",
			"signType" : signType,//"MD5", //微信签名方式:
			"paySign" : paySign,//"70EA570631E4BB79628FBCA90534C63FF7FADD89" //微信签名
		}, function(res) { // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
//				alert(JSON.stringify(res));
			if (res.err_msg == "get_brand_wcpay_request:ok") {
				alert("支付成功,感谢您对重庆邮电大学教育事业的支持");
			}
			if (res.err_msg == "get_brand_wcpay_request:cancel") {
				alert("交易取消");
			}
			if (res.err_msg == "get_brand_wcpay_request:fail") {
				alert("支付失败,请重试");
			}
		});
	}

	function callPay(pay) {
		if (typeof WeixinJSBridge == "undefined") {
			if (document.addEventListener) {
				document.addEventListener('WeixinJSBridgeReady', onBridgeReady,false);
			} else if (document.attachEvent) {
				document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
				document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
			}
		} else {
			onBridgeReady(pay);
		}
	}

	function perverifi(value){
		if(value != ""){
			return true;
		}else{
			return false;
		}
	}


	$(document).delegate("input[name='personName']", "blur", checkPersonName);
	$(document).delegate("input[name='personEmail']", "blur", checkPersonEmail);
	$(document).delegate("input[name='groupName']", "blur", checkGroupName);
	$(document).delegate("input[name='groupLinkMan']", "blur", checkGroupLinkName);

	var CheckPersonName = true;
	var CheckPersonEmail = true;
	var CheckGroupName = true;
	var CheckGroupLinkName = true;

	function checkPersonName() {
		if (CheckPersonName == true) {
			if ($("input[name='personName']").val().length == 0) {
				$("input[name='personName']").attr("style", "border: 2px solid red;height: 35px;width: 99%");
				$(".mustWriteName").css('visibility','show');
			}
			CheckPersonName = false;
		}
		if ($("input[name='personName']").val().length !== 0) {
			$("input[name='personName']").attr("style", "height: 35px;width: 99%");//不为空且金额正确，删除红框
			$(".mustWriteName").css('visibility','hidden');
			CheckPersonName = true;
		}
	}
	function checkPersonEmail() {
		if (CheckPersonEmail == true) {
			if ($("input[name='personEmail']").val().length == 0) {
				$("input[name='personEmail']").attr("style", "border: 2px solid red;height: 35px;width: 99%");
				$(".mustWriteEmail").css('visibility','show');
			}
			CheckPersonEmail = false;
		}
		if ($("input[name='personEmail']").val().length !== 0) {
			$("input[name='personEmail']").attr("style", "height: 35px;width: 99%");//不为空且金额正确，删除红框
			$(".mustWriteEmail").css('visibility','hidden');
			CheckPersonEmail = true;
		}
	}
	function checkGroupName() {
		if (CheckGroupName == true) {
			if ($("input[name='groupName']").val().length == 0) {
				$("input[name='groupName']").attr("style", "border: 2px solid red;height: 35px;width: 99%");
				$(".mustWriteGroup").css('visibility','show');
			}
			CheckGroupName = false;
		}
		if ($("input[name='groupName']").val().length !== 0) {
			$("input[name='groupName']").attr("style", "height: 35px;width: 99%");//不为空且金额正确，删除红框
			$(".mustWriteGroup").css('visibility','hidden');
			CheckGroupName = true;
		}
	}
	function checkGroupLinkName() {
		if (CheckGroupLinkName == true) {
			if ($("input[name='groupLinkMan']").val().length == 0) {
				$("input[name='groupLinkMan']").attr("style", "border: 2px solid red;height: 35px;width: 99%");
				$(".mustWritePerson").css('visibility','show');
			}
			CheckGroupLinkName = false;
		}
		if ($("input[name='groupLinkMan']").val().length !== 0) {
			$("input[name='groupLinkMan']").attr("style", "height: 35px;width: 99%");//不为空且金额正确，删除红框
			$(".mustWritePerson").css('visibility','hidden');
			CheckGroupLinkName = true;
		}
	}

	//金额校验
	$(document).delegate("input[name='setmoney']", "focus",checkMoney_limit);
	$(document).delegate("input[name='setmoney']", "blur",checkMoney_format);
	var checkMoneyEmpty = true;
	var checkMoneyNum = true;
	//输入金额限制
	function checkMoney_limit(){
		//禁止数字首位为0
		$("input[name='setmoney']").bind('input.a',function(e){
			if (e.target.value==0){
				$(this).val("");
			}
		});
		//限制输入框只能输入数字（不是数字无法输入）
		$("input[name='setmoney']").on('input.b',function(e){
			var money = e.target.value;
			if (isNaN(money)){
				$(this).val("");
			}
			if (money.indexOf(".")!=-1){
				$(this).val("");
			}
		});
	}
	//输入金额应在10元至10万元之间
	function checkMoney_format(){
		var money = $("input[name='setmoney']").val();

		if (money==""){
			if (checkMoneyEmpty == true){
				$("input[name='setmoney']").attr("style", "border: 2px solid red;margin-top: 10px;height: 35px;width: 99%");
				$(".mustWriteMoney").css('visibility','show');
				$(".mustWriteMoney").html("（必填）");
				/*$("input[name='setmoney']").before("<span class='noSetMoney' style='margin-left:10px;color:red'>（必填）</span>");*/
				/*$(".SetMoneyNum").remove();*/
				checkMoneyEmpty = false;
				checkMoneyNum = true;
			}
		}else if (money<10||money>100000){
			if(checkMoneyNum == true){
				$("input[name='setmoney']").attr("style", "border: 2px solid red;margin-top: 10px;height: 35px;width: 99%");
				$(".mustWriteMoney").css('visibility','show');
				$(".mustWriteMoney").html("（10元-10万元）");
				/*$("input[name='setmoney']").before("<span class='SetMoneyNum' style='margin-left:10px;color:red'>（10元-10万元）</span>");*/
				/*$(".noSetMoney").remove();*/
				checkMoneyNum = false;
				checkMoneyEmpty = true;
			}
		}else{
			$("input[name='setmoney']").attr("style", "margin-top: 10px;height: 35px;width: 99%");//不为空且金额正确，删除红框
			$(".mustWriteMoney").css('visibility','hidden');
			/*$(".noSetMoney").remove();
			$(".SetMoneyNum").remove();*/
			checkMoneyEmpty = true;
			checkMoneyNum = true;
		}
	}



</script>
</body>
</html>