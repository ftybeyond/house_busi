<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>宁夏回族自治区政府机关事务管理局房产信息智能管理平台</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="<%=path%>bower_components/bootstrap/dist/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="<%=path%>bower_components/font-awesome/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="<%=path%>bower_components/Ionicons/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<%=path%>dist/css/AdminLTE.min.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="<%=path%>dist/css/skins/skin-red-light.min.css">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="<%=path%>dist/js/html5/html5shiv.min.js"></script>
	<script src="<%=path%>dist/js/html5/respond.min.js"></script>
	<![endif]-->
	<!-- Google Font -->
	<link rel="stylesheet"
		  href="dist/css/google_font.css">
</head>
<body class="hold-transition skin-red-light sidebar-mini">
<div class="wrapper">

	<header class="main-header">
		<!-- Logo -->
		<a href="javascript:void(0)" class="logo">
			<!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini"><b>菜单</b></span>
			<!-- logo for regular state and mobile devices -->
			<span class="logo-lg"><b>房产信息管理平台</b></span>
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
							<img src="<%=path%>dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
							<span class="hidden-xs">超级管理员</span>
						</a>
						<ul class="dropdown-menu">
							<!-- User image -->
							<li class="user-header">
								<img src="<%=path%>dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

								<p>
									超级管理员-雨询
									<small>Member since Nov. 2012</small>
								</p>
							</li>
							<!-- Menu Footer-->
							<li class="user-footer">
								<div class="pull-left">
									<a href="#" class="btn btn-default btn-flat">密码修改</a>
								</div>
								<div class="pull-right">
									<a href="#" class="btn btn-default btn-flat">登出</a>
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<!-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar">
		<!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar">
			<!-- Sidebar user panel -->
			<div class="user-panel">
				<div class="pull-left image">
					<img src="<%=path%>dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
				</div>
				<div class="pull-left info">
					<p>超级管理员</p>
					<a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
				</div>
			</div>
			<!-- sidebar menu: : style can be found in sidebar.less -->
			<ul class="sidebar-menu" data-widget="tree">
				<li class="header">功能菜单</li>
				<li class="treeview">
					<a href="#">
						<i class="fa fa-dashboard"></i> <span>经营性房产</span>
						<span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
					</a>
					<ul class="treeview-menu">
						<li><a href="index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>
						<li><a href="index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
					</ul>
				</li>

				<li class="treeview">
					<a href="#">
						<i class="fa fa-share"></i> <span>Multilevel</span>
						<span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
					</a>
					<ul class="treeview-menu">
						<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
						<li class="treeview">
							<a href="#"><i class="fa fa-circle-o"></i> Level One
								<span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
							</a>
							<ul class="treeview-menu">
								<li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
								<li class="treeview">
									<a href="#"><i class="fa fa-circle-o"></i> Level Two
										<span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
									</a>
									<ul class="treeview-menu">
										<li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
										<li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
					</ul>
				</li>
				<li><a href="https://adminlte.io/docs"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
				<li class="header">LABELS</li>
				<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
				<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
				<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
			</ul>
		</section>
		<!-- /.sidebar -->
	</aside>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				Modals
				<small>new</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">UI</a></li>
				<li class="active">Modals</li>
			</ol>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-default">
						<div class="box-header with-border">
							<h3 class="box-title">Modal Examples</h3>
						</div>
						<div class="box-body">
							<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-default">
								Launch Default Modal
							</button>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="modal-default">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title">Default Modal</h4>
						</div>
						<div class="modal-body">
							<p>操作成功</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal" data-keyboard="false">确定</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 1.0.0
		</div>
		<strong>Copyright &copy; 2019-2022 <a href="#">宁夏回族自治区机关事务管理局</a>.</strong> All rights
		reserved.
	</footer>

</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="<%=path%>bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<%=path%>bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="<%=path%>bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<%=path%>dist/js/adminlte.min.js"></script>
</html>

