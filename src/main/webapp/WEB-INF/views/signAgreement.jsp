<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@include file="template/header.jsp"%>
<link rel="stylesheet" href="<%=basePath%>bower_components/zTree/css/metroStyle/metroStyle.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>bower_components/datatables.net/select.dataTables.min.css">

<body class="hold-transition skin-red-light sidebar-mini">
<div class="wrapper">

	<%@include file="template/main_header.jsp"%>

	<%@include file="template/main-sidebar.jsp"%>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h3>
				合同关联
			</h3>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> ${applicationScope.sysHeaderTitle}</a></li>
				<li class="active">合同关联</li>
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
							<form class="form-horizontal" id="houseSearchForm">
								<input type="hidden" name="idPath">
								<div class="form-group col-md-5">
									<label class="col-sm-4 control-label">房产编码</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="houseCodeSearch"  placeholder="房产编码">
									</div>
								</div>
								<div class="form-group col-md-5">
									<label  class="col-sm-4 control-label">门牌号码</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="houseNumberSearch"  placeholder="门牌号码">
									</div>
								</div>
								<div class="form-group col-md-2">
									<button type="button" class="btn btn-primary pull-right" id="doHouseSearch">查询</button>
								</div>
							</form>
						</div>
					</div>
					<div class="box box-danger row">
						<div class="box-header">
							<h3 class="box-title">房屋信息(单机行选择房产，支持多选)</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-danger btn-xs" id="selectAgreement">关联合同</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="houseList" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>房产编号</th>
									<th>门牌号</th>
									<th>产权单位</th>
									<th>装修程度</th>
									<th>房屋类型</th>
									<th>面积(㎡)</th>
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
	<section class="content">
		<div class="box box-danger">
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
				<form class="form-horizontal" id="agreementSearchForm">
					<input type="hidden" name="idPath">
					<div class="form-group col-md-5">
						<label class="col-sm-4 control-label">合同编码</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="serialNumberSearch"  placeholder="合同编码">
						</div>
					</div>
					<div class="form-group col-md-5">
						<label  class="col-sm-4 control-label">合同标题</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="titleSearch"  placeholder="合同标题">
						</div>
					</div>
					<div class="form-group col-md-2">
						<button type="button" class="btn btn-primary pull-right" id="doAgreemntSearch">查询</button>
					</div>
				</form>
			</div>
		</div>
		<div class="box box-danger">
			<div class="box-header">
				<h3 class="box-title">合同信息（双击选择要关联的合同）</h3>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<table id="agreementList" class="table table-bordered table-hover" style="width: 100%;">
					<thead>
					<tr>
						<th>合同编号</th>
						<th>甲方单位</th>
						<th>乙方单位</th>
						<th>起始时间</th>
						<th>截止时间</th>
						<th>租金</th>
						<th>付款周期</th>
						<th></th>
					</tr>
					</thead>
				</table>
			</div>
		</div>
	</section>
</div>
<div id="popWin2" style="display: none;">
	<div id="popContent" class="box box-danger" style="padding: 10px;">

	</div>
