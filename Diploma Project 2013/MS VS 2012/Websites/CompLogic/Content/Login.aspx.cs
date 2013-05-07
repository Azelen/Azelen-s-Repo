using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Content_Login : System.Web.UI.Page
{
    SqlConnection DB_Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

    string UsersDB = System.Configuration.ConfigurationManager.AppSettings["UsersDB"];

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) //need this [?]
            return;

        if (Session["student"] != null || Session["teacher"] != null)
            Response.Redirect("~/Content/Default.aspx");

        if (Request.QueryString["user"] != null)
        {
            string var_username = Request.QueryString["user"];

            string SQL_SELECT = "SELECT Activation FROM " + UsersDB + " WHERE Username='" + var_username + "'";
            SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
            CMD_SELECT.CommandType = CommandType.Text;

            string SQL_UPDATE = "UPDATE " + UsersDB + " SET Activation=NULL WHERE Username='" + var_username + "'";
            SqlCommand CMD_UPDATE = new SqlCommand(SQL_UPDATE, DB_Connection);
            CMD_UPDATE.CommandType = CommandType.Text;


            if (Request.QueryString["token"] != null)
            {
                DB_Connection.Open();

                using (SqlDataReader Reader = CMD_SELECT.ExecuteReader())
                {
                    if (Reader.Read())
                    {
                        if (Reader["Activation"] == DBNull.Value)
                        {
                            ActivationMessage.ForeColor = Color.Empty;
                            ActivationMessage.Text = "Ваш обліковий запис вже активований. Ви можете увійти в систему використовуючи свої реєстраційні дані.";
                            Login_Redirect.Visible = true;

                            Login_Notification.Visible = true;
                        }
                        else
                        {
                            if (Reader["Activation"].ToString() == Request.QueryString["token"])
                            {
                                Reader.Close();
                                CMD_UPDATE.ExecuteNonQuery();
                                ActivationMessage.ForeColor = Color.Green;
                                ActivationMessage.Text = "Ваш обліковий запис успішно активовано. Тепер Ви можете увійти в систему.";
                                Login_Redirect.Visible = true;

                                Login_Notification.Visible = true;
                            }
                            else
                            {
                                ActivationMessage.ForeColor = Color.Red;
                                ActivationMessage.Text = "Невірний ключ активації. Скористайтесь посиланням нижче, щоб отримати нове повідомлення з ключем активації.";
                                Resend_Email.Visible = true;

                                Login_Notification.Visible = true;
                            }
                        }
                    }
                    else
                    {
                        ActivationMessage.ForeColor = Color.Red;
                        ActivationMessage.Text = "Такого користувача не зареєстровано в нашій базі даних.";

                        Login_Notification.Visible = true;
                    }
                }

                DB_Connection.Close();
                return;
            }
            else
            {
                DB_Connection.Open();

                using (SqlDataReader Reader = CMD_SELECT.ExecuteReader())
                {
                    if (Reader.Read())
                    {
                        if (Reader["Activation"] != DBNull.Value)
                        {
                            ActivationMessage.Text = "Обліковий запис ще не активовано. Під час реєстрації на вказану електронну адресу було відправлено повідомлення з вказівками щодо активації цього облікового запису. Якщо повідомлення не прийшло протягом 10 хвилин з моменту реєстрації - скористайтесь посиланням нижче, щоб повторно відправити це повідомлення.";
                            Resend_Email.Visible = true;

                            Login_Notification.Visible = true;
                        }
                        else
                            Response.Redirect("~/Content/Login.aspx");
                    }
                }

                DB_Connection.Close();
                return;
            }
        }

        //only if not logged in show login form
        if (Session["student"] == null && Session["teacher"] == null)
        {
            if (Request.Cookies["LoginData"] != null)
            {
                Login_Username.Text = Request.Cookies["LoginData"]["Username"].ToString();
                Login_Password.Text = Request.Cookies["LoginData"]["Password"].ToString(); //really need this [?]
                Login_RememberMe.Checked = true;
            }

            Login_Form.Visible = true;
        }
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

    protected void Login_Click(object sender, EventArgs e)
    {
        ActivationMessage.Visible = false;
        Resend_Email.Visible = false;
        LoginMessage.Visible = false;

        if (Login_Username.Text == "" || Login_Password.Text == "")
        {
            LoginMessage.Text = "Введіть ім'я користувача та пароль.";
            LoginMessage.Visible = true;
            return;
        }

        string SQL_SELECT = "SELECT * FROM " + UsersDB + " WHERE Username='" + Login_Username.Text.ToString() + "'";
        SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
        CMD_SELECT.CommandType = CommandType.Text;

        string SQL_UPDATE = "UPDATE " + UsersDB + " SET LastLogin='" + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString() + "', PRecover=NULL WHERE Username='" + Login_Username.Text + "'";
        SqlCommand CMD_UPDATE = new SqlCommand(SQL_UPDATE, DB_Connection);
        CMD_UPDATE.CommandType = CommandType.Text;

        DB_Connection.Open();

        using (SqlDataReader Reader = CMD_SELECT.ExecuteReader())
        {
            if (Reader.Read())
            {
                if (GetMd5Hash(Login_Password.Text.ToLower(), Reader["Password_salt"].ToString()) == Reader["Password_hash"].ToString())
                {
                    if (Login_RememberMe.Checked == true)
                    {
                        HttpCookie login_cookie = new HttpCookie("LoginData");
                        login_cookie.Values.Add("Username", Login_Username.Text);
                        login_cookie.Values.Add("Password", Login_Password.Text); //really need this [?]
                        Response.Cookies.Add(login_cookie);
                        Response.Cookies["LoginData"].Expires = DateTime.Now.AddMonths(1);
                    }
                    else
                    {
                        Response.Cookies.Remove("LoginData");
                        Response.Cookies["LoginData"].Expires = DateTime.Now.AddMonths(-1);
                    }

                    if (Reader["Activation"] == DBNull.Value)
                    {
                        if (Convert.ToInt32(Reader["AccessLevel"].ToString()) < 2)
                            Session.Add("student", Reader["Username"].ToString());
                        else
                            Session.Add("teacher", Reader["Username"].ToString());

                        Session.Add("SurName", Reader["Surname"].ToString() + " " + Reader["Name"]);
                    }
                    else
                        Response.Redirect("~/Content/Login.aspx?user=" + Reader["Username"].ToString().ToLower());

                    Reader.Close();
                    CMD_UPDATE.ExecuteNonQuery();

                    //redirect back if redirected from another page
                    if (Request.QueryString["url"] != null)
                        Response.Redirect(Request.QueryString["url"].ToString());
                    else
                        Response.Redirect("~/Content/Default.aspx");
                }
                else
                {
                    LoginMessage.Text = "Невірний пароль до облікового запису.";
                    LoginMessage.Visible = true;
                }
            }
            else
            {
                LoginMessage.Text = "Користувача з таким іменем не зареєстровано в нашій базі даних.";
                LoginMessage.Visible = true;
            }
        }

        DB_Connection.Close();
    }

    protected void Login_Redirect_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Content/Login.aspx");
    }

    protected void Resend_Email_Click(object sender, EventArgs e)
    {
        string ActToken = "";
        while (ActToken.Length < 24)
            ActToken += Guid.NewGuid().ToString().GetHashCode().ToString("x");
        ActToken = ActToken.Substring(0, 24);

        string var_username = Request.QueryString["user"].ToString();

        string SQL_SELECT = "SELECT Username, Email, Surname, Name FROM " + UsersDB + " WHERE Username='" + var_username + "'";
        SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
        CMD_SELECT.CommandType = CommandType.Text;

        string SQL_UPDATE = "UPDATE " + UsersDB + " SET Activation='" + ActToken + "' WHERE Username='" + var_username + "'";
        SqlCommand CMD_UPDATE = new SqlCommand(SQL_UPDATE, DB_Connection);
        CMD_UPDATE.CommandType = CommandType.Text;

        DB_Connection.Open();

        CMD_UPDATE.ExecuteNonQuery();

        using (SqlDataReader Reader = CMD_SELECT.ExecuteReader())
        {
            if (Reader.Read() && Reader["Email"].ToString() != null)
            {
                var FromAddress = new MailAddress("essalibe@gmail.com", "CompLogic");
                var ToAddress = new MailAddress(Reader["Email"].ToString());
                const string FromPassword = "excalib10";
                const string Subjuect = "Активація облікового запису CompLogic";
                string Body = "Привіт, " + Reader["Surname"].ToString() + " " + Reader["Name"].ToString() + "! Щоб активувати Ваш обліковий запис скористайтесь цим посиланням - " + Request.Url.GetLeftPart(UriPartial.Authority) + "/Content/Login.aspx?user=" + Reader["Username"].ToString().ToLower() + "&token=" + ActToken;

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(FromAddress.Address, FromPassword),
                    Timeout = 20000
                };

                using (var message = new MailMessage(FromAddress, ToAddress)
                {
                    Subject = Subjuect,
                    Body = Body
                })
                {
                    smtp.Send(message);
                    
                }

                Login_Notification.Visible = false;
                Email_Resent.Text = "<p style=\"font-size: medium; color: green;\">Повідомлення відправлено.</p><br /><p>На вказаний Вами під час реєстрації електронний адрес було повторно відправлено повідомлення з вказівками щодо активації облікового запису. Після активації Ви отримаєте повний доступ до ресурсів електронного посібника.</p><p>Через <b>15 секунд</b> Вас буде автоматично перенаправлено на головну сторінку.</p> <script>setTimeout(function() { window.location='../Content/Default.aspx';}, 15000); </script>";
            }
        }

        DB_Connection.Close();
    }
}