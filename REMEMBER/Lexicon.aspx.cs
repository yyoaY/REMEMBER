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
    public partial class lexicon : System.Web.UI.Page
    {
        static int s = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                s = 1;
            }
            if (Session["u_id"] == null)
            {
                //跳转到登录界面
                Response.Redirect("Login.aspx");
            }
            else
            {
                user_name.Text = Session["u_id"].ToString().Trim();
            }
            HideAll();
            if (s==1)
            {
                div_searchPart.Visible = true;
            }
        }

        private void HideAll()
        {
            div_all.Visible = false;
            div_learned.Visible = false;
            div_unlearned.Visible = false;
            div_error.Visible = false;
            div_searchPart.Visible = false;
        }

        protected void btn_all_Click(object sender, EventArgs e)
        {
            num.Text = "" + gv_all.Rows.Count;
            HideAll();
            div_all.Visible = true;
        }

        protected void btn_learned_Click(object sender, EventArgs e)
        {
            num.Text = "" + gv_learned.Rows.Count;
            HideAll();
            div_learned.Visible = true;
        }

        protected void btn_unlearned_Click(object sender, EventArgs e)
        {
            num.Text = "" + gv_unlearned.Rows.Count;
            HideAll();
            div_unlearned.Visible = true;
        }

        protected void btn_error_Click(object sender, EventArgs e)
        {
            num.Text = "" + gv_error.Rows.Count;
            HideAll();
            div_error.Visible = true;
        }

        protected void gv_all_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //执行循环，保证每条数据都可以更新
            for (int i = -1; i < gv_all.Rows.Count; i++)
            {
                //首先判断是否是数据行
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //当鼠标停留时更改背景色
                    e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='pink'");
                    //当鼠标移开时还原背景色
                    e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
                }
            }
            
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            s = 1;
            SqlDataAdapter da = new SqlDataAdapter();
            //实例化SqlConnection对象
            SqlConnection sqlCon = new SqlConnection();
            //实例化SqlConnection对象连接数据库的字符串
            sqlCon.ConnectionString = "Data Source=(local);Database=REMEMBER;Uid=sa;Pwd=123456";
            da.SelectCommand = new SqlCommand();
            string bookNum = "";
            string word = "";
            string learnNum = "";
            string errorNum = "";
            bookNum = ddl_bookNum.Text;
            word = ddl_word.Text;
            learnNum = ddl_learnNum.Text;
            errorNum = ddl_errorNum.Text;
            string strComText1 = "select b_id as '词书编号',word as '单词',means as '含义',learn as '学习次数',errorNum as '错误次数' from words ";
            if (ddl_bookNum.Text == "请选择" && ddl_word.Text == "请选择" && ddl_learnNum.Text == "请选择" && ddl_errorNum.Text == "请选择")
                da.SelectCommand.CommandText = strComText1;

            if (ddl_bookNum.Text == "请选择" && ddl_word.Text == "请选择" && ddl_learnNum.Text == "请选择" && ddl_errorNum.Text != "请选择")
                da.SelectCommand.CommandText = strComText1+"where errorNum>='" + errorNum + "'";

            if (ddl_bookNum.Text == "请选择" && ddl_word.Text == "请选择" && ddl_learnNum.Text != "请选择" && ddl_errorNum.Text == "请选择")
                da.SelectCommand.CommandText = strComText1 + "where learn<='" + learnNum + "'";

            if (ddl_bookNum.Text == "请选择" && ddl_word.Text == "请选择" && ddl_learnNum.Text != "请选择" && ddl_errorNum.Text != "请选择")
                da.SelectCommand.CommandText = strComText1 + "where learn<='" + learnNum + "' and errorNum>='" + errorNum + "'";

            if (ddl_bookNum.Text == "请选择" && ddl_word.Text != "请选择" && ddl_learnNum.Text == "请选择" && ddl_errorNum.Text == "请选择")
                da.SelectCommand.CommandText = strComText1 + "where (word like '" + word.ToLower() + "%' or word like '" + word + "%')";

            if (ddl_bookNum.Text == "请选择" && ddl_word.Text != "请选择" && ddl_learnNum.Text == "请选择" && ddl_errorNum.Text != "请选择")
                da.SelectCommand.CommandText = strComText1 + "where (word like '" + word.ToLower() + "%' or word like '" + word + "%') and errorNum>='" + errorNum + "'";

            if (ddl_bookNum.Text == "请选择" && ddl_word.Text != "请选择" && ddl_learnNum.Text != "请选择" && ddl_errorNum.Text == "请选择")
                da.SelectCommand.CommandText = strComText1 + "where (word like '" + word.ToLower() + "%' or word like '" + word + "%') and learn<='" + learnNum + "'";

            if (ddl_bookNum.Text == "请选择" && ddl_word.Text != "请选择" && ddl_learnNum.Text != "请选择" && ddl_errorNum.Text != "请选择")
                da.SelectCommand.CommandText = strComText1 + "where (word like '" + word.ToLower() + "%' or word like '" + word + "%') and learn<='" + learnNum + "' and errorNum>='" + errorNum + "'";

            if (ddl_bookNum.Text != "请选择" && ddl_word.Text == "请选择" && ddl_learnNum.Text == "请选择" && ddl_errorNum.Text == "请选择")
                da.SelectCommand.CommandText = strComText1+"where b_id='" + bookNum + "'";

            if (ddl_bookNum.Text != "请选择" && ddl_word.Text == "请选择" && ddl_learnNum.Text == "请选择" && ddl_errorNum.Text != "请选择")
                da.SelectCommand.CommandText = strComText1 + "where b_id='" + bookNum + "' and errorNum>='" + errorNum + "'";

            if (ddl_bookNum.Text != "请选择" && ddl_word.Text == "请选择" && ddl_learnNum.Text != "请选择" && ddl_errorNum.Text == "请选择")
                da.SelectCommand.CommandText = strComText1 + "where b_id='" + bookNum + "' and learn<='" + learnNum + "'";

            if (ddl_bookNum.Text != "请选择" && ddl_word.Text == "请选择" && ddl_learnNum.Text != "请选择" && ddl_errorNum.Text != "请选择")
                da.SelectCommand.CommandText = strComText1 + "where b_id='" + bookNum + "' and learn<='" + learnNum + "' and errorNum>='" + errorNum + "'";

            if (ddl_bookNum.Text != "请选择" && ddl_word.Text != "请选择" && ddl_learnNum.Text == "请选择" && ddl_errorNum.Text == "请选择")
                da.SelectCommand.CommandText = strComText1 + "where b_id='" + bookNum + "' and (word like '" + word.ToLower() + "%' or word like '" + word + "%')";

            if (ddl_bookNum.Text != "请选择" && ddl_word.Text != "请选择" && ddl_learnNum.Text == "请选择" && ddl_errorNum.Text != "请选择")
                da.SelectCommand.CommandText = strComText1 + "where b_id='" + bookNum + "' and (word like '" + word.ToLower() + "%' or word like '" + word + "%') and errorNum>='" + errorNum + "'";

            if (ddl_bookNum.Text != "请选择" && ddl_word.Text != "请选择" && ddl_learnNum.Text != "请选择" && ddl_errorNum.Text == "请选择")
                da.SelectCommand.CommandText = strComText1 + "where b_id='" + bookNum + "' and (word like '" + word.ToLower() + "%' or word like '" + word + "%') and learn<='" + learnNum + "'";

            if (ddl_bookNum.Text != "请选择" && ddl_word.Text != "请选择" && ddl_learnNum.Text != "请选择" && ddl_errorNum.Text != "请选择")
                da.SelectCommand.CommandText = strComText1 + "where b_id='" + bookNum + "' and (word like '" + word.ToLower() + "%' or word like '" + word + "%') and learn<='" + learnNum + "' and errorNum>='" + errorNum + "'";

            da.SelectCommand.Connection = sqlCon;
            DataSet ds = new DataSet();
            da.Fill(ds);
            //绑定DataList控件
            gv_search.DataSource = ds;//设置数据源，用于填充控件中的项的值列表
            gv_search.DataBind();//将控件及其所有子控件绑定到指定的数据源
            num.Text = ""+gv_search.Rows.Count;
        }

        protected void btn_searchPart_Click(object sender, EventArgs e)
        {
            num.Text = "" + gv_search.Rows.Count;
            HideAll();
            div_searchPart.Visible = true;
        }


    }
}