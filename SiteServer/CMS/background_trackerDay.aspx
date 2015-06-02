<%@ Page Language="C#" Inherits="SiteServer.CMS.BackgroundPages.BackgroundTrackerDay" %>

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
  <asp:Literal id="ltlBreadCrumb" runat="server" />
  <bairong:alerts runat="server" />

  <div class="popover popover-static">
    <h3 class="popover-title">访问量最近30日分配图表</h3>
    <div class="popover-content">
    
      <TABLE cellPadding=2 border=0>
        <TBODY>
          <TR>
            <TD>单位（访问量）</TD>
          </TR>
          <TR>
            <TD align=bottom><TABLE align=center>
                <TBODY>
                  <TR vAlign=bottom>
                    <TD vAlign=top style="vertical-align: top;"><TABLE height=200 cellSpacing=0 cellPadding=0 align=center 
                    border=0>
                        <TBODY>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetAccessNum(8)%></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetAccessNum(7)%></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetAccessNum(6)%></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetAccessNum(5)%></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetAccessNum(4)%></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetAccessNum(3)%></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetAccessNum(2)%></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetAccessNum(1)%></TD>
                          </TR>
                        </TBODY>
                      </TABLE></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(1)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(2)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(3)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(4)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(5)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(6)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(7)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(8)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(9)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(10)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(11)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(12)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(13)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(14)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(15)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(16)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(17)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(18)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(19)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(20)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(21)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(22)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(23)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(24)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(25)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(26)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(27)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(28)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(29)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetGraphicHtml(30)%></TD>
                    <TD>单位（日）</TD>
                  </TR>
                </TBODY>
              </TABLE></TD>
          </TR>
        </TBODY>
      </TABLE>
  
    </div>
  </div>

  <div class="popover popover-static">
    <h3 class="popover-title">访客最近30日分配图表</h3>
    <div class="popover-content">
    
      <TABLE cellPadding=2 border=0>
        <TBODY>
          <TR>
            <TD>单位（人）</TD>
          </TR>
          <TR>
            <TD align=bottom><TABLE align=center>
                <TBODY>
                  <TR vAlign=bottom>
                    <TD vAlign=top style="vertical-align: top;"><TABLE height=200 cellSpacing=0 cellPadding=0 align=center 
                    border=0>
                        <TBODY>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetUniqueAccessNum(8)%></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetUniqueAccessNum(7)%></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetUniqueAccessNum(6)%></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetUniqueAccessNum(5)%></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetUniqueAccessNum(4)%></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetUniqueAccessNum(3)%></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetUniqueAccessNum(2)%></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top noWrap height=25><%=GetUniqueAccessNum(1)%></TD>
                          </TR>
                        </TBODY>
                      </TABLE></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(1)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(2)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(3)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(4)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(5)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(6)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(7)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(8)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(9)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(10)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(11)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(12)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(13)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(14)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(15)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(16)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(17)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(18)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(19)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(20)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(21)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(22)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(23)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(24)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(25)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(26)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(27)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(28)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(29)%></TD>
                    <TD noWrap align=bottom width=16 style="vertical-align: bottom;" 
                  background=../pic/tracker_background.gif height=216><%=GetUniqueGraphicHtml(30)%></TD>
                    <TD>单位（日）</TD>
                  </TR>
                </TBODY>
              </TABLE></TD>
          </TR>
        </TBODY>
      </TABLE>
  
    </div>
  </div>

  <ul class="breadcrumb breadcrumb-button">
    <asp:Button class="btn" ID="ExportTracking" runat="server" Text="导出Excel"></asp:Button>
  </ul>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->