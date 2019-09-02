using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginWeb
{
    public partial class ResetPwdPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            //非空验证
            if (u_id.Text.Trim() == "")
            {
                lblTip.Text = "提交失败，请输入用户名！";
            }
            else if (u_pwd.Text.Trim() == "")
            {
                lblTip.Text = "提交失败，请输入密码！";
            }
            else if (u_checkPwd.Text.Trim() == "")
            {
                lblTip.Text = "提交失败，请输入确认密码！";
            }
            else if (u_checkPwd.Text.Trim() != u_pwd.Text.Trim())
            {
                lblTip.Text = "提交失败，确认密码不正确！";
            }
            else
            {
                //根据用户名（id）验证用户是否存在
                String sql = "select * from users where u_name='" + u_id.Text.Trim()  + "';";
                SqlDataReader sqlDr = dataOperate.getRow(sql);
                if (sqlDr.Read())
                {
                    //更新记录
                    sql = "update users set u_pwd='" + u_pwd.Text.Trim().GetHashCode() + "' where u_name='" + u_id.Text.Trim() + "';";
                    if (dataOperate.execSQL(sql))
                    {
                        lblTip.Text = "密码修改成功！";
                    }
                }
                else
                {
                    lblTip.Text = "修改失败，找不到该用户！";
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}