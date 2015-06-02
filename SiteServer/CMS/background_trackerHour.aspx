<%@ Page Language="C#" Inherits="SiteServer.CMS.BackgroundPages.BackgroundTrackerHour" %>

<%@ Register TagPrefix="bairong" Namespace="BaiRong.Controls" Assembly="BaiRong.Controls" %>

<%@ Register TagPrefix="site" Namespace="SiteServer.CMS.Controls" Assembly="SiteServer.CMS" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!--#include file="../inc/header.aspx"-->
</head>

<body>
    <!--#include file="../inc/openWindow.html"-->
    <form class="form-inline" runat="server">
        <asp:Literal ID="ltlBreadCrumb" runat="server" />
        <bairong:Alerts runat="server" />

        <div class="popover popover-static">
            <h3 class="popover-title">访问量24小时分配图表</h3>
            <div class="popover-content">

                <table cellpadding="2" border="0">
                    <tbody>
                        <tr>
                            <td>单位（访问量）</td>
                        </tr>
                        <tr>
                            <td align="bottom">
                                <table align="center">
                                    <tbody>
                                        <tr valign="bottom">
                                            <td valign="top" style="vertical-align: top;">
                                                <table height="200" cellspacing="0" cellpadding="0" align="center"
                                                    border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetAccessNum(8)%></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetAccessNum(7)%></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetAccessNum(6)%></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetAccessNum(5)%></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetAccessNum(4)%></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetAccessNum(3)%></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetAccessNum(2)%></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetAccessNum(1)%></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(1)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(2)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(3)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(4)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(5)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(6)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(7)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(8)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(9)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(10)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(11)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(12)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(13)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(14)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(15)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(16)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(17)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(18)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(19)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(20)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(21)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(22)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(23)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetGraphicHtml(24)%></td>
                                            <td>单位（点）</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>

        <div class="popover popover-static">
            <h3 class="popover-title">访客24小时分配图表</h3>
            <div class="popover-content">

                <table cellpadding="2" border="0">
                    <tbody>
                        <tr>
                            <td>单位（人）</td>
                        </tr>
                        <tr>
                            <td align="bottom">
                                <table align="center">
                                    <tbody>
                                        <tr valign="bottom">
                                            <td valign="top" style="vertical-align: top;">
                                                <table height="200" cellspacing="0" cellpadding="0" align="center"
                                                    border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetUniqueAccessNum(8)%></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetUniqueAccessNum(7)%></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetUniqueAccessNum(6)%></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetUniqueAccessNum(5)%></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetUniqueAccessNum(4)%></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetUniqueAccessNum(3)%></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetUniqueAccessNum(2)%></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" nowrap height="25"><%=GetUniqueAccessNum(1)%></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(1)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(2)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(3)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(4)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(5)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(6)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(7)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(8)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(9)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(10)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(11)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(12)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(13)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(14)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(15)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(16)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(17)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(18)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(19)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(20)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(21)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(22)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(23)%></td>
                                            <td nowrap align="bottom" width="20" style="vertical-align: bottom;"
                                                background="../pic/tracker_background.gif" height="216"><%=GetUniqueGraphicHtml(24)%></td>
                                            <td>单位（点）</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>

        <ul class="breadcrumb breadcrumb-button">
            <asp:Button class="btn" ID="ExportTracking" runat="server" Text="导出Excel"></asp:Button>
        </ul>

    </form>
</body>
</html>
<!-- check for 3.6 html permissions -->
