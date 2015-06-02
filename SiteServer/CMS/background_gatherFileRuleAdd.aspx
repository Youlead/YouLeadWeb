<%@ Page Language="C#" validateRequest="false" Inherits="SiteServer.CMS.BackgroundPages.BackgroundGatherFileRuleAdd" %>

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

  <script language="JavaScript" type="text/JavaScript">
  function AddOnPos(obj, charvalue)
  {
      //obj代表要插入字符的输入框
      //value代表要插入的字符
      
      obj.focus();
      var r = document.selection.createRange();
      var ctr = obj.createTextRange();
      var i;
      var s = obj.value;
      
      //注释掉的这种方法只能用在单行的输入框input内
      //对多行输入框textarea无效
      //r.setEndPoint("StartToStart", ctr);
      //i = r.text.length;
      //取到光标位置----Start----
      var ivalue = "&^asdjfls2FFFF325%$^&"; 
      r.text = ivalue;
      i = obj.value.indexOf(ivalue);
      r.moveStart("character", -ivalue.length);
      r.text = "";
      //取到光标位置----End----
      //插入字符
      obj.value = s.substr(0,i) + charvalue + s.substr(i,s.length);
      ctr.collapse(true);
      ctr.moveStart("character", i + charvalue.length);
      ctr.select();
  }
  </script>

  <div class="popover popover-static">
    <h3 class="popover-title"><asp:Literal id="ltlPageTitle" runat="server" /></h3>
    <div class="popover-content">

      <asp:PlaceHolder id="GatherRuleBase" runat="server" Visible="false">
        <table class="table noborder table-hover">
          <tr>
            <td width="170">采集规则名称：</td>
            <td>
              <asp:TextBox Columns="25" MaxLength="50" id="GatherRuleName" runat="server"/>
            </td>
          </tr>
          <tr>
            <td>采集页面地址：</td>
            <td>
              <asp:TextBox Columns="50" id="GatherUrl" runat="server"/>
            </td>
          </tr>
          <tr>
            <td>网页编码：</td>
            <td>
              <asp:DropDownList id="Charset" runat="server"></asp:DropDownList>
            </td>
          </tr>
          <tr>
            <td>采集目的地：</td>
            <td>
              <asp:DropDownList ID="IsToFile" AutoPostBack="true" OnSelectedIndexChanged="DropDownList_SelectedIndexChanged" runat="server">
                <asp:ListItem Value="True" Selected="true">采集到文件</asp:ListItem>
                <asp:ListItem Value="False">采集到内容</asp:ListItem>
              </asp:DropDownList>
            </td>
          </tr>
          <asp:PlaceHolder ID="PlaceHolder_File" runat="server">
          <tr>
            <td>采集到文件地址：</td>
            <td>
              <asp:TextBox Columns="50" id="FilePath" runat="server"/>
              <br>
              <span>以“~/”开头代表系统根目录，以“@/”开头代表站点根目录</span>
            </td>
          </tr>
          <tr>
            <td>删除JS脚本：</td>
            <td>
              <asp:RadioButtonList id="IsRemoveScripts" RepeatDirection="Horizontal" class="noborder" runat="server">
                <asp:ListItem Value="True">是</asp:ListItem>
                <asp:ListItem Value="False" Selected="true">否</asp:ListItem>
              </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td>下载相关文件：</td>
            <td>
              <asp:RadioButtonList id="IsSaveRelatedFiles" AutoPostBack="true" OnSelectedIndexChanged="DropDownList_SelectedIndexChanged" RepeatDirection="Horizontal" class="radiobuttonlist" runat="server">
                <asp:ListItem Value="True">是</asp:ListItem>
                <asp:ListItem Value="False" Selected="true">否</asp:ListItem>
              </asp:RadioButtonList>
              <span>下载采集网址的相关文件（图片、CSS等）</span>
            </td>
          </tr>
          <asp:PlaceHolder ID="PlaceHolder_File_Directory" runat="server">
          <tr>
            <td>Css样式保存地址：</td>
            <td>
              <asp:TextBox Text="@/css" Columns="25" MaxLength="200" id="StyleDirectoryPath" runat="server"/>
              <br>
              <span>以“~/”开头代表系统根目录，以“@/”开头代表站点根目录</span>
            </td>
          </tr>
          <tr>
            <td>Js脚本保存地址：</td>
            <td>
              <asp:TextBox Text="@/js" Columns="25" MaxLength="200" id="ScriptDirectoryPath" runat="server"/>
              <br>
              <span>以“~/”开头代表系统根目录，以“@/”开头代表站点根目录</span>
            </td>
          </tr>
          <tr>
            <td>图片保存地址：</td>
            <td>
              <asp:TextBox Text="@/images" Columns="25" MaxLength="200" id="ImageDirectoryPath" runat="server"/>
              <br>
              <span>以“~/”开头代表系统根目录，以“@/”开头代表站点根目录</span>
            </td>
          </tr>
          </asp:PlaceHolder>
        </asp:PlaceHolder>
        <asp:PlaceHolder ID="PlaceHolder_Content" runat="server">
          <tr>
            <td>采集到栏目：</td>
            <td><asp:DropDownList ID="NodeIDDropDownList" runat="server"></asp:DropDownList></td>
          </tr>
          <tr>
            <td>下载内容图片：</td>
            <td>
              <asp:RadioButtonList id="IsSaveImage" RepeatDirection="Horizontal" class="radiobuttonlist" runat="server">
                <asp:ListItem Value="True">是</asp:ListItem>
                <asp:ListItem Value="False" Selected="true">否</asp:ListItem>
              </asp:RadioButtonList>
              <span>下载所采集内容的图片到服务器中</span>
            </td>
          </tr>
          <tr>
            <td>不经过审核：</td>
            <td>
              <asp:RadioButtonList id="IsChecked" RepeatDirection="Horizontal" class="radiobuttonlist" runat="server">
                <asp:ListItem Value="True" Selected="true">是</asp:ListItem>
                <asp:ListItem Value="False">否</asp:ListItem>
              </asp:RadioButtonList>
              <span>采集的内容是否不经过审核直接添加到栏目中</span>
            </td>
          </tr>
        </asp:PlaceHolder>
        </table>
      </asp:PlaceHolder>
      <asp:PlaceHolder id="GatherRuleContent" runat="server" Visible="false">
        <table class="table noborder table-hover">
          <tr>
            <td>内容标题开始<br>（必填）：</td>
            <td>
              <asp:TextBox Columns="30" Rows="6" TextMode="MultiLine" id="ContentTitleStart" runat="server"/>
              <a href="javascript:;" onCLICK="AddOnPos(document.getElementById('<%=ContentTitleStart.ClientID%>'), '*');" title="遇到变动字符用*代替">&nbsp;<font color="#0000FF">*</font></a><a href="javascript:;" onCLICK="AddOnPos(document.getElementById('<%=ContentTitleStart.ClientID%>'), '|');" title="多个条件用|分隔各字符串">&nbsp;<font color="#0000FF">|</font></a>
            </td>
            <td>内容标题结束<br>（必填）：</td>
            <td>
              <asp:TextBox Columns="30" Rows="6" TextMode="MultiLine" id="ContentTitleEnd" runat="server"/>
              <a href="javascript:;" onCLICK="AddOnPos(document.getElementById('<%=ContentTitleEnd.ClientID%>'), '*');" title="遇到变动字符用*代替">&nbsp;<font color="#0000FF">*</font></a><a href="javascript:;" onCLICK="AddOnPos(document.getElementById('<%=ContentTitleEnd.ClientID%>'), '|');" title="多个条件用|分隔各字符串">&nbsp;<font color="#0000FF">|</font></a>
            </td>
          </tr>
          <tr>
            <td>内容正文开始<br>（必填）：</td>
            <td>
              <asp:TextBox Columns="30" Rows="6" TextMode="MultiLine" id="ContentContentStart" runat="server"/>
              <a href="javascript:;" onCLICK="AddOnPos(document.getElementById('<%=ContentContentStart.ClientID%>'), '*');" title="遇到变动字符用*代替">&nbsp;<font color="#0000FF">*</font></a><a href="javascript:;" onCLICK="AddOnPos(document.getElementById('<%=ContentContentStart.ClientID%>'), '|');" title="多个条件用|分隔各字符串">&nbsp;<font color="#0000FF">|</font></a>
            </td>
            <td>内容正文结束<br>（必填）：</td>
            <td>
              <asp:TextBox Columns="30" Rows="6" TextMode="MultiLine" id="ContentContentEnd" runat="server"/>
              <a href="javascript:;" onCLICK="AddOnPos(document.getElementById('<%=ContentContentEnd.ClientID%>'), '*');" title="遇到变动字符用*代替">&nbsp;<font color="#0000FF">*</font></a><a href="javascript:;" onCLICK="AddOnPos(document.getElementById('<%=ContentContentEnd.ClientID%>'), '|');" title="多个条件用|分隔各字符串">&nbsp;<font color="#0000FF">|</font></a>
            </td>
          </tr>
          <tr>
            <td>内容正文排除<br />（选填）：</td>
            <td colspan="3">
              <asp:TextBox Columns="60" Rows="6" TextMode="MultiLine" id="ContentExclude" runat="server"/>
              <a href="javascript:;" onCLICK="AddOnPos(document.getElementById('<%=ContentExclude.ClientID%>'), '*');" title="遇到变动字符用*代替">&nbsp;<font color="#0000FF">*</font></a><a href="javascript:;" onCLICK="AddOnPos(document.getElementById('<%=ContentExclude.ClientID%>'), '|');" title="多个条件用|分隔各字符串">&nbsp;<font color="#0000FF">|</font></a>
            </td>
          </tr>
          <tr>
            <td>清除Html标签及包含文字<br />（选填）：</td>
            <td colspan="3">
              <asp:CheckBoxList ID="ContentHtmlClearCollection" RepeatDirection="Horizontal" class="checkboxlist" runat="server" RepeatColumns="7">
                <asp:ListItem Value="script" Selected="true" Text="脚本&amp;lt;script"></asp:ListItem>
                <asp:ListItem Value="object" Selected="true" Text="对象&amp;lt;object"></asp:ListItem>
                <asp:ListItem Value="iframe" Selected="true" Text="框架&amp;lt;iframe"></asp:ListItem>
                <asp:ListItem Value="a" Text="链接&amp;lt;a"></asp:ListItem>
                <asp:ListItem Value="br" Text="换行&amp;lt;br&amp;gt;"></asp:ListItem>
                <asp:ListItem Value="table" Text="表格&amp;lt;table"></asp:ListItem>
                <asp:ListItem Value="tbody" Text="表格体&amp;lt;tbody"></asp:ListItem>
                <asp:ListItem Value="tr" Text="表格行&amp;lt;tr"></asp:ListItem>
                <asp:ListItem Value="td" Text="单元&amp;lt;td"></asp:ListItem>
                <asp:ListItem Value="font" Text="字体&amp;lt;font"></asp:ListItem>
                <asp:ListItem Value="div" Text="层&amp;lt;div"></asp:ListItem>
                <asp:ListItem Value="span" Text="SPAN&amp;lt;span"></asp:ListItem>
                <asp:ListItem Value="img" Text="图象&amp;lt;img"></asp:ListItem>
                <asp:ListItem Value="&nbsp;" Text="空格&amp;nbsp;"></asp:ListItem>
              </asp:CheckBoxList>
              <span>采集内容的正文必须清除的Html标签及包含的文字</span>
            </td>
          </tr>
          <tr>
            <td>清除Html标签<br />（选填）：</td>
            <td colspan="3">
              <asp:CheckBoxList ID="ContentHtmlClearTagCollection" RepeatDirection="Horizontal" class="noborder" runat="server" RepeatColumns="7">
                <asp:ListItem Value="a" Text="链接&amp;lt;a"></asp:ListItem>
                <asp:ListItem Value="table" Text="表格&amp;lt;table"></asp:ListItem>
                <asp:ListItem Value="tbody" Text="表格体&amp;lt;tbody"></asp:ListItem>
                <asp:ListItem Value="tr" Text="表格行&amp;lt;tr"></asp:ListItem>
                <asp:ListItem Value="td" Text="单元&amp;lt;td"></asp:ListItem>
                <asp:ListItem Value="p" Text="段落&amp;lt;p"></asp:ListItem>
                <asp:ListItem Value="font" Selected="true" Text="字体&amp;lt;font"></asp:ListItem>
                <asp:ListItem Value="div" Selected="true" Text="层&amp;lt;div"></asp:ListItem>
                <asp:ListItem Value="span" Selected="true" Text="SPAN&amp;lt;span"></asp:ListItem>
              </asp:CheckBoxList>
              <span>采集内容的正文必须清除的Html标签</span>
            </td>
          </tr>
          <tr>
            <td>其他需要采集的字段：</td>
            <td colspan="3">
              <asp:CheckBoxList ID="ContentAttributes" AutoPostBack="true" OnSelectedIndexChanged="ContentAttributes_SelectedIndexChanged" RepeatColumns="8" RepeatDirection="Horizontal" class="checkboxlist" runat="server"></asp:CheckBoxList>
            </td>
          </tr>
          <asp:Repeater ID="ContentAttributesRepeater" runat="server">
            <itemtemplate>
              <tr>
                <td><bairong:NoTagText id="HelpStart" runat="server"></bairong:NoTagText></td>
                <td><asp:TextBox Columns="30" Rows="6" TextMode="MultiLine" id="ContentStart" runat="server"/>
                <a href="javascript:;" onCLICK="AddOnPos(this.parentNode.firstChild, '*');" title="遇到变动字符用*代替">&nbsp;<font color="#0000FF">*</font></a><a href="javascript:;" onCLICK="AddOnPos(this.parentNode.firstChild, '|');" title="多个条件用|分隔各字符串">&nbsp;<font color="#0000FF">|</font></a>
                </td>
                <td><bairong:NoTagText id="HelpEnd" runat="server"></bairong:NoTagText></td>
                <td><asp:TextBox Columns="30" Rows="6" TextMode="MultiLine" id="ContentEnd" runat="server"/>
                <a href="javascript:;" onCLICK="AddOnPos(this.parentNode.firstChild, '*');" title="遇到变动字符用*代替">&nbsp;<font color="#0000FF">*</font></a><a href="javascript:;" onCLICK="AddOnPos(this.parentNode.firstChild, '|');" title="多个条件用|分隔各字符串">&nbsp;<font color="#0000FF">|</font></a>
                </td>
              </tr>
            </itemtemplate>
          </asp:Repeater>
        </table>
      </asp:PlaceHolder>
      <asp:PlaceHolder id="Done" runat="server" Visible="false">

        <blockquote>
          <p>完成!</p>
          <small>操作成功。</small>
        </blockquote>

      </asp:PlaceHolder>
      <asp:PlaceHolder id="OperatingError" runat="server" Visible="false">

        <blockquote>
          <p>发生错误</p>
          <small>执行向导过程中出错。</small>
        </blockquote>

        <div class="alert alert-error">
          <h4><asp:Label ID="ErrorLabel" runat="server"></asp:Label></h4>
        </div>

      </asp:PlaceHolder>
  
      <hr />
      <table class="table noborder">
        <tr>
          <td class="center">
            <asp:Button class="btn" ID="Previous" OnClick="PreviousPanel" runat="server" Text="< 上一步"></asp:Button>
            <asp:Button class="btn btn-primary" id="Next" onclick="NextPanel" runat="server" text="下一步 >"></asp:button>
          </td>
        </tr>
      </table>
  
    </div>
  </div>

</form>
</body>
</html>
<!-- check for 3.6 html permissions -->