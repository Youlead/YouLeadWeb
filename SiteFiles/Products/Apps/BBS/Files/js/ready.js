$(document).ready(function(){

	$(".share_table tr:last-child").addClass("fl_row");
	$(".share_area").last().removeClass("sha_bot_line");
	
	$('#word').focus(function(){
		if(this.value == '请输入搜索条件') this.value = '';
	}).blur(function(){
		if(this.value == '') this.value = '请输入搜索条件';
	});
	
	$('#userName').focus(function(){
		if(this.value == '用户名') this.value = '';
	}).blur(function(){
		if(this.value == '') this.value = '用户名';
	});
	
	$('#a_register').click(function(){
		var url = getDialogUrl('register');
		return showDialog(url, 500, 620, '用户注册');
	});
	$('#a_forget').click(function(){
		var url = getDialogUrl('forget');
	    return showDialog(url, 350, 520, '找回密码');
	});
	
	var rr = $("#seleMenu");
	var lis = rr.find("li.libg");
	
	lis.each(function(){
		var ls = $(this).find(".seleMenu");
		var lsH = ls.height()+2;
		ls.find(".seleLay").height(lsH);
		
		ls.find("p").hover(function(){
			$(this).addClass("over");
		},function(){
			$(this).removeClass("over");
		});
	});
	
	lis.hover(function(){
		var els = $(this);
		els.addClass("now");
		els.find(".seleMenu").show();
	},function(){
		var els = $(this);
		els.removeClass("now");
		els.find(".seleMenu").hide();
	});
	
	$(document).ajaxStart(showAjaxLoading).ajaxStop(hideAjaxLoading);
});

function showAjaxLoading(){	
	$('#ajaxLoading').css({ 
		top: $(window).scrollTop() + 5 + 'px'
	}).show();
}
function hideAjaxLoading(){
	$('#ajaxLoading').hide();
}

function userConfig(theType, theValue){
	$.post(bbsUrl + '/ajax/config.aspx', { type: theType, value: theValue }, function(data) {
		if (data.success == 'true'){
			window.location.reload(false);
		}else{
			failureMessage(data.errorMessage);
		}
	}, 'json');
}