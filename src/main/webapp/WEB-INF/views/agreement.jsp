<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@include file="template/header.jsp"%>
<link rel="stylesheet" href="<%=basePath%>bower_components/zTree/css/metroStyle/metroStyle.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css"/>
<body class="hold-transition skin-red-light sidebar-mini">
<div class="wrapper">

	<%@include file="template/main_header.jsp"%>

	<%@include file="template/main-sidebar.jsp"%>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h3>
				合同管理
			</h3>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> ${applicationScope.sysHeaderTitle}</a></li>
				<li class="active">合同管理</li>
			</ol>
		</section>

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
						<form class="form-horizontal" id="searchForm">
							<div class="form-group col-md-4">
								<label class="col-sm-4 control-label">合同编码</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="serialNumberSearch"  placeholder="合同编码">
								</div>
							</div>
							<div class="form-group col-md-4">
								<label  class="col-sm-4 control-label">合同标题</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="titleSearch"  placeholder="合同标题">
								</div>
							</div>
							<div class="form-group col-md-3">
								<label  class="col-sm-4 control-label">合同状态</label>
								<div class="col-sm-8">
									<select  class="form-control"  name="stateSearch"></select>
								</div>
							</div>
							<div class="form-group col-md-1">
								<button type="button" class="btn btn-primary pull-right" id="doSearch">查询</button>
							</div>
						</form>
					</div>
				</div>
			<div class="box box-danger">
						<div class="box-header">
							<h3 class="box-title">合同信息</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-danger btn-xs" id="addHouseBtn">新增</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="agreementList" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>合同编号</th>
									<th>甲方单位</th>
									<th>乙方单位</th>
									<th>起始时间</th>
									<th>截止时间</th>
									<th>租金</th>
									<th>付款周期</th>
									<th>合同状态</th>
									<th></th>
								</tr>
								</thead>
							</table>
						</div>
					</div>
		</section>
		
	</div>
	<!-- /.content-wrapper -->
	<%@include file="template/main-footer.jsp"%>
</div>

<div id="popWin" style="display: none;">
	<div class="box box-danger row">
		<!-- form start -->
		<form class="form-horizontal" enctype="multipart/form-data">
			<input type="hidden" name="id">
			<div class="box-body col-md-6">
				<div class="form-group">
					<label  class="col-sm-3 control-label">合同编号</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="serialNumber"  placeholder="合同编号">
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">甲方名称</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="contacts1" placeholder="甲方名称">
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">联系方式</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="contacts1Tel" placeholder="甲方联系方式">
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">起始时间</label>
					<div class="col-sm-9">
						<input type="text" class="form-control date" name="effectDate" placeholder="起始时间">
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">租金</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="rent" placeholder="租金">
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">签订日期</label>
					<div class="col-sm-9">
						<input type="text" class="form-control date" name="signDate"  placeholder="签订日期">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<button type="button" id="addAccessory" style="margin-left: 10px;" class="btn btn-sm">添加附件</button>
					</div>
				</div>

			</div>
			<div class="box-body col-md-6">
				<div class="form-group">
					<label class="col-sm-3 control-label">合同标题</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="title" id="title" placeholder="合同标题">
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">乙方名称</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="contacts2"  placeholder="乙方名称">
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">联系方式</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="contacts2Tel"  placeholder="乙方联系方式">
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">截止时间</label>
					<div class="col-sm-9">
						<input type="text" class="form-control date" name="endDate"  placeholder="截止时间">
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">租金周期</label>
					<div class="col-sm-9">
						<select  class="form-control"  name="payRound"></select>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">收租次数</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="chargeTimes"  placeholder="收租次数">
					</div>
				</div>
			</div>
			<div class="box-body col-md-12 accessory" style="padding-left: 35px;">

			</div>
			<!-- /.box-body -->
			<div class="box-footer">
				<button type="button" id="popCancel" class="btn btn-primary pull-right">取消</button>
				<button type="button" id="popSubmit" class="btn btn-primary pull-right" style="margin-right: 10px;">保存</button>
			</div>
			<!-- /.box-footer -->
		</form>
	</div>
</div>
<div id="popWin1" style="display: none">
	<textarea id="editor1" name="content" rows="10" cols="80">

	</textarea>
</div>

<div id="popWin2" style="display: none;">
	<div id="popContent" class="box box-danger" style="padding: 10px;">

	</div>
