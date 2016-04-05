jQuery.adminChoose = {
		chooseDataTable:null,
		toSave:false,
		initSearchDataTable : function() {
			if (this.chooseDataTable == null) {
				this.chooseDataTable = $('#dt_item_view').dataTable({
					"sDom" : "<'row-fluid'r>t",
					"sPaginationType" : "bootstrap",
					"oLanguage" : {
						"sLengthMenu" : "每页显示 _MENU_ 条记录",
						"sZeroRecords" : "抱歉， 暂时没有记录",
						"sInfo" : "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
						"sSearch" : "",
						"sInfoEmpty" : "没有数据",
						"sInfoFiltered" : "(从 _MAX_ 条数据中检索)",
						"oPaginate" : {
							"sFirst" : "首页",
							"sPrevious" : "前一页",
							"sNext" : "后一页",
							"sLast" : "尾页"
						}
					},
					"bAutoWidth" : false,
					"iDisplayLength" : 10,
					"aLengthMenu" : [ 5, 10, 25, 50],
					"bServerSide" : true,
					"sServerMethod" : "POST",
					"bProcessing" : true,
					"bSort" : false,
					"sAjaxSource" : $.ace.getContextPath() + "/admin/choose/list",
					"fnDrawCallback" : function(oSettings) {
						$('[rel="popover"],[data-rel="popover"]').popover();
					},
					"fnServerData" : function(sSource, aoData, fnCallback) {
						var name = $("#_name").val();
						if (!!name) {
							aoData.push({
								"name" : "id",
								"value" : name
							});
						}
						$.ajax({
							"dataType" : 'json',
							"type" : "POST",
							"url" : sSource,
							"data" : aoData,
							"success" : function(data){
								fnCallback(data.resultMap);
							}
						});
					},
					"aoColumns" : [{
						"mDataProp" : "name"
					},{
						"mDataProp" : "num"
					}],
					"aoColumnDefs" : [
						{
							'aTargets' : [1],
							'fnRender' : function(oObj, sVal) {
								return sVal+"票  <div class='progress progress-success progress-striped'> <div class='bar' style='width: "+sVal+"%'></div></div>";
							}
						},
					 {
						'aTargets' : [ '_all' ],
						'bSortable' : false,
						'sClass' : 'center'
					}]

				});
			} else {
				var oSettings = this.chooseDataTable.fnSettings();
				oSettings._iDisplayStart = 0;
				this.chooseDataTable.fnDraw(oSettings);
			}

		},
		deleteChoose :function(id){
			bootbox.confirm( "是否确认删除？", function (result) {
	            if(result){
	            	$.ajax({
	        			type : "get",
	        			url : $.ace.getContextPath() + "/admin/choose/delete?id="+id,
	        			dataType : "json",
	        			success : function(json) {
	        				if(json.resultMap.state=='success'){
	        					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	        					$.adminChoose.initSearchDataTable();
	        				}else{
	        					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	        				}
	        			}
	        		});
	            }
	        });
		},
		showaddModal: function(id){
			$.adminChoose.toSave=true;
			$("#user_modal_header_label").text("新增分类");
			$("#choose_modal").modal('show');
		},
		save : function (){
			if($.adminChoose.toSave){
				$.ajax({
	    			type : "post",
	    			url : $.ace.getContextPath() + "/admin/choose/save",
	    			data:{
	    				"choose.category.id":$("#_name").val(),
	    				"choose.name":$("#name").val(),
	    				"choose.ordernum":$("#ordernum").val()
	    			},
	    			dataType : "json",
	    			success : function(json) {
	    				if(json.resultMap.state=='success'){
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	    					$.adminChoose.initSearchDataTable();
	    					$("#choose_modal").modal('hide');
	    				}else{
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	    				}
	    			}
	    		});
			}else{
				$.ajax({
	    			type : "post",
	    			url : $.ace.getContextPath() + "/admin/choose/update",
	    			data:{
	    				"choose.id":$("#chooseId").val(),
	    				"choose.name":$("#name").val(),
	    				"choose.bigType.id":$("#bigtype").val(),
	    				"choose.remark":$("#remark").val()
	    			},
	    			dataType : "json",
	    			success : function(json) {
	    				if(json.resultMap.state=='success'){
	    					$("#user_edit_modal").modal('hide');
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	    					$.adminChoose.initSearchDataTable();
	    					$("#choose_modal").modal('hide');
	    				}else{
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	    				}
	    			}
	    		});
			}
		},
		showEdit: function (id){
			$("#chooseId").val(id);
			$.adminChoose.toSave=false;
			$.ajax({
    			type : "get",
    			url : $.ace.getContextPath() + "/admin/choose/get?id="+id,
    			dataType : "json",
    			success : function(json) {
    				if(json.resultMap.state=='success'){
    					$("#user_modal_header_label").text("修改分类");
    					$("#choose_modal").modal('show');
    					$("#name").val(json.resultMap.choose.name);
    					$("#pid").val(json.resultMap.choose.id);
    					$("#bigtype").val(json.resultMap.choose.bigType.id);
    					$("#remark").val(json.resultMap.choose.remark);
    				}else{
    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
    				}
    			}
    		});
		}
};