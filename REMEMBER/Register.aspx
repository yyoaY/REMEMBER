<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="NEWS.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>REMEMBER-注册</title>
    <style type="text/css">
        body{
            margin:0;
            padding:0;
        }
        * {
            font-family: 微软雅黑,Consolas;
            font-size: medium;
        }

        .top {
            height: 30px;
            text-align: center;
            padding: 30px;
            font-size: larger;
     background-color: darkorange;
        }

        .content {
            width: 230px;
            padding: 10px 100px;
            margin: 0px auto;
            line-height: 30px;
            overflow: visible;
        }
        .div_btn {
            margin: 20px auto;
        }

        .lbl {
            color: #808080;
        }
        .txtbx{
            overflow:visible;
            width:230px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="top">注册</div>
            <div class="content">
                <div id="p_namePwd">
                    <div class="lbl">
                        <label>用户名</label>
                    </div>
                    <div class="txtbx">
                        <asp:TextBox ID="u_name" runat="server"></asp:TextBox>
                        <asp:Label ID="u_name_tip" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                    <div class="lbl">
                        <asp:Label ID="Label3" runat="server" Text="密码"></asp:Label>
                    </div>
                    <div class="txtbx">
                        <asp:TextBox ID="u_pwd" runat="server"></asp:TextBox>
                    </div>
                    <div class="lbl">
                        <asp:Label ID="Label9" runat="server" Text="生日"></asp:Label>
                    </div>
                    <div class="txtbx">
                        <asp:DropDownList ID="ddlYear" runat="server" ></asp:DropDownList>
                        <asp:Label ID="Label11" runat="server" Text="年"></asp:Label>
                        <asp:DropDownList ID="ddlMonth" runat="server"></asp:DropDownList>
                        <asp:Label ID="Label12" runat="server" Text="月"></asp:Label>
                        <asp:DropDownList ID="ddlDay" runat="server"></asp:DropDownList>
                        <asp:Label ID="Label13" runat="server" Text="日"></asp:Label>
                    </div>
                    <div class="lbl">
                        <asp:Label ID="Label8" runat="server" Text="性别"></asp:Label>
                    </div>
                    <div class="txtbx">
                        <asp:RadioButton ID="rb_man" runat="server" GroupName="gender" Text="男" Checked="True" />
                        <asp:RadioButton ID="rb_female" runat="server" GroupName="gender" Text="女" />
                    </div>
                    <div class="lbl">
                        <asp:Label ID="Label5" runat="server" Text="邮箱"></asp:Label>
                    </div>
                    <div class="txtbx">
                        <asp:TextBox ID="mail" runat="server"></asp:TextBox>
                    </div>
                    <div class="lbl">
                        <asp:Label ID="Label6" runat="server" Text="学校"></asp:Label>
                    </div>
                    <div class="txtbx">
                        <asp:DropDownList ID="ddlSchool" runat="server"></asp:DropDownList>
                    </div>
                    <div class="lbl">
                        <asp:Label ID="Label1" runat="server" Text="专业"></asp:Label>
                    </div>
                    <div class="txtbx">
                        <asp:DropDownList ID="ddlMajor" runat="server"></asp:DropDownList>
                    </div>
                    <div class="lbl">
                        <asp:Label ID="Label4" runat="server" Text="故乡"></asp:Label>
                    </div>
                    <div class="txtbx">
                        <asp:TextBox ID="home" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="div_btn">
                    <asp:Button ID="btn_submit" runat="server" Text="提交" Width="213px" BackColor="darkorange" BorderWidth="0px" ForeColor="White" Height="30px" Font-Size="Medium" OnClick="btn_submit_Click" />
                </div>
            </div>
        </div>
    </form>

</body>
</html>
