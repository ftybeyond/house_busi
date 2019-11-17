<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@include file="template/header.jsp"%>
<link rel="stylesheet" href="<%=basePath%>/bower_components/zTree/css/metroStyle/metroStyle.css" type="text/css">
<body class="hold-transition skin-red-light sidebar-mini">
<div class="wrapper">

	<%@include file="template/main_header.jsp"%>

	<%@include file="template/main-sidebar.jsp"%>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h3>
				区域维护
			</h3>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> ${applicationScope.sysHeaderTitle}</a></li>
				<li class="active">区域维护</li>
			</ol>
		</section>

		<section class="content">
			<div class="row">
				<div class="col-md-3">

					<!-- About Me Box -->
					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title">区域列表</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-danger btn-xs" id="addRegionBtn">新增</button>
								<button type="button" class="btn btn-danger btn-xs" id="editRegionBtn">编辑</button>
								<button type="button" class="btn btn-danger btn-xs" id="deleteRegionBtn">删除</button>
							</div>
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
						<div class="box-header with-border">
							<h3 class="box-title">地图标注(选中区域节点，在地图上右键进行标注)</h3>
							<div class="box-tools pull-right">
								<button type="button" id="saveMark" class="btn btn-danger btn-sm" style="float: right;margin-right: 15px;">保存标注</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div id="allmap" style="width: auto;height: 600px;">
						</div>
						<!-- /.box-body -->
					</div>
				</div>
			</div>
		</section>
		
	</div>
	<!-- /.content-wrapper -->
	<%@include file="template/main-footer.jsp"%>
</div>

<div id="popWin" style="display: none;">
	<div class="box box-danger">
		<!-- form start -->
		<form id="regionForm" class="form-horizontal">
			<input type="hidden" id="regionId" name="id">
			<input type="hidden" id="level" name="level">
			<div class="box-body">
				<div class="form-group">
					<label for="regionName" class="col-sm-2 control-label">区域名称</label>

					<div class="col-sm-10">
						<input type="text" class="form-control" id="regionName" name="name" maxlength="255"  placeholder="区域名称">
					</div>
				</div>
				<div class="form-group">
					<label for="fatherRegionName" class="col-sm-2 control-label">上级区域</label>

					<div class="col-sm-7">
						<input type="text" class="form-control" id="fatherRegionName" disabled="disabled" value="无">
						<input type="hidden" name="parentId">
					</div>
					<div class="col-sm-2" style="margin-top: 12px;margin-left: -15px;">
						<a id="fatherCancel">取消上级</a>
					</div>
				</div>
				<div class="form-group">
					<label for="remark" class="col-sm-2 control-label">备注</label>
					<div class="col-sm-10">
						<textarea class="form-control" id="remark" name="remark" rows="3" maxlength="500" placeholder="备注 ..."></textarea>
					</div>
				</div>
			</div>
			<!-- /.box-body -->
			<div class="box-footer">
				<button id="regionFormCancel" type="button" class="btn btn-primary pull-right">取消</button>
				<button id="regionFormSumbit" type="button" class="btn btn-primary pull-right" style="margin-right: 10px;">保存</button>
			</div>
			<!-- /.box-footer -->
		</form>
	</div>

