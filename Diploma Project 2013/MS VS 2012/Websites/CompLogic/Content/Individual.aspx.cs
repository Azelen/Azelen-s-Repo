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

public partial class Content_Individuals : System.Web.UI.Page
{
    SqlConnection DB_Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

    string UsersDB = System.Configuration.ConfigurationManager.AppSettings["UsersDB"];
    string IndividualsDB = System.Configuration.ConfigurationManager.AppSettings["IndividualsDB"];

    protected void Page_Load(object sender, EventArgs e)
    {
        string var_id = Request.QueryString["id"];
        string action_id = Request.QueryString["action"];

        //manage page content
        if (var_id != null)
        {
            IndividualsList_Form.Visible = false;

            if (var_id == "new")
            {
                if (Session["teacher"] == null)
                    Response.Redirect("~/Content/Individual.aspx");

                NewIndividual_Form.Visible = true;
                IndividualsList.Visible = false;
                DisplayIndividual_Content.Visible = true;
            }
            else
            {
                if (Session["teacher"] != null)
                {
                    DisplayIndividual_AddIndividual.Visible = true;
                    DisplayIndividual_DeleteIndividual.Visible = true;
                    DisplayIndividual_AddPage.Visible = true;
                    DisplayIndividual_EditPage.Visible = true;
                    DisplayIndividual_DeletePage.Visible = true;
                }

                string SQL_SELECT = "SELECT * FROM " + IndividualsDB + " WHERE IndividualIndex=" + var_id;
                SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
                CMD_SELECT.CommandType = CommandType.Text;

                string SQL_SELECT_A = "SELECT count(*) FROM " + IndividualsDB + " WHERE IndividualIndex=" + var_id;
                SqlCommand CMD_SELECT_A = new SqlCommand(SQL_SELECT_A, DB_Connection);
                CMD_SELECT_A.CommandType = CommandType.Text;

                string SQL_SELECT_P = "SELECT IndividualIndex FROM " + IndividualsDB + " WHERE IndividualIndex=" + (Convert.ToInt32(var_id) - 1);
                SqlCommand CMD_SELECT_P = new SqlCommand(SQL_SELECT_P, DB_Connection);
                CMD_SELECT_P.CommandType = CommandType.Text;

                string SQL_SELECT_N = "SELECT IndividualIndex FROM " + IndividualsDB + " WHERE IndividualIndex=" + (Convert.ToInt32(var_id) + 1);
                SqlCommand CMD_SELECT_N = new SqlCommand(SQL_SELECT_N, DB_Connection);
                CMD_SELECT_P.CommandType = CommandType.Text;

                DB_Connection.Open();

                using (SqlDataReader Reader = CMD_SELECT.ExecuteReader())
                {
                    if (Reader.Read() && !NewIndividual_Form.Visible) //2nd check correct [?]
                    {
                        DisplayIndividual_Form.Visible = true;

                        DisplayIndividual_Title.Text = Reader["Title"].ToString();
                        DisplayIndividual_DataSource.SelectCommand = "SELECT Content FROM " + IndividualsDB + " WHERE IndividualIndex=" + var_id;
                    }
                }

                // disable "Delete Page" button if only 1 page found
                if (Convert.ToInt32(CMD_SELECT_A.ExecuteScalar().ToString()) < 2)
                {
                    DisplayIndividual_DeletePage.Enabled = false;
                    DisplayIndividual_DeletePage.ImageUrl = "~/Source/img/document-remove-disabled.png";
                    DisplayIndividual_DeletePage.ToolTip = "";
                }

                // display previous Individual button
                using (SqlDataReader Reader2 = CMD_SELECT_P.ExecuteReader())
                {
                    if (Reader2.Read() && Reader2.HasRows)
                        DisplayIndividual_Previous.NavigateUrl = "~/Content/Individual.aspx?id=" + Reader2["IndividualIndex"].ToString();
                    else
                        DisplayIndividual_Previous.Visible = false;

                    Reader2.Close();
                }

                // display next Individual button
                using (SqlDataReader Reader3 = CMD_SELECT_N.ExecuteReader())
                {
                    if (Reader3.Read() && Reader3.HasRows)
                        DisplayIndividual_Next.NavigateUrl = "~/Content/Individual.aspx?id=" + Reader3["IndividualIndex"].ToString();
                    else
                        DisplayIndividual_Next.Visible = false;

                    Reader3.Close();
                }

                IndividualsList.Visible = false;

                DB_Connection.Close();
            }
        }
        else //display list of Individuals
        {
            //need to prevent postback callback reimplementation
            if (Page.IsPostBack)
                return;

            IndividualsList.Visible = true;
            Button_Return.Visible = false;

            if (Session["teacher"] == null)
            {
                IndividualsList.Columns[4].Visible = false;
                IndividualsList.ShowFooter = false;
            }

            string SQL_SELECT = "SELECT Surname, Name, IndividualIndex, DateCreated, Title FROM " + IndividualsDB + " INNER JOIN " + UsersDB + " ON " + IndividualsDB + ".AuthorID=" + UsersDB + ".Username WHERE Page=1";

            SqlDataAdapter da = new SqlDataAdapter(SQL_SELECT, DB_Connection);
            DataTable dt = new DataTable();

            DB_Connection.Open();

            da.Fill(dt);
            IndividualsList.DataSource = dt;
            IndividualsList.DataBind();

            DB_Connection.Close();
        }
    }

