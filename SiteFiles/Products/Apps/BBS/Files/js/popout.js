window.getObj?0:getObj=function(s){return document.getElementById(s)};
var agt = navigator.userAgent.toLowerCase();
var is_ie = ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1));
var is_gecko= (navigator.product == "Gecko");
var is_webkit=agt.indexOf('webkit')>-1;
function IsElement(id) {
	return document.getElementById(id) != null ? true : false;
}

function ietruebody() {
	return (document.compatMode && document.compatMode!="BackCompat" && !is_webkit)? document.documentElement : document.body;
}
function getTop() {
	return typeof window.pageYOffset != 'undefined' ? window.pageYOffset:ietruebody().scrollTop;
}
function getLeft() {
	return (typeof window.pageXOffset != 'undefined' ? window.pageXOffset:ietruebody().scrollLeft)
}

/*
 *对话框类。
 *使用举例：
 *@example
 new PwMenu('boxID').guide();
 *
 */
/**
 * @param String
 *            id 对话框的id，若不传递，则默认为pw_box
 */
PWMENU_ZINDEX=1001;

function PwMenu(id){
	this.pid	= null;
	this.obj	= null;
	this.w		= null;
	this.h		= null;
	this.t		= 0;
	this.menu	= null;
	this.mid	= id;
	this.oCall  = null;
	this.init(id);
}

