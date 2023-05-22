<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TestWork0514.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <style>
        *{
            text-align:center
        }
        a:link{
            color:#0000FF;
            font-family:'Times New Roman', Times, serif;
        }
        a:visited{
            color:#0000FF;
        }
        a:hover {
            color: #FF0000;
            text-decoration: none;
        }
        .gridviewDiv{
            margin:auto;
            width:554px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <h1>成绩查询</h1>

            关键字类型:<asp:DropDownList ID="dropKey" runat="server"></asp:DropDownList>
            <asp:TextBox ID="txtKey" runat="server"></asp:TextBox>
            <asp:Button ID="btnQuery" runat="server" Text="查询" OnClick="btnQuery_Click" />
            <asp:Button ID="btnShowAll" runat="server" Text="显示全部" OnClick="btnShowAll_Click" />
            <div class ="gridviewDiv">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="sid" 
                    DataSourceID="SqlDataSource1" Width="554px">
                    <Columns>
                        <asp:BoundField DataField="sid" HeaderText="学号" ReadOnly="True" SortExpression="sid" />
                        <asp:BoundField DataField="sname" HeaderText="姓名" SortExpression="sname" />
                        <asp:BoundField DataField="ssex" HeaderText="性别" SortExpression="ssex" />
                        <asp:BoundField DataField="sclass" HeaderText="班级" SortExpression="sclass" />
                        <asp:BoundField DataField="smath" HeaderText="数学" SortExpression="smath" />
                        <asp:BoundField DataField="sch" HeaderText="语文" SortExpression="sch" />
                        <asp:BoundField DataField="sen" HeaderText="英语" SortExpression="sen" />
                        <asp:BoundField DataField="总分" HeaderText="总分" ReadOnly="True" SortExpression="总分" />
                    </Columns>
                    <RowStyle Height="27px" />
                    <HeaderStyle Height="27px" BackColor="#c0c0c0" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT sid, sname, ssex, sclass, smath, sch, sen, sscore 总分 FROM grade"></asp:SqlDataSource>
            </div>

        </div>
    </form>
</body>
</html>
