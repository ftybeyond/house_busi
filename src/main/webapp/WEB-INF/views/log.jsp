<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@include file="template/header.jsp"%>
<link rel="stylesheet" href="<%=basePath%>/bower_components/zTree/css/metroStyle/metroStyle.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<body class="hold-transition skin-red-light sidebar-mini">
<div class="wrapper">

	<%@include file="template/main_header.jsp"%>

	<%@include file="template/main-sidebar.jsp"%>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h3>
				日志查询
			</h3>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> ${applicationScope.sysHeaderTitle}</a></li>
				<li class="active">日志查询</li>
			</ol>
		</section>

		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-danger">
						<div class="box-header">
							<h3 class="box-title">日志列表</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="logList" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>流水号</th>
									<th>归属模块</th>
									<th>操作类型</th>
									<th>操作日期</th>
									<th>操作员</th>
								</tr>
								</thead>
							</table>
						</div>
				</div>
			</div>
		</section>
		
	</div>
	<!-- /.content-wrapper -->
	<%@include file="template/main-footer.jsp"%>
</div>

<!-- ./wrapper -->
</body>
<%@include file="template/footer_script.jsp"%>
<script src="<%=basePath%>/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        loadDeps(["<%=basePath%>rest/log/eventType"],function(loadedData) {
            $('#logList').DataTable({
                language: datatables_lan_cn,
                ordering: false,
                serverSide: true,
                searching: false,
                lengthChange: false,
                columns: [
                    {data: "id"},
                    {data: "belong"},
                    {data: "event", render: function (data, type, row, meta) {
						var dic = findArrayValue(data, loadedData[0]);
						return dic && dic.text ? dic.text : "";
					}},
                    {data: "stamp"},
                    {data: "operatorName"}
                ],
                ajax: {
                    "url": "<%=basePath%>rest/log/table",
                    "type": "post",
                    "data": function (a) {
                        delete  a.columns;
                        delete  a.order;
                        delete a.search;
                    },
                    dataSrc: 'data'
                }
            })
        });
    });
</script>
</html>