    protected void IndividualsList_DeleteIndividual(object sender, EventArgs e)
    {
        string SQL_DELETE = "DELETE FROM " + IndividualsDB + " WHERE IndividualIndex=" + ((ImageButton)sender).AlternateText;
        SqlCommand CMD_DELETE = new SqlCommand(SQL_DELETE, DB_Connection);
        CMD_DELETE.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_DELETE.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect(Request.RawUrl);
    }

    protected void DisplayIndividual_EditPage_Click(object sender, EventArgs e)
    {
        DisplayIndividual_EditPage.Enabled = false;
        DisplayIndividual_DataPager.Visible = false;

        NewIndividual_Index.Text = Request.QueryString["id"].ToString();
        NewIndividual_Title.Text = DisplayIndividual_Title.Text;

        foreach (ListViewDataItem item in DisplayIndividual_ListView.Items)
        {
            Label Content = (Label)item.FindControl("_content");
            CKEditor.Text = Content.Text;
            break;
        }

        NewIndividual_Form.Visible = true;
        NewIndividual_Submit.Visible = false;
        NewIndividual_Update.Visible = true;
        NewIndividual_AddPage.Visible = false;
    }

    protected void DisplayIndividual_AddPage_Click(object sender, EventArgs e)
    {
        NewIndividual_Index.Text = Request.QueryString["id"].ToString();
        NewIndividual_Title.Text = DisplayIndividual_Title.Text;

        SqlConnection DB_Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

        string SQL_SELECT = "SELECT max(Page) FROM " + IndividualsDB + " WHERE IndividualIndex=" + Request.QueryString["id"].ToString();
        SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
        CMD_SELECT.CommandType = CommandType.Text;

        DB_Connection.Open();
        ViewState["CurrentPage"] = Convert.ToInt32(CMD_SELECT.ExecuteScalar().ToString()) + 1;
        DB_Connection.Close();

        DisplayIndividual_Form.Visible = false;
        NewIndividual_Form.Visible = true;
        NewIndividual_Submit.Visible = false;
        NewIndividual_Update.Visible = false;
        NewIndividual_AddPage.Visible = true;
        NewIndividual_Index.Enabled = false;
        NewIndividual_Title.Enabled = false;
    }

    protected void DisplayIndividual_DeleteIndividual_Click(object sender, EventArgs e)
    {
        int IndividualIndex = int.Parse(Request.QueryString["id"]);

        string SQL_DELETE = "DELETE FROM " + IndividualsDB + " WHERE IndividualIndex=" + IndividualIndex;
        SqlCommand CMD_DELETE = new SqlCommand(SQL_DELETE, DB_Connection);
        CMD_DELETE.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_DELETE.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect("~/Content/Individual.aspx");
    }

