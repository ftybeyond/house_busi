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
				房产信息维护
			</h3>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> ${applicationScope.sysHeaderTitle}</a></li>
				<li class="active">房产信息维护</li>
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
									<button type="button" class="btn btn-primary pull-right" id="doSearch">查询</button>
								</div>
							</form>
						</div>
					</div>
					<div class="box box-danger row">
						<div class="box-header">
							<h3 class="box-title">房屋信息</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-danger btn-xs" id="addHouseBtn">新增</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="houseList" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>房产编号</th>
									<th>门牌号</th>
									<th>房屋类型</th>
									<th>面积(㎡)</th>
									<th>产权单位</th>
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
	<div class="box box-danger row">
		<!-- form start -->
		<form class="form-horizontal">
			<input type="hidden" name="id">
			<div class="box-body col-md-6">
				<div class="form-group">
					<label  class="col-sm-3 control-label">房产编号</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="houseCode" placeholder="房产编号">
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">房屋性质</label>
					<div class="col-sm-9">
						<select class="form-control" name="nature"></select>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">房屋户型</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="layout" placeholder="房屋户型">
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">产权单位</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="owner" placeholder="产权单位">
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">所属区域</label>
					<div class="col-sm-9">
						<select  class="form-control"  name="region"></select>
					</div>
				</div>

			</div>
			<div class="box-body col-md-6">
				<div class="form-group">
					<label class="col-sm-3 control-label">门牌号码</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="houseNumber"  placeholder="门牌号码">
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">装修程度</label>
					<div class="col-sm-9">
						<select  class="form-control"  name="decorate"></select>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">建筑面积</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="area"  placeholder="建筑面积">
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">房产证号</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="certificate"  placeholder="房产证号">
					</div>
				</div>
				<div class="form-group">
					<label for="remark" class="col-sm-3 control-label">备注信息</label>
					<div class="col-sm-9">
						<textarea class="form-control" id="remark" name="remark" rows="3" placeholder="备注信息 ..."></textarea>
					</div>
				</div>
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
<!-- ./wrapper -->
</body>
<%@include file="template/footer_script.jsp"%>
<script type="text/javascript" src="<%=basePath%>/bower_components/zTree/js/jquery.ztree.all.js"></script>
<script src="<%=basePath%>/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="<%=basePath%>/bower_components/jquery/jquery.validate.min.js"></script>
<script src="<%=basePath%>/bower_components/jquery/jquery.validate.messages_zh.js"></script>
<script type="text/javascript">
    var popWin,validator;
    var editRow = function(index){
        $('#popWin form')[0].reset();
        $("#popWin form input[type='hidden']").val("");
        $("#popWin form select").val(null).trigger("change");
        validator.resetForm();
        var rowData = $("#houseList").DataTable().row(index).data();
        for (key in rowData) {
            if ($("#popWin input[name='" + key + "']").length > 0) {
                $("#popWin input[name='" + key + "']").val(rowData[key]);
            } else if ($("#popWin select[name='" + key + "']").length > 0) {
                $("#popWin select[name='" + key + "']").val(rowData[key]).change();
            } else if($("#popWin textarea[name='" + key + "']").length > 0){
                $("#popWin textarea[name='" + key + "']").val(rowData[key]);
            }
        };
        var option = new Option(rowData.regionPath,rowData.region,true,true);
        $("select[name='region']").append(option).trigger('change');
//        $("select[name='region']").prop("disabled",true);
        popWin = layer.open({
            type: 1,
            title: false, //不显示标题
            content: $('#popWin'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
            title: '编辑房屋',
            shade: 0.6,
            area: ['800px', '500px']
        });
    };
    var delRow = function(index){
        var rowData = $("#houseList").DataTable().row(index).data();
        layer.confirm("确定删除数据?",{yes:function(){
            $.post("<%=basePath%>rest/house/delete",{id:rowData.id},null,"json").done(function(rsp){
				if(rsp.resultCode =="0000"){
					layer.alert(rsp.description,{title:"操作成功",icon:1});
                    $("#houseList").DataTable().ajax.reload();
				}else{
					layer.alert(rsp.description,{title:"处理失败",icon:7})
				}
            })
        }})
    };
    $(document).ready(function(){
        var validateRules = {
            houseNumber:{
                required: true,
                maxlength: 100
            },
            owner:{
                required: true,
                maxlength: 50
            },
            area:{
                required: true,
                number:true,
                range:[0,999999]
            },
            region:{
                required: true
            }
        };
        validator  = $("#popWin form").validate({rules:validateRules});
        loadDeps(["<%=basePath%>dictionary/HouseNature.json","<%=basePath%>dictionary/Decorate.json"],function(loadedData){
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
            var tree = $.fn.zTree.init($("#treeDomain"), setting);
            $("#addHouseBtn").on("click",function(){
                $('#popWin form')[0].reset();
                validator.resetForm();
                $("#popWin form input[type='hidden']").val("");
                $("select[name='region']").prop("disabled",false);
                $("#popWin form select").val(null).trigger("change");
                var currentNode = tree.getSelectedNodes()!=null?tree.getSelectedNodes()[0]:null;
                if(currentNode){
                    var option = new Option(currentNode.namePath,currentNode.id,true,true);
                    $("select[name='region']").append(option).trigger('change');
                }
                popWin = layer.open({
                    type: 1,
                    title: false, //不显示标题
                    content: $('#popWin'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
                    title: '添加房屋',
                    shade: 0.6,
                    area: ['800px', '500px']
                });
            });
            $("#popSubmit").on("click",function(){
                if(!validator.form()){
                    return false;
                }
                var param = $("#popWin form").serialize();
                $.post("<%=basePath%>rest/house/saveOrUpdate",param,null,"json").done(function(rsp){
                    if(rsp.resultCode =="0000"){
                        layer.alert(rsp.description,{title:"操作成功",icon:1});
                        table.ajax.reload();
                        layer.close(popWin);
                    }else{
                        layer.alert(rsp.description,{title:"处理失败",icon:7})
                    }
                });
            });
            $("#popCancel").on("click",function () {
                layer.close(popWin);
            });
            $("#doSearch").on("click",function(){
				table.ajax.reload();
			});
            $("select[name='nature']").SimpleSelect2({dropdownParent:$("#popWin"),data:loadedData[0]});
            $("select[name='decorate']").SimpleSelect2({dropdownParent:$("#popWin"),data:loadedData[1]});
            $("select[name='region']").select2({
                ajax: {
                    type: 'POST',
                    delay: 1250,
                    url: "<%=basePath%>rest/region/selectQuery", //数据请求路径
                    dataType: 'json',
                    data: function (params) {
                        return {
                            name: params.term
                        };
                    },
                    processResults: function (data, params) { //服务端返回结果data
                        if(data.resultCode!="0000"){
                            layer.alert("区域信息拉取出错"+data.description);
                            return {result:null};
                        }
                        return {
                            results: data.data.map(function (item) {
                                return { //return默认有两个参数id,text，必须这么写不然的话就报错记住,拿个小本本记下来吧
                                    id: item.id,
                                    text: item.namePath
                                }
                            })
                        };
                    },
                    cache: true
                },
                placeholder: '--请选择--',//默认文字提示
                language: "zh-CN",
                width:"100%",
                dropdownParent:$("#popWin"),
                minimumInputLength:1,
                allowClear: true//允许清空
            });

            var table = $('#houseList').DataTable({
                language:datatables_lan_cn,
                ordering: false,
                serverSide: true,
                searching:false,
                lengthChange:false,
                columns:[
                    {data:"houseCode"},
                    {data:"houseNumber"},
                    {data:"nature",render:function(row){
                        var dic = findArrayValue(row,loadedData[0])
                        return dic&&dic.text?dic.text:"";
					}},
                    {data:"area"},
                    {data:"owner"}
                ],
                ajax: {
                    "url": "<%=basePath%>rest/house/table",
                    "type":"post",
                    "data":function (a) {
                        delete  a.columns;
                        delete  a.order;
                        delete a.search;
                        a['params[idPath]'] = $("#searchForm input[name='idPath']").val();
                        a['params[houseCodeSearch]'] = $("#searchForm input[name='houseCodeSearch']").val();
                        a['params[houseNumberSearch]'] = $("#searchForm input[name='houseNumberSearch']").val();
                    },
                    dataSrc:'data'
                },
                columnDefs: [ {
                    "targets": 5,
                    "data": "null",
                    "render": function ( data, type, row, meta ) {
                        var btns = '<button type="button" class="btn btn-danger btn-xs" onclick="editRow('+meta.row+')" >编辑</button>'+
								'&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="delRow('+meta.row+')" >删除</button>';
                        return btns;
                    }
                } ]
            });
        });
    });
</script>
</html>

