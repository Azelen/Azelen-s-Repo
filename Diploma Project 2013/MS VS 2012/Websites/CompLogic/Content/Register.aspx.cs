using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Content_Register : System.Web.UI.Page
{
    SqlConnection DB_Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

    string UsersDB = System.Configuration.ConfigurationManager.AppSettings["UsersDB"];
    string GroupsDB = System.Configuration.ConfigurationManager.AppSettings["GroupsDB"];

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
            return;

        if (Session["student"] == null && Session["teacher"] == null)
        {
            string SQL_SELECT = "SELECT * FROM " + GroupsDB;
            SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
            CMD_SELECT.CommandType = CommandType.Text;

            DB_Connection.Open();
            Register_Group.Items.Insert(0, new ListItem("Не вказано", "0"));

            using (SqlDataReader Reader = CMD_SELECT.ExecuteReader())
            {
                while (Reader.Read())
                {
                    if (Convert.ToInt32(Reader["AccessLevel"].ToString()) == 1)
                    {
                        ListItem item = new ListItem();
                        item.Text = Reader["GroupName"].ToString();
                        item.Value = Reader["GroupID"].ToString();
                        Register_Group.Items.Add(item);
                    }
                }
            }

            DB_Connection.Close();
        }
        else
            Response.Redirect("~/Content/Default.aspx");
    }

    private static string CreateSalt(int size)
    {
        var rng = new RNGCryptoServiceProvider();
        var buff = new byte[size];
        rng.GetBytes(buff);

        return Convert.ToBase64String(buff);
    }

    private static string GetMd5Hash(string input, string salt)
    {
        var hasher = MD5.Create();
        var data = hasher.ComputeHash(Encoding.Default.GetBytes(input + salt));
        var builder = new StringBuilder();

        for (int i = 0; i < data.Length; i++)
            builder.Append(data[i].ToString("x2"));

        return builder.ToString();
    }

    protected void Register_Submit_Click(object sender, EventArgs e)
    {
        RegisterMessage.Text = "";
        RegisterMessage.Visible = false;

        //Validation checks
        if (Register_Username.Text == "" || Register_Email.Text == "" || Register_Password.Text == "" || Register_Surname.Text == "" || Register_Name.Text == "" || Register_Group.SelectedValue == "0")
        {
            RegisterMessage.Text = "Заповніть будь-ласка всі поля.";
            RegisterMessage.Visible = true;
            return;
        }

        if (Register_Password.Text != Register_RePassword.Text)
        {
            RegisterMessage.Text = "Паролі не співпадають.";
            RegisterMessage.Visible = true;
            return;
        }

        if (Register_Password.Text.Length < 6 || Register_Password.Text.Length > 30)
        {
            RegisterMessage.Text = "Пароль повинен бути не коротшим за 6 і не довшим за 30 символів.";
            RegisterMessage.Visible = true;
            return;
        }

        //anti-bot check

        string ActToken = "";
        while (ActToken.Length < 24)
            ActToken += Guid.NewGuid().ToString().GetHashCode().ToString("x");
        ActToken = ActToken.Substring(0, 24);

        //Register
        string password_salt = CreateSalt(8);
        string password_hash = GetMd5Hash(Register_Password.Text.ToLower(), password_salt);

        string SQL_INSERT = "INSERT INTO " + UsersDB + " (Username, Email, Password_hash, Password_salt, Surname, Name, GroupID, Gender, Activation, ShowEmailTo) VALUES ('" + Register_Username.Text + "', '" + Register_Email.Text + "', '" + password_hash + "', '" + password_salt + "', '" + Register_Surname.Text + "', '" + Register_Name.Text + "', " + Register_Group.SelectedValue + ", " + Register_Gender.SelectedIndex + ", '" + ActToken + "', " + Register_EmailOptions.SelectedValue + ")";
        SqlCommand CMD_INSERT = new SqlCommand(SQL_INSERT, DB_Connection);
        CMD_INSERT.CommandType = CommandType.Text;
        
        string SQL_SELECT = " SELECT * FROM " + UsersDB + " WHERE Surname='" + Register_Surname.Text + "' AND Name='" + Register_Name.Text + "' AND GroupID=" + Register_Group.SelectedValue;
        SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
        CMD_SELECT.CommandType = CommandType.Text;

        try
        {
            DB_Connection.Open();
            using (SqlDataReader Reader_SurName = CMD_SELECT.ExecuteReader())
            {
                if (!Reader_SurName.Read())
                {
                    Reader_SurName.Close();
                    CMD_INSERT.ExecuteNonQuery();
                    
                    //send email with activation link
                    var FromAddress = new MailAddress("essalibe@gmail.com", "CompLogic");
                    var ToAddress = new MailAddress(Register_Email.Text.ToString());
                    const string FromPassword = "excalib10";
                    const string Subjuect = "Активація облікового запису CompLogic";
                    string Body = "Привіт, " + Register_Surname.Text + " " + Register_Name.Text + "! Щоб активувати Ваш обліковий запис скористайтесь цим посиланням - " + Request.Url.GetLeftPart(UriPartial.Authority) + "/Content/Login.aspx" + "?user=" + Register_Username.Text.ToLower() + "&token=" + ActToken;

                    var smtp = new SmtpClient
                    {
                        Host = "smtp.gmail.com",
                        Port = 587,
                        EnableSsl = true,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential(FromAddress.Address, FromPassword),
                        Timeout = 20000,
                    };
                    
                    using (var Message = new MailMessage(FromAddress, ToAddress)
                    {
                        Subject = Subjuect,
                        Body = Body
                    })
                    {
                        smtp.Send(Message);
                    }

                    //show message and redirect
                    Register_Form.Visible = false;
                    Register_Success.Text = "<p style=\"font-size: medium; color: green;\">Реєстрація пройшла успішно.</p><br /><p>Дякуємо за реєстрацію. На вказаний Вами електронний адрес було відправлено повідомлення з вказівками щодо активації облікового запису. Після активації Ви отримаєте повний доступ до ресурсів електронного посібника.</p><p>Через <b>15 секунд</b> Вас буде автоматично перенаправлено на головну сторінку.</p> <script>setTimeout(function() { window.location='../Content/Default.aspx';}, 15000); </script>";
                }
                else
                {
                    RegisterMessage.Text = "Ви вже зареєстровані в системі!";
                    RegisterMessage.Visible = true;
                }
            }
        }
        catch (SqlException Ex)
        {
            if (Ex.Number == 2627)  //duplicate entry PRIMARY KEY violation
            {
                RegisterMessage.Text = "Користувач з таким іменем вже існує.";
                RegisterMessage.Visible = true;
            }
            else
            {
                RegisterMessage.Text = "Сталася помилка підчас виконання операції. " + Ex.Message;
                RegisterMessage.Visible = true;
            }
        }
        finally
        {
            DB_Connection.Close();
        }
    }

    protected void Register_Clean_Click(object sender, EventArgs e)
    {
        //is this is correct way [?]
        Response.Redirect(Request.RawUrl);
    }
}