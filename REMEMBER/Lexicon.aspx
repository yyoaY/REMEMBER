<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lexicon.aspx.cs" Inherits="REMEMBER.lexicon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>REMEMBER</title>
    <link rel="stylesheet" type="text/css" href="css/theme.css" />
    <link rel="stylesheet" type="text/css" href="css/menu.css" />
    <link rel="stylesheet" type="text/css" href="css/top.css" />
    <link href="css/Lexicon.css" rel="stylesheet" />
    <style type="text/css">
        #middle {
            text-align: -webkit-center;
        }

        #div_btn {
            height: 40px;
            margin: 20px 0;
            width: 500px;
        }

        #btn_search {
            width: 100px;
            height: 30px;
            margin: 5px;
            color: white;
            background: orange;
            border: 0px;
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
                <div id="div_btn">
                    <asp:Button runat="server" ID="btn_all" Text="所有单词" OnClick="btn_all_Click" CssClass="btn" />
                    <asp:Button runat="server" ID="btn_learned" Text="已学单词" OnClick="btn_learned_Click" CssClass="btn" />
                    <asp:Button runat="server" ID="btn_unlearned" Text="未学单词" OnClick="btn_unlearned_Click" CssClass="btn" />
                    <asp:Button runat="server" ID="btn_error" Text="易错单词" OnClick="btn_error_Click" CssClass="btn" />
                    <asp:Button runat="server" ID="btn_searchPart" Text="分类检索" OnClick="btn_searchPart_Click" CssClass="btn" />
                </div>
                <div id="txt_num">
                    共<asp:Label ID="num" runat="server" Text="0"></asp:Label>条记录
                </div>
                <div id="div_searchPart" runat="server">
                    <table style="text-align: center; width: 320px; border: 3px double #eee; color: darkred; padding: 4px;box-shadow: 1px 1px 1px 0.1px grey;">
                        <tr>
                            <td>词书编号</td>
                            <td>首字母</td>
                            <td>学习次数</td>
                            <td>错误次数</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddl_bookNum" runat="server">
                                    <asp:ListItem Value="1">词书1</asp:ListItem>
                                    <asp:ListItem Value="2">词书2</asp:ListItem>
                                    <asp:ListItem Selected="True">请选择</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddl_word" runat="server" Height="16px">
                                    <asp:ListItem>A</asp:ListItem>
                                    <asp:ListItem>B</asp:ListItem>
                                    <asp:ListItem>C</asp:ListItem>
                                    <asp:ListItem>D</asp:ListItem>
                                    <asp:ListItem>E</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                    <asp:ListItem>G</asp:ListItem>
                                    <asp:ListItem>H</asp:ListItem>
                                    <asp:ListItem>I</asp:ListItem>
                                    <asp:ListItem>J</asp:ListItem>
                                    <asp:ListItem>K</asp:ListItem>
                                    <asp:ListItem>L</asp:ListItem>
                                    <asp:ListItem>M</asp:ListItem>
                                    <asp:ListItem>N</asp:ListItem>
                                    <asp:ListItem>O</asp:ListItem>
                                    <asp:ListItem>P</asp:ListItem>
                                    <asp:ListItem>Q</asp:ListItem>
                                    <asp:ListItem>R</asp:ListItem>
                                    <asp:ListItem>S</asp:ListItem>
                                    <asp:ListItem>T</asp:ListItem>
                                    <asp:ListItem>U</asp:ListItem>
                                    <asp:ListItem>V</asp:ListItem>
                                    <asp:ListItem>W</asp:ListItem>
                                    <asp:ListItem>X</asp:ListItem>
                                    <asp:ListItem>Y</asp:ListItem>
                                    <asp:ListItem>Z</asp:ListItem>
                                    <asp:ListItem Selected="True">请选择</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddl_learnNum" runat="server">
                                    <asp:ListItem Value="0">0</asp:ListItem>
                                    <asp:ListItem Value="5"><=5</asp:ListItem>
                                    <asp:ListItem Value="10"><=10</asp:ListItem>
                                    <asp:ListItem Value="20"><=20</asp:ListItem>
                                    <asp:ListItem Selected="True">请选择</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddl_errorNum" runat="server">
                                    <asp:ListItem Value="5">>=5</asp:ListItem>
                                    <asp:ListItem Value="10">>=10</asp:ListItem>
                                    <asp:ListItem Value="20">>=20</asp:ListItem>
                                    <asp:ListItem Selected="True">请选择</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btn_search" runat="server" OnClick="btn_search_Click" Text="检索" />
                    <asp:GridView ID="gv_search" runat="server" OnRowDataBound="gv_all_RowDataBound" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="602px">
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#FFE181" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </div>
                <div id="div_all" runat="server">
                    <asp:GridView ID="gv_all" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowDataBound="gv_all_RowDataBound"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Vertical" Width="602px" DataSourceID="sds_all" EnableModelValidation="True">
                        <Columns>
                            <asp:BoundField DataField="b_id" HeaderText="词书编号" SortExpression="b_id" />
                            <asp:BoundField DataField="word" HeaderText="单词" SortExpression="word" />
                            <asp:BoundField DataField="means" HeaderText="含义" SortExpression="means" />
                        </Columns>
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#FFE181" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="sds_all" ConnectionString="<%$ ConnectionStrings:REMEMBERConnectionString %>" SelectCommand="SELECT [b_id], [word], [means] FROM [words] WHERE ([u_name] = @u_name) ORDER BY [b_id], [word], [means]">
                        <SelectParameters>
                            <asp:SessionParameter Name="u_name" SessionField="u_id" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div id="div_learned" runat="server">
                    <asp:GridView ID="gv_learned" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowDataBound="gv_all_RowDataBound"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Vertical" Width="602px" DataSourceID="sds_learned" EnableModelValidation="True">

                        <Columns>
                            <asp:BoundField DataField="b_id" HeaderText="词书编号" SortExpression="b_id" />
                            <asp:BoundField DataField="word" HeaderText="单词" SortExpression="word" />
                            <asp:BoundField DataField="means" HeaderText="含义" SortExpression="means" />
                            <asp:BoundField DataField="learn" HeaderText="学习次数" SortExpression="learn" />
                            <asp:BoundField DataField="errorNum" HeaderText="错误次数" SortExpression="errorNum" />
                        </Columns>
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#FFE181" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="sds_learned" ConnectionString="<%$ ConnectionStrings:REMEMBERConnectionString %>" SelectCommand="SELECT [b_id], [word], [means], [learn], [errorNum] FROM [words] WHERE (([learn] &lt;&gt; @learn) AND ([u_name] = @u_name)) ORDER BY [learn] DESC, [b_id], [word]">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="learn" Type="Int32" />
                            <asp:SessionParameter Name="u_name" SessionField="u_id" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div id="div_unlearned" runat="server">
                    <asp:GridView ID="gv_unlearned" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowDataBound="gv_all_RowDataBound"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Vertical" Width="602px" DataSourceID="sds_unlearned" EnableModelValidation="True">

                        <Columns>
                            <asp:BoundField DataField="b_id" HeaderText="词书编号" SortExpression="b_id" />
                            <asp:BoundField DataField="word" HeaderText="单词" SortExpression="word" />
                            <asp:BoundField DataField="means" HeaderText="含义" SortExpression="means" />
                        </Columns>
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#FFE181" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="sds_unlearned" ConnectionString="<%$ ConnectionStrings:REMEMBERConnectionString %>" SelectCommand="SELECT [b_id], [word], [means] FROM [words] WHERE (([u_name] = @u_name) AND ([learn] = @learn)) ORDER BY [b_id], [word], [means]">
                        <SelectParameters>
                            <asp:SessionParameter Name="u_name" SessionField="u_id" Type="String" />
                            <asp:Parameter DefaultValue="0" Name="learn" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div id="div_error" runat="server">
                    <asp:GridView ID="gv_error" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowDataBound="gv_all_RowDataBound"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Vertical" Width="602px" DataSourceID="sds_error" EnableModelValidation="True">

                        <Columns>
                            <asp:BoundField DataField="b_id" HeaderText="词书编号" SortExpression="b_id" />
                            <asp:BoundField DataField="word" HeaderText="单词" SortExpression="word" />
                            <asp:BoundField DataField="means" HeaderText="含义" SortExpression="means" />
                            <asp:BoundField DataField="errorNum" HeaderText="错误次数" SortExpression="errorNum" />
                            <asp:BoundField DataField="learn" HeaderText="学习次数" SortExpression="learn" />
                        </Columns>
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#FFE181" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="sds_error" ConnectionString="<%$ ConnectionStrings:REMEMBERConnectionString %>" SelectCommand="SELECT [b_id], [word], [means], [errorNum], [learn] FROM [words] WHERE (([errorNum] &lt;&gt; @errorNum) AND ([u_name] = @u_name)) ORDER BY [errorNum] DESC, [b_id], [word]">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="errorNum" Type="Int32" />
                            <asp:SessionParameter Name="u_name" SessionField="u_id" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
