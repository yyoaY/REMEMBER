<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="REMEMBER.books" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>REMEMBER</title>
    <link rel="stylesheet" type="text/css" href="css/theme.css" />
    <link rel="stylesheet" type="text/css" href="css/menu.css" />
    <link rel="stylesheet" type="text/css" href="css/top.css" />
    <style type="text/css">
        .div_book {
            height: 160px;
            width: 460px;
            margin: 20px auto;
            overflow: hidden;
            box-shadow: #e90 10px 10px 15px 0.5px;
        }

            .div_book div {
                display: inline-block;
                float: left;
                position: relative;
                top: -330px;
                left: 50px;
                margin: 10px;
            }

        .b_name {
            width: 200px;
        }

        h4 {
            border-bottom: 2px solid #FFF68F;
        }

        .b_btn {
            padding-top: 120px;
            height: 30px;
        }

        #btn_add_book1, #btn_add_book2 {
            width: 100px;
            height: 30px;
            color: white;
            background: orange;
            border: 0px;
        }

        #tip {
            height: 20px;
            width: 460px;
            margin: 0px auto;
            padding: 10px;
            color: orange;
            text-align: center;
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
                <div id='cssmenu'>
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
                <div id="top-right">
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
                <div id="tip">
                    <asp:Label runat="server" ID="lblTip"></asp:Label>
                </div>
                <div class="div_book">
                    <img src="pic/p_book.jpg" style="position: relative; top: 0; z-index: -200; margin: 0; padding: 0; width: 480px; left: 0;">
                    <%--<div class="b_pic">
                        <img alt="" src="pic/head.png" width="100px" height="150px" /></div>--%>
                    <div class="b_name">
                        <h4>词书1</h4>
                        基础词汇
                    </div>
                    <div class="b_btn">
                        <asp:Button runat="server" Text="添加" ID="btn_add_book1" OnClick="btn_add_book1_Click" />
                    </div>

                </div>
                <div class="div_book">
                    <img src="pic/p_book.jpg" style="position: relative; top: 0; z-index: -200; margin: 0; padding: 0; width: 480px; left: 0;">
                    <%--<div class="b_pic">
                        <img alt="" src="pic/head.png" width="100px" height="150px" /></div>--%>
                    <div class="b_name">
                        <h4>词书2</h4>
                        基础词汇
                    </div>
                    <div class="b_btn">
                        <asp:Button runat="server" Text="添加" ID="btn_add_book2" OnClick="btn_add_book2_Click" />
                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
