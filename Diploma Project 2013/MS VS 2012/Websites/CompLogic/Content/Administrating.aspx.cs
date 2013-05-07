using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Content_Administrating : System.Web.UI.Page
{
    SqlConnection DB_Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

    string UsersDB = System.Configuration.ConfigurationManager.AppSettings["UsersDB"];
    string GroupsDB = System.Configuration.ConfigurationManager.AppSettings["GroupsDB"];

    protected void Page_Load(object sender, EventArgs e)
    {
        // check for access level on refresh?
        if (!Page.IsPostBack && Session["teacher"] != null)
        {
            AdminMessage.Visible = false;
            AdminMultiview.ActiveViewIndex = 0;

            string SQL_SELECT_USR = "SELECT Username, Surname, Name FROM " + UsersDB;
            SqlCommand CMD_SELECT_USR = new SqlCommand(SQL_SELECT_USR, DB_Connection);
            CMD_SELECT_USR.CommandType = CommandType.Text;

            string SQL_SELECT_GR = "SELECT * FROM " + GroupsDB + " WHERE AccessLevel < 2 ORDER BY GroupName";
            SqlCommand CMD_SELECT_GR = new SqlCommand(SQL_SELECT_GR, DB_Connection);
            CMD_SELECT_GR.CommandType = CommandType.Text;

            DB_Connection.Open();

            // Fill Users List
            SqlDataAdapter DAdapter = new SqlDataAdapter(CMD_SELECT_USR);
            DataTable DTable = new DataTable();
            DAdapter.Fill(DTable);
            CMD_SELECT_USR.Dispose();

            Admin_Access_Username.DataSource = DTable;
            Admin_Access_Username.DataTextField = "Surname";
            Admin_Access_Username.DataValueField = "Username";
            Admin_Access_Username.DataBind();

            // Fill Names
            for (int i = 0; i < Admin_Access_Username.Items.Count; ++i)
            {
                string SQL_SELECT = "SELECT Name FROM " + UsersDB + " WHERE Username='" + Admin_Access_Username.Items[i].Value + "'";
                SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
                CMD_SELECT.CommandType = CommandType.Text;

                Admin_Access_Username.Items[i].Text += " " + CMD_SELECT.ExecuteScalar().ToString();

                ListItem copy_item = Admin_Access_Username.Items[i];
                Admin_Activate_Username.Items.Add(copy_item);
                Admin_Activate_Username.Items[i].Text += " (" + copy_item.Value + ")";
            }

            // add default selection
            ListItem item = new ListItem();
            item.Text = "-- Оберіть користувача --";
            Admin_Access_Username.Items.Insert(0, item);
            Admin_Activate_Username.Items.Insert(0, item);

            // Fill Groups List
            DAdapter = new SqlDataAdapter(CMD_SELECT_GR);
            DTable = new DataTable();
            DAdapter.Fill(DTable);
            CMD_SELECT_GR.Dispose();

            Admin_GroupsList.DataSource = DTable;
            Admin_GroupsList.DataTextField = "GroupName";
            Admin_GroupsList.DataValueField = "GroupID";
            Admin_GroupsList.DataBind();

            DB_Connection.Close();
        }
    }

    protected void Admin_Access_Click(object sender, EventArgs e)
    {
        if (Admin_Access_Username.SelectedIndex <= 0)
            return;

        string SQL_UPDATE = "UPDATE " + UsersDB + " SET AccessLevel=" + Admin_Access_YesNo.SelectedValue + " WHERE Username='" + Admin_Access_Username.SelectedValue + "'";
        SqlCommand CMD_UPDATE = new SqlCommand(SQL_UPDATE, DB_Connection);
        CMD_UPDATE.CommandType = CommandType.Text;

        SQL_Result.Visible = true;
        DB_Connection.Open();
        CMD_UPDATE.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect(Request.RawUrl);
    }

    protected void Admin_Add_Group_Click(object sender, EventArgs e)
    {
        AdminMessage.Visible = false; // need this [?]

        if (Admin_Group_Name.Text == "")
            //show error here [?]
            return;

        string SQL_INSERT = "INSERT INTO " + GroupsDB + " (GroupName) VALUES ('" + Admin_Group_Name.Text.ToUpper() + "')";
        SqlCommand CMD_INSERT = new SqlCommand(SQL_INSERT, DB_Connection);
        CMD_INSERT.CommandType = CommandType.Text;

        try
        {
            DB_Connection.Open();
            CMD_INSERT.ExecuteNonQuery();
            Response.Redirect(Request.RawUrl);
        }
        catch (SqlException Ex)
        {
            if (Ex.Number == 2627) //duplicate entry PRIMARY KEY violation
            {
                AdminMessage.Text = "Така група вже існує.";
                AdminMessage.Visible = true;
            }
            else
            {
                AdminMessage.Text = "Сталася помилка під час виконання операції.";
                AdminMessage.Visible = true;
            }
        }
        finally
        {
            DB_Connection.Close();
        }
    }

    protected void Admin_Activate_Click(object sender, EventArgs e)
    {
        if (Admin_Activate_Username.Text == "")
            return;

        string SQL_UPDATE = "UPDATE " + UsersDB + " SET Activation=NULL WHERE Username='" + Admin_Activate_Username.Text + "'";
        SqlCommand CMD_UPDATE = new SqlCommand(SQL_UPDATE, DB_Connection);
        CMD_UPDATE.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_UPDATE.ExecuteNonQuery();
        Response.Redirect(Request.RawUrl);
        DB_Connection.Close();
    }

    protected void Admin_Del_Group_Click(object sender, EventArgs e)
    {
        if (Admin_GroupsList.SelectedValue == "0")
            return;

        string SQL_DELETE = "DELETE FROM " + GroupsDB + " WHERE GroupName='" + Admin_GroupsList.SelectedItem.Text + "'";
        SqlCommand CMD_DELETE = new SqlCommand(SQL_DELETE, DB_Connection);
        CMD_DELETE.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_DELETE.ExecuteNonQuery();
        Response.Redirect(Request.RawUrl);
        DB_Connection.Close();
    }

    protected void Admin_SQL_Execute_Click(object sender, EventArgs e)
    {
        if (Admin_SQL.Text == "")
            return;

        SQL_Result.ForeColor = System.Drawing.Color.Green;

        string SQL_COMMAND = Admin_SQL.Text;
        SqlCommand CMD_COMMAND = new SqlCommand(SQL_COMMAND, DB_Connection);
        CMD_COMMAND.CommandType = CommandType.Text;

        try
        {
            DB_Connection.Open();
            string comm = SQL_COMMAND.Remove(6).ToUpper();

            switch (comm)
            {
                case "UPDATE":
                    break;
                case "SELECT":
                    break;
                case "DELETE":
                    break;
                case "INSERT":
                    break;
                case "REPLAC":
                    break;
                default:
                    break;
            }

        }
        catch (SqlException ex)
        {
            SQL_Result.ForeColor = System.Drawing.Color.Red;
            SQL_Result.Text = ex.Message.ToString();
        }
        finally
        {
            DB_Connection.Close();
        }
    }

    protected void Admin_Upload_Click(object sender, EventArgs e)
    {
        string SavePath = Request.PhysicalApplicationPath + @"\Uploads\";

        if (Admin_FileUpload.HasFile)
        {
            SavePath += Admin_FileUpload.FileName;

            if (!File.Exists(SavePath))
            {
                Admin_FileUpload.SaveAs(SavePath);
                FileUpload_Result.ForeColor = System.Drawing.Color.Green;
                FileUpload_Result.Text = "Файл успішно завантажено. Шлях до файлу:<br />" + Request.Url.GetLeftPart(UriPartial.Authority) + "/Uploads/" + Admin_FileUpload.FileName;
            }
            else
            {
                FileUpload_Result.ForeColor = System.Drawing.Color.Red;
                FileUpload_Result.Text = "Файл з таким іменем вже існує.";
            }
        }
        else
        {
            FileUpload_Result.ForeColor = System.Drawing.Color.Red;
            FileUpload_Result.Text = "Не вдалося завантажити файл.";
        }

        FileUpload_Result.Visible = true;
    }
}