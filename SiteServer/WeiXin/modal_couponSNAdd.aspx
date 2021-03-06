<%@ Page Language="C#" ValidateRequest="false" Inherits="SiteServer.WeiXin.BackgroundPages.Modal.CouponSNAdd" Trace="false" %>

<%@ Register TagPrefix="bairong" Namespace="BaiRong.Controls" Assembly="BaiRong.Controls" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!--#include file="../inc/header.aspx"-->
</head>

<body>
    <!--#include file="../inc/openWindow.html"-->
    <form class="form-inline" runat="server">
        <asp:Button ID="btnSubmit" UseSubmitBehavior="false" OnClick="Submit_OnClick" runat="server" Style="display: none" />
        <bairong:Alerts runat="server"></bairong:Alerts>

        <link href="css/emotion.css" rel="stylesheet">

        <table class="table table-noborder">
            <tr>
                <td width="120">优惠劵数量：</td>
                <td>
                    <asp:TextBox ID="tbTotalNum" class="input-mini" runat="server" />
                    <asp:RegularExpressionValidator
                        ControlToValidate="tbTotalNum"
                        ValidationExpression="\d+"
                        Display="Dynamic"
                        ForeColor="red"
                        ErrorMessage="必须为数字"
                        runat="server" />
                    <span>小于1000</span>
                </td>
            </tr>
            <tr style="display: none;">
                <td width="120">选择上传文件：</td>
                <td>
                    <input type="file" id="hifUpload" size="45" runat="server" />
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
<!-- check for 3.6 html permissions -->
