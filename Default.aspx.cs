using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TestWork0514
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dropKey.Items.Add(new ListItem("学号", "sid"));
                dropKey.Items.Add(new ListItem("姓名", "sname"));
                dropKey.Items.Add(new ListItem("班级", "sclass"));
            }

        }
        protected void btnQuery_Click(object sender, EventArgs e)
        {
            if (txtKey.Text.Trim() == "")
            {
                //若用户设有输入查询关键字,弹出提示信息框"查询关键字不能为空!"
                ClientScript.RegisterStartupScript(GetType(), "Waring", "<script>alert('查询关键字不能为空!')</script>");
                return;
            }

            SqlDataSource1.FilterExpression = dropKey.SelectedValue + " like'%" + txtKey.Text.Trim() + "%'";
            //获取当前筛选出的记录数
            int num = ((DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty)).Count;
            if (num == 0)
            {
                //若符合条件的记录数为0,弹出提示信息框"未找到符合条件的记录!"
                ClientScript.RegisterStartupScript(GetType(), "Warning", "<script>alert('未找到符合条件的记录!')</script>");
            }
        }

        //"显示全部"按钮被单击执行的事件处理代码如下
        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            GridView1.DataSourceID = "SqlDataSource1";  //设置SqlDataSource1为GridView1的数据源
            GridView1.DataBind();                       //重新绑定数据源
        }

    }
}