jQuery.adminHistorymajor = {
		historymajorDataTable:null,
		toSave:false,
		initSearchDataTable : function() {
			if (this.historymajorDataTable == null) {
				this.historymajorDataTable = $('#dt_historymajor_view').dataTable({
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
					"sAjaxSource" : $.ace.getContextPath() + "/admin/historymajor/list",
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
					},{
						"mDataProp" : "category.name"
					}, {
						"mDataProp" : "year"
					}, {
						"mDataProp" : "area.name"
					}, {
						"mDataProp" : "totalMan"
					}, {
						"mDataProp" : "maxScore"
					} ,{
						"mDataProp" : "minScore"
					}, {
						"mDataProp" : "avgScore"
					}, {
						"mDataProp" : "maxOrder"
					} ,{
						"mDataProp" : "minOrder"
					}, {
						"mDataProp" : "avgOrder"
					}, {
						"mDataProp" : ""
					}],
					"aoColumnDefs" : [
						{
							'aTargets' : [11],
							'fnRender' : function(oObj, sVal) {
								return  "  <button class=\"btn2 btn-info\" onclick=\"$.adminHistorymajor.deleteHistorymajor("+oObj.aData.id+")\"><i class=\"icon-trash\"></i> 删除</button>";
							}
						},
					 {
						'aTargets' : [ '_all' ],
						'bSortable' : false,
						'sClass' : 'center'
					}]

				});
			} else {
				var oSettings = this.historymajorDataTable.fnSettings();
				oSettings._iDisplayStart = 0;
				this.historymajorDataTable.fnDraw(oSettings);
			}

		},
		deleteHistorymajor :function(id){
			bootbox.confirm( "是否确认删除？", function (result) {
	            if(result){
	            	$.ajax({
	        			type : "get",
	        			url : $.ace.getContextPath() + "/admin/historymajor/delete?id="+id,
	        			dataType : "json",
	        			success : function(json) {
	        				if(json.resultMap.state=='success'){
	        					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	        					$.adminHistorymajor.initSearchDataTable();
	        				}else{
	        					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	        				}
	        			}
	        		});
	            }
	        });
		},
		showaddModal: function(id){
			$.adminHistorymajor.toSave=true;
			$("#user_modal_header_label").text("新增分类");
			$("#historymajor_modal").modal('show');
		},
		save : function (){
			if($.adminHistorymajor.toSave){
				$.ajax({
	    			type : "post",
	    			url : $.ace.getContextPath() + "/admin/historymajor/save",
	    			data:{
	    				"historymajor.school.id":$("#schoolid").val(),
	    				"historymajor.area.code":$("#areaid").val(),
	    				"historymajor.category.id":$("#category").val(),
	    				"historymajor.type":$("#type").val(),
	    				"historymajor.year":$("#year").val(),
	    				"historymajor.totalMan":$("#totalMan").val(),
	    				"historymajor.maxScore":$("#maxScore").val(),
	    				"historymajor.maxOrder":$("#maxOrder").val(),
	    				"historymajor.minOrder":$("#minOrder").val(),
	    				"historymajor.minScore":$("#minScore").val(),
	    				"historymajor.avgScore":$("#avgScore").val(),
	    				"historymajor.avgOrder":$("#avgOrder").val(),
	    			},
	    			dataType : "json",
	    			success : function(json) {
	    				if(json.resultMap.state=='success'){
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	    					$.adminHistorymajor.initSearchDataTable();
	    					$("#historymajor_modal").modal('hide');
	    				}else{
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	    				}
	    			}
	    		});
			}else{
				$.ajax({
	    			type : "post",
	    			url : $.ace.getContextPath() + "/admin/historymajor/update",
	    			data:{
	    				"historymajor.id":$("#historymajorId").val(),
	    				"historymajor.school.id":$("#schoolid").val(),
	    				"historymajor.area.code":$("#areaid").val(),
	    				"historymajor.category.id":$("#category").val(),
	    				"historymajor.type":$("#type").val(),
	    				"historymajor.year":$("#year").val(),
	    				"historymajor.totalMan":$("#totalMan").val(),
	    				"historymajor.maxScore":$("#maxScore").val(),
	    				"historymajor.maxOrder":$("#maxOrder").val(),
	    				"historymajor.minOrder":$("#minOrder").val(),
	    				"historymajor.minScore":$("#minScore").val(),
	    				"historymajor.avgScore":$("#avgScore").val(),
	    				"historymajor.avgOrder":$("#avgOrder").val(),
	    			},
	    			dataType : "json",
	    			success : function(json) {
	    				if(json.resultMap.state=='success'){
	    					$("#user_edit_modal").modal('hide');
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	    					$.adminHistorymajor.initSearchDataTable();
	    					$("#historymajor_modal").modal('hide');
	    				}else{
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	    				}
	    			}
	    		});
			}
		},
		showEdit: function (id){
			$("#historymajorId").val(id);
			$.adminHistorymajor.toSave=false;
			$.ajax({
    			type : "get",
    			url : $.ace.getContextPath() + "/admin/historymajor/get?id="+id,
    			dataType : "json",
    			success : function(json) {
    				if(json.resultMap.state=='success'){
    					$("#user_modal_header_label").text("修改分类");
    					$("#historymajor_modal").modal('show');
    					$("#name").val(json.resultMap.historymajor.name);
    					$("#pid").val(json.resultMap.historymajor.id);
    					$("#remark").val(json.resultMap.historymajor.remark);
    				}else{
    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
    				}
    			}
    		});
		}
};