using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Content_Labs : System.Web.UI.Page
{
    SqlConnection DB_Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

    string UsersDB = System.Configuration.ConfigurationManager.AppSettings["UsersDB"];
    string LabsDB = System.Configuration.ConfigurationManager.AppSettings["LabsDB"];

    protected void Page_Load(object sender, EventArgs e)
    {
        string var_id = Request.QueryString["id"];
        string action_id = Request.QueryString["action"];

        //manage page content
        if (var_id != null)
        {
            LabsList_Form.Visible = false;

            if (var_id == "new")
            {
                if (Session["teacher"] == null)
                    Response.Redirect("~/Content/Labs.aspx");

                NewLab_Form.Visible = true;
                LabsList.Visible = false;
                DisplayLab_Content.Visible = true;
            }
            else
            {
                if (Session["teacher"] != null)
                {
                    DisplayLab_AddLab.Visible = true;
                    DisplayLab_DeleteLab.Visible = true;
                    DisplayLab_AddPage.Visible = true;
                    DisplayLab_EditPage.Visible = true;
                    DisplayLab_DeletePage.Visible = true;
                }

                string SQL_SELECT = "SELECT * FROM " + LabsDB + " WHERE LabIndex=" + var_id;
                SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
                CMD_SELECT.CommandType = CommandType.Text;

                string SQL_SELECT_A = "SELECT count(*) FROM " + LabsDB + " WHERE LabIndex=" + var_id;
                SqlCommand CMD_SELECT_A = new SqlCommand(SQL_SELECT_A, DB_Connection);
                CMD_SELECT_A.CommandType = CommandType.Text;

                string SQL_SELECT_P = "SELECT LabIndex FROM " + LabsDB + " WHERE LabIndex=" + (Convert.ToInt32(var_id) - 1);
                SqlCommand CMD_SELECT_P = new SqlCommand(SQL_SELECT_P, DB_Connection);
                CMD_SELECT_P.CommandType = CommandType.Text;

                string SQL_SELECT_N = "SELECT LabIndex FROM " + LabsDB + " WHERE LabIndex=" + (Convert.ToInt32(var_id) + 1);
                SqlCommand CMD_SELECT_N = new SqlCommand(SQL_SELECT_N, DB_Connection);
                CMD_SELECT_P.CommandType = CommandType.Text;

                DB_Connection.Open();

                using (SqlDataReader Reader = CMD_SELECT.ExecuteReader())
                {
                    if (Reader.Read() && !NewLab_Form.Visible) //2nd check correct [?]
                    {
                        DisplayLab_Form.Visible = true;

                        DisplayLab_Title.Text = Reader["Title"].ToString();
                        DisplayLab_Subtitle.Text = Reader["Subtitle"].ToString();
                        DisplayLab_DataSource.SelectCommand = "SELECT Content FROM " + LabsDB + " WHERE LabIndex=" + var_id;
                    }
                }

                // disable "Delete Page" button if only 1 page found
                if (Convert.ToInt32(CMD_SELECT_A.ExecuteScalar().ToString()) < 2)
                {
                    DisplayLab_DeletePage.Enabled = false;
                    DisplayLab_DeletePage.ImageUrl = "~/Source/img/document-remove-disabled.png";
                    DisplayLab_DeletePage.ToolTip = "";
                }

                // display previous Lab button
                using (SqlDataReader Reader2 = CMD_SELECT_P.ExecuteReader())
                {
                    if (Reader2.Read() && Reader2.HasRows)
                        DisplayLab_Previous.NavigateUrl = "~/Content/Labs.aspx?id=" + Reader2["LabIndex"].ToString();
                    else
                        DisplayLab_Previous.Visible = false;

                    Reader2.Close();
                }

                // display next Lab button
                using (SqlDataReader Reader3 = CMD_SELECT_N.ExecuteReader())
                {
                    if (Reader3.Read() && Reader3.HasRows)
                        DisplayLab_Next.NavigateUrl = "~/Content/Labs.aspx?id=" + Reader3["LabIndex"].ToString();
                    else
                        DisplayLab_Next.Visible = false;

                    Reader3.Close();
                }

                LabsList.Visible = false;

                DB_Connection.Close();
            }
        }
        else //display list of Labs
        {
            //need to prevent postback callback reimplementation
            if (Page.IsPostBack)
                return;

            LabsList.Visible = true;
            Button_Return.Visible = false;

            if (Session["teacher"] == null)
            {
                LabsList.Columns[4].Visible = false;
                LabsList.ShowFooter = false;
            }

            string SQL_SELECT = "SELECT Surname, Name, LabIndex, DateCreated, Title FROM " + LabsDB + " INNER JOIN " + UsersDB + " ON " + LabsDB + ".AuthorID=" + UsersDB + ".Username WHERE Page=1";

            SqlDataAdapter da = new SqlDataAdapter(SQL_SELECT, DB_Connection);
            DataTable dt = new DataTable();

            DB_Connection.Open();

            da.Fill(dt);
            LabsList.DataSource = dt;
            LabsList.DataBind();

            DB_Connection.Close();
        }
    }

    protected void LabsList_DeleteLab(object sender, EventArgs e)
    {
        string SQL_DELETE = "DELETE FROM " + LabsDB + " WHERE LabIndex=" + ((ImageButton)sender).AlternateText;
        SqlCommand CMD_DELETE = new SqlCommand(SQL_DELETE, DB_Connection);
        CMD_DELETE.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_DELETE.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect(Request.RawUrl);
    }

    protected void DisplayLab_EditPage_Click(object sender, EventArgs e)
    {
        DisplayLab_EditPage.Enabled = false;
        DisplayLab_DataPager.Visible = false;

        NewLab_Index.Text = Request.QueryString["id"].ToString();
        NewLab_Title.Text = DisplayLab_Title.Text;
        NewLab_Subtitle.Text = DisplayLab_Subtitle.Text;

        foreach (ListViewDataItem item in DisplayLab_ListView.Items)
        {
            Label Content = (Label)item.FindControl("_content");
            CKEditor.Text = Content.Text;
            break;
        }

        NewLab_Form.Visible = true;
        NewLab_Submit.Visible = false;
        NewLab_Update.Visible = true;
        NewLab_AddPage.Visible = false;
    }

    protected void DisplayLab_AddPage_Click(object sender, EventArgs e)
    {
        NewLab_Index.Text = Request.QueryString["id"].ToString();
        NewLab_Title.Text = DisplayLab_Title.Text;
        NewLab_Subtitle.Text = DisplayLab_Subtitle.Text;

        SqlConnection DB_Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

        string SQL_SELECT = "SELECT max(Page) FROM " + LabsDB + " WHERE LabIndex=" + Request.QueryString["id"].ToString();
        SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
        CMD_SELECT.CommandType = CommandType.Text;

        DB_Connection.Open();
        ViewState["CurrentPage"] = Convert.ToInt32(CMD_SELECT.ExecuteScalar().ToString()) + 1;
        DB_Connection.Close();

        DisplayLab_Form.Visible = false;
        NewLab_Form.Visible = true;
        NewLab_Submit.Visible = false;
        NewLab_Update.Visible = false;
        NewLab_AddPage.Visible = true;
        NewLab_Index.Enabled = false;
        NewLab_Title.Enabled = false;
        NewLab_Subtitle.Enabled = false;
    }

    protected void DisplayLab_DeleteLab_Click(object sender, EventArgs e)
    {
        int LabIndex = int.Parse(Request.QueryString["id"]);

        string SQL_DELETE = "DELETE FROM " + LabsDB + " WHERE LabIndex=" + LabIndex;
        SqlCommand CMD_DELETE = new SqlCommand(SQL_DELETE, DB_Connection);
        CMD_DELETE.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_DELETE.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect("~/Content/Labs.aspx");
    }

    protected void NewLab_Submit_Click(object sender, EventArgs e)
    {
        if (NewLab_Title.Text == "" || CKEditor.Text == "")
            //show error here [?]
            return;

        string SQL_INSERT = "INSERT INTO " + LabsDB + " VALUES ('" + Session["teacher"].ToString() + "', " + NewLab_Index.Text + ", '" + DateTime.Now.Date.ToShortDateString() + "', '" + NewLab_Title.Text + "', '" + CKEditor.Text + "', '" + NewLab_Subtitle.Text + "', " + 1 + ")";
        SqlCommand CMD_INSERT = new SqlCommand(SQL_INSERT, DB_Connection);
        CMD_INSERT.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_INSERT.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect("~/Content/Labs.aspx");
    }

    protected void NewLab_Update_Click(object sender, EventArgs e)
    {
        if (ViewState["CurrentPage"] == null)
            ViewState["CurrentPage"] = 1;

        string SQL_UPDATE = "UPDATE " + LabsDB + " SET LabIndex=" + NewLab_Index.Text + ", Title='" + NewLab_Title.Text + "', Subtitle='" + NewLab_Subtitle.Text + "' WHERE LabIndex=" + Request.QueryString["id"];
        SqlCommand CMD_UPDATE = new SqlCommand(SQL_UPDATE, DB_Connection);
        CMD_UPDATE.CommandType = CommandType.Text;

        string SQL_UPDATE_2 = "UPDATE " + LabsDB + " SET Content='" + CKEditor.Text + "' WHERE LabIndex=" + Request.QueryString["id"] + " AND Page=" + ViewState["CurrentPage"].ToString();
        SqlCommand CMD_UPDATE_2 = new SqlCommand(SQL_UPDATE_2, DB_Connection);
        CMD_UPDATE_2.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_UPDATE.ExecuteNonQuery();
        CMD_UPDATE_2.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect("~/Content/Labs.aspx?id=" + NewLab_Index.Text);
    }

    protected void NewLab_AddPage_Click(object sender, EventArgs e)
    {
        if (ViewState["CurrentPage"] == null)
            return;

        string SQL_INSERT = "INSERT INTO " + LabsDB + " VALUES ('" + Session["teacher"].ToString() + "', " + NewLab_Index.Text + ", '" + DateTime.Now.Date.ToShortDateString() + "', '" + NewLab_Title.Text + "', '" + CKEditor.Text + "', '" + NewLab_Subtitle.Text + "', " + ViewState["CurrentPage"] + ")";
        SqlCommand CMD_INSERT = new SqlCommand(SQL_INSERT, DB_Connection);
        CMD_INSERT.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_INSERT.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect("~/Content/Labs.aspx?id=" + NewLab_Index.Text);
    }

    protected void DisplayLab_DeletePage_Click(object sender, ImageClickEventArgs e)
    {
        if (ViewState["CurrentPage"] == null)
            return;

        string SQL_DELETE = "DELETE FROM " + LabsDB + " WHERE LabIndex=" + Request.QueryString["id"] + " AND Page=" + ViewState["CurrentPage"];
        SqlCommand CMD_DELETE = new SqlCommand(SQL_DELETE, DB_Connection);
        CMD_DELETE.CommandType = CommandType.Text;

        string SQL_UPDATE = " UPDATE " + LabsDB + " SET Page= Page-1 WHERE LabIndex=" + Request.QueryString["id"] + " AND Page >" + ViewState["CurrentPage"];
        SqlCommand CMD_UPDATE = new SqlCommand(SQL_UPDATE, DB_Connection);
        CMD_UPDATE.CommandType = CommandType.Text;

        DB_Connection.Open();

        // delete page
        CMD_DELETE.ExecuteNonQuery();

        // recalculate page numbers for rest pages
        CMD_UPDATE.ExecuteNonQuery();

        DB_Connection.Close();
        Response.Redirect(Request.RawUrl);
    }

    protected void NewLab_Preview_Click(object sender, EventArgs e)
    {
        DisplayLab_Title.Text = NewLab_Title.Text;
        DisplayLab_Subtitle.Text = NewLab_Subtitle.Text;

        if (Request.QueryString["id"] != "new")
        {
            foreach (ListViewDataItem item in DisplayLab_ListView.Items)
            {
                Label Content = (Label)item.FindControl("_content");
                Content.Text = CKEditor.Text;
            }
        }
        else
            DisplayLab_Content.Text = CKEditor.Text;

        DisplayLab_Form.Visible = true;
        DisplayLab_DataPager.Visible = false;
    }

    protected void DisplayLab_ListView_DataBound(object sender, EventArgs e)
    {
        if (Request.QueryString["action"] == "edit")
        {
            foreach (ListViewDataItem item in DisplayLab_ListView.Items)
            {
                Label Content = (Label)item.FindControl("_content");
                CKEditor.Text = Content.Text;
                break;
            }
        }
    }

    protected void DisplayLab_ListView_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        ViewState["CurrentPage"] = (e.StartRowIndex / e.MaximumRows) + 1;
    }
}