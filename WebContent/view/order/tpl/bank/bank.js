//

var pageIndex = 1;
var pageSize = 10;
var totalPage = 0;

/**
 * 收入-账单列表
 * */
function incomeBillDetail(uid,pid,trantype,identity){
	$("#_userid").val(uid);
	$("#_parentid").val(pid);
	$("#_trantype").val(trantype);
	$("#_identity").val(identity);
	
	initPage();
	loadData_incomeBillDetail();
}

//加载数据-收入-账单列表
function loadData_incomeBillDetail(){
	var _data = {};
	_data.parentid = $("#_parentid").val();
	_data.userid = $("#_userid").val();
	_data.trantype = $("#_trantype").val();
	_data.identity = $("#_identity").val();
	_data.pageIndex = pageIndex;
	_data.pageSize = pageSize;
	$.ajax({
		async:false,
        url: getRootPath_web() + "/orderUserBank/incomeBillDetail.htmls",
        data: _data,
        type: "post",
        dataType:"json",
        success: function (json) {
        	totalPage = Math.ceil(json.total/pageSize);
        	$("#billDetail").setTemplateURL(getRootPath_web() + "/view/order/tpl/bank/incomeBillDetail.tpl");
        	$("#billDetail").setParam('rowCount', json.total);
     		$("#billDetail").setParam('pageSize', pageSize);
     		$("#billDetail").setParam('pageIndex', pageIndex);
     		$("#billDetail").setParam('totalPage', totalPage);
        	$("#billDetail").processTemplate(json.data);
        	//
        	pageSel(1);
            pageEnter(1);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(jqXHR.responseText);
        }
   });
}

/**
 * 支出-账单列表
 * */
function spendingBillDetail(uid,pid,trantype){
	$("#_userid").val(uid);
	$("#_parentid").val(pid);
	$("#_trantype").val(trantype);
	
	initPage();
	loadData_spendingBillDetail();
}

//加载数据-支出-账单列表
function loadData_spendingBillDetail(){
	var _data = {};
	_data.parentid = $("#_parentid").val();
	_data.userid = $("#_userid").val();
	_data.trantype = $("#_trantype").val();
	_data.pageIndex = pageIndex;
	_data.pageSize = pageSize;
	$.ajax({
		async:false,
        url: getRootPath_web() + "/orderUserBank/spendingBillDetail.htmls",
        data: _data,
        type: "post",
        dataType:"json",
        success: function (json) {
        	totalPage = Math.ceil(json.total/pageSize);
        	$("#billDetail").setTemplateURL(getRootPath_web() + "/view/order/tpl/bank/spendingBillDetail.tpl");
        	$("#billDetail").setParam('rowCount', json.total);
     		$("#billDetail").setParam('pageSize', pageSize);
     		$("#billDetail").setParam('pageIndex', pageIndex);
     		$("#billDetail").setParam('totalPage', totalPage);
        	$("#billDetail").processTemplate(json.data);
        	//
        	pageSel(2);
            pageEnter(2);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(jqXHR.responseText);
        }
   });
}


/**
 * 配额-账单列表
 * */
function quotaBillDetail(uid,pid){
	$("#_userid").val(uid);
	$("#_parentid").val(pid);
	
	initPage();
	loadData_quotaBillDetail();
}

//加载数据-配额-账单列表
function loadData_quotaBillDetail(){
	var _data = {};
	_data.parentid = $("#_parentid").val();
	_data.userid = $("#_userid").val();
	_data.pageIndex = pageIndex;
	_data.pageSize = pageSize;
	$.ajax({
		async:false,
        url: getRootPath_web() + "/orderUserBank/quotaBillDetail.htmls",
        data: _data,
        type: "post",
        dataType:"json",
        success: function (json) {
        	totalPage = Math.ceil(json.total/pageSize);
        	$("#billDetail").setTemplateURL(getRootPath_web() + "/view/order/tpl/bank/quotaBillDetail.tpl");
        	$("#billDetail").setParam('rowCount', json.total);
     		$("#billDetail").setParam('pageSize', pageSize);
     		$("#billDetail").setParam('pageIndex', pageIndex);
     		$("#billDetail").setParam('totalPage', totalPage);
        	$("#billDetail").processTemplate(json.data);
        	//
        	pageSel(3);
            pageEnter(3);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(jqXHR.responseText);
        }
   });
}

/**
 * 返利、奖励-账单列表
 * */
function disBillDetail(uid,pid,type){
	$("#_userid").val(uid);
	$("#_parentid").val(pid);
	$("#_detailstype").val(type);
	initPage();
	loadData_disBillDetail();
}

//加载数据-返利、奖励-账单列表
function loadData_disBillDetail(){
	var _data = {};
	_data.parentid = $("#_parentid").val();
	_data.userid = $("#_userid").val();
	_data.detailstype = $("#_detailstype").val();
	_data.pageIndex = pageIndex;
	_data.pageSize = pageSize;
	$.ajax({
		async:false,
        url: getRootPath_web() + "/orderUserBank/rebateRewardBill.htmls",
        data: _data,
        type: "post",
        dataType:"json",
        success: function (json) {
        	totalPage = Math.ceil(json.total/pageSize);
        	$("#billDetail").setTemplateURL(getRootPath_web() + "/view/order/tpl/bank/publicDisDetail.tpl");
        	$("#billDetail").setParam('rowCount', json.total);
     		$("#billDetail").setParam('pageSize', pageSize);
     		$("#billDetail").setParam('pageIndex', pageIndex);
     		$("#billDetail").setParam('totalPage', totalPage);
        	$("#billDetail").processTemplate(json.data);
        	//
        	pageSel(4);
            pageEnter(4);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(jqXHR.responseText);
        }
   });
}

/**
 * 分页参数初始化
 * */
function initPage(){
	pageIndex = 1;
	pageSize = 10;
	totalPage = 0;
}

/**
 * 分页 - 翻页(上一页、下一页)
 * */
function pageClick(sel_page,type) {
	pageIndex = sel_page;
	page_loadData(type);
}

/**
 * 输入页码 - 跳转
 * */
function pageEnter(type) {
	$('.ui-pager-inp').bind('keypress',function(event) {
        if(event.keyCode == "13") {
        	if (isInteger($(this).val())) {
        		if ($(this).val() > totalPage || $(this).val() < 1 || $(this).val() == pageIndex) {
        			return false;
        		}
        		else {
        			pageIndex = $(this).val();
        			page_loadData(type);
        		}
        	}
        	else {
        	}
            return false;
        }
    });
}

/**
 * 切换每页显示条数
 * */
function pageSel(type) {
	$('.pageSel').change(function(){ 
		var p1=$(this).children('option:selected').val();//这就是selected的值
		pageIndex = 1;
		pageSize = p1;
		page_loadData(type);
	}) 
}

/**
 * 分页切换-加载数据
 * type:1收入，2支出，3配额，4返利/奖励
 * */
function page_loadData(type){
	if(type == 1){
		loadData_incomeBillDetail();	//收入-账单列表
	}else if(type == 2){
		loadData_spendingBillDetail();	//支出-账单列表
	}else if(type == 3){
		loadData_quotaBillDetail();		//配额-账单列表
	}else if(type == 4){
		loadData_disBillDetail();		//返利、奖励-账单列表
	}
}