PwMenu.prototype = {

	init : function(id) {
		this.menu = getPWBox(id);
		var _ = this;
		document.body.insertBefore(this.menu,document.body.firstChild);
		_.menu.style.zIndex=PWMENU_ZINDEX+10+"";
		PWMENU_ZINDEX+=10;
	},

	guide : function() {
		this.menu=this.menu||getPWBox(this.mid);
		this.menu.className = '';
		this.menu.innerHTML = '<div class="popout"><table border="0" cellspacing="0" cellpadding="0"><tbody><tr><td class="bgcorner1"></td><td class="pobg1"></td><td class="bgcorner2"></td></tr><tr><td class="pobg4"></td><td><div class="popoutContent" style="padding:20px;"><img src="'+imgpath+'/loading.gif" align="absmiddle" alt="loading" /> 正在加载数据...</div></td><td class="pobg2"></td></tr><tr><td class="bgcorner4"></td><td class="pobg3"></td><td class="bgcorner3"></td></tr></tbody></table></div>';
		this.menupz(this.obj);
	},

	close : function() {
		var _=this;
		read.t = setTimeout(function() {
			_.menu?0:_.menu=read.menu;
			if (_.menu) {
				_.menu.style.display = 'none';
				_.menu.className = '';
				if (_.oCall && _.oCall.close) _.oCall.close();
			}
		}, 100);
	},

	setMenu : function(element,type,border,oCall) {
		if (this.IsShow() && this.oCall && this.oCall.close) {
			this.oCall.close();
		}
		if (type) {
			this.menu=this.menu||getPWBox(this.mid);
			var thisobj = this.menu;
		} else {
			var thisobj = getPWContainer(this.mid,border);
		}
		if (typeof(element) == 'string') {
			thisobj.innerHTML = element;
		} else {
			while (thisobj.hasChildNodes()) {
				thisobj.removeChild(thisobj.firstChild);
			}
			thisobj.appendChild(element);
		}
		this.oCall = null;
		if (typeof oCall == 'object' && oCall.open) {
			this.oCall = oCall;
			oCall.open();
		}
	},

	move : function(e) {
		if(is_ie){document.body.onselectstart = function(){return false;}}
		var e  = is_ie ? window.event : e;
		var o  = this.menu||getPWBox(this.mid);
		var x  = e.clientX;
		var y  = e.clientY;
		this.w = e.clientX - parseInt(o.offsetLeft);
		this.h = e.clientY - parseInt(o.offsetTop);
		var _=this;
		_.menu=_.menu||getPWBox(_.mid);
		document.body.setCapture && _.menu.setCapture();
		document.onmousemove = function(e) {
			var e  = is_ie ? window.event : e;
			var x  = e.clientX;
			var y  = e.clientY;
			_.menu.style.left = x - _.w + 'px';
			_.menu.style.top  = y - _.h + 'px';
		};
		document.onmouseup   = function() {
			if(is_ie){document.body.onselectstart = function(){return true;}}
			document.body.releaseCapture && _.menu.releaseCapture();// IE释放鼠标监控
			document.onmousemove = null;
			document.onmouseup = null;
		};
	},


	open : function(idName, object, type, pz, oCall) {
		if (typeof idName == 'string') {
			idName = getObj(idName);
		}
		if (idName == null) return false;
		this.menu=this.menu||getPWBox(this.mid);
		clearTimeout(read.t);
		if (typeof type == "undefined" || !type) type = 1;
		if (typeof pz == "undefined" || !pz) pz = 0;

		this.setMenu(idName.innerHTML, 1, 1, oCall);
		this.menu.className = idName.className;
		this.menupz(object,pz);

		if (type == 3) {
			this.closeByClick();
		} else if (type != 2) {
			this.closeByMove(object);
		}
	},
	
	closeByClick : function() {
		document.onmousedown = function (e) {
			var o = is_ie ? window.event.srcElement : e.target;
			if (!issrc(o)) {
				read.close();
				document.onmousedown = '';
			}
		}
	},

	closeByMove : function(id) {
		var _=this;
		getObj(id).onmouseout = function() {_.close();getObj(id).onmouseout = '';};
		_.menu.onmouseout = function() {_.close();}
		_.menu.onmouseover = function() {clearTimeout(read.t);}
	},

	menupz : function(obj,pz) {
		this.menu=this.menu||getPWBox(this.mid);
		this.menu.onmouseout = '';
		this.menu.style.display = '';
		// this.menu.style.zIndex = 3000;
		this.menu.style.left	= '-500px';
		this.menu.style.visibility = 'visible';

		if (typeof obj == 'string') {
			obj = getObj(obj);
		}
		if (obj == null) {
			if (is_ie) {
				this.menu.style.top  = (ietruebody().offsetHeight - this.menu.offsetHeight)/3 + getTop() +(getObj('upPanel')?getObj('upPanel').scrollTop:0)+ 'px';
				this.menu.style.left = (ietruebody().offsetWidth - this.menu.offsetWidth)/2 + 'px';
			} else {
				this.menu.style.top  = (document.documentElement.clientHeight - this.menu.offsetHeight)/3 + getTop() + 'px';
				this.menu.style.left = (document.documentElement.clientWidth - this.menu.offsetWidth)/2 + 'px';
			}
		} else {
			var top  = findPosY(obj);
			var left = findPosX(obj);
			var pz_h = Math.floor(pz/10);
			var pz_w = pz % 10;
			if (is_ie) {
				var offsetheight = ietruebody().offsetHeight;
				var offsethwidth = ietruebody().offsetWidth;
			} else {
				var offsetheight = ietruebody().clientHeight;
				var offsethwidth = ietruebody().clientWidth;
			}
			/*
			 * if (IsElement('upPanel') && is_ie) { var gettop = 0; } else { var
			 * gettop = ; }
			 */
			var show_top = IsElement('upPanel') ? top - getObj('upPanel').scrollTop : top;

			if (pz_h!=1 && (pz_h==2 || show_top < offsetheight/2)) {
				top += getTop() + obj.offsetHeight;
			} else {
				top += getTop() - this.menu.offsetHeight;
			}
			if (pz_w!=1 && (pz_w==2 || left > (offsethwidth)*3/5)) {
				left -= this.menu.offsetWidth - obj.offsetWidth - getLeft();
			}
			this.menu.style.top = top+ 'px';
			if (top < 0) {
				this.menu.style.top  = 0  + 'px';
			}
			this.menu.style.left = left + 'px';
			if (pz_w != 1 && left + this.menu.offsetWidth > document.body.offsetWidth+ietruebody().scrollLeft) {
				this.menu.style.left = document.body.offsetWidth+ietruebody().scrollLeft-this.menu.offsetWidth-30 + 'px';
			}
		}
	},

	InitMenu : function() {
		var _=this;
		function setopen(a,b) {
			if (getObj(a)) {
				var type = null,pz = 0,oc;
				if (typeof window[a] == 'object') {
					oc = window[a];
					oc.type ? type = oc.type : 0;
					oc.pz ? pz = oc.pz : 0;
				}
				getObj(a).onmouseover = function(){_.open(b, a, type, pz, oc);};
				// getObj(a).onmouseover=function(){_.open(b,a);callBack?callBack(b):0};
				// try{getObj(a).parentNode.onfocus =
				// function(){_.open(b,a);callBack?callBack(b):0};}catch(e){}
			}
		}
		for (var i in openmenu) {
			try{setopen(i,openmenu[i]);}catch(e){}
		}
	},

	IsShow : function() {
		this.menu=this.menu||getPWBox(this.mid);
		return (this.menu.hasChildNodes() && this.menu.style.display != 'none') ? true : false;
	}
};
var read = new PwMenu();

