<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header class="main-header">
    <!-- Logo -->
    <a href="<%=basePath%>/page/welcome.html" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>菜单</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>${applicationScope.sysName}</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="<%=basePath%>dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                        <span class="hidden-xs">${sessionScope.op.roleObj.name}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="<%=basePath%>dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                            <p>
                                ${sessionScope.op.name}
                            </p>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="javascript:void(0)" id="pswChange" class="btn btn-default btn-flat">密码修改</a>
                            </div>
                            <div class="pull-right">
                                <a href="javascript:void(0)" id="logout" class="btn btn-default btn-flat">登出</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
<div id="passwordChangeWin" style="display: none;">
    <div class="box box-danger row" style="padding-top: 10px;">
        <!-- form start -->
        <form class="form-horizontal">
            <input type="hidden" name="id">
            <div class="form-group">
                <label  class="col-sm-3 control-label">原密码</label>
                <div class="col-sm-9">
                    <input type="password" class="form-control" name="oldPsw" placeholder="输入原密码">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-3 control-label">新密码</label>
                <div class="col-sm-9">
                    <input type="password" class="form-control" name="newPsw" placeholder="输入新密码">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-3 control-label">新密码</label>
                <div class="col-sm-9">
                    <input type="password" class="form-control" name="checkNewPsw" placeholder="再次输入新密码">
                </div>
            </div>
        </form>
    </div>
</div>