</div>
<!-- ./wrapper -->
</body>
<%@include file="template/footer_script.jsp"%>
<script type="text/javascript" src="<%=basePath%>/bower_components/zTree/js/jquery.ztree.all.js"></script>
<script src="<%=basePath%>/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
    var popWin;
    var showContent = function(id){
        $("#popContent").empty();
        popWin2 = layer.open({
            type: 1,
            content: $('#popWin2'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
            title: '合同正文',
            shade: 0.6,
            area: ['800px', '600px']
        });
        $.post("<%=basePath%>rest/agreement/getContent",{id:id},null,"json").done(function(rsp){
            if(rsp.resultCode =="0000"){
                $("#popContent").append(rsp.data)
            }else{
                layer.alert(rsp.description,{title:"处理失败",icon:7})
            }
        })
    };
    $(document).ready(function(){
        loadDeps(["<%=basePath%>dictionary/HouseNature.json","<%=basePath%>dictionary/Decorate.json","<%=basePath%>dictionary/PayRound.json"],function(loadedData){
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
                        houseTable.ajax.reload()
                    }
                }
            };
            var tree = $.fn.zTree.init($("#treeDomain"), setting);
            $("#doAgreemntSearch").on("click",function(){
                agreementTable.ajax.reload();
			});
            $("#doHouseSearch").on("click",function(){
                houseTable.ajax.reload();
            });
            var selectedRows;
            $("#selectAgreement").on("click",function () {
				selectedRows = houseTable.rows('.selected').data();
				if(selectedRows.length == 0){
				    layer.alert("请选择要关联合同的房产，单机行选择房产，支持多选！");
				    return;
				}
                popWin = layer.open({
                    type: 1,
                    title: false, //不显示标题
                    content: $('#popWin'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
                    title: '合同选择',
                    shade: 0.6,
                    area: ['800px', '600px']
                });
            });

            var houseTable = $('#houseList').DataTable({
                language:datatables_lan_cn,
                ordering: false,
                serverSide: true,
                searching:false,
                lengthChange:false,
                columns:[
                    {data:"houseCode"},
                    {data:"houseNumber"},
                    {data:"owner"},
                    {data:"decorate",render:function(row){
                        var dic = findArrayValue(row,loadedData[1]);
                        return dic&&dic.text?dic.text:"";
                    }},
                    {data:"nature",render:function(row){
                        var dic = findArrayValue(row,loadedData[0]);
                        return dic&&dic.text?dic.text:"";
					}},
                    {data:"area"}

                ],
                ajax: {
                    "url": "<%=basePath%>rest/house/table",
                    "type":"post",
                    "data":function (a) {
                        delete  a.columns;
                        delete  a.order;
                        delete a.search;
                        a['params[am]']=-1;
                        a['params[idPath]'] = $("#houseSearchForm input[name='idPath']").val();
                        a['params[houseCodeSearch]'] = $("#houseSearchForm input[name='houseCodeSearch']").val();
                        a['params[houseNumberSearch]'] = $("#houseSearchForm input[name='houseNumberSearch']").val();
                    },
                    dataSrc:'data'
                }
            });
            var agreementTable = $('#agreementList').DataTable({
                language:datatables_lan_cn,
                ordering: false,
                serverSide: true,
                searching:false,
                lengthChange:false,
                columns:[
                    {data:"serialNumber"},
                    {data:"contacts1"},
                    {data:"contacts2"},
                    {data:"effectDate"},
                    {data:"endDate"},
                    {data:"rent"},
                    {data:"payRound",render:function(row){
                        var dic = findArrayValue(row,loadedData[2]);
                        return dic&&dic.text?dic.text:"";
                    }}
                ],
                ajax: {
                    "url": "<%=basePath%>rest/agreement/table",
                    "type":"post",
                    "data":function (a) {
                        delete  a.columns;
                        delete  a.order;
                        delete a.search;
                        a['params[state]']='0,1';
                        a['params[idPath]'] = $("#agreementSearchForm input[name='idPath']").val();
                        a['params[serialNumberSearch]'] = $("#agreementSearchForm input[name='serialNumberSearch']").val();
                        a['params[titleSearch]'] = $("#agreementSearchForm input[name='titleSearch']").val();
                    },
                    dataSrc:'data'
                },
                columnDefs: [ {
                    "targets": 7,
                    "data": "null",
                    "render": function ( data, type, row, meta ) {
                        var btns ='<button type="button" class="btn btn-danger btn-xs" onclick="showContent('+row.id+')" >查看正文</button>';
                        return btns;
                    }
                } ]
            });

            $('#houseList tbody').on( 'click', 'tr', function () {
                $(this).toggleClass('selected');
            });
            $('#agreementList tbody').on( 'dblclick', 'tr', function () {
                if (!$(this).hasClass('selected')) {
                    agreementTable.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                }
                var houses='';
                $.each(selectedRows,function(index,item){
                    houses+=item.houseNumber;
                    if(index<selectedRows.length-1){
                        houses+=","
					}
				});
                var housesParam= $.map(selectedRows,function(value){
                    return value.id;
                });
                var agreement = agreementTable.rows('.selected').data()[0];
                layer.confirm("确认关联房产<p>" + houses+"</p>到合同<p>"+agreement.title+"</p>",{yes:function(){
                    $.ajax({
                        type: "POST",
                        dataType:"json",
                        url: "<%=basePath%>rest/house/relateAgreement",
                        data: {houses:housesParam,agreement:agreement.id},
                        traditional:true
					}).done(function(rsp){
                        if(rsp.resultCode =="0000"){
                            houseTable.ajax.reload();
                            agreementTable.ajax.reload();
                            layer.alert(rsp.description,{title:"操作成功",icon:1});
                            layer.close(popWin);
                        }else{
                            layer.alert(rsp.description,{title:"处理失败",icon:7})
                        }
					})
				}});
            });
        });
    });
</script>
</html>

