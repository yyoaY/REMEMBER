using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REMEMBER
{
    public partial class main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["u_id"]== null)
            {
                //跳转到登录界面
                Response.Redirect("Login.aspx");
            }
            else
            {
                user_name.Text = Session["u_id"].ToString().Trim();
                //填充上次登录时间
                SqlDataReader dr = dataOperate.getRow(" select top 1 * from LoginRecord where u_name='" + Session["u_id"].ToString().Trim() + "' and loginTime not in (select top 1 loginTime from LoginRecord where u_name='" + Session["u_id"].ToString().Trim() + "' order by loginTime desc ) order by loginTime desc");
                if (dr.Read())
                {
                    lbl_lastLogon.Text = dr.GetValue(1).ToString();
                }
                else
                {
                    lbl_lastLogon.Text = "这是您的第一次登录";
                }
            }
        }

        protected void btn_study_Click(object sender, ImageClickEventArgs e)
        {
            //跳转到登录界面
            Response.Redirect("Study.aspx");
        }
        
    }
}