<%@ Page Language="C#" Inherits=" SiteServer.BBS.Pages.Dialog.Report" Trace="False" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<link href="../css/share.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.container h2 { color:#336699; font-size:14px; margin-bottom:10px; }
.mb5, .fs { margin-bottom:8px; }
.fs { color:#444444; font-size:12px; font-weight:bold }
.mb5 h2 { color:#444444; font-size:12px; font-weight:normal; margin-bottom:5px; }
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
.dialog_sbtn { background: url(../images/subbtn.jpg) no-repeat; width:46px; height:23px; color:#ffffff; border:none; margin-left:110px; cursor:pointer }
.input { border-bottom: #e1e1e1 1px solid; border-left: #999999 1px solid; padding-bottom: 2px; padding-left: 3px; padding-right: 3px; background: #fff; color: #000; font-size: 1em; border-top: #999999 1px solid; border-right: #e1e1e1 1px solid; padding-top: 2px; }
.input_wa { width: 154px; }
.line td { border-bottom: #ddd 1px solid; }
.tr3 td { padding: 6px; }
.tr3:hover { background-color:#F1F1F1; }
</style>
<script type="text/javascript" src="../js/bbs.js"></script>
<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../js/jquery.form.js"></script>
<script type="text/javascript" src="../js/jquery.bgiframe.min.js"></script>
<script type="text/javascript" src="../js/jquery.loading.js"></script>
<script type="text/javascript">
function checkLength(which) {
	var maxChars = 200;
	if (which.value.length > maxChars)
		which.value = which.value.substring(0, maxChars);
	var curr = maxChars - which.value.length;
	document.getElementById("chLeft").innerHTML = curr.toString();
}
function check() {
	if (document.getElementById("txtCon").value=="") {
		alert("请填写内容");
		return false;
	}
}
function onReportSubmit(form) {
    if ($('#txtCon', form).val() == '') {
        failureMessage('请填写内容');
    } else {
		var loading = new ol.loading();
		loading.show();
		$(form).ajaxSubmit({
		    dataType: 'json',
		    success: function (data) {
		        loading.hide();
		        if (data.success == 'true') {
				   alert("举报成功");
		           window.top.hideDialog();
		        } else {
		            failureMessage(data.errorMessage);
		        }
		    }
		});
    }
}
</script>
</head>
<body>
<form id="contentForm" runat="server" onsubmit="onReportSubmit(this);return false;" action="../ajax/form.aspx?publishmentSystemID=<%=Request.QueryString["publishmentSystemID"]%>&action=report" method="post">
  <input id="forumID" name="forumID" type="hidden" value="<%=base.forumID%>" />
  <input id="threadID" name="threadID" type="hidden" value="<%=base.threadID%>" />
  <input id="postID" name="postID" type="hidden" value="<%=base.postID%>" />
  <div class="container"  id="container">
    <h2>举报</h2>
    <div class="mb5">
      <h2>可选举报理由</h2>
      <select style="WIDTH: 300px;background: #fff; color:#444444; height:55px" onchange="this.form.txtCon.value=this.value" name="" size="4">
        <option value="广告帖">广告帖</option>
        <option value="恶意灌水">恶意灌水</option>
        <option value="非法内容">非法内容</option>
        <option value="与版规不符">与版规不符</option>
        <option value="重复发帖">重复发帖</option>
        <option value="优秀文章">优秀文章</option>
        <option value="原创内容">原创内容</option>
      </select>
    </div>
    <div class="mb5">
      <textarea class="textareaA" name="txtCon" onkeyup="checkLength(this)" id="txtCon" style="height:70px; width:300px;"></textarea>
    </div>
    <div class="fs"> 您还可以输入<span id="chLeft">200</span>个字符
      <input type="submit" value="确定" class="dialog_sbtn" />
      <%--<asp:Button ID="btnSubmit" runat="server"  Text="确定" CssClass="dialog_sbtn" OnClick="btnSubmit_Click" OnClientClick="return check()"/>--%>
    </div>
  </div>
</form>
<link href="../css/opopout.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
        var bbsUrl = '..';
</script> 
<script type="text/javascript" src="../js/popout.js"></script>
<asp:Literal ID="ltlScripts" runat="server"></asp:Literal>
</body>
</html>
