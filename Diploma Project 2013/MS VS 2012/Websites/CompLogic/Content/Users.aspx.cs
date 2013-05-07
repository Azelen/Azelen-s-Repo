using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Content_Users : System.Web.UI.Page
{
    SqlConnection DB_Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

    string UsersDB = System.Configuration.ConfigurationManager.AppSettings["UsersDB"];
    string GroupsDB = System.Configuration.ConfigurationManager.AppSettings["GroupsDB"];
             
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["student"] != null || Session["teacher"] != null)
        {
            if (Request.QueryString["id"] != null)
            {
                int ViewerGroupID = 0;

                // select GroupID of viewing user
                string Viewer = Session["teacher"] != null ? Session["teacher"].ToString() : Session["student"].ToString();
                string SQL_SELECT = "SELECT GroupID FROM " + UsersDB + " WHERE Username='" + Viewer + "'";
                SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
                CMD_SELECT.CommandType = CommandType.Text;

                // select all data of viewed user
                string Viewed = Request.QueryString["id"];
                string SQL_SELECT_2 = "SELECT Username, Email, LastLogin, Gender, " + UsersDB + ".GroupID, Surname, Name, ShowEmailTo, GroupName FROM " + UsersDB + " INNER JOIN " + GroupsDB + " ON " + UsersDB + ".GroupID=" + GroupsDB + ".GroupID" + " WHERE Username='" + Viewed + "';";
                SqlCommand CMD_SELECT_2 = new SqlCommand(SQL_SELECT_2, DB_Connection);
                CMD_SELECT_2.CommandType = CommandType.Text;

                DB_Connection.Open();

                using (SqlDataReader Reader = CMD_SELECT.ExecuteReader())
                {
                    if (Reader.Read())
                        ViewerGroupID = Convert.ToInt32(Reader["GroupID"].ToString());
                    Reader.Close();
                }

                using (SqlDataReader Reader = CMD_SELECT_2.ExecuteReader())
                {
                    if (Reader.Read())
                    {
                        int GroupID = Convert.ToInt32(Reader["GroupID"].ToString());
                        string Email = Reader["Email"].ToString();

                        if (ViewerGroupID == GroupID || Session["teacher"] != null)
                        {
                            UserInfo_SurnameName.Text = Reader["Surname"].ToString() + " " + Reader["Name"].ToString();
                            UserInfo_Username.Text = Reader["Username"].ToString();
                            UserInfo_Group.Text = Reader["GroupName"].ToString();
                            UserInfo_Group.NavigateUrl = "~/Content/Groups.aspx?id=" + GroupID;
                            UserInfo_LastLogin.Text = Reader["LastLogin"].ToString();

                            if (int.Parse(Reader["Gender"].ToString()) != 0 && int.Parse(Reader["Gender"].ToString()) < 3)
                                UserInfo_Gender.Text = int.Parse(Reader["Gender"].ToString()) == 1 ? "Чоловіча" : "Жіноча";

                            //always show Email / EditEmail to self
                            if (Viewer.ToLower() == Request.QueryString["id"].ToLower())
                            {
                                UserInfo_Email.Text = Email;
                                UserInfo_EmailUpdate.Visible = true;
                            }

                            //show to group & teacher / teacher only
                            if (Session["teacher"] != null)
                            {
                                if (Convert.ToInt32(Reader["ShowEmailTo"].ToString()) < 2 && ViewerGroupID == GroupID)
                                    UserInfo_Email.Text = Email;
                            }
                            else
                            {
                                if (Convert.ToInt32(Reader["ShowEmailTo"].ToString()) < 3)
                                    UserInfo_Email.Text = Email;
                            }
                        }
                        else
                        {
                            UsersMessage.Text = "Ви не можете переглядати цей профіль.";
                            UsersMessage.Visible = true;
                        }
                    }
                    else
                    {
                        UsersMessage.Text = "Такого користувача не існує.";
                        UsersMessage.Visible = true;
                    }
                }

                DB_Connection.Close();
            }
            else
                //if no ID set auto redirect to page with ID of currently logged in user
                Response.Redirect(Request.RawUrl + "?id=" + ((Session["teacher"] != null ? Session["teacher"].ToString().ToLower() : Session["student"].ToString().ToLower())));
        }
        else
            //redirect to login page
            Response.Redirect("~/Content/Login.aspx?url=" + Request.RawUrl);
    }

    protected void UserInfo_EmailUpdate_Click(object sender, EventArgs e)
    {
        if (UserInfo_Email.Visible)
        {
            UserInfo_EmailEdit.Text = UserInfo_Email.Text;
            UserInfo_Email.Visible = false;
            UserInfo_EmailEdit.Visible = true;
        }
        else
        {
            string SQL_UPDATE = "UPDATE " + UsersDB + " SET Email='" + UserInfo_EmailEdit.Text + "' WHERE Username='" + Request.QueryString["id"] + "'";
            SqlCommand CMD_UPDATE = new SqlCommand(SQL_UPDATE, DB_Connection);
            CMD_UPDATE.CommandType = CommandType.Text;

            DB_Connection.Open();
            CMD_UPDATE.ExecuteNonQuery();
            DB_Connection.Close();
            UserInfo_EmailEdit.Visible = false;
            UserInfo_Email.Visible = true;
            Response.Redirect(Request.RawUrl);
        }
    }
}