</div>
<!-- ./wrapper -->
</body>
<%@include file="template/footer_script.jsp"%>
<script src="<%=basePath%>/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="<%=basePath%>/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath%>/bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>/bower_components/ckeditor/ckeditor.js"></script>
<script src="<%=basePath%>/bower_components/ckeditor/config.js"></script>
<script src="<%=basePath%>/bower_components/jquery/form.js"></script>
<script src="<%=basePath%>/bower_components/jquery/jquery.validate.min.js"></script>
<script src="<%=basePath%>/bower_components/jquery/jquery.validate.messages_zh.js"></script>

<script type="text/javascript">
    var popWin,popWin1,popWin2,validator;
    var editRow = function(index){
        $('#popWin form')[0].reset();
        validator.resetForm();
        $("#popWin form input[type='hidden']").val("");
        $("#popWin form select").val(null).trigger("change");
        $("#popWin .accessory").empty();
        var rowData = $("#agreementList").DataTable().row(index).data();
        for (key in rowData) {
            if ($("#popWin input[name='" + key + "']").length > 0) {
                $("#popWin input[name='" + key + "']").val(rowData[key]);
            } else if ($("#popWin select[name='" + key + "']").length > 0) {
                $("#popWin select[name='" + key + "']").val(rowData[key]).change();
            } else if($("#popWin textarea[name='" + key + "']").length > 0){
                $("#popWin textarea[name='" + key + "']").val(rowData[key]);
            }
        };
        popWin = layer.open({
            type: 1,
            title: false, //不显示标题
            content: $('#popWin'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
            title: '编辑合同',
            shade: 0.6,
            area: ['800px', '500px']
        });
        //拉附件
        $.post("<%=basePath%>rest/agreement/getAccessories",{id:rowData.id},null,"json").done(function(rsp){
            if(rsp.resultCode =="0000"){
                $.each(rsp.data,function(index,item){
                    var accessoryRow = '<a href="<%=basePath%>rest/download/accessory?id='+item.id+'">'+item.name+'</a>';
                    var _accessoryRow = $(accessoryRow);
                    var delBtn = '<button type="button" class="btn btn-xs btn-danger">删除</button>';
                    var _delBtn = $(delBtn);
                    _delBtn.on("click",function(){
                        $.post("<%=basePath%>rest/agreement/deleteAccessory",{id:item.id},null,"json").done(function(r){
                            if(r.resultCode =="0000"){
                                _accessoryRow.remove();
                                _delBtn.remove();
                                layer.alert(rsp.description,{title:"操作成功",icon:1});
                            }else{
                                layer.alert(rsp.description,{title:"附件删除失败!",icon:7})
							}
						}).fail(function(xhr){layer.alert("服务器内部错误")});
					});
                    $(".accessory").append(_accessoryRow).append("&nbsp;&nbsp;").append(_delBtn).append("&nbsp;&nbsp;");
				});
            }else{
                layer.alert(rsp.description,{title:"附件数据拉取失败!",icon:7})
            }
		})
    };
    var delRow = function(index){
        var rowData = $("#agreementList").DataTable().row(index).data();
        layer.confirm("确定删除数据?",{yes:function(){
            $.post("<%=basePath%>rest/agreement/delete",{id:rowData.id},null,"json").done(function(rsp){
                if(rsp.resultCode =="0000"){
                    layer.alert(rsp.description,{title:"操作成功",icon:1});
                    $("#agreementList").DataTable().ajax.reload();
                }else{
                    layer.alert(rsp.description,{title:"处理失败",icon:7})
                }
            })
        }})
    };
    var editContent = function(id){
        popWin1 = layer.open({
            type: 1,
            content: $('#popWin1'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
            title: '合同正文',
            shade: 0.6,
            area: ['800px', '600px'],
			btn:['保存','取消'],
			yes:function(){
                var stem = CKEDITOR.instances.editor1.getData();
                $.post("<%=basePath%>rest/agreement/saveContent",{id:id,content:stem},null,"json").done(function(rsp){
                    if(rsp.resultCode =="0000"){
                        layer.alert(rsp.description,{title:"操作成功",icon:1});
                        layer.close(popWin1);
                    }else{
                        layer.alert(rsp.description,{title:"处理失败",icon:7})
                    }
				})
			},
			btn1:function(){
			    layer.close(popWin1);
			}
        });
        if(CKEDITOR.instances.editor1){
            CKEDITOR.instances.editor1.destroy();
        }
        CKEDITOR.replace('content',{height:'390px'});
	};
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
        var validateRules = {
            title:{
                required: true,
                maxlength: 50
            },
            serialNumber:{
                required: true,
                maxlength: 50
			},
            contacts1:{
                required: true,
                maxlength: 50
            },
            contacts2:{
                required: true,
                maxlength: 50
            },
            effectDate:{
                required: true
            },
            endDate:{
                required: true
            },
            payRound:{
                required: true
            },
            rent:{
                required: true,
                number:true,
                range:[0,999999]
            },
            chargeTimes:{
                required: true,
                digits:true,
                range:[0,100]
            },
            signDate:{
                required: true
            }
		};
        validator = $("#popWin form").validate({rules:validateRules});
        loadDeps(["<%=basePath%>dictionary/AgreementState.json","<%=basePath%>dictionary/PayRound.json"],function(loadedData){
            $("#addHouseBtn").on("click",function(){
                $('#popWin form')[0].reset();
                validator.resetForm();
                $("#popWin form input[type='hidden']").val("");
                $("#popWin form select").val(null).trigger("change");
                $("#popWin .accessory").empty();
                popWin = layer.open({
                    type: 1,
                    content: $('#popWin'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
                    title: '添加合同',
                    shade: 0.6,
                    area: ['800px', '600px']
                });
                if(CKEDITOR.instances.editor1){
                    CKEDITOR.instances.editor1.destroy();
				}
                CKEDITOR.replace('content');
            });
            $("#addAccessory").on("click",function () {
				var component = '<div class="form-group">' +
                    '<div class="col-sm-6">' +
                    '<label class="col-sm-3 control-label">附件名称</label>' +
                    '<div class="col-sm-9">' +
                    '<input type="text" name="fileName" style="width: 100%;"  placeholder="附件名称">' +
                    '</div>' +
                    '</div>' +
                    '<div class="col-sm-3">' +
                    '<input type="file" name="files">' +
                    '</div>' +
                    '<div class="col-sm-3">' +
                    '<a href="javascript:void(0)">删除附件</a>' +
                    '</div>' +
                    '</div>';
				var jq_component = $(component);
				jq_component.find("a").on("click",function(){
                    jq_component.remove();
				});
				$(".accessory").append(jq_component);
            });
            $("select[name='payRound']").SimpleSelect2({dropdownParent:$("#popWin"),data:loadedData[1]});
            $("select[name='stateSearch']").SimpleSelect2({data:loadedData[0]});
            $("#popSubmit").on("click",function(){
                if(!validator.form()){
                    return false;
				}
                var param = $("#popWin form").serialize();
                $("#popWin form").ajaxSubmit({
                    url: '<%=basePath%>rest/agreement/saveOrUpdate',
                    type: 'post',
                    async: true,
                    data: param,
                    dataType: "json",
                    success: function (rsp) {
                        if(rsp.resultCode =="0000"){
                            layer.alert(rsp.description,{title:"操作成功",icon:1});
                            table.ajax.reload();
                            layer.close(popWin);
                        }else{
                            layer.alert(rsp.description,{title:"处理失败",icon:7})
                        }
                    }
                });
            });
            $("#popCancel").on("click",function () {
                layer.close(popWin);
            });
            $("#doSearch").on("click",function(){
                table.ajax.reload();
            });
            $(".date").datepicker({
                language:"zh-CN",
                autoclose:true
			});
            var table = $('#agreementList').DataTable({
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
                        var dic = findArrayValue(row,loadedData[1]);
                        return dic&&dic.text?dic.text:"";
                    }},
                    {data:"state",render:function(row){
                        var dic = findArrayValue(row,loadedData[0]);
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
                        a['params[serialNumberSearch]'] = $("#searchForm input[name='serialNumberSearch']").val();
                        a['params[titleSearch]'] = $("#searchForm input[name='titleSearch']").val();
                        a['params[state]'] = $("#searchForm select[name='stateSearch']").val();
                    },
                    dataSrc:'data'
                },
                columnDefs: [ {
                    "targets": 8,
                    "data": "null",
                    "render": function ( data, type, row, meta ) {
                        var btns;
                        if (row.state == 0) {
                            btns = '<button type="button" class="btn btn-danger btn-xs" onclick="editRow('+meta.row+')" >编辑</button>'+
                                '&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="editContent('+row.id+')" >正文</button>'+
                                '&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="delRow('+meta.row+')" >删除</button>';
                        } else if(row.state ==1) {
                            btns = '<button type="button" class="btn btn-danger btn-xs" onclick="editRow('+meta.row+')" >编辑</button>'+
                                '&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="editContent('+row.id+')" >正文</button>';
                        }else {
                            btns ='<button type="button" class="btn btn-danger btn-xs" onclick="showContent('+row.id+')" >查看正文</button>'
                        }
                        return btns;
                    }
                } ]
            });
        });
    });
</script>
</html>

