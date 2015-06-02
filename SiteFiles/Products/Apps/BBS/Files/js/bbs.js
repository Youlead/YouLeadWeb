function onLoginSubmit(form) {
	if($('#userName', form).val() == '' || $('#password', form).val() == '') {
		var url = getDialogUrl('login');
		showDialog(url, 350, 450, '用户登录');
	} else {
		var loading = new ol.loading();
		loading.show();
		$(form).ajaxSubmit({
		    dataType: 'json',
		    success: function (data) {
		        loading.hide();
		        if (data.success == 'true') {
		            window.location.reload(false);
		        } else {
		            failureMessage(data.errorMessage);
		        }
		    }
		});
	}
}

function onLoginPageSubmit(form, returnUrl) {
	if($('#userName', form).val() == '') {
		failureMessage('请输入登录账号');
	} else if ( $('#password', form).val() == ''){
		failureMessage('请输入登录密码');
	} else {
		var loading = new ol.loading();
		loading.show();
		$(form).ajaxSubmit({
			dataType: 'json',
			success: function(data) {
				loading.hide();
				if (data.success == 'true'){
					
					if (data.isSSO == 'true') {
		                var urlList = data.ssoUrls.split(',');
		                if (urlList.length > 0) {
		                    window.urlCount = urlList.length;
		                    for (var i = 0; i < urlList.length; i++) {
		                        loadScript(urlList[i], function () {
		                            if (!window.urlLoad) window.urlLoad = 0;
		                            if (++window.urlLoad == window.urlCount) {
		                                window.location = returnUrl;
		                            }
		                        });
		                    }
		                } else {
		                    window.location = returnUrl;
		                }
		            }
		            else {
		                window.location = returnUrl;
		            }
				}else{
					failureMessage(data.errorMessage);
				}
			}
		});
	}
}

function onAddThreadSubmit(form) {
	KE.sync("content");
	if($('#title', form).val() == '') {
		failureMessage('请填写标题', function(){$('#title', form).focus();});
	}else if($('#content', form).val() == '') {
		failureMessage('请填写内容', function(){KE.util.focus("content");});
	} else {
		var loading = new ol.loading();
		loading.show();
		$(form).ajaxSubmit({
			dataType: 'json',
			success: function(data) {
				loading.hide();
				if (data.success == 'true'){
					if (data.url && data.url.length > 0){
						window.location = data.url;
					}else{
							
					}
				}else{
					failureMessage(data.errorMessage);
				}
			}
		});
	}
}

function onAddPostSubmit(form) {
	KE.sync("content");
	if($('#content', form).val() == '') {
		failureMessage('请填写内容', function(){KE.util.focus("content");});
	} else {
		var loading = new ol.loading();
		loading.show();
		$(form).ajaxSubmit({
			dataType: 'json',
			success: function(data) {
				loading.hide();
				if (data.success == 'true'){
					data.content = $('#content', form).val();
					data.stars = $('#stars', form).html();
					$("#templateBefore").before("<div id='post_" + data.postID + "'></div>");
					$("#post_" + data.postID).setTemplateElement("template", null, {filter_data: false});
					$("#post_" + data.postID).processTemplate(data);
					form.reset();
					KE.html('content', '');
				}else{
					failureMessage(data.errorMessage);
				}
			}
		});
	}
}

function onPostPageSubmit(form) {
	KE.sync("content");
	if($('#content', form).val() == '') {
		failureMessage('请填写内容', function(){KE.util.focus("content");});
	} else {
		var loading = new ol.loading();
		loading.show();
		$(form).ajaxSubmit({
			dataType: 'json',
			success: function(data) {
				loading.hide();
				if (data.success == 'true'){
					window.location = data.url;
				}else{
					failureMessage(data.errorMessage);
				}
			}
		});
	}
}
 
function onPollSubmit(form){
	var loading = new ol.loading();
	loading.show();
	$(form).ajaxSubmit({
		dataType: 'json',
		success: function(data) { 
			loading.hide();
			if (data.success == 'true'){
				//window.top.location.href = data.url;
				window.location.reload(false);	
			}else{
				failureMessage(data.errorMessage);
			}
		}
	});
}

function loadScript(url, callback){
	var head = document.getElementsByTagName('head')[0];
	var script = document.createElement('script');
	script.type = 'text/javascript';
	script.src = url;
	script.onload = script.onreadystatechange = function(){
		if((!this.readyState || this.readyState === "loaded" || this.readyState === "complete")){
			callback && callback();
			// Handle memory leak in IE
			script.onload = script.onreadystatechange = null;
			if ( head && script.parentNode ) {
				head.removeChild( script );
			}
		}
	};
	// Use insertBefore instead of appendChild  to circumvent an IE6 bug.
	head.insertBefore( script, head.firstChild );
}