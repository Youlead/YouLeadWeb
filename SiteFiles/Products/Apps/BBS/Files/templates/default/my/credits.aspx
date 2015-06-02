<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.CreditsPage" EnableViewState="false" %>
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
<script type="text/javascript" language="javascript" src="../js/jquery.idTabs.min.js"></script>
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
              <li><a class="select" href="credits.aspx">积分</a></li>
              <li><a href="password.aspx">密码安全</a></li>
              <li><a href="permission.aspx">用户权限</a></li>
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
            <h3>积分</h3>
          </div>
          <div class="share_table">
            <div id="tabs">
              <ul class="tab cl">
                <li> <a class="selected" href="#tab1">我的积分</a> </li>
                <li> <a href="#tab2">积分日志</a> </li>
                <li> <a href="#tab3">积分规则</a> </li>
              </ul>
              <div class="tabContent" id="tab1">
                <div class="flow_tab_info">
                  <div><span class="redbold f14">总积分：
                    <asp:Literal ID="ltlCredit" runat="server"></asp:Literal>
                    </span><br />
                    总积分 =
                    <asp:Literal ID="ltlCalculate" runat="server"></asp:Literal>
                  </div>
                  <br />
                  <table border="0" class="annouce_01font f14" style="width:400px;">
                    <asp:Literal ID="ltlCreditRows" runat="server"></asp:Literal>
                  </table>
                </div>
              </div>
              <div class="tabContent" id="tab2">
                <table class="activeTable" width="95%" cellpadding="2" cellspacing="2">
                  <thead>
                    <tr>
                      <th class="null"></th>
                      <th class="TotalCount">奖励次数</th>
                      <th class="Prestige">威望</th>
                      <th class="Contribution">贡献</th>
                      <th class="Currency">金钱</th>
                      <th class="LastDate">最后奖励时间</th>
                    </tr>
                  </thead>
                  <tbody>
                    <asp:Repeater ID="rptRuleLog" runat="server">
                    <itemtemplate>
                    <tr>
                      <th><asp:Literal ID="ltlRuleName" runat="server"></asp:Literal></th>
                      <td class="TotalCount"><asp:Literal ID="ltlTotalCount" runat="server"></asp:Literal></td>
                      <td class="Prestige"><asp:Literal ID="ltlPrestige" runat="server"></asp:Literal></td>
                      <td class="Contribution"><asp:Literal ID="ltlContribution" runat="server"></asp:Literal></td>
                      <td class="Currency"><asp:Literal ID="ltlCurrency" runat="server"></asp:Literal></td>
                      <td class="LastDate"><asp:Literal ID="ltlLastDate" runat="server"></asp:Literal></td>
                    </tr>
                    </itemtemplate>
                    </asp:Repeater>
                  </tbody>
                </table>
              </div>
              <div class="tabContent" id="tab3">
              <table class="activeTable" width="95%" cellpadding="2" cellspacing="2">
                  <thead>
                    <tr>
                      <th class="null"></th>
                      <th class="PeriodType">周期</th>
                      <th class="MaxNum">最高次数</th>
                      <th class="Prestige">威望</th>
                      <th class="Contribution">贡献</th>
                      <th class="Currency">金钱</th>
                    </tr>
                  </thead>
                  <tbody>
                    <asp:Repeater ID="rptRule" runat="server">
                    <itemtemplate>
                    <tr>
                      <th><asp:Literal ID="ltlRuleName" runat="server"></asp:Literal></th>
                      <td class="PeriodType"><asp:Literal ID="ltlPeriodType" runat="server"></asp:Literal></td>
                      <td class="MaxNum"><asp:Literal ID="ltlMaxNum" runat="server"></asp:Literal></td>
                      <td class="Prestige"><asp:Literal ID="ltlPrestige" runat="server"></asp:Literal></td>
                      <td class="Contribution"><asp:Literal ID="ltlContribution" runat="server"></asp:Literal></td>
                      <td class="Currency"><asp:Literal ID="ltlCurrency" runat="server"></asp:Literal></td>
                    </tr>
                    </itemtemplate>
                    </asp:Repeater>
                  </tbody>
                </table>
              </div>
            </div>
            <script type="text/javascript">   $("#tabs ul").idTabs(); </script> 
          </div>
        </div></td>
    </tr>
  </table>
</div>
<bbs:include file="include/footer.html"></bbs:include>
<bbs:include file="include/dialog.html"></bbs:include>
</body>
</html>
