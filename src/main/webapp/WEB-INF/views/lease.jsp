<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@include file="template/header.jsp"%>
<link rel="stylesheet" href="<%=basePath%>bower_components/zTree/css/metroStyle/metroStyle.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<body class="hold-transition skin-red-light sidebar-mini">
<div class="wrapper">

	<%@include file="template/main_header.jsp"%>

	<%@include file="template/main-sidebar.jsp"%>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h3>
				租约管理
			</h3>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> ${applicationScope.sysHeaderTitle}</a></li>
				<li class="active">租约管理</li>
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
							<h3 class="box-title">房屋信息</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="leaseList" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>合同编码</th>
									<th>门牌号</th>
									<th>承租单位</th>
									<th>面积(㎡)</th>
									<th>租金</th>
									<th>合同到期</th>
									<th>租赁状态</th>
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
					<th>合同编号:</th>
					<td class="serialNumber winValue"></td>
					<th>合同标题:</th>
					<td class="title winValue"></td>
				</tr>
				<tr>
					<th>起始日期</th>
					<td class="effectDate winValue"></td>
					<th>截止日期:</th>
					<td class="endDate winValue"></td>
				</tr>
				<tr>
					<th>甲方单位:</th>
					<td class="contacts1 winValue"></td>
					<th>乙方单位:</th>
					<td class="contacts2 winValue"></td>
				</tr>
				<tr>
					<th>账期</th>
					<th colspan="3">应交金额</th>
				</tr>

				</tbody></table>
		</div>
