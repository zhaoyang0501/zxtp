jQuery.adminScoreline = {
		scorelineDataTable:null,
		toSave:false,
		initSearchDataTable : function() {
			if (this.scorelineDataTable == null) {
				this.scorelineDataTable = $('#dt_scoreline_view').dataTable({
					"sDom" : "<'row-fluid'<'span6'l>r>t<'row-fluid'<'span6'i><'span6'p>>",
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
					"sAjaxSource" : $.ace.getContextPath() + "/admin/scoreline/list",
					"fnDrawCallback" : function(oSettings) {
						$('[rel="popover"],[data-rel="popover"]').popover();
					},
					"fnServerData" : function(sSource, aoData, fnCallback) {
						var name = $("#_name").val();
						if (!!name) {
							aoData.push({
								"name" : "name",
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
					"aoColumns" : [ {
						"mDataProp" : "id"
					} ,{
						"mDataProp" : "year"
					}, {
						"mDataProp" : "area.name"
					}, {
						"mDataProp" : "score1"
					}, {
						"mDataProp" : "score2"
					}, {
						"mDataProp" : "score3"
					}, {
						"mDataProp" : "score4"
					},{
						"mDataProp" : "num1"
					}, {
						"mDataProp" : "num2"
					}, {
						"mDataProp" : "num3"
					}, {
						"mDataProp" : "num4"
					}, {
						"mDataProp" : ""
					}],
					"aoColumnDefs" : [
						{
							'aTargets' : [11],
							'fnRender' : function(oObj, sVal) {
								return "<button class=\"btn2 btn-info\" onclick=\"$.adminScoreline.showEdit("+oObj.aData.id+")\"><i class=\"icon-pencil\"></i>修改</button>"+
								 "  <button class=\"btn2 btn-info\" onclick=\"$.adminScoreline.deleteScoreline("+oObj.aData.id+")\"><i class=\"icon-trash\"></i> 删除</button>";
							}
						},
					 {
						'aTargets' : [ '_all' ],
						'bSortable' : false,
						'sClass' : 'center'
					}]

				});
			} else {
				var oSettings = this.scorelineDataTable.fnSettings();
				oSettings._iDisplayStart = 0;
				this.scorelineDataTable.fnDraw(oSettings);
			}

		},
		deleteScoreline :function(id){
			bootbox.confirm( "是否确认删除？", function (result) {
	            if(result){
	            	$.ajax({
	        			type : "get",
	        			url : $.ace.getContextPath() + "/admin/scoreline/delete?id="+id,
	        			dataType : "json",
	        			success : function(json) {
	        				if(json.resultMap.state=='success'){
	        					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	        					$.adminScoreline.initSearchDataTable();
	        				}else{
	        					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	        				}
	        			}
	        		});
	            }
	        });
		},
		showaddModal: function(id){
			$.adminScoreline.toSave=true;
			$("#user_modal_header_label").text("新增分类");
			$("#scoreline_modal").modal('show');
		},
		save : function (){
			if($.adminScoreline.toSave){
				$.ajax({
	    			type : "post",
	    			url : $.ace.getContextPath() + "/admin/scoreline/save",
	    			data:{
	    				"scoreLine.area.code":$("#area").val(),
	    				"scoreLine.year":$("#year").val(),
	    				"scoreLine.score1":$("#score1").val(),
	    				"scoreLine.score2":$("#score2").val(),
	    				"scoreLine.score3":$("#score3").val(),
	    				"scoreLine.score4":$("#score4").val(),
	    				"scoreLine.num1":$("#num1").val(),
	    				"scoreLine.num2":$("#num2").val(),
	    				"scoreLine.num3":$("#num3").val(),
	    				"scoreLine.num4":$("#num4").val(),
	    			},
	    			dataType : "json",
	    			success : function(json) {
	    				if(json.resultMap.state=='success'){
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	    					$.adminScoreline.initSearchDataTable();
	    					$("#scoreline_modal").modal('hide');
	    				}else{
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	    				}
	    			}
	    		});
			}else{
				$.ajax({
	    			type : "post",
	    			url : $.ace.getContextPath() + "/admin/scoreline/update",
	    			data:{
	    				"scoreLine.area.code":$("#area").val(),
	    				"scoreLine.year":$("#year").val(),
	    				"scoreLine.score1":$("#score1").val(),
	    				"scoreLine.score2":$("#score2").val(),
	    				"scoreLine.score3":$("#score3").val(),
	    				"scoreLine.score4":$("#score4").val(),
	    				"scoreLine.num1":$("#num1").val(),
	    				"scoreLine.num2":$("#num2").val(),
	    				"scoreLine.num3":$("#num3").val(),
	    				"scoreLine.num4":$("#num4").val(),
	    				"scoreLine.id":$("#scorelineId").val()
	    			},
	    			dataType : "json",
	    			success : function(json) {
	    				if(json.resultMap.state=='success'){
	    					$("#user_edit_modal").modal('hide');
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	    					$.adminScoreline.initSearchDataTable();
	    					$("#scoreline_modal").modal('hide');
	    				}else{
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	    				}
	    			}
	    		});
			}
		},
		showEdit: function (id){
			$("#scorelineId").val(id);
			$.adminScoreline.toSave=false;
			$.ajax({
    			type : "get",
    			url : $.ace.getContextPath() + "/admin/scoreline/get?id="+id,
    			dataType : "json",
    			success : function(json) {
    				if(json.resultMap.state=='success'){
    					$("#user_modal_header_label").text("修改分类");
    					$("#scoreline_modal").modal('show');
    					$("#year").val(json.resultMap.scoreLine.year);
    					$("#score1").val(json.resultMap.scoreLine.score1);
    					$("#score2").val(json.resultMap.scoreLine.score2);
    					$("#score3").val(json.resultMap.scoreLine.score3);
    					$("#score4").val(json.resultMap.scoreLine.score4);
    					$("#area").val(json.resultMap.scoreLine.area.code);
    				}else{
    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
    				}
    			}
    		});
		}
};