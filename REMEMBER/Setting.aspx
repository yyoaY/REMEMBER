<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="REMEMBER.Setting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>REMEMBER</title>
    <link rel="stylesheet" type="text/css" href="css/theme.css" />
    <link rel="stylesheet" type="text/css" href="css/menu.css" />
    <link rel="stylesheet" type="text/css" href="css/top.css" />
    <script src="Scripts/jquery-1.7.1.js"></script>
    <script>
        $(document).ready(function () {
            $("#li1").click(function () {
                $("#li1 ul li a").css("display", "block");
                $("#li2 ul li a").css("display", "none");
            });
            $("#li2").click(function () {
                $("#li2 ul li a").css("display", "block");
                $("#li1 ul li a").css("display", "none");
            });
        });
    </script>
    <style type="text/css">
        #top {
            background-color: #ff6a00;
            position: fixed;
            width: 250px;
            margin: 0;
            padding: 0;
            top: 0;
        }

        #contentLeft {
            z-index: 10;
            width: 250px;
            height: 100%;
            position: fixed;
            top: 52px;
            left: 0;
            background-color: #283c51;
        }

        #contentRight {
            position: absolute;
            left: 270px;
            width: 600px;
            z-index: -20;
        }

        #leftNavigation, #leftNavigation li ul {
            list-style: none;
            padding: 0;
        }

        #leftNavigation {
            margin: 0;
        }

            #leftNavigation li a, #leftNavigation li a .leftNavIcon {
                line-height: 120%;
            }

            #leftNavigation li a {
                font-size: 0.875rem;
                display: block;
                padding: 0.8rem 1rem 0.8rem 3rem;
                color: #adadad;
                border-bottom: solid 1px #ff6a00;
                text-overflow: ellipsis;
                overflow: hidden;
                position: relative;
                -webkit-transition: color 0.2s ease;
                transition: color 0.2s ease;
            }

                #leftNavigation li a:hover {
                    color: goldenrod;
                }

        a {
            text-decoration: none;
        }

        #leftNavigation li ul li a {
            border-bottom: solid 1px #233547;
            display: none;
        }

        #back {
            text-decoration: none;
            color: darkorange;
            position: fixed;
            right: 20px;
            bottom: 20px;
        }
    </style>

</head>
<body style="
    background-color: whitesmoke;