</div>
<!-- ./wrapper -->
</body>
<%@include file="template/footer_script.jsp"%>
<script type="text/javascript" src="<%=basePath%>/bower_components/zTree/js/jquery.ztree.all.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=TCh1CjBfxx3UgODQzBdyBLyVeNZKb8gf"></script>
<script type="text/javascript">
    $(document).ready(function(){
        var pop;//弹窗引用
        var marker;//标注引用
		//树形配置
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
                    $("#fatherRegionName").val(treeNode.name);
                    $("input[name='parentId']").val(treeNode.id);
                    if(treeNode.location){
                        var point = treeNode.location.split(",");
                        if(point.length==2){
							marker = new BMap.Marker(new BMap.Point(point[0] ,point[1]));
                            map.clearOverlays();
                            map.addOverlay(marker);
                            return;
						}
					}
                    map.clearOverlays();
                }
            }
        };
        var tree = $.fn.zTree.init($("#treeDomain"), setting);
        //新增区域按钮
        $("#addRegionBtn").on("click",function(){
            $("#regionId").val('');
            $("#level").val('');
            pop =layer.open({
                type: 1,
                title: false, //不显示标题
                content: $('#popWin'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
                title: '添加单位',
                shade: 0.6,
                area: ['550px', '400px']
            });
		});
        //关闭弹窗
        $("#regionFormCancel").on("click",function(){
			layer.close(pop);
		});
        //取消上级选择
        $("#fatherCancel").on("click",function () {
            tree.cancelSelectedNode();
            $("#fatherRegionName").val('无');
            $("input[name='parentId']").val('');
        });

        //提交保存或更新
        $("#regionFormSumbit").on("click",function () {
			var param = $("#regionForm").serialize();
			var name = $("#regionForm input[name='name']").val();
			if(!name||name.length <1){
			    layer.alert("请填写区域名称!");
			    return false;
			}
			$.post("<%=basePath%>rest/region/saveOrUpdate",param,null,"json").done(function(rsp){
				if(rsp.resultCode =="0000"){
                    layer.alert(rsp.description,{title:"操作成功",icon:1});
                    var currentNode = tree.getSelectedNodes()!=null?tree.getSelectedNodes()[0]:null;
                    if((currentNode && !currentNode.isParent)||$("#regionId").val().length>0){
                        currentNode=currentNode.getParentNode();
					}
                    tree.reAsyncChildNodes(currentNode, "refresh");
				}else{
				    layer.alert(rsp.description,{title:"处理失败",icon:7})
				}
				layer.close(pop);
				$("#regionName").val('');
				$("#remark").val('');
            }).fail(function(){
                layer.alert("服务器内部错误！")
			})
        });
        //删除按钮事件
        $("#deleteRegionBtn").on("click",function () {
            var currentNode = tree.getSelectedNodes()!=null?tree.getSelectedNodes()[0]:null;
            if(!currentNode){
                layer.alert("请选择要删除的区域节点！");
            }else{
                layer.confirm("确定删除节点"+currentNode.name + "以及其子节点内容?",{icon:3,yes:function(){
                    $.post("<%=basePath%>rest/region/delete",{id:currentNode.id},null,"json").done(function(rsp){
                        if(rsp.resultCode == "0000"){
                            layer.alert("操作成功",{icon:1})
                        }else{
                            layer.alert("操作失败",{icon:7})
                        }
                        tree.reAsyncChildNodes(currentNode.getParentNode(), "refresh");
                        tree.cancelSelectedNode();
                        $("#fatherRegionName").val('无');
                        $("input[name='parentId']").val('');
                    }).fail(function(){
                        layer.alert("服务器内部错误！")
                    })
                }})
            }
        });
        //编辑按钮事件
		$("#editRegionBtn").on("click",function () {
            var currentNode = tree.getSelectedNodes()!=null?tree.getSelectedNodes()[0]:null;
            if(currentNode){
				var father = currentNode.getParentNode();
				if(father){
                    $("#fatherRegionName").val(father.name);
                    $("input[name='parentId']").val(father.id);
				}else{
                    $("#fatherRegionName").val('无');
                    $("input[name='parentId']").val('');
				}
                $("#regionId").val(currentNode.id);
                $("#regionName").val(currentNode.name);
                $("#level").val(currentNode.level+1);
                $("#remark").val(currentNode.remark);
                pop =layer.open({
                    type: 1,
                    title: false, //不显示标题
                    content: $('#popWin'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
                    title: '编辑单位',
                    shade: 0.6,
                    area: ['550px', '400px']
                });
			}else {
                layer.alert("请选择要编辑的区域节点！")
			}
        });
		//地图事件
        var map = new BMap.Map("allmap");  // 创建Map实例
        map.centerAndZoom("宁夏",15);      // 初始化地图,用城市名设置地图中心点
        var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
        map.addControl(top_right_navigation);
		//右键菜单
        var menu = new BMap.ContextMenu();
		var pt;
        menu.addEventListener("open",function(e){
            pt = new BMap.Point(e.point.lng ,e.point.lat);
		});
		menu.addItem(new BMap.MenuItem("标注",function(e){
            var currentNode = tree.getSelectedNodes()!=null?tree.getSelectedNodes()[0]:null;
            if (currentNode) {
                marker = new BMap.Marker(pt);
                map.clearOverlays();
                map.addOverlay(marker);
            } else {
                layer.alert("请在左侧区域列表选择要标注的节点！");
            }
		}));
        map.addContextMenu(menu);
        $("#saveMark").on("click",function(){
            var currentNode = tree.getSelectedNodes()!=null?tree.getSelectedNodes()[0]:null;
            if(!currentNode){
                layer.alert("请选择要标注的节点！");
            }
            if(!marker){
                layer.alert("请在地图上右键选择标注点");
			}
            var location = (marker.point.lng + "," + marker.point.lat);
            $.post("<%=basePath%>rest/region/mark",{id:currentNode.id,point:location},null,"json").done(function(rsp){
                if(rsp.resultCode == "0000"){
                    layer.alert("操作成功",{icon:1})
					currentNode.location = location;
                }else{
                    layer.alert("操作失败",{icon:7})
                }
			})
		})

    });
</script>
</html>

