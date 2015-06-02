<%@ Page Language="c#" Inherits="SiteServer.BBS.Pages.Dialog.Identify" Trace="False" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../css/share.css" rel="stylesheet" type="text/css">
<STYLE>
body { padding: 0px; margin: 0px; }
.container { padding: 10px; }
* { outline-style: none; }
.mb5 { margin-bottom: 5px; }
.mr20 { margin-right: 20px; }
.w { white-space: nowrap; }
.cp { cursor: pointer; }
textarea { border-bottom: #e1e1e1 1px solid; border-left: #999999 1px solid; padding-bottom: 3px; line-height: 1.5; padding-left: 3px; padding-right: 3px; background: #fff; border-top: #999999 1px solid; border-right: #e1e1e1 1px solid; padding-top: 3px; }
select { padding-bottom: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; }
.textareaA { line-height: 1.3; width: 95%; background: #fff; height: 30px; overflow: auto; }
.input { border-bottom: #e1e1e1 1px solid; border-left: #999999 1px solid; padding-bottom: 2px; padding-left: 3px; padding-right: 3px; background: #fff; color: #000; font-size: 1em; border-top: #999999 1px solid; border-right: #e1e1e1 1px solid; padding-top: 2px; }
.input_wa { width: 154px; }
.line td { border-bottom: #ddd 1px solid; }
.tr3 td { padding: 6px; }
.tr3:hover { background-color:#F1F1F1; }
</STYLE>
<script type="text/javascript" src="../js/datepicker/WdatePicker.js"></script>
<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../js/jquery.form.js"></script>
<script type="text/javascript">
function onSubmit(form) {
	$(form).ajaxSubmit({
		dataType: 'json',
		success: function(data) { 
			if (data.success == 'true'){
				window.top.location = data.url;
			}else{
				alert(data.errorMessage);
			}
		}
	});
}
function identifyChanged(option) {
	var obj = $(option);
	var iconUrl = obj.attr('iconUrl');
	var stampUrl = obj.attr('stampUrl');
	if (stampUrl){
		$('#imageTD').html("<img src='" + stampUrl + "' />");
		if (iconUrl){
			$('#imageTD').html($('#imageTD').html() + "&nbsp;<img src='" + iconUrl + "' />");
		}
	}else{
		$('#imageTD').html("");
	}
}
</script>
</head>
<body>
<form onsubmit="onSubmit(this);return false;" action="?isPostBack=True&publishmentSystemID=<%=Request.QueryString["publishmentSystemID"]%>&forumID=<%=Request.QueryString["forumID"]%>&threadID=<%=Request.QueryString["threadID"]%>&threadIDArray=<%=Request.QueryString["threadIDArray"]%>" method="post">
  <div class="container">
    <table width="100%" class="dtb">
      <tbody>
        <tr class="tr3">
          <td width="55"><label for="moveto">鉴定图章:</label></td>
          <td><div class="mb5">
              <select style="WIDTH: 220px" id="identifyID" name="identifyID" onchange="identifyChanged(this.options[this.selectedIndex])">
                <%=GetOptions()%>
              </select>
            </div></td>
        </tr>
        <tr class="tr3 line" height="120">
          <td>图章/图标</td>
          <td id="imageTD"></td>
        </tr>
      </tbody>
    </table>    
    <table width="100%" class="dtb">
      <tbody>
        <tr class="tr3">
          <td width="55">消息通知: </td>
          <td><label class="mr20">
              <input type="radio" name="isMessage" value="True" />
              开启</label>
            <label>
              <input type="radio" name="isMessage" value="False" checked="checked" />
              关闭</label></td>
        </tr>
        <tr class="tr3">
          <td>操作原因: </td>
          <td><div class="mb5" style="text-align:right; margin-right:5px;">
              <select style="WIDTH: 80px" onchange="this.form.reason.value=this.value" name="">
                <option value="">自定义</option>
                <option value="">-------</option>
                <option value="广告帖">广告帖</option>
                <option value="恶意灌水">恶意灌水</option>
                <option value="非法内容">非法内容</option>
                <option value="与版规不符">与版规不符</option>
                <option value="重复发帖">重复发帖</option>
                <option value="">-------</option>
                <option value="优秀文章">优秀文章</option>
                <option value="原创内容">原创内容</option>
              </select>
            </div>
            <textarea class="textareaA" id="reason" name="reason"></textarea></td>
        </tr>
      </tbody>
    </table>
    <table width="100%" class="dtb">
      <tbody>
        <tr>
          <td align="center"><input type="submit" class="dialog_btn" value="确 定" /></td>
        </tr>
      </tbody>
    </table>
  </div>
</form>
</body>
</html>