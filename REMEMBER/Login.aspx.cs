using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NEWS
{
    public partial class Login : System.Web.UI.Page
    {
        String username;
        String pwd;
        String sqlStr = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //清空提示文本
            lblTip.Text = "";
        }


        protected void btnLogin_Click(object sender, EventArgs e)//注册
        {
            //跳转到注册界面
            Response.Redirect("Register.aspx");
        }


        protected void btnResetPwd_Click(object sender, EventArgs e)//忘记密码
        {
            //跳转到修改密码界面
            Response.Redirect("ResetPwdPage.aspx");
        }

        protected void btnSignIn_Click(object sender, EventArgs e)//登录
        {
            username = txtUsername.Text.Trim();//用户名
            pwd = txtPwd.Text.Trim();//密码

            //验证用户合法性
            sqlStr = "select * from users where  u_name='" + username + "' and u_pwd='" + pwd.GetHashCode() + "'";
            SqlDataReader Dr = dataOperate.getRow(sqlStr);
            if (Dr.Read())
            {//有记录，登录成功
                Session["u_id"] = username;

                //添加该用户登录记录
                sqlStr = "insert into LoginRecord (u_name,loginTime) values('" + username + "','" + DateTime.Now +"')";
                dataOperate.execSQL(sqlStr);

                //跳转到用户界面
                Response.Redirect("Main.aspx");
            }
            else
            {//无记录，登录失败
                lblTip.Text = "登录失败！请输入正确的用户名与密码！";
            } 
        }



    }
}