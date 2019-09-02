<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="REMEMBER.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>REMEMBER</title>
    <%-- <link rel="stylesheet" type="text/css" href="css/theme.css" />
    <link rel="stylesheet" type="text/css" href="css/menu.css" />
    <link rel="stylesheet" type="text/css" href="css/top.css" />
    <link rel="stylesheet" type="text/css" href="css/middle.css" />--%>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            min-width: 700px;
        }

        #top {
            background-color: #ff6a00;
        }

        #bottom {
            background-color: Gray;
        }

        #middle {
            margin: 0 auto;
            width: 1000px;
        }

        #logo {
            display: block;
            float: left;
            padding-top: 15px;
            width: 200px;
            text-align: center;
            height: 36px;
        }

        #top-right {
            display: block;
            position: absolute;
            top: 0;
            right: 0;
            height: 52px;
            width: 150px;
        }

            #top-right img {
                position: relative;
                top: 8px;
            }

        #cssmenu,
        #cssmenu ul,
        #cssmenu ul li,
        #cssmenu ul li a,
        #cssmenu #menu-button {
            border-style: none;
            border-color: inherit;
            border-width: 0;
            position: relative;
            margin: 0;
            padding: 0;
            list-style: none;
            line-height: 1;
            display: block;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            top: 0px;
            left: 0px;
        }

        #cssmenu {
            height: 52px;
            margin-left: 200px;
        }

            #cssmenu:after,
            #cssmenu > ul:after {
                content: ".";
                display: block;
                clear: both;
                visibility: hidden;
                line-height: 0;
                height: 0;
            }

            #cssmenu #menu-button {
                display: none;
            }

        #cssmenu {
            width: auto;
            font-family: 'Open Sans', sans-serif;
            line-height: 1;
            /*background: #ffffff;*/
        }

        #menu-line {
            position: absolute;
            top: 0;
            left: 0;
            height: 3px;
            /*background: #009ae1;*/
            -webkit-transition: all 0.25s ease-out;
            -moz-transition: all 0.25s ease-out;
            -ms-transition: all 0.25s ease-out;
            -o-transition: all 0.25s ease-out;
            transition: all 0.25s ease-out;
        }

        #cssmenu > ul > li {
            float: left;
            top: 0px;
            left: 0px;
        }

        #cssmenu.align-center > ul {
            font-size: 0;
            text-align: center;
        }

            #cssmenu.align-center > ul > li {
                display: inline-block;
                float: none;
            }

        #cssmenu.align-center ul ul {
            text-align: left;
        }

        #cssmenu.align-right > ul > li {
            float: right;
        }

        #cssmenu.align-right ul ul {
            text-align: right;
        }

        #cssmenu > ul > li > a {
            padding: 20px;
            font-size: 12px;
            text-decoration: none;
            text-transform: uppercase;
            color: #000000;
            -webkit-transition: color .2s ease;
            -moz-transition: color .2s ease;
            -ms-transition: color .2s ease;
            -o-transition: color .2s ease;
            transition: color .2s ease;
        }

        #cssmenu > ul > li:hover > a {
            color: #ffffff;
        }

        #cssmenu > ul > li.h #cssmenu > ul > li.has-sub > a {
            padding-right: 25px;
        }

        #cssmenu > ul > li.has-sub > a::after {
            position: absolute;
            top: 21px;
            right: 10px;
            width: 4px;
            height: 4px;
            border-bottom: 1px solid #000000;
            border-right: 1px solid #000000;
            content: "";
            -webkit-transform: rotate(45deg);
            -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            -o-transform: rotate(45deg);
            transform: rotate(45deg);
            -webkit-transition: border-color 0.2s ease;
            -moz-transition: border-color 0.2s ease;
            -ms-transition: border-color 0.2s ease;
            -o-transition: border-color 0.2s ease;
            transition: border-color 0.2s ease;
        }

        #cssmenu > ul > li.has-sub:hover > a::after {
            border-color: #000000;
        }

        #cssmenu ul ul {
            position: absolute;
            top: 52px;
            left: -9999px;
        }

        #cssmenu li:hover > ul {
            left: auto;
        }

        #cssmenu.align-right li:hover > ul {
            right: 0;
        }

        #cssmenu ul ul ul {
            margin-left: 100%;
            top: 0;
        }

        #cssmenu.align-right ul ul ul {
            margin-left: 0;
            margin-right: 100%;
        }

        #cssmenu ul ul li {
            height: 0;
            -webkit-transition: height .2s ease;
            -moz-transition: height .2s ease;
            -ms-transition: height .2s ease;
            -o-transition: height .2s ease;
            transition: height .2s ease;
        }

        #cssmenu ul li:hover > ul > li {
            height: 32px;
        }

        #cssmenu ul ul li a {
            padding: 10px 20px;
            width: 160px;
            font-size: 12px;
            /*二级菜单背景色*/
            background: #ffffff;
            text-decoration: none;
            color: #000000;
            -webkit-transition: color .2s ease;
            -moz-transition: color .2s ease;
            -ms-transition: color .2s ease;
            -o-transition: color .2s ease;
            transition: color .2s ease;
        }

            #cssmenu ul ul li:hover > a,
            #cssmenu ul ul li a:hover {
                color: #009ae1;
            }

        #cssmenu ul ul li.has-sub > a::after {
            position: absolute;
            top: 13px;
            right: 10px;
            width: 4px;
            height: 4px;
            border-bottom: 1px solid #dddddd;
            border-right: 1px solid #dddddd;
            content: "";
            -webkit-transform: rotate(-45deg);
            -moz-transform: rotate(-45deg);
            -ms-transform: rotate(-45deg);
            -o-transform: rotate(-45deg);
            transform: rotate(-45deg);
            -webkit-transition: border-color 0.2s ease;
            -moz-transition: border-color 0.2s ease;
            -ms-transition: border-color 0.2s ease;
            -o-transition: border-color 0.2s ease;
            transition: border-color 0.2s ease;
        }

        #cssmenu.align-right ul ul li.has-sub > a::after {
            right: auto;
            left: 10px;
            border-bottom: 0;
            border-right: 0;
            border-top: 1px solid #dddddd;
            border-left: 1px solid #dddddd;
        }

        #cssmenu ul ul li.has-sub:hover > a::after {
            border-color: #009ae1;
        }

        @media all and (max-width: 768px), only screen and (-webkit-min-device-pixel-ratio: 2) and (max-width: 1024px), only screen and (min--moz-device-pixel-ratio: 2) and (max-width: 1024px), only screen and (-o-min-device-pixel-ratio: 2/1) and (max-width: 1024px), only screen and (min-device-pixel-ratio: 2) and (max-width: 1024px), only screen and (min-resolution: 192dpi) and (max-width: 1024px), only screen and (min-resolution: 2dppx) and (max-width: 1024px) {
            #cssmenu {
                width: 100%;
            }

                #cssmenu ul {
                    width: 100%;
                    display: none;
                }

                #cssmenu.align-center > ul,
                #cssmenu.align-right ul ul {
                    text-align: left;
                }

                #cssmenu ul li,
                #cssmenu ul ul li,
                #cssmenu ul li:hover > ul > li {
                    width: 100%;
                    height: auto;
                    border-top: 1px solid rgba(120, 120, 120, 0.15);
                }

                    #cssmenu ul li a,
                    #cssmenu ul ul li a {
                        width: 100%;
                    }

                #cssmenu > ul > li,
                #cssmenu.align-center > ul > li,
                #cssmenu.align-right > ul > li {
                    float: none;
                    display: block;
                }

                #cssmenu ul ul li a {
                    padding: 20px 20px 20px 30px;
                    font-size: 12px;
                    color: #000000;
                    background: none;
                }

                    #cssmenu ul ul li:hover > a,
                    #cssmenu ul ul li a:hover {
                        color: #000000;
                    }

                #cssmenu ul ul ul li a {
                    padding-left: 40px;
                }

                #cssmenu ul ul,
                #cssmenu ul ul ul {
                    position: relative;
                    left: 0;
                    right: auto;
                    width: 100%;
                    margin: 0;
                }

                    #cssmenu > ul > li.has-sub > a::after,
                    #cssmenu ul ul li.has-sub > a::after {
                        display: none;
                    }

            #menu-line {
                display: none;
            }

            #cssmenu #menu-button {
                display: block;
                padding: 20px;
                color: #000000;
                cursor: pointer;
                font-size: 12px;
                text-transform: uppercase;
            }

                #cssmenu #menu-button::after {
                    content: '';
                    position: absolute;
                    top: 20px;
                    right: 20px;
                    display: block;
                    width: 15px;
                    height: 2px;
                    background: #000000;
                }

                #cssmenu #menu-button::before {
                    content: '';
                    position: absolute;
                    top: 25px;
                    right: 20px;
                    display: block;
                    width: 15px;
                    height: 3px;
                    border-top: 2px solid #000000;
                    border-bottom: 2px solid #000000;
                }

            #cssmenu .submenu-button {
                position: absolute;
                z-index: 10;
                right: 0;
                top: 0;
                display: block;
                border-left: 1px solid rgba(120, 120, 120, 0.15);
                height: 52px;
                width: 52px;
                cursor: pointer;
            }

                #cssmenu .submenu-button::after {
                    content: '';
                    position: absolute;
                    top: 21px;
                    left: 26px;
                    display: block;
                    width: 1px;
                    height: 11px;
                    background: #000000;
                    z-index: 99;
                }

                #cssmenu .submenu-button::before {
                    content: '';
                    position: absolute;
                    left: 21px;
                    top: 26px;
                    display: block;
                    width: 11px;
                    height: 1px;
                    background: #000000;
                    z-index: 99;
                }

                #cssmenu .submenu-button.submenu-opened:after {
                    display: none;
                }
        }



        #top-right ul li {
            list-style-type: none;
            float: left;
            position: relative;
            top: -39px;
        }

            #top-right ul li a {
                text-decoration: none;
                color: black;
                -webkit-transition: color .2s ease;
                -moz-transition: color .2s ease;
                -ms-transition: color .2s ease;
                -o-transition: color .2s ease;
                transition: color .2s ease;
            }

                #top-right ul li a::after {
                    content: "";
                }

            #top-right ul li ul li {
                position: relative;
                top: 15px;
                float: none;
                background-color: oldlace;
                width: 100px;
                height: 30px;
                line-height: 30px;
                text-align: center;
                font-size: small;
                left: -45px;
            }

                #top-right ul li ul li a {
                    color: black;
                    position: initial;
                    -webkit-transition: color .2s ease;
                    -moz-transition: color .2s ease;
                    -ms-transition: color .2s ease;
                    -o-transition: color .2s ease;
                    transition: color .2s ease;
                }

            #top-right ul li ul {
                display: none;
            }

            #top-right ul li:hover ul {
                display: block;
                -webkit-transition: color .2s ease;
                -moz-transition: color .2s ease;
                -ms-transition: color .2s ease;
                -o-transition: color .2s ease;
                transition: color .2s ease;
            }

        #top-right ul ul li:hover > a,
        #top-right ul ul li a:hover {
            color: #009ae1;
        }

        #top-right ul li:hover > a,
        #top-right ul li a:hover {
            color: #ffffff;
        }

        a:link {
            color: black;
        }

        a:visited {
            color: black;
        }

        a:hover {
            color: #009ae1;
        }

        a:active {
            color: black;
        }

        #middle #line1, #line2 {
            margin: 10px 0;
        }

        #left, #right, #sentence {
            border-radius: 15px;
            margin: 40px;
        }

        #left, #right {
            display: inline-block;
            text-align: center;
            width: 400px;
            height: 260px;
            box-shadow: #FFD700 2px 2px 15px 0.5px;
        }

        #s_content_div {
            padding: 15px;
        }

        #sentence {
            background-color: #ffffff;
            box-shadow: #FFD700 2px 2px 15px 0.5px;
            padding-bottom: 2em;
        }

        #s_from_div {
            display: block;
            float: right;
            margin-right: 50px;
        }

        #right {
            float: right;
            height: 120px;
        }

        #lblTime {
            color: grey;
            font-family: -webkit-pictograph;
        }

        #p1 {
            width: 400px;
            border-radius: 10px 10px 0 0;
        }

        #t1 {
            width: 400px;
            padding: 15px 0;
            border-radius: 0 0 10px 10px;
        }

        #p1, #t1 {
        }

        #time {
            font-size: -webkit-xxx-large;
            font-family: cursive;
            color: lightgrey;
        }

        #middle a:hover {
            color: #ff6a00;
        }

        div#div_t {
            width: 200px;
            position: absolute;
            left: 30px;
            top: 70px;
            padding: 5px;
            border: 1px solid grey;
        }

        div#div_lastLogon {
            width: 200px;
            padding: 5px;
            position: absolute;
            left: 30px;
            top: 170px;
            border: 1px solid grey;
        }

        div#lblLastLogon {
            color: grey;
            font-family: -webkit-pictograph;
        }

        span#lbl_lastLogon {
            color: grey;
            font-size: small;
        }
    </style>
    <script type="text/javascript" src="js/echarts.js"></script>
    <script type="text/javascript">
        function showtime() {
            today = new Date();
            var hh = today.getHours();
            var mm = today.getMinutes();
            var ss = today.getSeconds();
            if (hh < 10) hh = "0" + hh;
            if (mm < 10) mm = "0" + mm;
            if (ss < 10) ss = "0" + ss;
            time.innerText = hh + ":" + mm + ":" + ss;
            window.setTimeout("showtime()", 1000);
        }
    </script>
    <script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js">
    </script>
    <script>
        $(document).ready(function () {
            $("#left").click(function () {
                window.location.replace("Study.aspx");
            });
        });

    </script>
