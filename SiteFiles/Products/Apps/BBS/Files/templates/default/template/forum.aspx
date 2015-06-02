<%@ Page language="c#" Inherits="SiteServer.BBS.Pages.ForumPage" EnableViewState="false" %>
<%@ Import namespace="SiteServer.BBS.Core" %>
<%@ Import namespace="SiteServer.BBS.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><bbs:forum type="title"></bbs:forum> - {bbs.BBSName}</title><bbs:forum type="MetaKeywords"></bbs:forum><bbs:forum type="MetaDescription"></bbs:forum>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<link href="../css/share.css" rel="stylesheet" type="text/css">
<link href="../css/theme.css" rel="stylesheet" type="text/css">
<bbs:include file="include/css_js.html"></bbs:include>
<link href="../js/jquery_select/selectStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery_select/jquery.select-1.3.6.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("select").sSelect();
		$('#posting1').hover(function(){
		$("#menu_post1").fadeIn(400);
	},function(){
		$("#menu_post1").hide();
	});
		$("#menu_post1").hover(function(){
		$("#menu_post1").show();
	},function(){
		$("#menu_post1").hide();
	});
	$('#posting2').hover(function(){
		$("#menu_post2").fadeIn(400);
	},function(){
		$("#menu_post2").hide();
	});
	$("#menu_post2").hover(function(){
		$("#menu_post2").show();
	},function(){
		$("#menu_post2").hide();
	});
});
function changeTarget(newWin){
	if (newWin){$('.new a').attr('target', '_blank');}else{$('.new a').attr('target', '_self');}
}
</script>
<bbs:run class="UserUtils" if="!IsAnonymous">
<script type="text/javascript" src="{bbs.bbsUrl}/editor/kindeditor-min.js"></script>
<script type="text/javascript" src="{bbs.bbsUrl}/js/editor.js"></script>
<script>
function gotoAdvancedUrl() {
    Storage.save('title', $('#title', $('#contentForm')).val());
    Storage.save('content', $('#content', $('#contentForm')).val());
    location.href = '{bbs.forum.addPostUrl}';
}
KE.show({
    id : 'content',
    imageUploadJson : '{bbs.editUploadUrl}',
    allowFileManager : false,
    items : ['fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline', 'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', '|', 'emoticons', 'image', 'media', 'link', '|', 'ubb_code', 'ubb_hide'],
    afterCreate : function(id) {
        KE.event.ctrl(document, 13, function() {
            KE.util.setData(id);
            onAddThreadSubmit(document.forms['contentForm']);
        });
        KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
            KE.util.setData(id);
            onAddThreadSubmit(document.forms['contentForm']);
        });
    }
 });
</script>
</bbs:run>
</head>
<body>
<bbs:include file="include/header.html"></bbs:include>
<div class="hd">
        <div id="ad_navbanner" class="adv_area"></div>
      </div>
