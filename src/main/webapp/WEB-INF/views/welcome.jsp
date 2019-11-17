<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@include file="template/header.jsp"%>
<body class="hold-transition skin-red-light sidebar-mini">
<div class="wrapper">

	<%@include file="template/main_header.jsp"%>

	<%@include file="template/main-sidebar.jsp"%>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h3>
				首页
			</h3>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> ${applicationScope.sysHeaderTitle}</a></li>
				<li class="active">首页</li>
			</ol>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-6">
					<!-- Default box -->
					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title">自治区本级行政事业单位国有资产进场出租流程图</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
										title="Collapse">
									<i class="fa fa-minus"></i></button>
							</div>
						</div>
						<div class="box-body" align="center">
							<img src="<%=basePath%>dist/img/flow.png" style="overflow: hidden"/>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>

				<div class="col-md-6">
					<!-- Default box -->
					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title">重要通知</h3>

							<div class="box-tools pull-right">
								<a href="#">全部</a>
								<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
										title="Collapse">
									<i class="fa fa-minus"></i></button>
							</div>
						</div>
						<div class="box-body">
							<table class="table table-hover">
								<tr>
									<th>标题</th>
									<th>发起单位</th>
									<th>发表日期</th>
									<th>类型</th>
								</tr>
								<tr>
									<td>经营性资产通知</td>
									<td>机管局</td>
									<td>2019-01-01</td>
									<td>政策法规</td>
								</tr>
								<tr>
									<td>经营性用房管理规范</td>
									<td>机管局</td>
									<td>2018-12-11</td>
									<td>管理规范</td>
								</tr>
							</table>
						</div>
						<!-- /.box-body -->
					</div>
					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title">租期临近</h3>

							<div class="box-tools pull-right">
								<a href="#">更多</a>
								<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
										title="Collapse">
									<i class="fa fa-minus"></i></button>
							</div>
						</div>
						<div class="box-body">
							<table class="table table-hover">
								<tr>
									<th>单位地址</th>
									<th>承租人</th>
									<th>租约到期</th>
									<th>状态</th>
								</tr>
								<tr>
									<td>解放西街201号</td>
									<td>John Doe</td>
									<td>2019-05-21</td>
									<td><span class="label label-primary">30天</span></td>
								</tr>
								<tr>
									<td>怀远西路100号</td>
									<td>Alexander Pierce</td>
									<td>2019-05-11</td>
									<td><span class="label label-warning">20天</span></td>
								</tr>
								<tr>
									<td>政府大院4号楼105室</td>
									<td>Bob Doe</td>
									<td>2019-04-09</td>
									<td><span class="label label-warning">10天</span></td>
								</tr>
								<tr>
									<td>凤凰北街1号</td>
									<td>Mike Doe</td>
									<td>2019-04-15</td>
									<td><span class="label label-danger">超期5天</span></td>
								</tr>
							</table>
						</div>
						<!-- /.box-body -->
					</div>
					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title">流程文档</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
										title="Collapse">
									<i class="fa fa-minus"></i></button>
							</div>
						</div>
						<div class="box-body">
							<table class="table table-hover">
								<tr>
									<th>序号</th>
									<th>文档名称</th>
									<th>说明</th>
								</tr>
								<tr>
									<td>0</td>
									<td>出租方需提供资料清单</td>
									<td><a href="#">下载</a></td>
								</tr>
								<tr>
									<td>1</td>
									<td>租赁项目申请书（一式两份）</td>
									<td><a href="#">下载</a></td>
								</tr>
								<tr>
									<td>2</td>
									<td>行政单位国有资产租赁委托书（一式两份）</td>
									<td><a href="#">下载</a></td>
								</tr>
								<tr>
									<td>3</td>
									<td>行政单位资产租赁挂牌价格核准备案表</td>
									<td><a href="#">下载</a></td>
								</tr>
								<tr>
									<td>4</td>
									<td>授权委托书</td>
									<td><a href="#">下载</a></td>
								</tr>
							</table>
						</div>
						<!-- /.box-body -->
					</div>
				</div>

			</div>
		</section>
		<!-- /.content -->

	</div>
	<!-- /.content-wrapper -->
	<%@include file="template/main-footer.jsp"%>
</div>
<!-- ./wrapper -->
</body>
<%@include file="template/footer_script.jsp"%>
</html>