</div>
<div id="popWin1" style="display: none;">
	<div class="table-responsive">
		<table class="table">
			<tbody><tr>
				<th>合同编号:</th>
				<td class="serialNumber winValue"></td>
				<th>合同标题:</th>
				<td class="title winValue"></td>
			</tr>
			<tr>
				<th>起始日期</th>
				<td class="effectDate winValue"></td>
				<th>截止日期:</th>
				<td class="endDate winValue"></td>
			</tr>
			<tr>
				<th>甲方单位:</th>
				<td class="contacts1 winValue"></td>
				<th>乙方单位:</th>
				<td class="contacts2 winValue"></td>
			</tr>
			<tr>
				<th>所属区域</th>
				<th>房产地址</th>
				<th>产权单位</th>
				<th>房产面积</th>
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
<script src="<%=basePath%>/bower_components/moment/moment.min.js"></script>
<script type="text/javascript">
	var popWin,popWin1;
    var perform = function(row){
        var rowData = $("#leaseList").DataTable().row(row).data();
        var loadingMask = layer.msg('拼命加载中......', {shade: [0.8, '#393D49'], time: 0, icon: 16});
        $.post("<%=basePath%>rest/agreement/houses",{agreement:rowData.agreement},null,"json").done(function(rsp){
            if(rsp.resultCode =="0000"){
                layer.close(loadingMask);
                $("#popWin1.winValue").empty();
                $("#popWin1 tr.genValue").remove();
                $("#popWin1 td.serialNumber").html(rowData.agreementObj.serialNumber);
                $("#popWin1 td.title").html(rowData.agreementObj.title);
                $("#popWin1 td.effectDate").html(rowData.agreementObj.effectDate);
                $("#popWin1 td.endDate").html(rowData.agreementObj.endDate);
                $("#popWin1 td.contacts1").html(rowData.agreementObj.contacts1);
                $("#popWin1 td.contacts2").html(rowData.agreementObj.contacts2);
                $.each(rsp.data,function(index,item){
                    $("#popWin1 table tbody").append('<tr class="genValue"><td>'+item.regionPath+'</td><td >'+item.houseNumber+'</td><td >'+item.owner+'</td><td >'+item.area+'</td></tr>');
				});
                popWin1 = layer.open({
                    type: 1,
                    title: false, //不显示标题
                    content: $('#popWin1'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
                    title: '合同履行明细',
                    shade: 0.6,
                    area: ['600px', '500px'],
                    btn:["确认履行","取消"],
                    btn1:function(){
                        $.post("<%=basePath%>rest/agreement/perform",{agreement:rowData.agreement},null,"json").done(function(data){
                            if(data.resultCode =="0000"){
                                layer.close(popWin1)
                                layer.alert(data.description,{title:"操作成功",icon:1});
                                $("#leaseList").DataTable().ajax.reload();
                            }else{
                                layer.alert(data.description,{title:"处理失败",icon:7})
                            }
                        })
                    },
                    btn2:function(){
                        layer.close(popWin1);
                    }
                });
            }else{
                layer.alert(rsp.description,{title:"数据拉取失败",icon:7})
            }
		});
    };
    var relieve = function(row){
        var rowData = $("#leaseList").DataTable().row(row).data();
        layer.confirm("确定对房屋解绑合同？",{yes:function(){
            $.post("<%=basePath%>rest/agreement/relieve",{house:rowData.id,agreement:rowData.agreement},null,"json").done(function(rsp){
                if(rsp.resultCode =="0000"){
                    layer.alert(rsp.description,{title:"操作成功",icon:1});
                    $("#leaseList").DataTable().ajax.reload();
                }else{
                    layer.alert(rsp.description,{title:"处理失败",icon:7})
                }
            })
		}});
    };
    var over = function(row){
        var rowData = $("#leaseList").DataTable().row(row).data();
        $.post("<%=basePath%>rest/agreement/getPayable",{agreement:rowData.agreement},null,"json").done(function(rsp){
            if(rsp.resultCode =="0000"){
                $("#popWin.winValue").empty();
                $("#popWin tr.genValue").remove();
                $("#popWin td.serialNumber").html(rowData.agreementObj.serialNumber);
                $("#popWin td.title").html(rowData.agreementObj.title);
                $("#popWin td.effectDate").html(rowData.agreementObj.effectDate);
                $("#popWin td.endDate").html(rowData.agreementObj.endDate);
                $("#popWin td.contacts1").html(rowData.agreementObj.contacts1);
                $("#popWin td.contacts2").html(rowData.agreementObj.contacts2);
                var sum = 0;
                $.each(rsp.data,function (index,item) {
					$("#popWin table tbody").append('<tr class="genValue"><td>'+item.accountPeriod+'</td><td>'+item.payable+'</td></tr>');
					sum += item.payable;
                });
                $("#popWin table tbody").append('<tr class="genValue"><th>合计应付：</th><td colspan="3">'+sum+'</td></tr>');
                $("#popWin table tbody").append('<tr class="genValue"><th>最终应付：</th><td><input type="text" name="finalPayable"/></td><th>最终实付：</th><td><input type="text" name="finalPayment"/></td></tr>');
				var _overDate = $('<tr class="genValue"><th>终止日期：</th><td colspan="3"><input type="text" name="overDate"/></td></tr>');
				_overDate.find("input[name='overDate']").datepicker({
                    language:"zh-CN",
                    autoclose:true
                });
                $("#popWin table tbody").append(_overDate);
                popWin = layer.open({
                    type: 1,
                    title: false, //不显示标题
                    content: $('#popWin'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
                    title: '合同终止明细',
                    shade: 0.6,
                    area: ['600px', '500px'],
					btn:["终止","取消"],
					btn1:function(){
						var payable = $("#popWin input[name='finalPayable']").val();
						var payment = $("#popWin input[name='finalPayment']").val();
                        var endDate = $("#popWin input[name='overDate']").val();
                        if(!payable||payable.length <1){
                            layer.alert("最终应付金额不能为空");
                            $("#popWin input[name='finalPayable']").focus();
                            return;
						}
                        if(!payment||payment.length <1){
                            layer.alert("最终实付金额不能为空");
                            $("#popWin input[name='finalPayment']").focus();
                            return;
                        }
                        if(!endDate||endDate.length <1){
                            layer.alert("终止日期不能为空");
                            $("#popWin input[name='overDate']").focus();
                            return;
                        }
                        $.post("<%=basePath%>rest/agreement/over",{house:rowData.id,agreement:rowData.agreement,payable:payable,payment:payment,endDate:endDate},null,"json").done(function(data){
							if(data.resultCode == "0000"){
							    layer.close(popWin)
							    layer.alert(data.description);
                                $("#leaseList").DataTable().ajax.reload();
							}else{
                                layer.alert(data.description,{title:"处理失败",icon:7})
							}
						});
					},
					btn2:function(){
					    layer.close(popWin);
					}
                });
            }else{
                layer.alert(rsp.description,{title:"未缴账单拉取失败",icon:7})
            }
		})
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
            var table = $('#leaseList').DataTable({
                language:datatables_lan_cn,
                ordering: false,
                serverSide: true,
                searching:false,
                lengthChange:false,
                columns:[
                    {data:"agreementObj.serialNumber"},
                    {data:"houseNumber"},
                    {data:"agreementObj.contacts2"},
                    {data:"area"},
                    {data:"agreementObj.rent"},
                    {data:"agreementObj.endDate"},
                    {data:"agreementObj.state",render:function(data, type, row, meta){
                        var dic = findArrayValue(data,loadedData[0]);
                        return dic&&dic.text?dic.text:"";
					}}
                ],
                ajax: {
                    "url": "<%=basePath%>rest/house/leaseList",
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
                        if (row.agreementObj.state == 1){
							btns += '<button type="button" class="btn btn-danger btn-xs" onclick="perform('+meta.row+')" >履行</button>';
                            btns += '&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="relieve('+meta.row+')" >解除</button>';
                        }else {
                            btns += '<button type="button" class="btn btn-danger btn-xs" onclick="over('+meta.row+')" >终止</button>';
						}
                        return btns;
                    }
                } ]
            });
        });
    });
</script>
</html>

