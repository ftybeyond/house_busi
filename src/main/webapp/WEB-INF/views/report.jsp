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
				统计报表
			</h3>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> ${applicationScope.sysHeaderTitle}</a></li>
				<li class="active">统计报表</li>
			</ol>
		</section>

		<section class="content">
			<div class="box box-danger">
				<!-- /.box-header -->
				<div class="box-body">
					<iframe name="report"  src="${applicationScope.reportUrl}" width="100%" height="100%" id="iframepage" frameborder="0"  marginheight="0" marginwidth="0" onLoad="autoSize(this)"></iframe>
				</div>
			</div>
		</section>
		
	</div>
	<!-- /.content-wrapper -->
	<%@include file="template/main-footer.jsp"%>
</div>

<div id="popWin" style="display: none;">

</div>
<!-- ./wrapper -->
</body>
<%@include file="template/footer_script.jsp"%>
<script type="text/javascript">
    function autoSize(ifm) {
		$(ifm).height($("div.content-wrapper").outerHeight())
    }
</script>
</html>

