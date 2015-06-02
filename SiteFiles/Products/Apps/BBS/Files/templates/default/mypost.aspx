<%@ Page Language="C#" EnableViewState="false" Inherits="SiteServer.BBS.Pages.MyPost" %>

<%@ Import Namespace="SiteServer.BBS.Core" %>
<%@ Import Namespace="SiteServer.BBS.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>{bbs.BBSName}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <link href="css/share.css" rel="stylesheet" type="text/css" />
    <link href="css/theme.css" rel="stylesheet" type="text/css" />
    <bbs:include file="include/css_js.html"></bbs:include>
    <style type="text/css">
        .noLine td, .noLine th
        {
            border-bottom-width: 0;
        }
        .grayTxt
        {
            font-size: 14px;
            color: #666;
            line-height: 23px;
        }
    </style>
    <script language="javascript" type="text/javascript">
        function _alertCheckBoxCollection(checklist, alertString) {
            var collectionValue = _getCheckBoxCollectionValue(checklist);
            if (collectionValue.length == 0) {
                alert(alertString);
                return true;
            }
            return false;
        }
        var _goto = function (url) {
            window.location.href = url;
        };

        function _isNull(obj) {
            if (typeof (obj) == "undefined")
                return true;
            if (obj == undefined)
                return true;
            if (obj == null)
                return true;
            return false;
        }

        function _getCheckBoxCollectionValue(checklist) {
            var retval = new String("");
            if (!_isNull(checklist)) {
                if (_isNull(checklist.length)) {
                    if (checklist.checked) {
                        retval = checklist.value + '';
                    }
                } else {
                    var hasValue = false;
                    for (var i = 0; i < checklist.length; i++) {
                        if (checklist[i].checked) {
                            hasValue = true;
                            retval += checklist[i].value + ',';
                        }
                    }
                    if (hasValue) {
                        retval = retval.substring(0, retval.length - 1);
                    }
                }
            }
            return retval;
        } 
    </script>
</head>
<body>
    <bbs:include file="include/header.html"></bbs:include>
    <div class="hd">
        <div id="ad_navbanner" class="adv_area">
        </div>
    </div>
    <div class="hd">
        <div class="share_position">
            <div class="share_p">
                <img src="images/ico_position.gif" /><a href="#">论坛</a>><a href="#">我的帖子</a>
            </div>
        </div>
        <div class="main thread">
            <div class="post_bar">
                <div class="post_function">
                </div>
                <bbs:include file="include/pager.html"></bbs:include>
            </div>
            <div class="nav_thread">
                <ul>
                    <li class="thr_current">我的帖子 </li>
                </ul>
                <div class="nav_rig_info">
                </div>
            </div>
            <div class="th">
                <table cellspacing="0" cellpadding="0" class="th">
                    <tr>
                        <td align="center" style="width: 20px;">
                        </td>
                        <td>
                            &nbsp;标题(共有<span style="color: red">
                                <asp:Literal ID="ltlCount" runat="server"></asp:Literal>
                            </span>篇帖子)
                        </td>
                        <td style="width: 100px;">
                            &nbsp;板块
                        </td>
                        <td style="width: 100px;">
                            &nbsp;作者
                        </td>
                        <td style="width: 120px;" align="center">
                            &nbsp;发布时间
                        </td>
                    </tr>
                </table>
            </div>
            <div class="thread_out" style="border: 1px solid #dadada; padding: 10px; background: url(images/info_table_bg.gif) repeat-x left top;">
                <table border="0" class="info_table" style="table-layout: fixed">
                    <asp:Repeater ID="rptPosts" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td align="center" style="width: 20px;">
                                    <input type="checkbox" name="IDCollection" value='<%#DataBinder.Eval(Container.DataItem, "ThreadID")%>' />
                                </td>
                                <td style="line-height: 28px;">
                                    <asp:Literal ID="ltlTitle" runat="server"></asp:Literal>
                                    <br />
                                    <asp:Literal ID="ltlContent" runat="server"></asp:Literal>
                                </td>
                                <td style="width: 100px;">
                                    <asp:Literal ID="ltlChannel" runat="server"></asp:Literal>
                                </td>
                                <td style="width: 100px;">
                                    <asp:Literal ID="ltlUserName" runat="server"></asp:Literal>
                                </td>
                                <td style="width: 90px;">
                                    &nbsp;
                                    <asp:Literal ID="ltlAddDate" runat="server"></asp:Literal>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
            <div class="post_bar">
                <div class="post_function">
                </div>
                <bbs:include file="include/pager.html"></bbs:include>
            </div>
        </div>
    </div>
    <bbs:include file="include/footer.html"></bbs:include>
    <bbs:include file="include/dialog.html"></bbs:include>
</body>
</html>
