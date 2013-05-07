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

public partial class Content_RestorePassword : System.Web.UI.Page
{
    SqlConnection DB_Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

    string UsersDB = System.Configuration.ConfigurationManager.AppSettings["UsersDB"];

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) //need this [?]
            return;

        PRMessage.Text = "";
        PRMessage.Visible = false;

        if (Session["student"] == null && Session["teacher"] == null)
        {
            if (Request.QueryString["user"] != null && Request.QueryString["token"] != null)
            {
                string SQL_SELECT = "SELECT PRecover FROM " + UsersDB + " WHERE Username='" + Request.QueryString["user"] + "'";
                SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
                CMD_SELECT.CommandType = CommandType.Text;

                DB_Connection.Open();
                using (SqlDataReader Reader = CMD_SELECT.ExecuteReader())
                {
                    if (Reader.Read())
                    {
                        //tokens match/doesnt match
                        if (Reader["PRecover"].ToString() == Request.QueryString["token"].ToString())
                        {
                            PRSend_Form.Visible = false;
                            PRContinue_Form.Visible = true;
                        }
                        else
                        {
                            PRMessage.Text = "Невірний ключ для зміни паролю.";
                            PRMessage.Visible = true;
                            PRSend_Form.Visible = false;
                        }
                    }
                }

                DB_Connection.Close();
            }
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

    protected void RestorePassword_Click(object sender, EventArgs e)
    {
        PRMessage.Text = "";
        PRMessage.Visible = false;

        if (PR_Username.Text == "")
        {
            PRMessage.Text = "Вкажіть ваше ім'я користувача.";
            PRMessage.Visible = true;
            return;
        }

        string PRToken = "";
        while (PRToken.Length < 24)
            PRToken += Guid.NewGuid().ToString().GetHashCode().ToString("x");
        PRToken = PRToken.Substring(0, 24);

        string SQL_SELECT = "SELECT Email, Surname, Name FROM " + UsersDB + " WHERE Username='" + PR_Username.Text + "'";
        SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
        CMD_SELECT.CommandType = CommandType.Text;

        string SQL_UPDATE = "UPDATE " + UsersDB + " SET PRecover='" + PRToken + "' WHERE Username='" + PR_Username.Text + "'";
        SqlCommand CMD_UPDATE = new SqlCommand(SQL_UPDATE, DB_Connection);
        CMD_UPDATE.CommandType = CommandType.Text;

        DB_Connection.Open();

        CMD_UPDATE.ExecuteNonQuery();
        
        using (SqlDataReader Reader = CMD_SELECT.ExecuteReader())
        {
            if (Reader.Read())
            {
                //send email with password recovery link and show message
                var FromAddress = new MailAddress("essalibe@gmail.com", "CompLogic");
                var ToAddress = new MailAddress(Reader["Email"].ToString());
                const string FromPassword = "excalib10";
                const string Subjuect = "Зміна паролю до облікового запису CompLogic";
                string Body = "Привіт, " + Reader["Surname"].ToString() + " " + Reader["Name"].ToString() + "! Ми отримали запит для відновлення паролю до Вашого облікового запису. Якщо Ви бажаєте встановити новий пароль до облікового запису - скористайтесь наступним посиланням  - " + Request.Url.GetLeftPart(UriPartial.Authority) + "/Content/RestorePassword.aspx?user=" + PR_Username.Text.ToLower() + "&token=" + PRToken + ". В іншому випадку просто проігноруйте це повідомлення.";

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(FromAddress.Address, FromPassword)
                };

                using (var message = new MailMessage(FromAddress, ToAddress)
                {
                    Subject = Subjuect,
                    Body = Body
                })
                {
                    smtp.Send(message);
                }

                PRSend_Form.Visible = false;
                PR_Successful.Text = "<p style=\"font-size: medium; color: green;\">Повідомлення відправлено.</p><br /><p> На вказану Вами під час реєстрації електронну адресу було відправлено повідомлення з вказівками щодо відновлення паролю.</p><p>Через <b>10 секунд</b> Вас буде автоматично перенаправлено на головну сторінку.</p> <script>setTimeout(function() { window.location='../Content/Default.aspx';}, 10000); </script>";
            }
            else
            {
                PRMessage.Text = "Користувача з таким іменем не зареєстровано в нашій базі даних.";
                PRMessage.Visible = true;
            }
        }

        DB_Connection.Close();
    }

    protected void ChangePassword_Click(object sender, EventArgs e)
    {
        PRMessage.Text = "";
        PRMessage.Visible = false;

        if (PR_Password.Text == "" || PR_RePassword.Text == "")
        {
            PRMessage.Text = "Вкажіть новий пароль.";
            PRMessage.Visible = true;
            return;
        }

        if (PR_Password.Text != PR_RePassword.Text)
        {
            PRMessage.Text = "Паролі не співпадають.";
            PRMessage.Visible = true;
            return;
        }

        if (PR_Password.Text.Length < 6 || PR_Password.Text.Length > 30)
        {
            PRMessage.Text = "Новий пароль повинен бути не коротшим за 6 і не довшим за 30 символів.";
            PRMessage.Visible = true;
            return;
        }

        string password_salt = CreateSalt(8);
        string password_hash = GetMd5Hash(PR_Password.Text.ToLower(), password_salt);

        string SQL_UPDATE = "UPDATE " + UsersDB + " SET Password_hash='" + password_hash + "', Password_salt='" + password_salt + "', PRecover=NULL WHERE Username='" + Request.QueryString["user"] + "'";
        SqlCommand CMD_UPDATE = new SqlCommand(SQL_UPDATE, DB_Connection);
        CMD_UPDATE.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_UPDATE.ExecuteNonQuery();
        DB_Connection.Close();

        PRContinue_Form.Visible = false;
        PR_Successful.Text = "<p style=\"font-size: medium; color: green;\">Пароль успішно змінено.</p><br /><p>Пароль до облікового запису змінено. Тепер Ви можете увійти в систему використовуючи нові дані.</p><p>Через <b>10 секунд</b> Вас буде автоматично перенаправлено на головну сторінку.</p> <script>setTimeout(function() { window.location='../Content/Default.aspx';}, 10000); </script>";
    }
}