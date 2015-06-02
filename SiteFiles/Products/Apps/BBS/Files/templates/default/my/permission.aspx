<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.PermissionPage" EnableViewState="false" %>
<%@ Import namespace="SiteServer.BBS.Core" %>
<%@ Import namespace="SiteServer.BBS.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>{bbs.BBSName}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<link href="../css/share.css" rel="stylesheet" type="text/css">
<link href="../css/theme.css" rel="stylesheet" type="text/css">
<bbs:include file="include/css_js.html"></bbs:include>
<link href="../css/activeTable.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="javascript" src="../js/jquery.activeTable.js"></script>
</head>
<body>
<bbs:include file="include/header.html"></bbs:include>
<div class="hd">
  <div id="ad_navbanner" class="adv_area"></div>
</div>
<div class="hd">
  <div class="share_position">
    <bbs:include file="include/shareRight.html"></bbs:include>
    <div class="share_p"><img src="../images/ico_position.gif" /><a href="#">论坛</a>><a href="#">设置中心</a></div>
  </div>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="21%" valign="top" style="padding-right:10px"><div id="sj1">
          <div id="sj_1">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" height="31">
              <tr>
                <td width="1%"><img src="../images/qweqw_03.png" width="6" height="31"  border="0"/></td>
                <td width="98%"><div id="s_bj">设置中心</div></td>
                <td width="1%" align="right"><img src="../images/qweqw_07.png" width="5" height="31"  border="0"/></td>
              </tr>
            </table>
          </div>
          <div id="sj_2">
            <ul>
              <li><a href="avatar.aspx">修改头像</a></li>
              <li><a href="profile.aspx">个人资料</a></li>
              <li><a href="credits.aspx">积分</a></li>
              <li><a href="password.aspx">密码安全</a></li>
              <li><a class="select" href="permission.aspx">用户权限</a></li>
            </ul>
          </div>
          <div id="sj_3">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="1%"><img src="../images/edit_06.png"  border="0"/></td>
                <td width="98%" style="background-image:url(../images/edit_08.png); background-repeat:repeat-x; height:9px;"></td>
                <td width="1%"><img src="../images/edit_10.png"  border="0"/></td>
              </tr>
            </table>
          </div>
        </div></td>
      <td width="79%" valign="top"><div class="share_area">
          <div class="share_tit">
            <h3>用户权限</h3>
          </div>
          <div class="share_table">
          <p><br />
              <span class="redbold"><asp:Literal ID="ltlPermissions" runat="server"></asp:Literal></span><br />
            </p>
            <p><br />
              <span class="redbold">基本权限</span><br />
            <br />
            </p>
            <table class="activeTable" width="95%" cellpadding="2" cellspacing="2">
              <thead>
                <tr>
                  <th class="p1">名称</th>
                  <th class="v1">权限</th>
                  <th class="p2">名称</th>
                  <th class="v2">权限</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="p1" width="120"><strong>访问论坛</strong></td>
                  <td class="v1"><asp:Literal ID="ltlIsAllowVisit" runat="server"></asp:Literal></td>
                  <td class="p2" width="120"><strong>隐身登录</strong></td>
                  <td class="v2"><asp:Literal ID="ltlIsAllowHide" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                  <td class="p3" width="120"><strong>个性签名</strong></td>
                  <td class="v3"><asp:Literal ID="IsAllowSignature" runat="server"></asp:Literal></td>
                  <td class="p1" width="120"><strong>搜索控制</strong></td>
                  <td class="v1"><asp:Literal ID="ltlSearchType" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                  <td class="p2" width="120"><strong>两次搜索时间间隔</strong></td>
                  <td class="v2"><asp:Literal ID="ltlSearchInterval" runat="server"></asp:Literal></td>
                  <td class="p3" width="120"></td>
                  <td class="v3"></td>
                </tr>
              </tbody>
            </table>
            <p><strong><br />
            </strong><span class="redbold">帖子权限</span><br />
            <br />
            </p>
            <table class="activeTable" width="95%" cellpadding="2" cellspacing="2">
              <thead>
                <tr>
                  <th class="p1">名称</th>
                  <th class="v1">权限</th>
                  <th class="p2">名称</th>
                  <th class="v2">权限</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="p1" width="120"><strong>浏览帖子</strong></td>
                  <td class="v1"><asp:Literal ID="ltlIsAllowRead" runat="server"></asp:Literal></td>
                  <td class="p2" width="120"><strong>发表主题</strong></td>
                  <td class="v2"><asp:Literal ID="ltlIsAllowPost" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                  <td class="p3" width="120"><strong>回复主题</strong></td>
                  <td class="v3"><asp:Literal ID="ltlIsAllowReply" runat="server"></asp:Literal></td>
                  <td class="p1" width="120"><strong>发起投票</strong></td>
                  <td class="v1"><asp:Literal ID="ltlIsAllowPoll" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                  <td class="p2" width="120"><strong>每天最多发表帖子数</strong></td>
                  <td class="v2"><asp:Literal ID="ltlMaxPostPerDay" runat="server"></asp:Literal></td>
                  <td class="p3" width="120"><strong>发帖间隔</strong></td>
                  <td class="v3"><asp:Literal ID="ltlPostInterval" runat="server"></asp:Literal></td>
                </tr>
              </tbody>
            </table>
            <p>&nbsp; </p>
            <p><span class="redbold">附件权限</span><br />
              <br />
            </p>
            <table class="activeTable" width="95%" cellpadding="2" cellspacing="2">
              <thead>
                <tr>
                  <th class="p1">名称</th>
                  <th class="v1">权限</th>
                  <th class="p2">名称</th>
                  <th class="v2">权限</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="p1" width="120"><strong>上传附件权限</strong></td>
                  <td class="v1"><asp:Literal ID="ltlUploadType" runat="server"></asp:Literal></td>
                  <td class="p2" width="120"><strong>下载附件权限</strong></td>
                  <td class="v2"><asp:Literal ID="ltlDownloadType" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                  <td class="p3" width="120"><strong>是否允许设置附件权限</strong></td>
                  <td class="v3"><asp:Literal ID="ltlIsAllowSetAttachmentPermissions" runat="server"></asp:Literal></td>
                  <td class="p1" width="120"><strong>允许上传的最大附件大小</strong></td>
                  <td class="v1"><asp:Literal ID="ltlMaxSize" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                  <td class="p2" width="120"><strong>允许上传的附件总大小</strong></td>
                  <td class="v2"><asp:Literal ID="ltlMaxSizePerDay" runat="server"></asp:Literal></td>
                  <td class="p3" width="120"><strong>允许上传的附件数量</strong></td>
                  <td class="v3"><asp:Literal ID="ltlMaxNumPerDay" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                	<td class="p1" width="120"><strong>允许上传的附件类型</strong></td>
                  <td class="v1" colspan="3"><asp:Literal ID="ltlAttachmentExtensions" runat="server"></asp:Literal></td>
                </tr>
              </tbody>
            </table>
            <p><br />
            </p>
          </div>
        </div></td>
    </tr>
  </table>
</div>
<bbs:include file="include/footer.html"></bbs:include>
<bbs:include file="include/dialog.html"></bbs:include>
</body>
</html>
