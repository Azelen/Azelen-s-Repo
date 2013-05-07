using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site : System.Web.UI.MasterPage
{
    SqlConnection DB_Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

    string UsersDB = System.Configuration.ConfigurationManager.AppSettings["UsersDB"];

    protected void Page_Load(object sender, EventArgs e)
    {
        Date.Text = "Сьогодні " + DateTime.Today.DayOfWeek.ToString().ToLower() + ", " + DateTime.Today.Date.ToLongDateString();

        if (Session["SurName"] != null && (Session["student"] != null || Session["teacher"] != null))
        {
            Loggedin_Username.Text = "Привіт, " + Session["SurName"].ToString() + "!";
            LoginMultiview.ActiveViewIndex = 1;

            if (Session["teacher"] != null)
            {
                Administrating_menu_link.Visible = true;
            }

            // update "last login" info in DB
            string Username = Session["teacher"] != null ? Session["teacher"].ToString() : Session["student"].ToString();

            string SQL_UPDATE = "UPDATE " + UsersDB + " SET LastLogin='" + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString() + "', PRecover=NULL WHERE Username='" + Username + "'";
            SqlCommand CMD_UPDATE = new SqlCommand(SQL_UPDATE, DB_Connection);
            CMD_UPDATE.CommandType = CommandType.Text;

            DB_Connection.Open();
            CMD_UPDATE.ExecuteNonQuery();
            DB_Connection.Close();
        }
    }

    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        if (Session.SessionID == "student")
            Session.Remove("student");
        else
            Session.Remove("teacher");

        Session.Remove("SurName");

        if (Path.GetFileName(Request.Url.AbsolutePath) == "Administrating.aspx")
            Response.Redirect("~/Content/Default.aspx");
        else
            Response.Redirect(Request.RawUrl);
    }
}
