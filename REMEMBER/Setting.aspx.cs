using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REMEMBER
{
    public partial class Setting : System.Web.UI.Page
    {
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
            resetLbl();
        }

        void resetLbl()
        {
            lblTip_resetPwd.Text = "";
            lblTip_resetWord.Text = "";
            lblTip_clearWord.Text = "";
            lblTip_clearTestRecord.Text = "";
            lblTip_clearLoginRecord.Text = "";
        }

        protected void btn_resetPwd_submit_Click(object sender, EventArgs e)
        {
            //非空验证
            if (u_oldPwd.Text.Trim() == "")
            {
                lblTip_resetPwd.Text = "提交失败，请输入旧密码！";
            }
            else if (u_newPwd.Text.Trim() == "")
            {
                lblTip_resetPwd.Text = "提交失败，请输入新密码！";
            }
            else if (u_checkPwd.Text.Trim() == "")
            {
                lblTip_resetPwd.Text = "提交失败，请输入确认密码！";
            }
            else if (u_checkPwd.Text.Trim() != u_newPwd.Text.Trim())
            {
                lblTip_resetPwd.Text = "提交失败，确认密码不正确！";
            }
            else
            {
                //根据id,密码验证用户是否存在
                String sql = "select * from users where u_name='" + Session["u_id"].ToString().Trim() + "' and u_pwd='" + u_oldPwd.Text.Trim().GetHashCode() + "';";
                SqlDataReader sqlDr = dataOperate.getRow(sql);
                if (sqlDr.Read())
                {
                    //更新记录
                    sql = "update users set u_pwd='" + u_newPwd.Text.Trim().GetHashCode() + "' where u_name='" + Session["u_id"].ToString().Trim() + "';";
                    if (dataOperate.execSQL(sql))
                    {
                        lblTip_resetPwd.Text = "新密码修改成功！";
                    }
                }
                else
                {
                    lblTip_resetPwd.Text = "提交失败，旧密码错误！";
                }
            }
        }

        protected void btn_reset_word_Click(object sender, EventArgs e)
        {
            //重置单词
            String sql = "update words set learn=0 ,errorNum=0 where u_name='" + Session["u_id"].ToString().Trim() + "';";
            if (dataOperate.execSQL(sql))
            {
                lblTip_resetWord.Text = "重置成功！";
            }
            else
            {
                lblTip_resetWord.Text = "重置失败！";
            }
        }

        protected void btn_clear_word_Click(object sender, EventArgs e)
        {
            //清空词库
            String sql = "delete from words where u_name='" + Session["u_id"].ToString().Trim() + "';";
            if (dataOperate.execSQL(sql))
            {
                lblTip_clearWord.Text = "已全部清空！";
            }
            else
            {
                lblTip_clearWord.Text = "清空失败！";
            }
        }

        protected void btn_clear_test_Click(object sender, EventArgs e)
        {
            //清除测试记录
            String sql = "delete from TestRecord where u_name='" + Session["u_id"].ToString().Trim() + "';";
            if (dataOperate.execSQL(sql))
            {
                lblTip_clearTestRecord.Text = "已全部清除！";
            }
            else
            {
                lblTip_clearTestRecord.Text = "清除失败！";
            }
        }

        protected void btn_clearLoginRecord_Click(object sender, EventArgs e)
        {
            //清除登录记录
            String sql = "delete from LoginRecord where u_name='" + Session["u_id"].ToString().Trim() + "';";
            if (dataOperate.execSQL(sql))
            {
                lblTip_clearLoginRecord.Text = "已全部清除！";
            }
            else
            {
                lblTip_clearLoginRecord.Text = "清除失败！";
            }
        }
    }
}