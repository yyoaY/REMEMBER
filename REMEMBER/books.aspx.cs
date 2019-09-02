using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REMEMBER
{
    public partial class books : System.Web.UI.Page
    {
        String sql = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["u_id"] == null)
            {
                //跳转到登录界面
                Response.Redirect("Login.aspx");
            }
            else
            {
                user_name.Text = Session["u_id"].ToString().Trim();
            }
        }

        protected void btn_add_book1_Click(object sender, EventArgs e)
        {
            AddBook("1");
        }

        private void AddBook(string b_id)
        {
            sql = "insert words(u_name,b_id,word,means,learn,errorNum,w_time) select '" + Session["u_id"] + "',b_id,word,means,0,0,'" + DateTime.Now + "' from book where b_id='"+b_id+"'";
            bool a = dataOperate.execSQL(sql);
            if (a)
            {//添加成功
                lblTip.Text = "添加成功";
            }
            else
            {
                lblTip.Text = "添加失败";
            }
        }

        protected void btn_add_book2_Click(object sender, EventArgs e)
        {
            AddBook("2");
        }
    }
}