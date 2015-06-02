<%@ Page Language="c#" Inherits="SiteServer.BBS.Pages.Dialog.Highlight" Trace="False" %>
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
				window.top.location.reload(false);
			}else{
				alert(data.errorMessage);
			}
		}
	});
}

$(document).ready(function(){
	$("#highlight_td a").toggle(
		function(){
			$(this).css({border:"#999 1px solid"});
			$("#highlight_" + $(this).html()).val("true");
		}, 
		function(){
			$(this).css({border:"#F4F4F4 1px solid"});
			$("#highlight_" + $(this).html()).val("false");
		}
	);
	
});
</script>
</head>
<body>
<form onsubmit="onSubmit(this);return false;" action="?isPostBack=True&publishmentSystemID=<%=Request.QueryString["publishmentSystemID"]%>&forumID=<%=Request.QueryString["forumID"]%>&threadID=<%=Request.QueryString["threadID"]%>&threadIDArray=<%=Request.QueryString["threadIDArray"]%>" method="post">
  <div class="container">
    <table width="100%" class="dtb">
      <tbody>
        <tr class="tr3">
          <td width="15"><input <%=GetChecked("top")%> type="checkbox" name="actions" value="top" /></td>
          <td width="55">置顶: </td>
          <td><table width="100" cellpadding="0" cellspacing="0">
              <tr>
                <td style="padding:0; margin:0;"><label class="mr20 w">
                    <input type="radio" name="topLevel" checked="checked" value="0" />
                    取消置顶</label></td>
                <td style="padding:0; margin:0;"><label class="mr20 w">
                    <input type="radio" name="topLevel" value="1" />
                    本版置顶</label></td>
              </tr>
              <tr>
                <td style="padding:0; margin:0;"><label class="mr20 w">
                    <input type="radio" name="topLevel" value="2" />
                    分区置顶</label></td>
                <td style="padding:0; margin:0;"><label class="mr20 w">
                    <input type="radio" name="topLevel" value="3" />
                    全局置顶</label></td>
              </tr>
            </table></td>
        </tr>
        <tr class="tr3 line">
          <td></td>
          <td> 到期时间: </td>
          <td><input id="topLevelDate" name="topLevelDate" class="input input_wa" type="text" onFocus="WdatePicker()"/></td>
        </tr>
      </tbody>
    </table>
    <table width="100%" class="dtb">
      <tbody>
        <tr class="tr3">
          <td width="15"><input <%=GetChecked("digest")%> type="checkbox" name="actions" value="digest" /></td>
          <td width="55">精华: </td>
          <td><table width="100" cellpadding="0" cellspacing="0">
              <tr>
                <td style="padding:0; margin:0;"><label class="mr20 w">
                    <input type="radio" name="digestLevel" checked="checked" value="0" />
                    取消精华</label></td>
                <td style="padding:0; margin:0;"><label class="mr20 w">
                    <input type="radio" name="digestLevel" value="1" />
                    精华 1</label></td>
              </tr>
              <tr>
                <td style="padding:0; margin:0;"><label class="mr20 w">
                    <input type="radio" name="digestLevel" value="2" />
                    精华 2</label></td>
                <td style="padding:0; margin:0;"><label class="mr20 w">
                    <input type="radio" name="digestLevel" value="3" />
                    精华 3</label></td>
              </tr>
            </table></td>
        </tr>
        <tr class="tr3 line">
          <td></td>
          <td> 到期时间: </td>
          <td><input id="digestDate" name="digestDate" class="input input_wa" type="text" onFocus="WdatePicker()"/></td>
        </tr>
      </tbody>
    </table>
    <table width="100%" class="dtb">
      <tbody>
        <tr class="tr3">
          <td width="15"><input <%=GetChecked("highlight")%> type="checkbox" name="actions" value="highlight" /></td>
          <td width="55">高亮: </td>
          <td id="highlight_td"><a style="border:#F4F4F4 1px solid; color:#333; padding:2px 6px; text-decoration:none; font:12px/1.5 'DejaVu Sans','Lucida Grande',Tahoma,'Hiragino Sans GB',STHeiti,SimSun,sans-serif; font-weight:700" title="文字加粗" href="javascript:;">B</a> <a style="border:#F4F4F4 1px solid; color:#333; padding:2px 8px; line-height:18px; text-decoration:none; font:12px/1.5 'DejaVu Sans','Lucida Grande',Tahoma,'Hiragino Sans GB',STHeiti,SimSun,sans-serif; font-style:italic" title="文字斜体" href="javascript:;">I</a> <a style="border:#F4F4F4 1px solid; color:#333; padding:2px 6px; text-decoration:underline; font:12px/1.5 'DejaVu Sans','Lucida Grande',Tahoma,'Hiragino Sans GB',STHeiti,SimSun,sans-serif;" title="文字下划线" href="javascript:;">U</a>
            <input type="hidden" id="highlight_B" name="highlight_B" value="" />
            <input type="hidden" id="highlight_I" name="highlight_I" value="" />
            <input type="hidden" id="highlight_U" name="highlight_U" value="" />
            <input id="highlight_Color" name="highlight_Color" style="width:50px;" class="input input_wa" type="text"/></td>
        </tr>
        <tr class="tr3 line">
          <td></td>
          <td> 到期时间: </td>
          <td><input id="highlightDate" name="highlightDate" class="input input_wa" type="text" onFocus="WdatePicker()"/></td>
        </tr>
      </tbody>
    </table>
    <table width="100%" class="dtb">
      <tbody>
        <tr class="tr3">
          <td width="15">&nbsp;</td>
          <td width="55">消息通知: </td>
          <td><label class="mr20">
              <input type="radio" name="isMessage" value="True" />
              开启</label>
            <label>
              <input type="radio" name="isMessage" value="False" checked="checked" />
              关闭</label></td>
        </tr>
        <tr class="tr3">
          <td></td>
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