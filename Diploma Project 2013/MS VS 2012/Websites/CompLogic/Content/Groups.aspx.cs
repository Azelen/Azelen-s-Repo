using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Content_Groups : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
            return;

        if (Session["student"] != null || Session["teacher"] != null)
        {
            SqlConnection DB_Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

            string UsersDB = System.Configuration.ConfigurationManager.AppSettings["UsersDB"];
            string GroupsDB = System.Configuration.ConfigurationManager.AppSettings["GroupsDB"];

            string SQL_SELECT = "SELECT * FROM " + GroupsDB + " ORDER BY GroupName";
            SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
            CMD_SELECT.CommandType = CommandType.Text;

            string SQL_SELECT_2 = "SELECT GroupID FROM " + UsersDB + " WHERE Username='" + ((Session["student"] != null) ? Session["student"].ToString() : Session["teacher"].ToString()) + "'";
            SqlCommand CMD_SELECT_2 = new SqlCommand(SQL_SELECT_2, DB_Connection);
            CMD_SELECT_2.CommandType = CommandType.Text;

            //fill Sel_Groups
            if (Session["teacher"] != null)
            {
                DB_Connection.Open();
                SqlDataAdapter DAdapter = new SqlDataAdapter(CMD_SELECT);
                DataTable DTable = new DataTable();
                DAdapter.Fill(DTable);
                CMD_SELECT.Dispose();
                Sel_Group.DataSource = DTable;
                Sel_Group.DataTextField = "GroupName";
                Sel_Group.DataValueField = "GroupID";
                Sel_Group.DataBind();
                Sel_Group.Items.Insert(0, new ListItem("Не вказано", "0"));
                DB_Connection.Close();
            }

            //fill List of Students
            if (Request.QueryString["id"] != null)
            {
                if (Session["student"] != null)
                {
                    Sel_Group.Visible = false;
                    DB_Connection.Open();

                    using (SqlDataReader Reader = CMD_SELECT_2.ExecuteReader())
                    {
                        if (Reader.Read())
                        {
                            if (Request.QueryString["id"] == Reader["GroupID"].ToString())
                                DisplayGroupList(Request.QueryString["id"]);
                            else
                                Response.Redirect("~/Content/Groups.aspx?id=" + Reader["GroupID"].ToString());
                        }
                    }
                }
                else //session teacher
                {
                    Sel_Group.SelectedValue = Request.QueryString["id"].ToString();
                    DisplayGroupList(Request.QueryString["id"]);
                }
            }
            else //id = 0
            {
                if (Session["student"] != null)
                {
                    DB_Connection.Open();

                    using (SqlDataReader Reader = CMD_SELECT_2.ExecuteReader())
                    {
                        if (Reader.Read())
                            Response.Redirect("~/Content/Groups.aspx?id=" + Reader["GroupID"].ToString());
                    }

                    DB_Connection.Close();
                }
                else //session teacher
                {
                    Sel_Group.Visible = true;
                }
            }
        }
        else
            Response.Redirect("~/Content/Login.aspx?url=" + Request.RawUrl);
    }

    private void DisplayGroupList(string id)
    {
        SqlConnection DB_Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

        string UsersDB = System.Configuration.ConfigurationManager.AppSettings["UsersDB"];

        string SQL_SELECT = "SELECT Username, Surname, Name FROM " + UsersDB + " WHERE GroupID=" + id + " ORDER BY Surname, Name";
        SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
        CMD_SELECT.CommandType = CommandType.Text;

        DB_Connection.Open();

        using (SqlDataReader Reader = CMD_SELECT.ExecuteReader())
        {
            while (Reader.Read())
            {
                TableRow row = new TableRow();

                TableCell cell0 = new TableCell();
                cell0.Text = Students_List.Rows.Count.ToString();

                TableCell cell1 = new TableCell();
                HyperLink link = new HyperLink();
                link.ID = "link_" + Reader["Username"].ToString();
                link.Text = Reader["Surname"].ToString() + " " + Reader["Name"].ToString();
                link.NavigateUrl = "~/Content/Users.aspx?id=" + Reader["Username"].ToString().ToLower();

                cell1.Controls.Add(link);
                row.Cells.Add(cell0);
                row.Cells.Add(cell1);
                Students_List.Rows.Add(row);
            }

            Students_List.Caption = "Користувачів в групі: " + (Students_List.Rows.Count - 1).ToString();
        }

        DB_Connection.Close();
    }

    protected void Sel_Group_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/Content/Groups.aspx?id=" + Sel_Group.SelectedValue);
    }
}