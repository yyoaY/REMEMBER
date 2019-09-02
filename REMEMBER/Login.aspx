<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NEWS.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>REMEMBER</title>
    <style type="text/css">
        * {
            font-family: 微软雅黑,Consolas;
        }

        #code {
            font-family: Arial;
            font-style: italic;
            font-weight: bold;
            border: 0;
            letter-spacing: 2px;
            color: blue;
        }

        #txtPwd {
            margin-left: 15px;
        }

        div {
            margin-top: 18px;
        }

        #btnResetPwd {
            margin-left: 20px;
        }

        #btnSignIn, #btnLogin {
            margin-top: 2px;
        }

        .textBox {
            border: 0px;
                border-bottom: 1px solid #fff;
                background-color:rgba(0,0,0,0);
        }

        #lblTip {
            line-height: 30px;
        }

        #btn_stu, #btn_tea {
            margin: 0 5px;
        }

        td {
            max-width: 200px;
            overflow: auto;
        }
        #bg {
    margin: 0;
    padding: 0;
    position: absolute;
    top: 0;
    left: 0;
    width: -webkit-fill-available;
    height: -webkit-fill-available;
    z-index: -1;
}
        body{
            margin:0;
            padding:0;
        }
        #div_login {
    width: 400px;
    margin: 200px auto 0 auto;
    left: -115px;
    padding: 20px 0px 0px 50px;
    background-color: rgba(255,69,0,0.4);
    box-shadow: #FFD700 23px 13px 50px 1px;
    border-radius: 0px 25px;
}
        #btnResetPwd {
    background-color: rgba(0,0,0,0);
}
    </style>
    

</head>
<body style="overflow:visible">
    <img id="bg" src="pic/p_bg01.jpg" style="height:700px;position:fixed;" alt="" />
    <form id="form1" runat="server">
        <div id="div_login">
                <asp:ScriptManager ID="ScriptManager2" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
            
            <div>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <label id="lbl_username" class="lbl_u_p" style="color: white;">用户名</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="textBox"></asp:TextBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <label id="lbl_pwd"" class="lbl_u_p"style="color: white; ">密码</label>
                        <asp:TextBox ID="txtPwd" runat="server" CssClass="textBox"></asp:TextBox>
                        <asp:Button ID="btnResetPwd" OnClick="btnResetPwd_Click" Text="忘记密码" runat="server" CausesValidation="false" BorderWidth="0px" ForeColor="lightgray" Font-Size="14px" ></asp:Button>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>            
            <div>
                <asp:Button ID="btnSignIn" OnClick="btnSignIn_Click" CausesValidation="true" Text="登录" runat="server" Width="213px" BackColor="DodgerBlue" BorderWidth="0px" ForeColor="White" Height="30px" Font-Size="Medium" />
                <br />
                <asp:Button ID="btnLogin" OnClick="btnLogin_Click" Text="注册" runat="server" CausesValidation="false" Width="213px" BackColor="#CCCCCC" BorderWidth="0px" ForeColor="White" Height="30px" Font-Size="Medium" ></asp:Button>
            </div>
            <asp:Label ID="lblTip"  ForeColor="maroon" runat="server" Height="30px"></asp:Label>
        </div>
    </form>
</body>
</html>