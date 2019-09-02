using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REMEMBER
{
    public partial class schedule : System.Web.UI.Page
    {
        string sql = "";
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
            //已学多少单词
            sql = "select * from words where u_name='" + Session["u_id"] + "' and learn>=1";
            lbl_learned.Text = "" + getNum(sql);
            TextBox1.Text = lbl_learned.Text.Trim();
            //未学多少单词
            sql = "select * from words where u_name='" + Session["u_id"] + "' and learn=0";
            lbl_unlearned.Text = "" + getNum(sql);
            TextBox2.Text = lbl_unlearned.Text.Trim();
            //Response.Write("t1:" + TextBox1.Text.Trim() + ";t2:" + TextBox2.Text.Trim());
            //测试多少次
            sql = "select * from TestRecord where u_name='" + Session["u_id"] + "'";
            lbl_testNum.Text = "" + getNum(sql);
            //正确率
            sql = "select avg(correctRate) from TestRecord where u_name='" + Session["u_id"] + "'";
            SqlDataReader Dr = dataOperate.getRow(sql);
            if (Dr.Read() && Dr[0].ToString()!="")
                lbl_correctRate.Text = "" + Dr[0].ToString();
            if (lbl_correctRate.Text.Length >= 5)
                lbl_correctRate.Text = lbl_correctRate.Text.Substring(0, 4);
        }

        private int getNum(string sqlstr){
            DataSet ds = dataOperate.getDataset(sqlstr);
            return ds.Tables[0].Rows.Count;

        }
    }
}