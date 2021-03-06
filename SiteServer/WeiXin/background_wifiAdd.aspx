﻿<%@ Page Language="C#" Inherits="SiteServer.WeiXin.BackgroundPages.BackgroundWifiAdd" %>

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
        <asp:Literal ID="ltlBreadCrumb" runat="server" />
        <bairong:Alerts runat="server" />

        <style type="text/css">
            div.step {
                font-weight: bold;
                font-size: 16px;
                margin-bottom: 10px;
            }

            span.activate_title {
                line-height: 34px;
                font-size: 16px;
                color: #333;
            }

            p.activate_desc {
                width: 100%;
                margin-left: 32px;
                font-size: 13px;
                font-weight: bold;
            }

            div.step_one, div.step_two, div.step_three {
                display: inline-block;
                margin-left: 30px;
                width: 280px;
                height: 190px;
                background: transparent url("images/weixin-activate.png") no-repeat;
            }

            div.step_two, div.step_three {
                margin-top: 20px;
            }

            div.step_one {
                background-position: -40px -48px;
            }

            div.step_two {
                background-position: -395px -48px;
            }

            div.step_three {
                background-position: -760px -48px;
            }
        </style>

        <bairong:Code Type="ajaxupload" runat="server" />
        <script type="text/javascript" src="../../sitefiles/bairong/scripts/swfUpload/swfupload.js"></script>
        <script type="text/javascript" src="../../sitefiles/bairong/scripts/swfUpload/handlers.js"></script>
        <div class="popover popover-static operation-area">
            <h3 class="popover-title">
                <asp:Literal ID="ltlPageTitle" runat="server" />
            </h3>
            <div class="popover-content">
                <div class="container-fluid" id="weixinactivate">
                    <asp:PlaceHolder ID="phStep1" runat="server">
                        <div class="row-fluid">
                            <div class="span6">
                                <div class="step">配置商家的基本属性信息</div>
                                <table class="table noborder table-hover">
                                    <tr>
                                        <td width="120">主题：</td>
                                        <td>
                                            <asp:TextBox class="input-xlarge" ID="tbTitle" runat="server" />
                                            <asp:RequiredFieldValidator
                                                ControlToValidate="tbTitle"
                                                ErrorMessage=" *" ForeColor="red"
                                                Display="Dynamic"
                                                runat="server" />
                                            <asp:RegularExpressionValidator
                                                runat="server"
                                                ControlToValidate="tbTitle"
                                                ValidationExpression="[^']+"
                                                ErrorMessage=" *" ForeColor="red"
                                                Display="Dynamic" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>摘要：</td>
                                        <td>
                                            <asp:TextBox ID="tbSummary" TextMode="Multiline" class="textarea" Rows="4" Style="width: 95%; padding: 5px;" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>商家状态：</td>
                                        <td class="checkbox">
                                            <asp:CheckBox ID="cbIsEnabled" runat="server" Checked="true" Text="启用商家信息" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>触发关键词：</td>
                                        <td>
                                            <asp:TextBox ID="tbKeywords" runat="server" />
                                            <asp:RegularExpressionValidator
                                                runat="server"
                                                ControlToValidate="tbKeywords"
                                                ValidationExpression="[^']+"
                                                ErrorMessage=" *" ForeColor="red"
                                                Display="Dynamic" />
                                            <br />
                                            <span class="gray">多个关键词请用空格格开：例如: 微信 腾讯 阁下</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>联系方式：</td>
                                        <td>
                                            <asp:TextBox class="input-xlarge" ID="tbContactAddress" runat="server" />
                                            <br />
                                            <span class="gray">用户加入网络可查看联系方式咨询.</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>联系QQ：</td>
                                        <td>
                                            <asp:TextBox class="input-xlarge" ID="tbContactQQ" runat="server" />
                                            <br />
                                            <span class="gray">用户加入网络可查看联系QQ咨询如何上网.</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>上网密码：</td>
                                        <td>
                                            <asp:TextBox class="input-xlarge" ID="tbPassword" runat="server" MaxLength="6" />
                                            <br />
                                            <span class="gray">非移动设备上网时的密码.(留空代表不修改密码,限制位数6位)</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>商家简介：</td>
                                        <td>
                                            <asp:TextBox ID="tbIntroduction" TextMode="Multiline" class="textarea" Rows="4" Style="width: 95%; padding: 5px;" runat="server" />
                                            <br />
                                            <span class="gray">用户加入网络可查看联系方式咨询.</span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="span6">
                                <div class="intro-grid">
                                    <p><strong>商家消息中显示图片：</strong></p>
                                    <asp:Literal ID="ltlImageUrl" runat="server" />
                                    <a id="js_imageUrl" href="javascript:;" onclick="return false;" class="btn btn-success">上传</a>
                                </div>
                            </div>

                        </div>

                        <script type="text/javascript">
                            new AjaxUpload('js_imageUrl', {
                                action: '<%=GetUploadUrl()%>',
                                name: "Upload",
                                data: {},
                                onSubmit: function (file, ext) {
                                    var reg = /^(jpg|jpeg|png|gif)$/i;
                                    if (ext && reg.test(ext)) {
                                        //$('#img_upload_txt_').text('上传中... ');
                                    } else {
                                        //$('#img_upload_txt_').text('只允许上传JPG,PNG,GIF图片');
                                        alert('只允许上传JPG,PNG,GIF图片');
                                        return false;
                                    }
                                },
                                onComplete: function (file, response) {
                                    if (response) {
                                        response = eval("(" + response + ")");
                                        if (response.success == 'true') {
                                            $('#preview_imageUrl').attr('src', response.url);
                                            $('#imageUrl').val(response.virtualUrl);
                                        } else {
                                            alert(response.message);
                                        }
                                    }
                                }
                            });
                        </script>
                    </asp:PlaceHolder>
                </div>
                <input id="imageUrl" name="imageUrl" type="hidden" runat="server" />
                <hr />
                <table class="table table-noborder">
                    <tr>
                        <td class="center">
                            <asp:Button class="btn btn-primary" ID="btnSubmit" Text="确定" OnClick="Submit_OnClick" runat="server" />
                        </td>
                    </tr>
                </table>

            </div>
        </div>

    </form>
</body>
</html>
