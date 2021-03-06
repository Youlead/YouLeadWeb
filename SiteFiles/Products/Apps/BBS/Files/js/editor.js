KE.lang['ubb_code'] = "插入代码";
KE.plugin['ubb_code'] = {
	click : function(id) {
		KE.util.selection(id);
		this.dialog = new KE.dialog({
			id : id,
			cmd : 'ubb_code',
			file : 'ubb_code.html',
			width : 450,
			height : 300,
			loadingMode : true,
			title : KE.lang['ubb_code'],
			yesButton : KE.lang['yes'],
			noButton : KE.lang['no']
		});
		this.dialog.show();
	},
	exec : function(id) {
		var dialogDoc = KE.util.getIframeDoc(this.dialog.iframe);
		var html = KE.$('textArea', dialogDoc).value;
		html = KE.util.escape(html);
		html = html.replace(/ /g, '&nbsp;');
		if (KE.g[id].newlineTag == 'p') {
			html = html.replace(/^/, '<p>').replace(/$/, '</p>').replace(/\r\n|\n|\r/g, '</p><p>');
		} else {
			html = html.replace(/\r\n|\n|\r/g, '<br />$&');
		}
		KE.util.insertHtml(id, "[code]" + html + "[/code]");
		this.dialog.hide();
		KE.util.focus(id);
	}
};
KE.lang['ubb_hide'] = "插入隐藏内容";
KE.plugin['ubb_hide'] = {
	click : function(id) {
		KE.util.selection(id);
		this.dialog = new KE.dialog({
			id : id,
			cmd : 'ubb_hide',
			file : 'ubb_hide.html',
			width : 450,
			height : 300,
			loadingMode : true,
			title : KE.lang['ubb_hide'],
			yesButton : KE.lang['yes'],
			noButton : KE.lang['no']
		});
		this.dialog.show();
	},
	exec : function(id) {
		var dialogDoc = KE.util.getIframeDoc(this.dialog.iframe);
		var html = KE.$('textArea', dialogDoc).value;
		html = KE.util.escape(html);
		html = html.replace(/ /g, '&nbsp;');
		if (KE.g[id].newlineTag == 'p') {
			html = html.replace(/^/, '<p>').replace(/$/, '</p>').replace(/\r\n|\n|\r/g, '</p><p>');
		} else {
			html = html.replace(/\r\n|\n|\r/g, '<br />$&');
		}
		KE.util.insertHtml(id, "[hide]" + html + "[/hide]");
		this.dialog.hide();
		KE.util.focus(id);
	}
};

function imgClick(){
	KE.insertHtml('content', $(this).html());
	return false;
}

function pageClick(){
	$a = $(this);
	
	$.get($a.attr('href'), '', function(data, textStatus){
		$('#tab-contents').html('');
		$("#tab-contents").append(data);
		$('.face_info>a').click(imgClick);
		$(".face_page>a").click(pageClick);
	});
	
	return false;
}

var Storage = {
	save : function(key, value, force) {
		if (!value && typeof force == 'undefined') return false;
		if (window.ActiveXObject) {
			with(document.documentElement) try {
				load(key);
				setAttribute("value", value);
				save(key);
			} catch(e) {return false;}
		} else if (window.sessionStorage) {
			try {
			sessionStorage.setItem(key,value);
			} catch(e) {return false;}
		}
		return true;
	},
	load : function(key) {
		var msg = '';
		if (window.ActiveXObject) {
			with (document.documentElement)
			try {
				load(key);
				msg = getAttribute("value");
			} catch(e) {}
		} else if (window.sessionStorage) {
			try {
				msg = sessionStorage.getItem(key);
			} catch(e) {}
		} else {
			return false;
		}
		return msg;
	}
}

$(document).ready(function(){
	$("#tabs a").click(function(){
		$a = $(this);
		$('#tab-contents>div').hide();
		$('#tabs li').removeClass('current');
		$a.parent().addClass('current');
		
		var tabContentID = "tabs-" + $a.attr('id');
		if($('#' + tabContentID).length>0){
			$('#' + tabContentID).show();
		}else{
			$.get($a.attr('href'), '', function(data, textStatus){
				$("#tab-contents").append(data);
				$('.face_info>a').click(imgClick);
				$(".face_page>a").click(pageClick);
			});
		}
		return false;
	});
	
	$('.face_info>a').click(imgClick);
	$(".face_page>a").click(pageClick);

});