function closep() {
	read.menu.style.display = 'none';
	read.menu.className = '';
}
function findPosX(obj) {
	var curleft = 0;
	if (obj.offsetParent) {
		while (obj.offsetParent) {
			curleft += obj.offsetLeft
			obj = obj.offsetParent;
		}
	} else if (obj.x) {
		curleft += obj.x;
	}
	return curleft - getLeft();
}
function findPosY(obj) {
	var curtop = 0;
	if (obj.offsetParent) {
		while (obj.offsetParent) {
			curtop += obj.offsetTop
			obj = obj.offsetParent;
		}
	} else if (obj.y) {
		curtop += obj.y;
	}
	return curtop - getTop();
}


function getPWBox(type){
	if (getObj(type||'pw_box')) {
		return getObj(type||'pw_box');
	}
	var pw_box	= elementBind('div',type||'pw_box','','position:absolute;left:-10000px');

	document.body.appendChild(pw_box);
	return pw_box;
}

function getPWContainer(id,border){
	if (typeof(id)=='undefined') id='';
	if (getObj(id||'pw_box')) {
		var pw_box = getObj(id||'pw_box');
	} else {
		var pw_box = getPWBox(id);
	}
	if (getObj(id+'box_container')) {
		return getObj(id+'box_container');
	}

	if (border == 1) {
		pw_box.innerHTML = '<div class="popout"><div id="'+id+'box_container"></div></div>';
	} else {
		pw_box.innerHTML = '<div class="popout"><table border="0" cellspacing="0" cellpadding="0"><tbody><tr><td class="bgcorner1"></td><td class="pobg1"></td><td class="bgcorner2"></td></tr><tr><td class="pobg4"></td><td><div class="popoutContent" id="'+id+'box_container"></div></td><td class="pobg2"></td></tr><tr><td class="bgcorner4"></td><td class="pobg3"></td><td class="bgcorner3"></td></tr></tbody></table></div>';
	}
	var popoutContent = getObj(id+'box_container');
	return popoutContent;
}
function elementBind(type,id,stylename,csstext){
	var element = document.createElement(type);
	if (id) {
		element.id = id;
	}
	if (typeof(stylename) == 'string') {
		element.className = stylename;
	}
	if (typeof(csstext) == 'string') {
		element.style.cssText = csstext;
	}
	return element;
}


