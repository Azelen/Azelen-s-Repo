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

public partial class Content_Lessons : System.Web.UI.Page
{
    SqlConnection DB_Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

    string UsersDB = System.Configuration.ConfigurationManager.AppSettings["UsersDB"];
    string LessonsDB = System.Configuration.ConfigurationManager.AppSettings["LessonsDB"];

    protected void Page_Load(object sender, EventArgs e)
    {
        string var_id = Request.QueryString["id"];
        string action_id = Request.QueryString["action"];

        //manage page content
        if (var_id != null)
        {
            LessonsList_Form.Visible = false;

            if (var_id == "new")
            {
                if (Session["teacher"] == null)
                    Response.Redirect("~/Content/Lessons.aspx");

                NewLesson_Form.Visible = true;
                LessonsList.Visible = false;
                DisplayLesson_Content.Visible = true;
            }
            else
            {
                if (Session["teacher"] != null)
                {
                    DisplayLesson_AddLesson.Visible = true;
                    DisplayLesson_EditPage.Visible = true;
                    DisplayLesson_DeleteLesson.Visible = true;
                    DisplayLesson_AddPage.Visible = true;
                    DisplayLesson_DeletePage.Visible = true;
                }

                string SQL_SELECT = "SELECT LessonIndex,Title,Subtitle,Content,Page FROM " + LessonsDB + " WHERE LessonIndex=" + var_id;
                SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
                CMD_SELECT.CommandType = CommandType.Text;

                string SQL_SELECT_A = "SELECT count(*) FROM " + LessonsDB + " WHERE LessonIndex=" + var_id;
                SqlCommand CMD_SELECT_A = new SqlCommand(SQL_SELECT_A, DB_Connection);
                CMD_SELECT_A.CommandType = CommandType.Text;

                string SQL_SELECT_P = "SELECT LessonIndex FROM " + LessonsDB + " WHERE LessonIndex=" + (Convert.ToInt32(var_id) - 1);
                SqlCommand CMD_SELECT_P = new SqlCommand(SQL_SELECT_P, DB_Connection);
                CMD_SELECT_P.CommandType = CommandType.Text;

                string SQL_SELECT_N = "SELECT LessonIndex FROM " + LessonsDB + " WHERE LessonIndex=" + (Convert.ToInt32(var_id) + 1);
                SqlCommand CMD_SELECT_N = new SqlCommand(SQL_SELECT_N, DB_Connection);
                CMD_SELECT_P.CommandType = CommandType.Text;

                DB_Connection.Open();

                using (SqlDataReader Reader = CMD_SELECT.ExecuteReader())
                {
                    if (Reader.Read() && !NewLesson_Form.Visible) //2nd check correct [?]
                    {
                        DisplayLesson_Form.Visible = true;

                        DisplayLesson_Title.Text = Reader["Title"].ToString();
                        DisplayLesson_Subtitle.Text = Reader["Subtitle"].ToString();
                        DisplayLesson_DataSource.SelectCommand = "SELECT Content FROM " + LessonsDB + " WHERE LessonIndex=" + var_id;
                    }
                }

                // disable "Delete Page" button if only 1 page found
                if (Convert.ToInt32(CMD_SELECT_A.ExecuteScalar().ToString()) < 2)
                {
                    DisplayLesson_DeletePage.Enabled = false;
                    DisplayLesson_DeletePage.ImageUrl = "~/Source/img/document-remove-disabled.png";
                    DisplayLesson_DeletePage.ToolTip = "";
                }

                // display previous Lesson button
                using (SqlDataReader Reader2 = CMD_SELECT_P.ExecuteReader())
                {
                    if (Reader2.Read() && Reader2.HasRows)
                        DisplayLesson_Previous.NavigateUrl = "~/Content/Lessons.aspx?id=" + Reader2["LessonIndex"].ToString();
                    else
                        DisplayLesson_Previous.Visible = false;

                    Reader2.Close();
                }

                // display next Lesson button
                using (SqlDataReader Reader3 = CMD_SELECT_N.ExecuteReader())
                {
                    if (Reader3.Read() && Reader3.HasRows)
                        DisplayLesson_Next.NavigateUrl = "~/Content/Lessons.aspx?id=" + Reader3["LessonIndex"].ToString();
                    else
                        DisplayLesson_Next.Visible = false;

                    Reader3.Close();
                }

                LessonsList.Visible = false;

                DB_Connection.Close();
            }
        }
        else //display list of Lessons
        {
            //need to prevent postback callback reimplementation
            if (Page.IsPostBack)
                return;

            LessonsList.Visible = true;
            Button_Return.Visible = false;

            if (Session["teacher"] == null)
            {
                LessonsList.Columns[4].Visible = false;
                LessonsList.ShowFooter = false;
            }

            string SQL_SELECT = "SELECT Surname, Name, LessonIndex, DateCreated, Title FROM " + LessonsDB + " INNER JOIN " + UsersDB + " ON " + LessonsDB + ".AuthorID=" + UsersDB + ".Username WHERE Page=1";

            SqlDataAdapter da = new SqlDataAdapter(SQL_SELECT, DB_Connection);
            DataTable dt = new DataTable();

            DB_Connection.Open();

            da.Fill(dt);
            LessonsList.DataSource = dt;
            LessonsList.DataBind();

            DB_Connection.Close();
        }
    }