    protected void NewIndividual_Submit_Click(object sender, EventArgs e)
    {
        if (NewIndividual_Title.Text == "" || CKEditor.Text == "")
            //show error here [?]
            return;

        string SQL_INSERT = "INSERT INTO " + IndividualsDB + " VALUES ('" + Session["teacher"].ToString() + "', " + NewIndividual_Index.Text + ", '" + DateTime.Now.Date.ToShortDateString() + "', '" + NewIndividual_Title.Text + "', '" + CKEditor.Text + "', " + 1 + ")";
        SqlCommand CMD_INSERT = new SqlCommand(SQL_INSERT, DB_Connection);
        CMD_INSERT.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_INSERT.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect("~/Content/Individual.aspx");
    }

    protected void NewIndividual_Update_Click(object sender, EventArgs e)
    {
        if (ViewState["CurrentPage"] == null)
            ViewState["CurrentPage"] = 1;

        string SQL_UPDATE = "UPDATE " + IndividualsDB + " SET IndividualIndex=" + NewIndividual_Index.Text + ", Title='" + NewIndividual_Title.Text + "' WHERE IndividualIndex=" + Request.QueryString["id"];
        SqlCommand CMD_UPDATE = new SqlCommand(SQL_UPDATE, DB_Connection);
        CMD_UPDATE.CommandType = CommandType.Text;

        string SQL_UPDATE_2 = "UPDATE " + IndividualsDB + " SET Content='" + CKEditor.Text + "' WHERE IndividualIndex=" + Request.QueryString["id"] + " AND Page=" + ViewState["CurrentPage"].ToString();
        SqlCommand CMD_UPDATE_2 = new SqlCommand(SQL_UPDATE_2, DB_Connection);
        CMD_UPDATE_2.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_UPDATE.ExecuteNonQuery();
        CMD_UPDATE_2.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect("~/Content/Individual.aspx?id=" + NewIndividual_Index.Text);
    }

    protected void NewIndividual_AddPage_Click(object sender, EventArgs e)
    {
        if (ViewState["CurrentPage"] == null)
            return;

        string SQL_INSERT = "INSERT INTO " + IndividualsDB + " VALUES ('" + Session["teacher"].ToString() + "', " + NewIndividual_Index.Text + ", '" + DateTime.Now.Date.ToShortDateString() + "', '" + NewIndividual_Title.Text + "', '" + CKEditor.Text + "', " + ViewState["CurrentPage"] + ")";
        SqlCommand CMD_INSERT = new SqlCommand(SQL_INSERT, DB_Connection);
        CMD_INSERT.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_INSERT.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect("~/Content/Individual.aspx?id=" + NewIndividual_Index.Text);
    }

    protected void DisplayIndividual_DeletePage_Click(object sender, ImageClickEventArgs e)
    {
        if (ViewState["CurrentPage"] == null)
            return;

        string SQL_DELETE = "DELETE FROM " + IndividualsDB + " WHERE IndividualIndex=" + Request.QueryString["id"] + " AND Page=" + ViewState["CurrentPage"];
        SqlCommand CMD_DELETE = new SqlCommand(SQL_DELETE, DB_Connection);
        CMD_DELETE.CommandType = CommandType.Text;

        string SQL_UPDATE = " UPDATE " + IndividualsDB + " SET Page= Page-1 WHERE IndividualIndex=" + Request.QueryString["id"] + " AND Page >" + ViewState["CurrentPage"];
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

    protected void NewIndividual_Preview_Click(object sender, EventArgs e)
    {
        DisplayIndividual_Title.Text = NewIndividual_Title.Text;

        if (Request.QueryString["id"] != "new")
        {
            foreach (ListViewDataItem item in DisplayIndividual_ListView.Items)
            {
                Label Content = (Label)item.FindControl("_content");
                Content.Text = CKEditor.Text;
            }
        }
        else
            DisplayIndividual_Content.Text = CKEditor.Text;

        DisplayIndividual_Form.Visible = true;
        DisplayIndividual_DataPager.Visible = false;
    }

    protected void DisplayIndividual_ListView_DataBound(object sender, EventArgs e)
    {
        if (Request.QueryString["action"] == "edit")
        {
            foreach (ListViewDataItem item in DisplayIndividual_ListView.Items)
            {
                Label Content = (Label)item.FindControl("_content");
                CKEditor.Text = Content.Text;
                break;
            }
        }
    }

    protected void DisplayIndividual_ListView_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        ViewState["CurrentPage"] = (e.StartRowIndex / e.MaximumRows) + 1;
    }
}