">
    <form id="form1" runat="server">
        <div>
            <div id="top">
                <div id="logo">
                    REMEMBER
                </div>
                <div id='cssmenu' style="display: none">
                    <ul>
                        <li><a href='Main.aspx'>首页</a></li>
                        <li class='active has-sub'><a href='#'>单词</a>
                            <ul>
                                <li><a href='Study.aspx'>单词学习</a></li>
                                <li><a href='Books.aspx'>单词书</a></li>
                                <li><a href='Lexicon.aspx'>我的词库</a></li>
                                <li><a href='Schedule.aspx'>单词进度</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div id="top-right" style="display: none">
                    <img alt="" src="pic/head.png" width="35px" height="35px" class="" id="user_head" />
                    <ul>
                        <li class='active has-sub'><a href='#'>
                            <asp:Label ID="user_name" runat="server" Text="username"></asp:Label></a>
                            <ul>
                                <li><a href='Setting.aspx'>设置</a></li>
                                <li><a href='Login.aspx'>退出</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="middle">
                <div id="contentLeft">

                    <ul id="leftNavigation" class="master">

                        <li id="li1">
                            <a href="#C1" class="t1">账号设置</a>
                            <ul>
                                <li class="t2">
                                    <a href="#C11">更改密码</a>
                                </li>
                            </ul>
                        </li>
                        <li id="li2">
                            <a href="#C2" class="t1">单词设置</a>
                            <ul>
                                <li class="t2">
                                    <a href="#C21">重置单词数据</a>
                                </li>
                                <li class="t2">
                                    <a href="#C22">清空词库</a>
                                </li>
                                <li class="t2">
                                    <a href="#C23">清除测试记录</a>
                                </li>
                                <li class="t2">
                                    <a href="#C24">清除登录记录</a>
                                </li>
                            </ul>
                        </li>

                    </ul>

                </div>
                <div id="contentRight">
                    <a id="back" href="Main.aspx">返回</a>
                    <h2><a name="C1">账号设置</a></h2>
                    <h3><a name="C11">更改密码</a></h3>
                    <div>
                        <p>
                            <asp:Label ID="lbl_old_pwd" runat="server" Text="旧密码" CssClass="lbl"></asp:Label>
                            <asp:TextBox ID="u_oldPwd" runat="server"></asp:TextBox>
                        </p>
                        <p>
                            <asp:Label ID="lbl_new_pwd" runat="server" Text="新密码" CssClass="lbl"></asp:Label>
                            <asp:TextBox ID="u_newPwd" runat="server"></asp:TextBox>
                        </p>
                        <p>
                            <asp:Label ID="Label1" runat="server" Text="确认密码" CssClass="lbl"></asp:Label>
                            <asp:TextBox ID="u_checkPwd" runat="server"></asp:TextBox>
                        </p>
                        <p>
                            <asp:Button ID="btn_resetPwd_submit" runat="server" Text="提交" OnClick="btn_resetPwd_submit_Click" Width="100px" BackColor="DodgerBlue" BorderWidth="0px" ForeColor="White" Height="30px" Font-Size="Medium" />
                        </p>
                        <p>
                            <asp:Label ID="lblTip_resetPwd" ForeColor="#FF6600" runat="server" Height="30px"></asp:Label>
                        </p>
                    </div>
                    <h2><a name="C2">单词设置</a></h2>
                    <h3><a name="C21">重置单词数据</a></h3>
                    <div>
                        <p>
                            <asp:Button ID="lblTip_reset" runat="server" Text="重置" OnClick="btn_reset_word_Click" Width="100px" BackColor="DodgerBlue" BorderWidth="0px" ForeColor="White" Height="30px" Font-Size="Medium" />
                        </p>
                        <p>点击按钮，您的词库中的所有单词都将被重置——单词的学习次数及错误次数都将重置清零。（您的单词测试记录不会被清理）</p>
                        <p>
                            <asp:Label ID="lblTip_resetWord" ForeColor="#FF6600" runat="server" Height="30px"></asp:Label>
                        </p>
                    </div>
                    <h3><a name="C22">清空词库</a></h3>
                    <div>
                        <p>
                            <asp:Button ID="btn_clear_word" runat="server" Text="清空" OnClick="btn_clear_word_Click" Width="100px" BackColor="DodgerBlue" BorderWidth="0px" ForeColor="White" Height="30px" Font-Size="Medium" />
                        </p>
                        <p>点击按钮，您的词库中的所有单词都将被清除，包括单词数据。（您的单词测试记录不会被清理）</p>
                        <p>
                            <asp:Label ID="lblTip_clearWord" ForeColor="#FF6600" runat="server" Height="30px"></asp:Label>
                        </p>
                    </div>
                    <h3><a name="C23">清除测试记录</a></h3>
                    <div>
                        <p>
                            <asp:Button ID="btn_clear_test" runat="server" Text="清除" OnClick="btn_clear_test_Click" Width="100px" BackColor="DodgerBlue" BorderWidth="0px" ForeColor="White" Height="30px" Font-Size="Medium" />
                        </p>
                        <p>点击按钮，您的全部单词测试记录将被清除。</p>
                        <p>
                            <asp:Label ID="lblTip_clearTestRecord" ForeColor="#FF6600" runat="server" Height="30px"></asp:Label>
                        </p>
                    </div>
                    <h3><a name="C24">清除登录记录</a></h3>
                    <div>
                        <p>
                            <asp:Button ID="btn_clearLoginRecord" runat="server" Text="清除" OnClick="btn_clearLoginRecord_Click" Width="100px" BackColor="DodgerBlue" BorderWidth="0px" ForeColor="White" Height="30px" Font-Size="Medium" />
                        </p>
                        <p>点击按钮，您的全部登录记录将被清除。</p>
                        <p>
                            <asp:Label ID="lblTip_clearLoginRecord" ForeColor="#FF6600" runat="server" Height="30px"></asp:Label>
                        </p>
                    </div>
                </div>
        </div>
        </div>
    </form>
</body>
</html>