<div class="hd">
        <div class="share_position">
    <bbs:include file="include/shareRight.html"></bbs:include>
    <div class="share_p"><img src="../images/ico_position.gif" />
            <bbs:location separator="&gt;"></bbs:location>
          </div>
  </div>
        <!--子版块开始-->
        <bbs:if testType="ChildrenCount" testOperate="GreatThan" testValue="0">
    <div class="share_area sha_bot_line" style="margin-bottom:10px;">
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
              <div class="fl_icn_g">
                <bbs:a>
                  <bbs:run class="ForumUtils" if="IsNewThread({bbs.forum.forumID})">
                    <bbs:successTemplate><img src="../images/forum_new.gif" /></bbs:successTemplate>
                    <bbs:failureTemplate><img src="../images/forum.gif" /></bbs:failureTemplate>
                  </bbs:run>
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
                  <td width="68%" class="fl_g"><div class="fl_icn_g">
                      <bbs:a>
                        <bbs:run class="ForumUtils" if="IsNewThread({bbs.forum.forumID})">
                          <bbs:successTemplate><img src="../images/forum_new.gif" /></bbs:successTemplate>
                          <bbs:failureTemplate><img src="../images/forum.gif" /></bbs:failureTemplate>
                        </bbs:run>
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
  </bbs:if>
        <!--子版块结束-->
        <bbs:if testType="ParentsCount" testOperate="NotEquals" testValue="1">
    <div class="main thread">
            <div class="explan_thr"> 
        <!--<p class="y">
        版主: <span class="f_c">
        <a href="post.aspx">admin</a></span>      </p>-->
        <div class="y thread_right">
                <div> <!--<img src="../images/favour.gif" /><a href="#" class="favour">收藏</a> --><img src="../images/forumdigest.gif" /><a href="../rss.aspx?forumID={bbs.forum.forumID}" target="_blank" class="digest">订阅</a> <img src="../images/icon_feed.gif" /><a href="../my/permission.aspx?forumID={bbs.forum.forumID}" class="feed">权限</a> </div>
                <div>版主：<span class="moderator">
                  <bbs:forum type="moderators" separator=""></bbs:forum>
                  </span></div>
              </div>
        <div class="y thread_left">
                <h1>
            <bbs:forum type="title"></bbs:forum>
          </h1>
                <span class="left">今日: <strong class="xi1">
                <bbs:run get="this.forumInfo.TodayPostCount + this.forumInfo.TodayThreadCount"></bbs:run>
                </strong><span class="pipe">|</span>主题: <strong class="xi1">
                <bbs:run get="this.forumInfo.TodayThreadCount"></bbs:run>
                </strong><span class="pipe">|</span>帖子: <strong class="xi1">
                <bbs:run get="this.forumInfo.TodayPostCount"></bbs:run>
                </strong></span>
                <p>
         
          </p>
              </div>
        <div class="thread_line"></div>
        <div class="explan_font"> <span class="y"><img id="arrow_summary" onClick="$('#summary').toggle();" style="cursor:pointer" src="../images/arrow_u.gif" border="0" /></span>
                <div id="summary">
            <bbs:forum type="Content"></bbs:forum>
          </div>
                <br />
              </div>
      </div>
            <div class="post_bar">
        <div class="post_function"><span class="posting" id="posting1"><a href="{bbs.forum.addPostUrl}">发 帖</a></span></div>
        <bbs:include file="include/pager.html"></bbs:include>
      </div>
            <div class="menuPost" id="menu_post1">
        <ul>
                <li> <a hideFocus="true" href="{bbs.forum.addPostUrl}">新 帖</a> </li>
                <li> <a hideFocus="true" href="{bbs.forum.addPollUrl}">投 票</a> </li>
              </ul>
      </div>
            <div class="nav_thread">
        <ul>
                <asp:Literal ID="ltlCategories" runat="server"></asp:Literal>
              </ul>
        <div class="nav_rig_info"><a href="?type=digest">精华</a> | <a href="?type=image">图片贴</a>&nbsp;&nbsp;
                <input name="" type="checkbox" value="" onclick="changeTarget(this.checked);"/>
                <span class="nav_rig_font">新窗口中打开</span></div>
      </div>
            <div class="th">
        <table cellspacing="0" cellpadding="0" class="th">
                <tr>
            <td width="66%"><div class="tf"> 排序:
                <bbs:run if="base.orderBy == 'addDate'">
                  <bbs:successTemplate><a href="?orderBy=lastDate" class="showmenu" >最后回复</a> <a href="?orderBy=addDate" class="xi4">最新发帖</a> </bbs:successTemplate>
                  <bbs:failureTemplate><a href="?orderBy=lastDate" class="xi4" >最后回复</a> <a href="?orderBy=addDate" class="showmenu">最新发帖</a> </bbs:failureTemplate>
                </bbs:run>
                <span class="pipe">|</span>类型: <a href="#" class="xi4">全部主题</a> <a href="#" class="showmenu">投票</a></div></td>
            <td width="14%" class="by">&nbsp;&nbsp;&nbsp;作者</td>
            <td width="6%" class="num">&nbsp;回复</td>
            <td width="14%" class="by">&nbsp;最后发表</td>
          </tr>
              </table>
      </div>
            <div class="thread_out" style="border:1px solid #dadada;padding:10px; background:url(../images/info_table_bg.gif) repeat-x left top;">
        <table border="0" class="info_table">
                <bbs:run if="base.pageNum <= 1">
            <asp:repeater ID="rptTopThreads" runat="server">
                    <itemtemplate>
                <tr>
                        <td class="folder"><bbs:run if="base.isModerator">
                        <%if (base.topForumID==0)
                          { %>
                            <input type="checkbox" autocomplete="off" name="threadIDArray" id="threadID_{bbs.item.id}" value="{bbs.item.id}" onclick="threadManager.show('threadManagerPop','title_{bbs.item.id}')"  />
                           <%  }%>
                           <%else
                          { %>
                           <input type="checkbox" autocomplete="off" name="threadIDArray" id="Checkbox1" value="{bbs.item.id}" onclick="threadManager.show('threadManagerPop','title_{bbs.item.id}')"  disabled="disabled" style="display:none"  />
                           
                           <% }%>
                            &nbsp; </bbs:run>
                    <asp:Literal ID="ltlIcon" runat="server"></asp:Literal></td>
                        <th class="new" id="title_{bbs.item.id}"> <asp:Literal ID="ltlTitle" runat="server"></asp:Literal><span class="tpages">&nbsp;<asp:Literal ID="ltlPages" runat="server"></asp:Literal></span></th>
                        <td width="14%" class="by"><em>
                          <asp:HyperLink ID="hlUserName" runat="server"></asp:HyperLink>
                          </em>
                    <div class="thread_number">
                            <asp:Literal ID="ltlAddDate" runat="server"></asp:Literal>
                          </div></td>
                        <td width="6%" class="num"><asp:HyperLink ID="hlReplies" CssClass="xg3" runat="server"></asp:HyperLink>
                    <div class="thread_number"> {bbs.item.hits} </div></td>
                        <td width="14%" class="by"><em>
                          <asp:HyperLink ID="hlLastUserName" runat="server"></asp:HyperLink>
                          </em>
                    <div class="thread_number">
                            <asp:Literal ID="ltlLastDate" runat="server"></asp:Literal>
                          </div></td>
                      </tr>
              </itemtemplate>
                  </asp:repeater>
            <tr class="ts">
                    <td> </td>
                    <th>普通主题</th>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                  </tr>
          </bbs:run>
                <asp:repeater ID="rptThreads" runat="server">
            <itemtemplate>
                    <tr>
                <td class="folder"><bbs:run if="base.isModerator">
                    <input type="checkbox" autocomplete="off" name="threadIDArray" id="threadID_{bbs.item.id}" value="{bbs.item.id}" onclick="threadManager.show('threadManagerPop','title_{bbs.item.id}')" />
                    &nbsp; </bbs:run>
                        <asp:Literal ID="ltlIcon" runat="server"></asp:Literal></td>
                <th class="new" id="title_{bbs.item.id}"> <asp:Literal ID="ltlTitle" runat="server"></asp:Literal><span class="tpages">&nbsp;<asp:Literal ID="ltlPages" runat="server"></asp:Literal></span></th>
                <td width="14%" class="by"><em>
                  <asp:HyperLink ID="hlUserName" runat="server"></asp:HyperLink>
                  </em>
                        <div class="thread_number">
                    <asp:Literal ID="ltlAddDate" runat="server"></asp:Literal>
                  </div></td>
                <td width="6%" class="num"><asp:HyperLink ID="hlReplies" CssClass="xg3" runat="server"></asp:HyperLink>
                        <div class="thread_number"> {bbs.item.hits} </div></td>
                <td width="14%" class="by"><em>
                  <asp:HyperLink ID="hlLastUserName" runat="server"></asp:HyperLink>
                  </em>
                        <div class="thread_number">
                    <asp:Literal ID="ltlLastDate" runat="server"></asp:Literal>
                  </div></td>
              </tr>
                  </itemtemplate>
          </asp:repeater>
                <bbs:run if="base.isModerator">
            <tr class="ts">
                    <td> </td>
                    <th>管理主题</th>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                  </tr>
            <tr>
                    <td class="folder" style="width:50px;"><label for="pw_sel_all" class="fl mr5">
                        <input name="chkall" id="pw_sel_all" autocomplete="off" type="checkbox" onclick="threadManager.checkall(this)" />
                        &nbsp;全选</label></td>
                    <td colspan="4"><P> <strong><a onclick="{bbs.dialog.deleteThread}" class="xg3" href="javascript:;">删除</a></strong> <span class="pipe">|</span><strong><a onclick="{bbs.dialog.translate}" class="xg3" href="javascript:;">移动</a></strong> <span class="pipe">|</span><strong><a onclick="{bbs.dialog.category}" class="xg3" href="javascript:;">分类</a></strong> <span class="pipe">|</span> <a onclick="{bbs.dialog.highlight.top}" class="xi1" href="javascript:;">置顶</a> <span class="pipe">|</span> <a onclick="{bbs.dialog.highlight.digest}" class="xi1" href="javascript:;">精华</a> <span class="pipe">|</span> <a onclick="{bbs.dialog.highlight.highlight}" class="xi1" href="javascript:;">高亮</a> <span class="pipe">|</span> <a onclick="{bbs.dialog.upDownThread}" class="xg3" href="javascript:;">提升/下沉</a> <span class="pipe">|</span> <a onclick"{bbs.dialog.close}" class="xg3" href="javascript:;">锁定/关闭</a> </P></td>
                  </tr>
          </bbs:run>
              </table>
      </div>
            <div class="post_bar">
        <div class="post_function"><span class="posting" id="posting2"><a href="{bbs.forum.addPostUrl}">发 帖</a></span></div>
        <bbs:include file="include/pager.html"></bbs:include>
      </div>
            <div class="menuPost" id="menu_post2">
        <ul>
                <li> <a hideFocus="true" href="{bbs.forum.addPostUrl}">新 帖</a> </li>
                <li> <a hideFocus="true" href="{bbs.forum.addPollUrl}">投 票</a> </li>
              </ul>
      </div>
            <!--发表主题开始-->
            <bbs:run class="UserUtils" if="!IsAnonymous">
        <form id="contentForm" onSubmit="onAddThreadSubmit(this);return false;" action="{bbs.formUrl}addThread" method="post">
                <input id="forumID" name="forumID" type="hidden" value="{bbs.forum.forumID}" />
                <input id="isSignature" name="isSignature" type="hidden" value="true" />
                <table cellspacing="0" cellpadding="0" class="last_table">
            <tr>
                    <td valign="top" class="post_left"><h3>快速发表主题</h3>
                <div class="avatar"><a href="<%=UserUtils.GetUserUrl(UserUtils.UserName)%>" target="_blank"><img src="<%=UserUtils.GetUserAvatarMiddleUrl(UserUtils.UserName)%>" width="120" height="120" /></a></div>
                <div class="use_photo">
                        <ul>
                    <li>级别： <%=UserUtils.GetGroupName(UserUtils.UserName)%> </li>
                    <li id="stars"> <%=UserUtils.GetStars(UserUtils.UserName)%> </li>
                  </ul>
                      </div></td>
                    <td valign="top" style="padding:5px;"><div class="posting_function">
                        <div style="padding:5px;"> <%=GetCategorySelectHtml()%>
                        <input id="title" name="title" type="text" class="txtTitle" />
                        <span class="share_right">&nbsp;<a href="javascript:;" onclick="gotoAdvancedUrl();return false;">高级模式</a></span> </div>
                        <div style="padding:5px;">
                        <textarea id="content" name="content" cols="100" rows="8" style="width:485px;height:170px;visibility:hidden;"></textarea>
                      </div>
                      <bbs:run if="UserUtils.IsVerifyCodeThread">
                <div style="padding-left:5px;"> 验证码：
                  <input id="verifyCode" name="verifyCode" type="text" class="txtTitle" maxlength="4" style="width:50px;" />
                  <img src="<%=UserUtils.PostVerifyCodeImageUrl%>"/> </div>
              </bbs:run>
                        <input type="submit" value="提交" class="submit_btn"/>
                      </div>
                <div id="face_right" class="face_right">
                        <div id="tabs" class="face_tit">
                    <ul>
                            <bbs:value type="FaceLinks"></bbs:value>
                          </ul>
                  </div>
                        <div id="tab-contents">
                    <bbs:value type="FaceDefaultContents"></bbs:value>
                  </div>
                      </div></td>
                  </tr>
          </table>
              </form>
      </bbs:run>
            <!--发表主题结束--> 
          </div>
  </bbs:if>
      </div>
<bbs:include file="include/footer.html"></bbs:include>
<bbs:include file="include/dialog.html"></bbs:include>
<bbs:run if="base.isModerator"> 
        <script type="text/javascript">
	$("td.folder").css({width:'50px'});
  </script>
        <bbs:include file="include/threadManager.html"></bbs:include>
      </bbs:run>
</body>
</html>
<script runat="server">
protected override void OnLoad(EventArgs e)
{
	base.forumID = {bbs.forum.forumID};
	base.OnLoad(e);
}
</script>