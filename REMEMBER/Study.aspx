<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Study.aspx.cs" Inherits="REMEMBER.Study" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>REMEMBER</title>
    <link rel="stylesheet" type="text/css" href="css/theme.css" />
    <link rel="stylesheet" type="text/css" href="css/menu.css" />
    <link rel="stylesheet" type="text/css" href="css/top.css" />
    <style type="text/css">
        div#lbl1 {
    font-size: 16px;
    color: orange;
    margin: 10px;
}
        #gv_study {
    width: auto;
    border: 1px moccasin;
    font-family: -webkit-pictograph;
}
        input#btn_start {
    width: 200px;
    height: 40px;
    font-size: 22px;
    color: white;
    background-color: orange;
    border: 0px;
    margin: 20px;
}
        #beforeStart,#testing {
    text-align: -webkit-center;
}
        #testing {
    margin: 40px;
}
        #btn_submit,#btn_next,#btn_all {
    width: 100px;
    height: 30px;
    margin: 20px;
    color: white;
    background: orange;
    border: 0px;
}
        #btn_back {
    width: 100px;
    height: 30px;
    margin: 20px;
    color: orange;
    background: papayawhip;
    border: 0px;
}
        #word1, #word2, #word3, #word4, #word5 {
    padding: 5px 10px;
    margin: 10px;
}
        #c_word1, #c_word2, #c_word3, #c_word4, #c_word5 {
    padding: 5px;
}
        th,td{
            padding:10px;
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
                                <li><a href="Study.aspx">单词学习</a></li>
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
            <div id="beforeStart" runat="server">
                <div id="lbl1">
                    <label>本次测试词汇</label>
                </div>
                <asp:GridView ID="gv_study" runat="server" AutoGenerateColumns="False" DataSourceID="sds_study" EnableModelValidation="True">
                    <Columns>
                        <asp:BoundField DataField="word" HeaderText="word" SortExpression="word" />
                        <asp:BoundField DataField="means" HeaderText="means" SortExpression="means" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sds_study" runat="server" ConnectionString="<%$ ConnectionStrings:REMEMBERConnectionString %>" SelectCommand="SELECT TOP (30) word, means FROM words WHERE (u_name = @u_name) ORDER BY learn, w_time">
                    <SelectParameters>
                        <asp:SessionParameter Name="u_name" SessionField="u_id" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Button ID="btn_start" runat="server" Text="开始学习" OnClick="btn_start_Click" />
            </div>
            <div>
                <div id="testing" runat="server">
                    <div>
                        <asp:Table ID="t_1" runat="server">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label ID="mean1" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="word1" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label ID="c_word1" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label ID="mean2" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="word2" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label ID="c_word2" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label ID="mean3" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="word3" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label ID="c_word3" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label ID="mean4" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="word4" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label ID="c_word4" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label ID="mean5" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="word5" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label ID="c_word5" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div>
                        <asp:Button ID="btn_submit" runat="server" Text="提交" OnClick="btn_submit_Click" />
                        <asp:Button ID="btn_next" runat="server" Text="下一题" OnClick="btn_next_Click" />
                        <asp:Button ID="btn_all" runat="server" Text="查看全部"  OnClick="btn_all_Click" />
                        <asp:Button ID="btn_back" runat="server" Text="返回"  OnClick="btn_back_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
