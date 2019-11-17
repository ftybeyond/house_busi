<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<%=basePath%>dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${sessionScope.op.roleObj.name}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">功能菜单</li>
            <c:forEach items="${sessionScope.authority}" var="item">
                <li class="treeview">
                    <a href="#">
                        <i class="${item.value[0].mouIcon}"></i> <span>${item.key}</span>
                        <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        <c:forEach items="${item.value}" var="func">
                            <li><a href="<%=path%>${func.url}"><i class="${func.funIcon}"></i>${func.name}</a></li>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
