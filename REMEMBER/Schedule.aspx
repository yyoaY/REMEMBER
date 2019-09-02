<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="REMEMBER.schedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>REMEMBER</title>
    <link rel="stylesheet" type="text/css" href="css/theme.css" />
    <link rel="stylesheet" type="text/css" href="css/menu.css" />
    <link rel="stylesheet" type="text/css" href="css/top.css" />
    <script src="js/echarts.js"></script>
    <style type="text/css">
        .block {
            width: 200px;
            display: inline-block;
            height: 100px;
            box-shadow: #ffee33 3px 3px 10px 0px;
            text-align: center;
            color: wheat;
            margin-top: 100px;
        }

        .b_lbl, .b_txt {
            width: 200px;
        }

        .b_lbl {
            height: 70px;
            font: 38px bold;
            font-family: fantasy;
        }

        #div_block {
            margin: 20px auto;
            width: 815px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="overflow: hidden">
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
            <div id="div_block">
                <div class="block">
                    <div class="b_lbl">
                        <asp:Label runat="server" ID="lbl_learned" Text="0"></asp:Label>
                    </div>
                    <div class="b_txt">已学词数</div>
                </div>
                <div class="block">
                    <div class="b_lbl">
                        <asp:Label runat="server" ID="lbl_unlearned" Text="0"></asp:Label>
                    </div>
                    <div class="b_txt">未学词数</div>
                </div>
                <div class="block">
                    <div class="b_lbl">
                        <asp:Label runat="server" ID="lbl_testNum" Text="0"></asp:Label>
                    </div>
                    <div class="b_txt">测试次数</div>
                </div>
                <div class="block">
                    <div class="b_lbl">
                        <asp:Label runat="server" ID="lbl_correctRate" Text="0"></asp:Label>
                    </div>
                    <div class="b_txt">正确率</div>
                </div>
            </div>
            <asp:TextBox runat="server" Visible="false" Text="" ID="TextBox1"></asp:TextBox>
            <asp:TextBox runat="server" Visible="false" Text="" ID="TextBox2"></asp:TextBox>
            <img src="pic/p_bg02.jpg" style="width: -webkit-fill-available; position: fixed; top: 52px; height: 700px; z-index: -200;">
            <%--<div id="chart_word" style="width: 600px; height: 400px;"></div>
            <script>
                // 绘制图表。
                var a = 100;
                var b = 150;
                echarts.init(document.getElementById('chart_word')).setOption({
                    series: {
                        type: 'pie',
                        data: [
                            { name: '已学词汇数量', value: a },
                            { name: '未学词汇数量', value: b }
                        ]
                    }
                });
            </script>--%>
        </div>
    </form>
</body>
</html>
