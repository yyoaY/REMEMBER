using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NEWS
{
    public partial class Register : System.Web.UI.Page
    {
        //用户名
        String uName;
        //密码
        String uPwd;
        //出生日期
        DateTime birth;
        //性别
        String uGender;
        //邮箱
        String uMail;
        //学校
        String uSchool;
        //专业
        String uMajor;
        //故乡
        String uHome;
        protected void Page_Load(object sender, EventArgs e)
        {
            Init();
        }
        private void Init()
        {
            InitBirth();
            InitSchool();
            InitMajor();
        }
        private void InitBirth()//出生日期
        {
            for (int i = 1980; i <= 2018; i++)
            {
                ddlYear.Items.Add("" + i);
            }
            for (int i = 1; i <= 12; i++)
            {
                ddlMonth.Items.Add("" + i);
            }
            for (int i = 1; i <= 31; i++)
            {
                ddlDay.Items.Add("" + i);
            }
        }

        private void InitSchool()//学校
        {
            ddlSchool.Items.Add("浙江传媒学院");
            ddlSchool.Items.Add("杭州电子科技大学");
            ddlSchool.Items.Add("中国计量大学");
            ddlSchool.Items.Add("浙江理工大学");
        }


        private void InitMajor()//专业
        {
            ddlMajor.Items.Add("计算机");
            ddlMajor.Items.Add("文学");
            ddlMajor.Items.Add("新闻");
            ddlMajor.Items.Add("电子信息");
            ddlMajor.Items.Add("英语");
            ddlMajor.Items.Add("哲学");
            ddlMajor.Items.Add("心理学");
            ddlMajor.Items.Add("服装");
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            //保存注册信息session -》 为登陆界面的自填充

            //获得页面数据
            getCurrentPageData();

            //验证用户名未有
            bool a = CheckNameUnique();
            if (!a)
            {
                u_name_tip.Text = "*此用户名已被注册";
                return;
            }
            //录入数据库
            String sql = "";

            //信息安全表插入一条记录
            sql = "insert into users(u_name,u_pwd,birth,gender,mail,school,major,home,date) values('" + uName + "','" + uPwd.GetHashCode() + "','" + birth + "','" + uGender + "','" + uMail + "','" + uSchool + "','" + uMajor + "','" + uHome + "','" + DateTime.Now + "');";
            dataOperate.execSQL(sql);


            //跳转页面-》登陆界面
            Response.Redirect("Login.aspx");
        }

        private bool CheckNameUnique()
        {
            String sql = "select * from users where u_name='" + uName +"'";
            SqlDataReader Dr = dataOperate.getRow(sql);
            if (Dr.Read())
            {
                return false;
            }
            return true;
        }

        private void getCurrentPageData()
        {
            
            //用户名
            uName = u_name.Text.Trim();
            //密码
            uPwd = u_pwd.Text.Trim();
            //出生日期
            int year = Convert.ToInt32(ddlYear.Text.Trim());
            int month = Convert.ToInt32(ddlMonth.Text.Trim());
            int day = Convert.ToInt32(ddlDay.Text.Trim());
            birth = new DateTime(year, month, day);
            //性别
            if (rb_man.Checked) uGender = "男";
            else if (rb_female.Checked) uGender = "女";
            //邮箱
            uMail = mail.Text.Trim();
            //学校
            uSchool = ddlSchool.SelectedItem.Text.Trim();
            //专业
            uMajor = ddlMajor.SelectedItem.Text.Trim();
            //故乡
            uHome = home.Text.Trim();
        }

    }
}