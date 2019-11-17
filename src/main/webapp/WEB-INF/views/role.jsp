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
				角色管理
			</h3>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> ${applicationScope.sysHeaderTitle}</a></li>
				<li class="active">角色管理</li>
			</ol>
		</section>

		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-danger">
						<div class="box-header">
							<h3 class="box-title">角色信息</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-danger btn-xs" id="addRoleBtn">新增</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="roleList" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>序号</th>
									<th>角色名称</th>
									<th>备注</th>
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
	<div class="box box-danger row" style="padding-top: 10px;">
		<!-- form start -->
		<form class="form-horizontal">
			<input type="hidden" name="id">
				<div class="form-group">
					<label  class="col-sm-3 control-label">角色名称</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="name" placeholder="角色名称">
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">角色权限</label>
					<div class="col-sm-9">
						<select class="form-control" name="authority" multiple="multiple"></select>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-3 control-label">备注信息</label>
					<div class="col-sm-9">
						<textarea class="form-control"  name="remark" rows="3" placeholder="备注信息 ..."></textarea>
					</div>
				</div>
		</form>
	</div>

</div>

<!-- ./wrapper -->
</body>
<%@include file="template/footer_script.jsp"%>
<script src="<%=basePath%>/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">

	var popWin;
	var editRow = function(index){
        $('#popWin form')[0].reset();
        $("#popWin form input[type='hidden']").val("");
        $("#popWin form select").val(null).trigger("change");
        var rowData = $("#roleList").DataTable().row(index).data();
        for (key in rowData) {
            if ($("#popWin input[name='" + key + "']").length > 0) {
                $("#popWin input[name='" + key + "']").val(rowData[key]);
            } else if ($("#popWin select[name='" + key + "']").length > 0) {
                $("#popWin select[name='" + key + "']").val(eval("["+rowData[key]+"]")).change();
            } else if($("#popWin textarea[name='" + key + "']").length > 0){
                $("#popWin textarea[name='" + key + "']").val(rowData[key]);
            }
        }
        popWin = layer.open({
            type: 1,
            title: false, //不显示标题
            content: $('#popWin'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
            title: '编辑角色',
            shade: 0.6,
            area: ['500px', '400px'],
            btn:["保存","取消"],
            btn1:function(){
                $.post("<%=basePath%>rest/role/update",$('#popWin form').serialize(),null,"json").done(function(rsp){
                    if(rsp.resultCode =="0000"){
                        layer.alert(rsp.description,{title:"操作成功",icon:1});
                        $("#roleList").DataTable().ajax.reload();
                        layer.close(popWin);
                    }else{
                        layer.alert(rsp.description,{title:"处理失败",icon:7})
                    }
                })
            },
            btn2:function(){
                layer.close(popWin);
            }
        });
	};
	var delRow = function(index){
        var rowData = $("#roleList").DataTable().row(index).data();
        layer.confirm("确定删除数据?",{yes:function(){
            $.post("<%=basePath%>rest/role/delete",{id:rowData.id},null,"json").done(function(rsp){
                if(rsp.resultCode =="0000"){
                    layer.alert(rsp.description,{title:"操作成功",icon:1});
                    $("#roleList").DataTable().ajax.reload();
                }else{
                    layer.alert(rsp.description,{title:"处理失败",icon:7})
                }
            })
        }})
    };
    $(document).ready(function(){
        loadDeps(["<%=basePath%>rest/role/authoritySelect2"],function(loadedData){
            $("select[name='authority']").SimpleSelect2({dropdownParent:$("#popWin"),data:loadedData[0],multiple: true});
            $("select[name='authority']").on('select2:select', function (e) {
                var id = e.params.data.id;
                console.log(id)
                if(id == 0){
                    $(this).val([0]).trigger("change");
				}
            });
            $("#addRoleBtn").on("click",function(){
                $('#popWin form')[0].reset();
                $("#popWin form input[type='hidden']").val("");
                $("#popWin form select").val(null).trigger("change");
                popWin = layer.open({
                    type: 1,
                    title: false, //不显示标题
                    content: $('#popWin'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
                    title: '添加角色',
                    shade: 0.6,
                    area: ['500px', '400px'],
                    btn:["保存","取消"],
					btn1:function(){
						$.post("<%=basePath%>rest/role/insert",$('#popWin form').serialize(),null,"json").done(function(rsp){
                            if(rsp.resultCode =="0000"){
                                layer.alert(rsp.description,{title:"操作成功",icon:1});
                                table.ajax.reload();
                                layer.close(popWin);
                            }else{
                                layer.alert(rsp.description,{title:"处理失败",icon:7})
                            }
						})
					},
					btn2:function(){
						layer.close(popWin);
					}
                });
            });
            var table = $('#roleList').DataTable({
                language:datatables_lan_cn,
                paging: false,
                ordering: false,
                serverSide: true,
                searching:false,
                lengthChange:false,
                columns:[
                    {data:"id"},
                    {data:"name"},
                    {data:"remark"}
                ],
                ajax: {
                    "url": "<%=basePath%>rest/role/table",
                    "type":"post",
                    "data":function (a) {
                        delete  a.columns;
                        delete  a.order;
                        delete a.search;
                    },
                    dataSrc:'data'
                },
                "columnDefs": [ {
                    "targets": 3,
                    "data": "null",
                    "render": function ( data, type, full, meta ) {
                        var btns = '<button type="button" class="btn btn-danger btn-xs" onclick="editRow('+meta.row+')" >编辑</button>'+
                            '&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="delRow('+meta.row+')" >删除</button>';
                        return btns;                    }
                }]
            })
        });


    });
</script>
</html>