    protected void LessonsList_DeleteLesson(object sender, EventArgs e)
    {
        string SQL_DELETE = "DELETE FROM " + LessonsDB + " WHERE LessonIndex=" + ((ImageButton)sender).AlternateText;
        SqlCommand CMD_DELETE = new SqlCommand(SQL_DELETE, DB_Connection);
        CMD_DELETE.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_DELETE.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect(Request.RawUrl);
    }

    protected void DisplayLesson_EditPage_Click(object sender, EventArgs e)
    {
        DisplayLesson_EditPage.Enabled = false;
        DisplayLesson_DataPager.Visible = false;

        NewLesson_Index.Text = Request.QueryString["id"].ToString();
        NewLesson_Title.Text = DisplayLesson_Title.Text;
        NewLesson_Subtitle.Text = DisplayLesson_Subtitle.Text;

        foreach (ListViewDataItem item in DisplayLesson_ListView.Items)
        {
            Label Content = (Label)item.FindControl("_content");
            CKEditor.Text = Content.Text;
            break;
        }

        NewLesson_Form.Visible = true;
        NewLesson_Submit.Visible = false;
        NewLesson_Update.Visible = true;
        NewLesson_AddPage.Visible = false;
    }

    protected void DisplayLesson_AddPage_Click(object sender, EventArgs e)
    {
        NewLesson_Index.Text = Request.QueryString["id"].ToString();
        NewLesson_Title.Text = DisplayLesson_Title.Text;
        NewLesson_Subtitle.Text = DisplayLesson_Subtitle.Text;

        SqlConnection DB_Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

        string SQL_SELECT = "SELECT max(Page) FROM " + LessonsDB + " WHERE LessonIndex=" + Request.QueryString["id"].ToString();
        SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
        CMD_SELECT.CommandType = CommandType.Text;

        DB_Connection.Open();
        ViewState["CurrentPage"] = Convert.ToInt32(CMD_SELECT.ExecuteScalar().ToString()) + 1;
        DB_Connection.Close();

        DisplayLesson_Form.Visible = false;
        NewLesson_Form.Visible = true;
        NewLesson_Submit.Visible = false;
        NewLesson_Update.Visible = false;
        NewLesson_AddPage.Visible = true;
        NewLesson_Index.Enabled = false;
        NewLesson_Title.Enabled = false;
        NewLesson_Subtitle.Enabled = false;
    }

    protected void DisplayLesson_DeleteLesson_Click(object sender, EventArgs e)
    {
        int LessonIndex = int.Parse(Request.QueryString["id"]);

        string SQL_DELETE = "DELETE FROM " + LessonsDB + " WHERE LessonIndex=" + LessonIndex;
        SqlCommand CMD_DELETE = new SqlCommand(SQL_DELETE, DB_Connection);
        CMD_DELETE.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_DELETE.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect("~/Content/Lessons.aspx");
    }

    protected void NewLesson_Submit_Click(object sender, EventArgs e)
    {
        if (NewLesson_Title.Text == "" || CKEditor.Text == "")
            //show error here [?]
            return;

        string SQL_INSERT = "INSERT INTO " + LessonsDB + " VALUES ('" + Session["teacher"].ToString() + "', " + NewLesson_Index.Text + ", '" + DateTime.Now.Date.ToShortDateString() + "', '" + NewLesson_Title.Text + "', '" + CKEditor.Text + "', '" + NewLesson_Subtitle.Text + "', " + 1 + ")";
        SqlCommand CMD_INSERT = new SqlCommand(SQL_INSERT, DB_Connection);
        CMD_INSERT.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_INSERT.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect("~/Content/Lessons.aspx");
    }