</head>
<body onload="showtime()">
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
            <%-- <div id="middle">
                <div id="line1">
                    <div id="left">
                        <div id="p1">
                            <img src="pic/p_study.jpg" width="400px" height="200px" style="border-radius: 10px 10px 0 0;" />
                        </div>
                        <div id="t1">
                            <label>学习</label>

                        </div>
                    </div>
                    <div id="right">
                        <div id="lblTime"><span>Time</span></div>
                        <div><span id="time">&nbsp;</span></div>
                    </div>
                </div>
                <div id="line2">
                    <div id="sentence">
                        <div id="s_content_div">
                            <asp:Label ID="s_content_1" runat="server">Keep on going never give up.</asp:Label>
                            <br />
                            <asp:Label ID="s_content_2" runat="server">勇往直前， 决不放弃！</asp:Label>
                        </div>
                        <div id="s_from_div">
                            <asp:Label ID="s_from" runat="server">-来自</asp:Label>
                        </div>
                    </div>
                </div>
            </div>--%>
            <div id="middle">
                <img src="pic/p_study.jpg" style="width: -webkit-fill-available; position: fixed; left: 0; height: 900px; z-index: -200;">
                <div style="width: 1000px; text-align: center; position: relative;">
                    <a style="width: 200px; text-align: center; height: 50px; position: absolute; margin-top: 250px; text-decoration: none; left: 50%; color: white; font-size: x-large; line-height: 50px; font-family: initial; border: 1px #fff solid; margin-left: -100px;"
                        href="Study.aspx">进入学习</a>
                </div>
                <div id="div_t">
                    <div id="lblTime"><span>Time</span></div>
                    <div><span id="time">&nbsp;</span></div>
                </div>
                <div id="div_lastLogon">
                    <div id="lblLastLogon"><span>Last logon time</span></div>
                    <div>
                        <asp:Label ID="lbl_lastLogon" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
            <div id="bottom">
            </div>
        </div>
    </form>
</body>
</html>
