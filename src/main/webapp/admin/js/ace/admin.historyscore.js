jQuery.adminHistoryscore = {
		historyscoreDataTable:null,
		toSave:false,
		initSearchDataTable : function() {
			if (this.historyscoreDataTable == null) {
				this.historyscoreDataTable = $('#dt_historyscore_view').dataTable({
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
					"sAjaxSource" : $.ace.getContextPath() + "/admin/historyscore/list",
					"fnDrawCallback" : function(oSettings) {
						$('[rel="popover"],[data-rel="popover"]').popover();
					},
					"fnServerData" : function(sSource, aoData, fnCallback) {
						var _school = $("#_school").val();
						var _year = $("#year").val();
						if (!!_school) {
							aoData.push({
								"name" : "schoolid",
								"value" : _school
							});
						}
						if (!!_year) {
							aoData.push({
								"name" : "year",
								"value" : _year
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
						"mDataProp" : "school.name"
					}, {
						"mDataProp" : "year"
					}, {
						"mDataProp" : "area.name"
					},{
						"mDataProp" : "type"
					}, {
						"mDataProp" : "totalMan"
					}, {
						"mDataProp" : "minScore"
					} ,{
						"mDataProp" : "maxScore"
					}, {
						"mDataProp" : "avgScore"
					}, {
						"mDataProp" : "minOrder"
					} ,{
						"mDataProp" : "maxOrder"
					}, {
						"mDataProp" : "avgOrder"
					}, {
						"mDataProp" : ""
					}],
					"aoColumnDefs" : [
{
	'aTargets' : [3],
	'fnRender' : function(oObj, sVal) {
		if(sVal=='1')
			return "本科一批";
		else if(sVal=='2')
			return "本科第二批";
		else if(sVal=='3')
			return "本科第三批";
		else if(sVal=='4')
			return "专批";
	}
},
						{
							'aTargets' : [11],
							'fnRender' : function(oObj, sVal) {
								return "  <button class=\"btn2 btn-info\" onclick=\"$.adminHistoryscore.deleteHistoryscore("+oObj.aData.id+")\"><i class=\"icon-trash\"></i> 删除</button>";
							}
						},
					 {
						'aTargets' : [ '_all' ],
						'bSortable' : false,
						'sClass' : 'center'
					}]

				});
			} else {
				var oSettings = this.historyscoreDataTable.fnSettings();
				oSettings._iDisplayStart = 0;
				this.historyscoreDataTable.fnDraw(oSettings);
			}

		},
		deleteHistoryscore :function(id){
			bootbox.confirm( "是否确认删除？", function (result) {
	            if(result){
	            	$.ajax({
	        			type : "get",
	        			url : $.ace.getContextPath() + "/admin/historyscore/delete?id="+id,
	        			dataType : "json",
	        			success : function(json) {
	        				if(json.resultMap.state=='success'){
	        					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	        					$.adminHistoryscore.initSearchDataTable();
	        				}else{
	        					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	        				}
	        			}
	        		});
	            }
	        });
		},
		showaddModal: function(id){
			$.adminHistoryscore.toSave=true;
			$("#user_modal_header_label").text("新增分类");
			$("#historyscore_modal").modal('show');
		},
		save : function (){
			if($.adminHistoryscore.toSave){
				$.ajax({
	    			type : "post",
	    			url : $.ace.getContextPath() + "/admin/historyscore/save",
	    			data:{
	    				"historyscore.school.id":$("#schoolid").val(),
	    				"historyscore.area.code":$("#areaid").val(),
	    				"historyscore.type":$("#type").val(),
	    				"historyscore.type":$("#type").val(),
	    				"historyscore.year":$("#year").val(),
	    				"historyscore.totalMan":$("#totalMan").val(),
	    				"historyscore.maxScore":$("#maxScore").val(),
	    				"historyscore.maxOrder":$("#maxOrder").val(),
	    				"historyscore.minOrder":$("#minOrder").val(),
	    				"historyscore.minScore":$("#minScore").val(),
	    				"historyscore.avgScore":$("#avgScore").val(),
	    				"historyscore.avgOrder":$("#avgOrder").val(),
	    			},
	    			dataType : "json",
	    			success : function(json) {
	    				if(json.resultMap.state=='success'){
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	    					$.adminHistoryscore.initSearchDataTable();
	    					$("#historyscore_modal").modal('hide');
	    				}else{
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	    				}
	    			}
	    		});
			}else{
				$.ajax({
	    			type : "post",
	    			url : $.ace.getContextPath() + "/admin/historyscore/update",
	    			data:{
	    				"historyscore.id":$("#historyscoreId").val(),
	    				"historyscore.name":$("#name").val(),
	    				"historyscore.remark":$("#remark").val()
	    			},
	    			dataType : "json",
	    			success : function(json) {
	    				if(json.resultMap.state=='success'){
	    					$("#user_edit_modal").modal('hide');
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	    					$.adminHistoryscore.initSearchDataTable();
	    					$("#historyscore_modal").modal('hide');
	    				}else{
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	    				}
	    			}
	    		});
			}
		},
		showEdit: function (id){
			$("#historyscoreId").val(id);
			$.adminHistoryscore.toSave=false;
			$.ajax({
    			type : "get",
    			url : $.ace.getContextPath() + "/admin/historyscore/get?id="+id,
    			dataType : "json",
    			success : function(json) {
    				if(json.resultMap.state=='success'){
    					$("#user_modal_header_label").text("修改分类");
    					$("#historyscore_modal").modal('show');
    					$("#name").val(json.resultMap.historyscore.name);
    					$("#pid").val(json.resultMap.historyscore.id);
    					$("#remark").val(json.resultMap.historyscore.remark);
    				}else{
    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
    				}
    			}
    		});
		}
};