(function() {
    if (window.showDlg) return;
    var win = window,doc = win.document,
        isIE = !+'\v1', // IE浏览器
	    isCompat = doc.compatMode == 'CSS1Compat',	// 浏览器当前解释模式
	    IE6 = isIE && /MSIE (\d)\./.test(navigator.userAgent) && parseInt(RegExp.$1) < 7, // IE6以下需要用iframe来遮罩
	    useFixed = !isIE || (!IE6 && isCompat), // 滚动时，IE7+（标准模式）及其它浏览器使用Fixed定位
        Typeis = function(o,type) {
		    return Object.prototype.toString.call(o)==='[object ' + type + ']';
	    }, // 判断元素类型
        $ = function(o) {
            return Typeis(o,'String') ? doc.getElementById(o) : o;
        },
        $height = function(obj) {return parseInt(obj.style.height) || obj.offsetHeight}, // 获取元素高度
        $width = function(obj) {return parseInt(obj.style.width) || obj.offsetWidth}, // 获取元素高度
        getWinSize = function() {
            var rootEl = doc.body;
			return [Math.max(rootEl.scrollWidth, rootEl.clientWidth), Math.max(Math.max(doc.body.scrollHeight,rootEl.scrollHeight), Math.max(rootEl.clientHeight,doc.body.clientHeight || window.clientHeight))]
		},
		/* 获取scrollLeft和scrollTop */
		getScrollPos = function() {
		    var body = doc.body,docEl = doc.documentElement;
			return {
			    left:body.scrollLeft || docEl.scrollLeft, top:body.scrollTop || docEl.scrollTop
			}
		},
		getElementsByClassName = function(className, element) {
		    var children = (element || document).getElementsByTagName('*');
		    var elements = new Array();
		    for (var i = 0; i < children.length; i++) {
			    var child = children[i];
			    var classNames = child.className.split(' ');
			    for (var j = 0; j < classNames.length; j++) {
				    if (classNames[j] == className) {
					    elements.push(child);
					    break;
				    }
			    }
		    }
		    return elements;
	    },
        empty = function(){},
        defaultCfg = {   // 默认设置
            id:         'pw_dialog',
            type:       'warning',
            message:    '',// 弹出提示的文字
            showObj:    null,// 要显示的本地元素,在ajax提示是常用
            width:      350,// 弹出框高度
            isMask:     1,
            autoHide:   0,// 是否自动关闭
		    zIndex:		9999, // 层叠值
		    onShow:		empty,// 显示时执行
		    onOk:       empty,
		    onClose:	empty, // 关闭时执行
		    left:       '50%',// 绝对位置
		    top:        '50%',
		    alpha:      0.2,// 遮罩的透明度
		    backgroundColor:'#000',// 遮罩的背景色
		    titleText:  '提示',// 提示标题
		    okText:      '确定',// 确定按钮文字
		    cancelText:  '取消',// 取消文字，确认时用
		    closeText:  '关闭',// 关闭文字
		    button:     null// 默认不显示按钮
        },
		icoPath = bbsUrl + '/images/';
        
    var Dialog = function(options) {// 构造函数
        var self = this;
        this.options = options;
        if (!(self instanceof Dialog)) {
            return new Dialog(options);
        }
        this._initialize();
    }
    Dialog.prototype = {
        _initialize:function() {
            for(var i in defaultCfg) {
                if(!(i in options)){
                    options[i] = defaultCfg[i];
                }
            }
            this.show();
        },
        show:function(options) {
            var self = this,
                opt = self.options,
                box = opt.showObj;
            	closep();
                createButton = function(){// 创建按钮
                    var html = [],btn = opt.button;
                    if(opt.autoHide){ html.push('<div class="fl gray">本窗口<span class="spanTime">'+ opt.autoHide +'</span>秒后关闭</div>');}
                    if(btn){
                        for(var i = 0,j = btn.length;i < j;i++ ) {
                            html.push('<span class="bt2"><span><button class="pw_dialoag_button" type="button">'+ btn[i][0] +'</button></span></span>');
                        }
                    }else {
                        if(opt.type === 'confirm') {
                            html.push('<span class="btn2"><span><button type="button" class="pw_dialoag_ok">'+ opt.okText +'</button></span></span>');
                        }
                        html.push('<span class="bt2"><span><button type="button" class="pw_dialoag_close">'+ opt.closeText +'</button></span></span>');
                    }
                    return html.join('');
                }
                // timeout;
            if(!opt.showObj) {
                var divStyle = 'z-index:'+ (opt.zIndex + 1) +';position:'+ (useFixed ? 'fixed' : 'absolute')+';';
                    maskStyle = (!opt.isMask ? 'display:none':'') + 'width:'+ getWinSize()[0] +'px;height:'+ getWinSize()[1] +'px;z-index:'+ opt.zIndex +';position:absolute;top:0;left:0;text-align:center;filter:alpha(opacity='+ opt.alpha*100 + ');opacity:'+ opt.alpha +';background-color:'+opt.backgroundColor;
                    if(!getObj(opt.id)) {
                        box = document.createElement('div');
                        box.id = opt.id;
                    }else {
                        box = getObj(opt.id);
                    }
                    if (!opt.type) opt.type = defaultCfg.type;
		            box.innerHTML = [
		            /* 遮罩 */
		            '<div style="' + maskStyle + '"></div>', IE6 ? ("<iframe id='maskIframe' src='about:blank' style='" + maskStyle + "'></iframe>") : '',
		            /* 窗体 */
		            // IE6 ? "<iframe src='javascript:false'
					// style='width:100%;height:999px;position:absolute;top:0;left:0;z-index:-1;opacity:1;filter:alpha(opacity=100)'></iframe>":
					// '',
		            '<div style="'+ divStyle +'" class="popout">\
		            <table cellspacing="0" cellpadding="0" border="0">\
		                <tbody>\
		                <tr><td class="bgcorner1"></td><td class="pobg1"></td><td class="bgcorner2"></td></tr><tr><td class="pobg4"></td>\
		                    <td>\
		                        <div id="box_container" class="popoutContent">\
		                            <div style="width:'+ opt.width +'px;">\
		                                <div class="popTop">'+ opt.titleText +'</div>\
		                                <div class="popCont"><img align="absmiddle" class="mr10" src="'+ icoPath + opt.type +'.gif">&nbsp;&nbsp;'+ opt.message +'</div>\
		                                <div style="text-align: right;" class="popBottom">\
		                                '+ createButton() + '\
		                                </div>\
		                            </div>\
		                        </div>\
		                    </td><td class="pobg2"></td></tr><tr><td class="bgcorner4"></td><td class="pobg3"></td><td class="bgcorner3"></td></tr>\
		                </tbody>\
		            </table>\
		            </div>',
		            /* 阴影 */
		            isIE ? "<div id='ym-shadow' style='position:absolute;z-index:10000;background:#808080;filter:alpha(opacity=80) progid:DXImageTransform.Microsoft.Blur(pixelradius=5);'></div>": ''].join('');
		        doc.body.insertBefore(box, doc.body.childNodes[0]);
		        var popout = getElementsByClassName('popout',box)[0];
                popout.style.left = Typeis(opt.left,'Number') ? opt.left + 'px' : opt.left
                popout.style.top = Typeis(opt.top,'Number') ? opt.top + 'px' : opt.top;
                var h = $height(popout),w = $width(popout);
                if(!Typeis(opt.left,'Number')) {
				    popout.style.marginLeft = useFixed ? - w / 2 + "px" : getScrollPos().left - w / 2 + "px";
				}else {
				    popout.style.left = ''+opt.left + 'px';
				}
				if(!Typeis(opt.top,'Number')) {
				    popout.style.marginTop = useFixed ? - h / 2 + "px" : getScrollPos().top - h / 2 + "px";
				}else {
				    popout.style.top = ''+opt.top + 'px';
				}
				var closeTime = function() {
					if(interval){
						clearInterval(interval);
						interval = null;
					}
                };
				if(opt.button) {
				    var customBtn = getElementsByClassName('pw_dialoag_button',box),buttons = opt.button;
				    if(customBtn.length){
                        for(var i = 0,j = customBtn.length;i < j;i++) {
                            (function(i){
                                customBtn[i].onclick = function() {
                                   buttons[i][1] && buttons[i][1](); 
                                }
                            })(i)
                            
                        }
                    }
				}else{
		            var closeBtn = getElementsByClassName('pw_dialoag_close',box),
                        okBtn = getElementsByClassName('pw_dialoag_ok',box);
                   if(closeBtn.length){
                        closeBtn[0].onclick = function() {
                            self.close();
                        }
                    }
                    if(okBtn.length) {
                        okBtn[0].onclick = function() {
                            self.options.onOk && self.options.onOk();
							//self.options.onClose && self.options.onClose();
                            self.close();
                        }
                    }
                }
                
            }else{
                var obj = getObj(opt.showObj);
                if(obj.nodeType !== 1) {// 如果传进来的不是元素,直接return
                    return;
                }
                obj.style.display = '';
                var msgObj = getElementsByClassName('message',obj),
                    msgClose = getElementsByClassName('close',obj);
                if( !msgObj.length ) { return false; }
                msgObj[0].innerHTML = opt.message;
                if( msgClose.length ) { msgClose[0].onclick = function() {obj.style.display = 'none'; }}
            }
            opt.onShow && opt.onShow();
            if(opt.autoHide) {
                var spanTime = getElementsByClassName('spanTime',popout)[0];
		        interval = setInterval(function() {
		                var time = --opt.autoHide;
		                if(spanTime){ spanTime.innerHTML = time;}
		                if(time === 0){
		                    clearInterval(interval);
		                    self.close();
		                }
		        },1000);
		    }
        },
        close:function() {
            var opt = this.options;
            if(!opt.showObj && getObj(opt.id)) {
                doc.body.removeChild(getObj(opt.id));
            }else if(getObj(opt.showObj)) {
                getObj(opt.showObj).style.display = 'none';
            }
            opt.onClose && opt.onClose();
        }
    }
    win['showDlg'] = function(type,message,autohide,callback){
		var isMask = type === 'confirm' ? 0 : 1,
			onClose = type !== 'confirm' ? callback : null,
			options = arguments.length === 1 ? arguments[0] : { type:type,message:message,autoHide:autohide,onOk:callback,onClose:onClose,isMask:isMask };
        Dialog(options);
    }
})();

function successMessage(message, callback){
	alert(message);
	//showDlg('success', message, 3, callback);
}

function failureMessage(message, callback){
	alert(message);
	//showDlg('failure', message, 0, callback);
}

function infoMessage(message, callback){
	alert(message);
	//showDlg('info', message, 3, callback);
}