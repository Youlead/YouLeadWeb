<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.DefaultPage" EnableViewState="false" %>
<%@ Import namespace="SiteServer.BBS.Core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>{bbs.BBSName}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<link href="css/share.css" rel="stylesheet" type="text/css">
<link href="css/theme.css" rel="stylesheet" type="text/css">
<bbs:include file="include/css_js.html"></bbs:include>
</head>
<body>
<bbs:include file="include/header.html"></bbs:include>
<div class="hd">
  <div id="ad_navbanner" class="adv_area"></div>
</div>
<div class="hd" style="margin:5px auto; ">
  <div class="cl"> <bbs:include file="include/shareRight.html"></bbs:include>
    <p class="bm_ico z"><img src="images/ico.gif" /></p>
    <p class="chart"><asp:Literal ID="ltlStatistics" runat="server"></asp:Literal></p>
  </div>
  <div class="cl">
    <p class="bm_ico z"><img src="images/ann_icon.gif" /></p>
    <bbs:sqlContents predefined="Announcement">
        <p class="annouce_01font z"><a href="{bbs.sql.linkUrl}" style="{bbs.sql.linkStyle}" target="{bbs.sql.linkTarget}">{bbs.sql.title}</a><span class="annouce_timt"><bbs:sqlContent type="AddDate" formatString="yy-MM-dd"></bbs:sqlContent></span></p>
    </bbs:sqlContents>
  </div>
</div>
<div class="hd">
  <bbs:forums where="ChildrenCount > 0">
    <div class="share_area sha_bot_line">
      <div class="share_tit"> <span class="y"><bbs:forum type="moderators" leftText="分区版主：" separator=" | "></bbs:forum></span>
        <h2>
          <bbs:a>
            <bbs:forum type="title"></bbs:forum>
          </bbs:a>
        </h2>
      </div>
      <div class="share_table sha_bot_line">
        <bbs:if testType="columns" testValue="1" testOperate="GreatThan">
          <bbs:successTemplate>
            <bbs:forums layout="table" itemClass="fl_g" align="center">
              <div>
                <bbs:a>
                  <bbs:run class="ForumUtils" get="GetForumIcon({bbs.forum.forumID})"></bbs:run>
                </bbs:a>
              </div>
              <dl>
                <dt>
                  <bbs:a><strong>
                    <bbs:forum type="title"></bbs:forum>
                    </strong></bbs:a>
                  <bbs:if testType="LinkUrl" testOperate="Empty"> <em class="xi1"> 
                    (<bbs:run class="ForumUtils" get="GetTodayThreadAndPostCount({bbs.forum.forumID})"></bbs:run>)
                     </em> </bbs:if>
                </dt>
                <bbs:if testType="LinkUrl" testOperate="Empty">
                  <bbs:successTemplate>
                    <dd><em>主题:
                      <bbs:run class="ForumUtils" get="GetThreadCount({bbs.forum.forumID})"></bbs:run>
                      </em>，<em>帖数:
                      <bbs:run class="ForumUtils" get="GetPostCount({bbs.forum.forumID})"></bbs:run>
                      </em></dd>
                    <dd><bbs:run class="ForumUtils" get="GetLastDate({bbs.forum.forumID})"></bbs:run></dd>
                  </bbs:successTemplate>
                  <bbs:failureTemplate>
                    <dd><span class="blue_font">链接外部地址</span></dd>
                  </bbs:failureTemplate>
                </bbs:if>
              </dl>
            </bbs:forums>
          </bbs:successTemplate>
          <bbs:failureTemplate>
            <table cellspacing="0" cellpadding="0" width="100%">
              <bbs:forums>
                <tr>
                  <td width="68%" class="fl_g"><div>
                      <bbs:a>
                        <bbs:run class="ForumUtils" get="GetForumIcon({bbs.forum.forumID})"></bbs:run>
                      </bbs:a>
                    </div>
                    <dl>
                      <dt style="padding-top:10px;">
                        <bbs:a><strong>
                          <bbs:forum type="title"></bbs:forum>
                          </strong></bbs:a>
                        <em class="xw0 xi1"> 
                        (<bbs:run class="ForumUtils" get="GetTodayThreadAndPostCount({bbs.forum.forumID})"></bbs:run>)
                         </em></dt>
                    </dl></td>
                  <td width="10%" class="fl_g"><em><bbs:run class="ForumUtils" get="GetThreadCount({bbs.forum.forumID})"></bbs:run></em> / <bbs:run class="ForumUtils" get="GetPostCount({bbs.forum.forumID})"></bbs:run></td>
                  <td width="21%" class="fl_g"><p><bbs:run class="ForumUtils" get="GetLastTitle({bbs.forum.forumID})"></bbs:run></p>
                    <div class="topicbackwriter"><bbs:run class="ForumUtils" get="GetLastUserNameAndTime({bbs.forum.forumID})"></bbs:run></div></td>
                </tr>
              </bbs:forums>
            </table>
          </bbs:failureTemplate>
        </bbs:if>
      </div>
    </div>
  </bbs:forums>
  <div class="zxyh">
    <div class="bm_h"> <span class="l_action"><a href="online.aspx">更多</a>>></span>
      <h3><strong><a href="online.aspx">在线用户</a></strong> <em><asp:Literal ID="ltlUserAnalysis" runat="server"></asp:Literal></em></h3>
    </div>
    <dl id="onlinelist">
      <dt><img src="images/user_administrator.gif"/> 管理员<img src="images/user_supermoderator.gif"/> 总版主<img src="images/user_moderator.gif"/> 论坛版主<img src="images/user_normal.gif"/> 普通会员</dt>
      <dd class="dash_line"></dd>
      <dd>
        <ul class="userlist cl">
        	<asp:Literal ID="ltlUserList" runat="server"></asp:Literal>
        </ul>
      </dd>
    </dl>
  </div>
  <div class="bm cl">
    <div class="bm_h">
      <h3><strong><a href="thread.aspx">友情链接</a></strong></h3>
    </div>
    <div class="link_list">
      <div class="link_img">
      <bbs:sqlContents predefined="LinkIcon">
      	<a href="{bbs.sql.linkUrl}" target="_blank" title="{bbs.sql.linkName}"><img src="{bbs.sql.iconUrl}" /></a>
      </bbs:sqlContents>
     </div>
      <ul>
      <bbs:sqlContents predefined="LinkText">
      	<li><a href="{bbs.sql.linkUrl}" target="_blank">{bbs.sql.linkName}</a></li>
      </bbs:sqlContents>
      </ul>
    </div>
  </div>
</div>
<bbs:include file="include/footer.html"></bbs:include>
<bbs:include file="include/dialog.html"></bbs:include>
</body>
</html>
