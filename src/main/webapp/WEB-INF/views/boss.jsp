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
				领导决策
			</h3>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> ${applicationScope.sysHeaderTitle}</a></li>
				<li class="active">领导决策</li>
			</ol>
		</section>

		<section class="content">
			<div class="row">
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="info-box">
						<span class="info-box-icon bg-aqua"><i class="icon ion-home"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">总房产数</span>
							<span class="info-box-number"><span id="housesCount"></span><small>套</small></span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="info-box">
						<span class="info-box-icon bg-red"><i class="icon ion-alert-circled"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">闲置房源</span>
							<span class="info-box-number"><span id="idleHousesCount"></span><small>套</small></span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->

				<!-- fix for small devices only -->
				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="info-box">
						<span class="info-box-icon bg-green"><i class="icon ion-calculator"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">本年度应收</span>
							<span class="info-box-number"><span id="yearPayable"></span><small>元</small></span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="info-box">
						<span class="info-box-icon bg-yellow"><i class="icon ion-grid"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">合计面积</span>
							<span class="info-box-number"><span id="housesAreaCount"></span><small>㎡</small></span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
			</div>
			<div class="row">
				<div class="col-md-6">
					<!-- 应收/实收 -->
					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title">租金收缴情况</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
							</div>
						</div>
						<div class="box-body" id="houseCharge" style="height: 400px;" align="center">

						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->

					<!-- 空闲/在租 -->
					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title">房产使用情况</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
							</div>
						</div>
						<div class="box-body" id="houseUsed" style="height: 400px;" align="center">

						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->

				</div>
				<!-- /.col (LEFT) -->
				<div class="col-md-6">
					<!-- LINE CHART -->
					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title">应收月度汇总</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
							</div>
						</div>
						<div class="box-body" id="houseChargeYear" style="height: 400px;" align="center">

						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->

					<!-- BAR CHART -->
					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title">年度收缴环比</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
							</div>
						</div>
						<div class="box-body" id="houseUsedYear" style="height: 400px;" align="center">

						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->

				</div>
				<!-- /.col (RIGHT) -->
			</div>
		</section>
		
	</div>
	<!-- /.content-wrapper -->
	<%@include file="template/main-footer.jsp"%>
</div>
<!-- ./wrapper -->
</body>
<%@include file="template/footer_script.jsp"%>
<script src="<%=basePath%>/bower_components/echars/echarts.min.js"></script>
<script src="<%=basePath%>/dist/js/boss.js"></script>
</html>

