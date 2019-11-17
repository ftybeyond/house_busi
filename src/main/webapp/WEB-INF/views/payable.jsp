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
				应收管理
			</h3>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> ${applicationScope.sysHeaderTitle}</a></li>
				<li class="active">应收管理</li>
			</ol>
		</section>

		<section class="content">
			<div class="row">
				<div class="col-md-3">

					<!-- About Me Box -->
					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title">区域列表</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<ul id="treeDomain" class="ztree"></ul>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
				<div class="col-md-9">
					<div class="box box-danger row">
						<div class="box-header">
							<h3 class="box-title">查询信息</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body row">
							<form class="form-horizontal" id="searchForm">
								<input type="hidden" name="idPath">
								<div class="form-group col-md-5">
									<label class="col-sm-4 control-label">合同编码</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="serialNumberSearch"  placeholder="合同编码">
									</div>
								</div>
								<div class="form-group col-md-5">
									<label  class="col-sm-4 control-label">门牌号码</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="houseNumberSearch"  placeholder="门牌号码">
									</div>
								</div>
								<div class="form-group col-md-2">
									<button type="button" class="btn btn-primary pull-right" id="doSearch">查询</button>
								</div>
							</form>
						</div>
					</div>
					<div class="box box-danger row">
						<div class="box-header">
							<h3 class="box-title">合同信息</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="payableList" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>合同编码</th>
									<th>门牌地址</th>
									<th>承租单位</th>
									<th>面积(㎡)</th>
									<th>租金</th>
									<th>账期</th>
									<th>应付金额</th>
									<th></th>
								</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
		
	</div>
	<!-- /.content-wrapper -->
	<%@include file="template/main-footer.jsp"%>
</div>
<div id="popWin" style="display: none;">
	<div class="table-responsive">
		<table class="table">
			<tbody><tr>
				<th>付费账期：</th>
				<td><input type="text" class="form-control date" name="accountPeriod"/></td>
			</tr>
			<tr>
				<th>应付金额：</th>
				<td><input type="text" class="form-control" name="payable"/></td>
			</tr>
			<tr>
				<th>备注信息：</th>
				<td><textarea class="form-control" name="remark" rows="3"></textarea>
				</td>
			</tr>
			</tbody></table>
	</div>
</div>
<!-- ./wrapper -->
</body>
<%@include file="template/footer_script.jsp"%>
<script type="text/javascript" src="<%=basePath%>/bower_components/zTree/js/jquery.ztree.all.js"></script>
<script src="<%=basePath%>/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="<%=basePath%>/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath%>/bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript">
	var popWin;
	var editRow = function(row){
        var rowData = $("#payableList").DataTable().row(row).data();
        $("#popWin input[name='payable']").val(rowData.payable);
        $("#popWin input[name='accountPeriod']").val(rowData.accountPeriod);
        $("#popWin textarea[name='remark']").val(rowData.remark);
        popWin = layer.open({
            type: 1,
            title: false, //不显示标题
            content: $('#popWin'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
            title: '应收信息',
            shade: 0.6,
            area: ['500px', '400px'],
            btn: ["确定", "取消"],
			btn1:function(){
                var payable = $("#popWin input[name='payable']").val();
                var accountPeriod = $("#popWin input[name='accountPeriod']").val();
                var remark = $("#popWin textarea[name='remark']").val();
                if(!payable||payable.length <1){
                    layer.alert("请输入缴费金额！");
                    return;
				}
                if(!accountPeriod||accountPeriod.length <1){
                    layer.alert("请输入缴费时间！");
                    return;
                }
				$.post("<%=basePath%>rest/charge/update",{id:rowData.id,payable:payable,accountPeriod:accountPeriod,remark:remark},null,"json").done(function(rsp){
                    if(rsp.resultCode =="0000"){
                        layer.alert(rsp.description,{title:"操作成功",icon:1});
                        $("#payableList").DataTable().ajax.reload();
                        layer.close(popWin);
                    }else{
                        layer.alert(rsp.description,{title:"处理失败",icon:7})
                    }
				});
			},
			btn2:function(){
			    layer.close(popWin)
			}
        });
	};
	var delRow = function(row){
        var rowData = $("#payableList").DataTable().row(row).data();
        layer.confirm("确认删除此条应付信息？",{yes:function(){
            $.post("<%=basePath%>rest/charge/delete",{id:rowData.id},null,"json").done(function(rsp){
                if(rsp.resultCode =="0000"){
                    layer.alert(rsp.description,{title:"操作成功",icon:1});
                    $("#payableList").DataTable().ajax.reload();
                    layer.close(popWin);
                }else{
                    layer.alert(rsp.description,{title:"处理失败",icon:7})
                }
            });
		}});
	};
    $(document).ready(function(){
        loadDeps(["<%=basePath%>dictionary/AgreementState.json"],function(loadedData) {
            var setting = {
                view: {
                    selectedMulti: false
                },
                async: {
                    enable: true,
                    url: "<%=basePath%>rest/region/tree",
                    autoParam: ["id=pid"]
                },
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "id",
                        pIdKey: "parentId",
                        rootPId: 0
                    }
                },
                callback: {
                    onClick: function(event, treeId, treeNode){
                        $("input[name='idPath']").val(treeNode.idPath);
                        table.ajax.reload()
                    }
                }
            };
            $.fn.zTree.init($("#treeDomain"), setting);
            $("#doSearch").on("click",function(){
                table.ajax.reload();
            });
            $(".date").datepicker({
                language:"zh-CN",
                autoclose:true
            });
            var table = $('#payableList').DataTable({
                language:datatables_lan_cn,
                ordering: false,
                serverSide: true,
                searching:false,
                lengthChange:false,
                columns:[
                    {data:"agreementObj.serialNumber"},
                    {data:"houseObj.houseNumber"},
                    {data:"agreementObj.contacts2"},
                    {data:"houseObj.area"},
                    {data:"agreementObj.rent"},
                    {data:"accountPeriod"},
                    {data:"payable"}
                ],
                ajax: {
                    "url": "<%=basePath%>rest/charge/payable",
                    "type":"post",
                    "data":function (a) {
                        delete  a.columns;
                        delete  a.order;
                        delete a.search;
                        a['params[idPath]'] = $("#searchForm input[name='idPath']").val();
                        a['params[serialNumberSearch]'] = $("#searchForm input[name='serialNumberSearch']").val();
                        a['params[houseNumberSearch]'] = $("#searchForm input[name='houseNumberSearch']").val();
                    },
                    dataSrc:'data'
                },
                columnDefs: [ {
                    "targets": 7,
                    "data": "null",
                    "render": function ( data, type, row, meta ) {
                        var btns = '';
                        if(row.state == 0){
                             btns += '<button type="button" class="btn btn-danger btn-xs" onclick="editRow('+meta.row+')" >编辑</button>'+
                                '&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="delRow('+meta.row+')" >删除</button>';
                        }
                        return btns;
                    }
                } ]
            });
        });
    });
</script>
</html>

