<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>统一认证中心</title>
<link href="<%=basePath%>dist/login/style.css" type="text/css" rel="stylesheet" rev="stylesheet"/>
<script type="text/javascript" src="<%=basePath%>bower_components/jquery/dist/jquery.min.js"></script>
</head>
<body class="denglu02">
	<div class="dl">
		<div class="biaoti"><img src="<%=basePath%>dist/login/images/ico02.png" /></div>
		<div class="log">
			<ul class="xuzhi02">
				 <li class="xz"> 已接入系统</li>
				 <li>房改及住房补贴管理子系统</li>
				 <li>政策法规管理子系统</li>
				 <li>办公用房管理子系统</li>
				 <li>经营性用房管理子系统</li>
			</ul>
			  <ul class="deng02">
				  <form action="<%=basePath%>localLogin.html" method="post">
					  <li class="xz" style="color: red;font-weight: bold"> ${message}</li>
					<li style=" width:100%; height:60px;">
						<p style="float:left;font-size:18px; color:#666;line-height:30px; min-width: 60px;" >用户名:</p>
						<input  class="i-text" type="text" name="loginName"  maxlength="50">
					</li>
					<div style="clear:both;"></div>

					<li style=" width:100%; height:60px;">
						<p style="float:left;font-size:18px; color:#666;line-height:30px; min-width: 60px;">密&nbsp;&nbsp;&nbsp;码:</p>
						<input  class="i-text" type="password" name="password"  maxlength="50">
					</li>
					<div style="clear:both;"></div>
					<li style=" width:100%; height:60px;">
						<button id="logonbtn" class="btn-login02" type="button" >
						<span>登&nbsp;&nbsp;&nbsp;&nbsp;录</span>
					  </button>
					</li>
				</form>
			</ul>
		</div>
	</div>
</body>
<script>
	$(function () {
		$("#logonbtn").on("click",function(){
			$(".deng02 form").submit();
		})
        $(".deng02 form").on("keypress",function(event){
            if(event.keyCode == "13"){
                $(".deng02 form").submit();
			}
		})
    })
</script>
</html>
