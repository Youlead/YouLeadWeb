<%@ Page Language="c#" AutoEventWireup="true" Inherits="SiteServer.BBS.Pages.Dialog.Forget"
    Trace="False" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title></title>
  <script src="../js/jquery-1.4.4.min.js" type="text/javascript"></script>
  <script type="text/javascript" src="../js/jquery.form.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
      $('#a_forget').click(function () {
          var url = window.top.getDialogUrl('forget');
          return window.top.showDialog(url, 500, 620, '找回密码');
      });
    });

    function onRegisterSubmit(form) {
      $(form).ajaxSubmit({
        dataType: 'json',
        success: function (data) {
          if (data.success == 'true') {
              alert(data.successMessage);
              var url = window.top.getDialogUrl('login');
              window.top.location.href = url;
          } else {
              alert(data.errorMessage);
          }
        }
      });
    }
  </script>
  <link href="../css/share.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="share_table">
        <form id="registerForm" onsubmit="onRegisterSubmit(this);return false;" runat="server">
        <div class="flow_tab_info">
            <ul>
                <li class="left_font">用户名：</li>
                <li>
                    <asp:TextBox ID="tbUserName" class="txt" runat="server" TabIndex="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                        ControlToValidate="tbUserName"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrorMessage_UserName" runat="server" style="color:Red; font-size:11px"></asp:Label>
                </li>
            </ul>
            <asp:PlaceHolder ID="phValidateCode" runat="server">
                <ul>
                    <li class="left_font">验证码：</li>
                    <li>
                        <asp:TextBox ID="tbVerifyCode" runat="server" Style="ime-mode: disabled" class="txt"
                            MaxLength="5" TabIndex="12"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="tbVerifyCode"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblErrorMessage_VerifyCode" runat="server"  style="color:Red; font-size:11px"></asp:Label>
                    </li>
                </ul>
            </asp:PlaceHolder>
            <ul>
                <li class="left_font">&nbsp;</li>
                <li>
                    <div class="verify_text" id="verifytip">
                        输入下图中的字符，不区分大小写</div>
                </li>
            </ul>
            <ul>
                <li class="left_font">&nbsp;</li>
                <li>
                    <div class="pic" id="verifyshow">
                        <asp:Literal ID="ltlValidateCode" runat="server"></asp:Literal>
                    </div>
                </li>
            </ul>
            <br />
            <table border="0" width="500" cellspacing="2" cellpadding="2">
                <tr>
                    <td width="200" align="right">
                        <asp:Button ID="btnforget" runat="server" Text="确定" class="regi_button" OnClick="btnforget_Click" />
                    </td>
                    <td valign="middle">
                    </td>
                </tr>
            </table>
        </div>
        </form>
    </div>
</body>
</html>
