<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>${applicationScope.sysTitle}</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet" href="<%=basePath%>bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="<%=basePath%>bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="<%=basePath%>bower_components/Ionicons/css/ionicons.min.css">

        <link rel="stylesheet" href="<%=basePath%>/bower_components/select2/dist/css/select2.min.css">

        <!-- Theme style -->
        <link rel="stylesheet" href="<%=basePath%>dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="<%=basePath%>dist/css/skins/skin-red-light.min.css">
        <script>var basePath = '<%=basePath%>'</script>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="<%=basePath%>dist/js/html5/html5shiv.min.js"></script>
        <script src="<%=basePath%>dist/js/html5/respond.min.js"></script>
        <![endif]-->
        <!-- Google Font -->
        <%--<link rel="stylesheet"--%>
              <%--href="<%=basePath%>dist/css/google_font.css">--%>
    </head>