    protected void NewLesson_Update_Click(object sender, EventArgs e)
    {
        if (ViewState["CurrentPage"] == null)
            ViewState["CurrentPage"] = 1;

        string SQL_UPDATE = "UPDATE " + LessonsDB + " SET LessonIndex=" + NewLesson_Index.Text + ", Title='" + NewLesson_Title.Text + "', Subtitle='" + NewLesson_Subtitle.Text + "' WHERE LessonIndex=" + Request.QueryString["id"];
        SqlCommand CMD_UPDATE = new SqlCommand(SQL_UPDATE, DB_Connection);
        CMD_UPDATE.CommandType = CommandType.Text;

        string SQL_UPDATE_2 = "UPDATE " + LessonsDB + " SET Content='" + CKEditor.Text + "' WHERE LessonIndex=" + Request.QueryString["id"] + " AND Page=" + ViewState["CurrentPage"].ToString();
        SqlCommand CMD_UPDATE_2 = new SqlCommand(SQL_UPDATE_2, DB_Connection);
        CMD_UPDATE_2.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_UPDATE.ExecuteNonQuery();
        CMD_UPDATE_2.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect("~/Content/Lessons.aspx?id=" + NewLesson_Index.Text);
    }

    protected void NewLesson_AddPage_Click(object sender, EventArgs e)
    {
        if (ViewState["CurrentPage"] == null)
            return;

        string SQL_INSERT = "INSERT INTO " + LessonsDB + " VALUES ('" + Session["teacher"].ToString() + "', " + NewLesson_Index.Text + ", '" + DateTime.Now.Date.ToShortDateString() + "', '" + NewLesson_Title.Text + "', '" + CKEditor.Text + "', '" + NewLesson_Subtitle.Text + "', " + ViewState["CurrentPage"] + ")";
        SqlCommand CMD_INSERT = new SqlCommand(SQL_INSERT, DB_Connection);
        CMD_INSERT.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_INSERT.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect("~/Content/Lessons.aspx?id=" + NewLesson_Index.Text);
    }

    protected void DisplayLesson_DeletePage_Click(object sender, ImageClickEventArgs e)
    {
        if (ViewState["CurrentPage"] == null)
            ViewState["CurrentPage"] = 1;

        string SQL_DELETE = "DELETE FROM " + LessonsDB + " WHERE LessonIndex=" + Request.QueryString["id"] + " AND Page=" + ViewState["CurrentPage"];
        SqlCommand CMD_DELETE = new SqlCommand(SQL_DELETE, DB_Connection);
        CMD_DELETE.CommandType = CommandType.Text;

        string SQL_UPDATE = " UPDATE " + LessonsDB + " SET Page= Page-1 WHERE LessonIndex=" + Request.QueryString["id"] + " AND Page >" + ViewState["CurrentPage"];
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

    protected void NewLesson_Preview_Click(object sender, EventArgs e)
    {
        DisplayLesson_Title.Text = NewLesson_Title.Text;
        DisplayLesson_Subtitle.Text = NewLesson_Subtitle.Text;

        if (Request.QueryString["id"] != "new")
        {
            foreach (ListViewDataItem item in DisplayLesson_ListView.Items)
            {
                Label Content = (Label)item.FindControl("_content");
                Content.Text = CKEditor.Text;
            }
        }
        else
            DisplayLesson_Content.Text = CKEditor.Text;

        DisplayLesson_Form.Visible = true;
        DisplayLesson_DataPager.Visible = false;
    }

    protected void DisplayLesson_ListView_DataBound(object sender, EventArgs e)
    {
        if (Request.QueryString["action"] == "edit")
        {
            foreach (ListViewDataItem item in DisplayLesson_ListView.Items)
            {
                Label Content = (Label)item.FindControl("_content");
                CKEditor.Text = Content.Text;
                break;
            }
        }
    }

    protected void DisplayLesson_ListView_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        ViewState["CurrentPage"] = (e.StartRowIndex / e.MaximumRows) + 1;
    }
}