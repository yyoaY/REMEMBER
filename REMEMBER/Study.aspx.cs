using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REMEMBER
{
    public partial class Study : System.Web.UI.Page
    {
        int startIndex;//记录每次初始化表单的第一个数据在gridview中的下标
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

            if (Session["startIndex"] != null)
            {
                startIndex = Convert.ToInt16(Session["startIndex"].ToString().Trim());
            }

            if (Session["testing"] == null || Session["testing"].ToString().Trim() == "0")
            {
                DivVisible(true, false);
            }
            else
            {//正在答题
                DivVisible(false, true);
            }
            if (!IsPostBack)
            {
                startIndex = 0;
                Session["startIndex"] = 0;
                if (gv_study.Rows.Count < 30)
                {
                    Response.Redirect("Books.aspx");
                }
                else
                {
                    InitTable();//初始化表单中题目和答案
                }
                c_wordVisible(false);
                ButtonVisible(true, false, false);
            }

        }

        private void DivVisible(bool b_beforeStart, bool b_testing)
        {
            beforeStart.Visible = b_beforeStart;
            testing.Visible = b_testing;
        }

        protected void btn_start_Click(object sender, EventArgs e)
        {//点击开始学习
            Session["correctNum"] = 0;
            Session["sum"] = 0;
            Session["testing"] = 1;
            Session["startTime"] = DateTime.Now;
            Response.Redirect("Study.aspx");
        }

        private void InitTable()
        {//初始化表单
            //设置题目和答案
            mean1.Text = gv_study.Rows[startIndex].Cells[1].Text.ToString();
            mean2.Text = gv_study.Rows[startIndex+1].Cells[1].Text.ToString();
            mean3.Text = gv_study.Rows[startIndex+2].Cells[1].Text.ToString();
            mean4.Text = gv_study.Rows[startIndex+3].Cells[1].Text.ToString();
            mean5.Text = gv_study.Rows[startIndex+4].Cells[1].Text.ToString();
            c_word1.Text = gv_study.Rows[startIndex].Cells[0].Text.ToString();
            c_word2.Text = gv_study.Rows[startIndex+1].Cells[0].Text.ToString();
            c_word3.Text = gv_study.Rows[startIndex+2].Cells[0].Text.ToString();
            c_word4.Text = gv_study.Rows[startIndex+3].Cells[0].Text.ToString();
            c_word5.Text = gv_study.Rows[startIndex+4].Cells[0].Text.ToString();
            //文本框清空
            ClearTxt();
            //变量自增长5
            startIndex += 5;
            Session["startIndex"] = Convert.ToInt16(Session["startIndex"].ToString().Trim()) + 5;
        }

        private void ClearTxt()
        {
            word1.Text = "";
            word2.Text = "";
            word3.Text = "";
            word4.Text = "";
            word5.Text = "";
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {//点击提交
            //对比用户输入和答案，正确 绿色，错误 红色
            if (c_word1.Text.Trim() == word1.Text.Trim())
            {
                correct(startIndex);
                c_word1.ForeColor = Color.Green;
            }
            else
            {
                error(startIndex);
                c_word1.ForeColor = Color.Red;
            }
            if (c_word2.Text.Trim() == word2.Text.Trim())
            {
                correct(startIndex+1);
                c_word2.ForeColor = Color.Green;
            }
            else
            {
                error(startIndex+1);
                c_word2.ForeColor = Color.Red;
            }
            if (c_word3.Text.Trim() == word3.Text.Trim())
            {
                correct(startIndex+2);
                c_word3.ForeColor = Color.Green;
            }
            else
            {
                error(startIndex+2);
                c_word3.ForeColor = Color.Red;
            }
            if (c_word4.Text.Trim() == word4.Text.Trim())
            {
                correct(startIndex+3);
                c_word4.ForeColor = Color.Green;
            }
            else
            {
                error(startIndex+3);
                c_word4.ForeColor = Color.Red;
            }
            if (c_word5.Text.Trim() == word5.Text.Trim())
            {
                correct(startIndex+4);
                c_word5.ForeColor = Color.Green;
            }
            else
            {
                error(startIndex+4);
                c_word5.ForeColor = Color.Red;
            }

            //显示答案label
            c_wordVisible(true);

            if (startIndex == 30)
            {//显示 查看全部
                ButtonVisible(false, false,true);
            }
            else
            {
                ButtonVisible(false, true,false);
            }
        }

        private void correct(int index)
        {//正确
            //更新数据 学习次数+1 学习时间
            sql="update words set learn=learn+1,w_time='"+DateTime.Now+"' where u_name='"+ Session["u_id"].ToString().Trim()+"'and word='"+gv_study.Rows[index-5].Cells[0].Text.ToString()+"'";
            
            bool a=dataOperate.execSQL(sql);
            if(!a){
                Response.Write("数据"+index+"更新失败");
            }
            gv_study.Rows[index - 5].BackColor = Color.GreenYellow;
            Session["correctNum"] = Convert.ToInt16(Session["correctNum"].ToString().Trim())+1;
            Session["sum"] = Convert.ToInt16(Session["sum"].ToString().Trim()) + 1;
        }
        private void error(int index)
        {//错误
            //更新数据 学习次数+1 错误次数+1 学习时间
            sql="update words set learn=learn+1,errorNum=errorNum+1,w_time='"+DateTime.Now+"' where u_name='"+ Session["u_id"].ToString().Trim()+"'and word='"+gv_study.Rows[index-5].Cells[0].Text.ToString()+"'";

            bool a=dataOperate.execSQL(sql);
            if(!a){
                Response.Write("数据"+index+"更新失败");
            }
            gv_study.Rows[index - 5].BackColor = Color.OrangeRed;
            gv_study.Rows[index - 5].ForeColor = Color.White;
            Session["sum"] = Convert.ToInt16(Session["sum"].ToString().Trim()) + 1;
        }

        private void c_wordVisible(bool p)
        {
            c_word1.Visible = p;
            c_word2.Visible = p;
            c_word3.Visible = p;
            c_word4.Visible = p;
            c_word5.Visible = p;

        }

        protected void btn_next_Click(object sender, EventArgs e)
        {//点击下一题
            //更新表单
            InitTable();
            c_wordVisible(false);
            ButtonVisible(true,false,false);

            
        }

        private void ButtonVisible(bool b_submit,bool b_next,bool b_all)
        {
            btn_submit.Visible = b_submit;
            btn_next.Visible = b_next;
            btn_all.Visible = b_all;
        }

        protected void btn_all_Click(object sender, EventArgs e)
        {//点击查看全部
            Session["testing"] = 0;
            btn_start.Visible = false;
            DivVisible(true, false);

            //保存测试记录
            sql = "insert into TestRecord(u_name,t_date,useTime,correctRate) values('" + Session["u_id"].ToString().Trim() + "','" + DateTime.Now + "','" + (DateTime.Now - Convert.ToDateTime(Session["startTime"].ToString().Trim())) + "','" + (Convert.ToDouble(Session["correctNum"].ToString().Trim()) / Convert.ToDouble(Session["sum"].ToString().Trim())) + "')";
            if (!dataOperate.execSQL(sql))
            {
                Response.Write("保存测试记录失败;sql=" + sql);
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {//点击返回
            Session["testing"] = 0;
            DivVisible(true, false);

            //保存测试记录
            sql = "insert into TestRecord(u_name,t_date,useTime,correctRate) values('" + Session["u_id"].ToString().Trim() + "','" + DateTime.Now + "','" + (DateTime.Now - Convert.ToDateTime(Session["startTime"].ToString().Trim())) + "','" + (Convert.ToDouble(Session["correctNum"].ToString().Trim()) /Convert.ToDouble(Session["sum"].ToString().Trim())) + "')";
            if (!dataOperate.execSQL(sql))
            {
                Response.Write("保存测试记录失败;sql="+sql);
            }

        }
    }
}