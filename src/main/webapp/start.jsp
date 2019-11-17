<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link href="<%=basePath%>bower_components/metro/css/metro-all.css" rel="stylesheet">
    <link href="<%=basePath%>bower_components/metro/css/start.css" rel="stylesheet">

    <title>宁夏回族自治区公共房产管理平台</title>
</head>
<body class="bg-dark fg-white h-vh-100 m4-cloak">

    <div class="container-fluid start-screen h-100">
        <h1 class="start-screen-title">宁夏回族自治区公共房产管理平台</h1>

        <div class="tiles-area clear">
            <div class="tiles-grid tiles-group size-6 fg-white" data-group-title="登录入口">
                <div data-role="tile" class="bg-indigo fg-white">
                    <span class="mif-school icon"></span>
                    <span class="branding-bar">系统应用支撑平台</span>
                </div>
                <div data-role="tile" class="bg-cyan fg-white">
                    <span class="mif-copy icon"></span>
                    <span class="branding-bar">政策法规管理子系统</span>
                </div>
                <div data-role="tile" class="bg-orange fg-white" data-size="wide">
                    <span class="mif-home icon"></span>
                    <span class="branding-bar">办公用房管理子系统</span>
                </div>

                <div data-role="tile" class="bg-brown fg-white">
                    <span class="mif-equalizer icon"></span>
                    <span class="branding-bar">工程项目管理子系统</span>
                </div>
                <div data-role="tile" class="bg-violet fg-white">
                    <span class="mif-file-image icon"></span>
                    <span class="branding-bar">自管公房管理子系统</span>
                </div>
                <a href="<%=basePath%>page/welcome.html" data-role="tile" class="bg-darkRed fg-white" data-size="wide">
                    <span class="mif-dollar2 icon"></span>
                    <span class="branding-bar">经营性房产管理子系统</span>
                </a>
                <div data-role="tile" class="bg-emerald fg-white">
                    <span class="mif-link icon"></span>
                    <span class="branding-bar">国管局对接子系统</span>
                </div>
                <div data-role="tile" class="bg-amber fg-white">
                    <span class="mif-table icon"></span>
                    <span class="branding-bar">房改及住房补贴管理子系统</span>
                </div>
            </div>

        </div>
    </div>


    <script src="<%=basePath%>bower_components/jquery/dist/jquery.min.js"></script>
    <script src="<%=basePath%>bower_components/metro/js/metro.js"></script>
    <script src="<%=basePath%>bower_components/metro/js/start.js"></script>

</body>
</html>