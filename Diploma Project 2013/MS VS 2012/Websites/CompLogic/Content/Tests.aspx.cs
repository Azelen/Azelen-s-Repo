using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Content_Tests : System.Web.UI.Page
{
    // Refresh Detection
    private bool _refreshState;
    private bool _isRefresh;

    protected override void LoadViewState(object savedState)
    {
        object[] AllStates = (object[])savedState;
        base.LoadViewState(AllStates[0]);
        _refreshState = bool.Parse(AllStates[1].ToString());
        _isRefresh = (_refreshState == (bool)Session["__ISREFRESH"]);
    }

    protected override object SaveViewState()
    {
        Session["__ISREFRESH"] = _refreshState;
        object[] AllStates = new object[3];
        AllStates[0] = base.SaveViewState();
        AllStates[1] = !(_refreshState);
        return AllStates;
    }
    // End Refresh Detection

    SqlConnection DB_Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

    string UsersDB = System.Configuration.ConfigurationManager.AppSettings["UsersDB"];
    string TestsDB = System.Configuration.ConfigurationManager.AppSettings["TestsDB"];
    string TestQuestionsDB = System.Configuration.ConfigurationManager.AppSettings["TestQuestionsDB"];
    string TestAnswersDB = System.Configuration.ConfigurationManager.AppSettings["TestAnswersDB"];
    string MarksDB = System.Configuration.ConfigurationManager.AppSettings["MarksDB"];

    protected void Page_Load(object sender, EventArgs e)
    {
        // return to test start on refresh
        if (Page.IsPostBack && _isRefresh)
            Response.Redirect(Request.RawUrl);

        // do not update answers/questions on partial async postback (timer tick)
        if (Page.IsPostBack && ScriptManager.GetCurrent(this.Page).IsInAsyncPostBack)
            return;

        string var_id = Request.QueryString["id"];

        //manage page content
        if (var_id != null)
        {
            TestsList_Form.Visible = false;

            if (var_id == "new")
            {
                //display new test UI
                if (Session["teacher"] == null)
                    Response.Redirect("~/Content/Tests.aspx");

                if (!Page.IsPostBack)
                    GenerateEmptyGridView();

                TestsList.Visible = false;
                NewTest_Form.Visible = true;
            }
            else // display test
            {
                string SQL_SELECT = "SELECT * FROM " + TestsDB + " WHERE TestID=" + Request.QueryString["id"];
                SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
                CMD_SELECT.CommandType = CommandType.Text;

                int TestID = 0;
                int QuestionsLimit = 0;
                int ChancesLimit = 0;
                int ChancesUsed = 0;
                int TimeLimit = 0;
                bool IsFree = false;
                List<int> Questions = new List<int>();

                DB_Connection.Open();

                using (SqlDataReader Reader = CMD_SELECT.ExecuteReader())
                {
                    if (Reader.Read())
                    {
                        DisplayTest_Title.Text = Reader["Title"].ToString();
                        TestID = int.Parse(Reader["TestID"].ToString());
                        QuestionsLimit = int.Parse(Reader["QuestionsLimit"].ToString());
                        ChancesLimit = int.Parse(Reader["ChancesLimit"].ToString());
                        TimeLimit = int.Parse(Reader["TimeLimit"].ToString());
                        IsFree = Convert.ToBoolean(Reader["IsFreeTest"]);

                        if (!IsFree && Session["student"] == null && Session["teacher"] == null)
                            Response.Redirect("~/Content/Tests.aspx");
                    }
                }

                if (ViewState["CurrentQuestion"] == null)
                {
                    string SQL_SELECT_2 = "SELECT * FROM " + TestQuestionsDB + " WHERE TestID=" + TestID;
                    SqlCommand CMD_SELECT_2 = new SqlCommand(SQL_SELECT_2, DB_Connection);
                    CMD_SELECT_2.CommandType = CommandType.Text;

                    //make list of question IDs
                    using (SqlDataReader Reader = CMD_SELECT_2.ExecuteReader())
                    {
                        while (Reader.Read())
                            Questions.Add(int.Parse(Reader["QuestionID"].ToString()));
                    }

                    int[] Questions_Array = new int[QuestionsLimit];

                    // shuffle questions
                    for (int i = 0; i < QuestionsLimit; ++i)
                    {
                        int q = Questions[new Random().Next(Questions.Count)];

                        if (Array.IndexOf(Questions_Array, q) < 0)
                            Questions_Array[i] = q;
                        else
                            --i;
                    }

                    // display test info
                    if (Session["student"] != null || Session["teacher"] != null)
                    {
                        string SQL_SELECT_3 = "SELECT count(*) FROM " + MarksDB + " WHERE Username='" + (Session["teacher"] != null ? Session["teacher"].ToString() : Session["student"].ToString()) + "' AND TestID=" + TestID;
                        SqlCommand CMD_SELECT_3 = new SqlCommand(SQL_SELECT_3, DB_Connection);
                        CMD_SELECT_3.CommandType = CommandType.Text;

                        ChancesUsed = int.Parse(CMD_SELECT_3.ExecuteScalar().ToString());
                        TestInfo_UserInfo.Text = Session["SurName"].ToString();
                    }

                    int QuestionTimer = (TimeLimit * 60) / QuestionsLimit;

                    TestInfo_QuestionsLimit.Text = Questions_Array.Length.ToString();
                    TestInfo_TimeLimit.Text = TimeLimit == 0 ? "Необмежено" : TimeLimit + " хв.";
                    TestInfo_TimePerQuestionLimit.Text = TimeLimit == 0 ? "Необмежено" : QuestionTimer.ToString() + " сек.";
                    TestInfo_TimesPassed.Text = ChancesLimit == 0 ? "Необмежено" : ChancesUsed.ToString() + " / " + ChancesLimit.ToString();

                    int j = new Random().Next(Questions_Array.Length);

                    ViewState["CurrentQuestion"] = Questions_Array[j];
                    ViewState["Questions"] = Questions_Array;
                    ViewState["QuestionTimer"] = QuestionTimer;
                    ViewState["TestTimer"] = TimeLimit * 60;

                    // no chances left
                    if (ChancesUsed >= ChancesLimit && ChancesLimit != 0)
                    {
                        TestInfo_TimesPassed.ForeColor = System.Drawing.Color.Red;
                        next_question.Enabled = false;
                    }

                    DisplayTest_InfoForm.Visible = true;
                }
                else
                {
                    // save answer
                    if (ViewState["Answers"] != null && ViewState["PassedQuestions"] != null)
                    {
                        int[] answers = ViewState["Answers"] as int[];
                        int[] answers_new = new int[answers.Length + 1];

                        for (int i = 0; i < answers.Length; ++i)
                            answers_new[i] = answers[i];

                        answers_new[answers_new.Length - 1] = int.Parse(DisplayTest_ChoicesList.SelectedValue);
                        ViewState["Answers"] = answers_new;
                    }
                    else
                    {
                        if (DisplayTest_ChoicesList.SelectedIndex >= 0)
                        {
                            int[] answers = new int[1] { int.Parse(DisplayTest_ChoicesList.SelectedValue) };
                            ViewState["Answers"] = answers;
                        }
                    }

                    //show result if finished test
                    if (ViewState["Answers"] != null && ViewState["Questions"] != null && (ViewState["Answers"] as int[]).Length == (ViewState["Questions"] as int[]).Length)
                    {
                        DisplayTest_TimerPeriodic.Enabled = false;

                        int[] answers = ViewState["Answers"] as int[];
                        int correct = 0;
                        int Mark = 0;

                        for (int i = 0; i < answers.Length; ++i)
                        {
                            string SQL_SELECT_2 = "SELECT IsCorrect FROM " + TestAnswersDB + " WHERE ChoiceID=" + answers[i];
                            SqlCommand CMD_SELECT_2 = new SqlCommand(SQL_SELECT_2, DB_Connection);
                            CMD_SELECT_2.CommandType = CommandType.Text;

                            using (SqlDataReader Reader = CMD_SELECT_2.ExecuteReader())
                            {
                                if (Reader.Read() && Convert.ToBoolean(Reader["IsCorrect"]))
                                    ++correct;
                            }
                        }

                        float Points = (float)100 / answers.Length * correct;
                        Mark = (int)Points;

                        // save to DB if not free and if student logged in
                        if (!IsFree && Session["student"] != null)
                        {
                            string SQL_SelectGroupID = "(SELECT GroupID FROM " + UsersDB + " WHERE Username='" + Session["student"].ToString() + "')";
                            string SQL_INSERT = "INSERT INTO " + MarksDB + " VALUES('" + Session["student"].ToString() + "', " + TestID + ", " + Mark + ", '" + DateTime.Now.ToString() + "', " + SQL_SelectGroupID + ")";
                            SqlCommand CMD_INSERT = new SqlCommand(SQL_INSERT, DB_Connection);
                            CMD_INSERT.CommandType = CommandType.Text;

                            CMD_INSERT.ExecuteNonQuery();
                        }

                        DB_Connection.Close();
                        DisplayTest_Result.Text = "Кількість правильних відповідей  " + correct + " з " + answers.Length + " запитань. Ви набрали " + Mark + " балів.";
                        DisplayTest_QuestionForm.Visible = false;
                        DisplayTest_ResultForm.Visible = true;
                        next_question.Visible = false;
                        return;
                    }

                    // display (next) question

                    // update timer
                    if (ViewState["TestTimer"] != null && ViewState["Questions"] != null)
                    {
                        DisplayTest_TimeLeft.ForeColor = System.Drawing.Color.LightGreen;
                        DisplayTest_TimeLeft.Text = "Залишилось часу: " + ViewState["QuestionTimer"].ToString() + " сек.";
                        Timer1.Enabled = false;
                    }

                    // show question
                    int CurrentQuestion = int.Parse(ViewState["CurrentQuestion"].ToString());

                    string SQL_SELECT_3 = "SELECT QuestionText FROM " + TestQuestionsDB + " WHERE QuestionID=" + CurrentQuestion;
                    SqlCommand CMD_SELECT_3 = new SqlCommand(SQL_SELECT_3, DB_Connection);
                    CMD_SELECT_3.CommandType = CommandType.Text;

                    string SQL_SELECT_4 = "SELECT * FROM " + TestAnswersDB + " WHERE QuestionID=" + CurrentQuestion;
                    SqlCommand CMD_SELECT_4 = new SqlCommand(SQL_SELECT_4, DB_Connection);
                    CMD_SELECT_4.CommandType = CommandType.Text;

                    using (SqlDataReader Reader = CMD_SELECT_3.ExecuteReader())
                    {
                        int PassedQuestions = ViewState["PassedQuestions"] != null ? (ViewState["PassedQuestions"] as int[]).Length + 1 : 1;
                        string QuestionIndex = "<b>" + PassedQuestions + "/" + QuestionsLimit + " </b>";

                        if (Reader.Read())
                            DisplayTest_QuestionText.Text = QuestionIndex + Reader["QuestionText"].ToString() + "<br />";
                    }

                    using (SqlDataReader Reader = CMD_SELECT_4.ExecuteReader())
                    {
                        DisplayTest_ChoicesList.Items.Clear();

                        //fill list of choices
                        while (Reader.Read())
                        {
                            ListItem item = new ListItem();
                            item.Value = Reader["ChoiceID"].ToString();
                            item.Text = Reader["ChoiceText"].ToString();
                            DisplayTest_ChoicesList.Items.Add(item);
                        }

                        //shuffle choices
                        for (int i = 0; i < DisplayTest_ChoicesList.Items.Count; ++i)
                        {
                            int r = new Random().Next(DisplayTest_ChoicesList.Items.Count);
                            ListItem temp = DisplayTest_ChoicesList.Items[i];
                            DisplayTest_ChoicesList.Items.Remove(temp);
                            DisplayTest_ChoicesList.Items.Insert(r, temp);
                        }

                        //add default selection
                        ListItem item0 = new ListItem();
                        item0.Text = "<b>жоден із варіантів</b>";
                        item0.Value = "0";
                        item0.Selected = true;
                        DisplayTest_ChoicesList.Items.Add(item0);
                    }
                }

                TestsList.Visible = false;
                DisplayTest_QuestionForm.Visible = true;
                DisplayTest_Form.Visible = true;

                DB_Connection.Close();
            }
        }
        else
        {
            // display list of tests
            if (Session["teacher"] == null)
            {
                TestsList.Columns[5].Visible = false;
                TestsList.ShowFooter = false;
            }

            string SQL_SELECT = "SELECT * FROM " + TestsDB + " WHERE IsFreeTest=1";

            // display full list of tests only for logged in users
            if (Session["student"] != null || Session["teacher"] != null)
                SQL_SELECT = "SELECT * FROM " + TestsDB + " ORDER BY IsFreeTest DESC";

            SqlDataAdapter da = new SqlDataAdapter(SQL_SELECT, DB_Connection);
            DataTable dt = new DataTable();

            DB_Connection.Open();

            da.Fill(dt);
            TestsList.DataSource = dt;
            TestsList.DataBind();

            DB_Connection.Close();
        }
    }

    protected void TestsList_DeleteTest_Click(object sender, ImageClickEventArgs e)
    {
        string SQL_DELETE = "DELETE FROM " + TestsDB + " WHERE TestID=" + ((ImageButton)sender).AlternateText;
        SqlCommand CMD_DELETE = new SqlCommand(SQL_DELETE, DB_Connection);
        CMD_DELETE.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_DELETE.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect(Request.RawUrl);
    }

    protected void NewTest_Submit_Click(object sender, EventArgs e)
    {
        ErrorMessage.Visible = false;

        if (NewTest_Title.Text == "" || QuestionsRequired.Text == "" || TimeLimit.Text == "" || ChancesLimit.Text == "")
        {
            ErrorMessage.Text = "Всі поля обовв'язкові до заповнення.";
            ErrorMessage.Visible = true;
            return;
        }

        if (NewTest_Questions_GridView.Rows.Count < 5 || NewTest_Questions_GridView.Rows.Count < int.Parse(QuestionsRequired.Text))
        {
            ErrorMessage.Text = "Тест повинен складатись мінімум з 5 запитань. Загальна кількість запитань повинна бути більшою за кількість запитань за 1 спробу.";
            ErrorMessage.Visible = true;
            return;
        }

        int TestID = 0;

        string SQL_SELECT = "SELECT count(*) FROM " + TestsDB + " WHERE Title='" + NewTest_Title.Text + "'";
        SqlCommand CMD_SELECT = new SqlCommand(SQL_SELECT, DB_Connection);
        CMD_SELECT.CommandType = CommandType.Text;

        string SQL_INSERT = "INSERT INTO " + TestsDB + " (Title,IsFreeTest,QuestionsLimit,ChancesLimit,TimeLimit) VALUES('" + NewTest_Title.Text + "', " + ((NewTest_IsFree.Checked == true) ? "1, " : "0, ") + int.Parse(QuestionsRequired.Text) + ", " + int.Parse(ChancesLimit.Text) + ", " + int.Parse(TimeLimit.Text) + ")";
        SqlCommand CMD_INSERT = new SqlCommand(SQL_INSERT, DB_Connection);
        CMD_INSERT.CommandType = CommandType.Text;

        string SQL_SELECT_2 = "SELECT TestID FROM " + TestsDB + " WHERE Title='" + NewTest_Title.Text + "'";
        SqlCommand CMD_SELECT_2 = new SqlCommand(SQL_SELECT_2, DB_Connection);
        CMD_SELECT_2.CommandType = CommandType.Text;

        DB_Connection.Open();

        if (Convert.ToInt32(CMD_SELECT.ExecuteScalar()) > 0)
        {
            ErrorMessage.Text = "Тест з такою назвою вже існує.";
            ErrorMessage.Visible = true;
            return;
        }

        CMD_INSERT.ExecuteNonQuery();

        using (SqlDataReader Reader = CMD_SELECT_2.ExecuteReader())
        {
            if (Reader.Read())
                TestID = int.Parse(Reader["TestID"].ToString());
            Reader.Close();
        }

        for (int i = 0; i < NewTest_Questions_GridView.Rows.Count; ++i)
        {
            TextBox Questions = (TextBox)NewTest_Questions_GridView.Rows[i].Cells[1].FindControl("question_");
            TextBox tbox_choices = (TextBox)NewTest_Questions_GridView.Rows[i].Cells[2].FindControl("choices_");

            // save question first
            string SQL_INSERT_2 = "INSERT INTO " + TestQuestionsDB + " VALUES('" + Questions.Text + "', " + TestID + ")";
            SqlCommand CMD_INSERT_2 = new SqlCommand(SQL_INSERT_2, DB_Connection);
            CMD_INSERT_2.CommandType = CommandType.Text;

            string SQL_SELECT_3 = "SELECT QuestionID FROM " + TestQuestionsDB + " WHERE QuestionText='" + Questions.Text + "' AND TestID=" + TestID;
            SqlCommand CMD_SELECT_3 = new SqlCommand(SQL_SELECT_3, DB_Connection);
            CMD_SELECT_3.CommandType = CommandType.Text;

            CMD_INSERT_2.ExecuteNonQuery();

            //now choices
            int QuestionID = 0;
            string pattern1 = @"\[(.*?)\]";
            string pattern2 = @"\{(\d+)\}";
            var choices = Regex.Matches(tbox_choices.Text, pattern1);
            int correct = int.Parse(Regex.Match(tbox_choices.Text, pattern2).Groups[1].ToString()) - 1;

            using(SqlDataReader Reader = CMD_SELECT_3.ExecuteReader())
            {
                if (Reader.Read())
                    QuestionID = int.Parse(Reader["QuestionID"].ToString());
                Reader.Close();
            }
            
            for (int j = 0; j < choices.Count; ++j)
            {
                string SQL_INSERT_3 = "INSERT INTO " + TestAnswersDB + " VALUES('" + choices[j].Groups[1] + "', " + (j==correct ? "1" : "0") + ", " + QuestionID + ")";
                SqlCommand CMD_INSERT_3 = new SqlCommand(SQL_INSERT_3, DB_Connection);
                CMD_INSERT_3.CommandType = CommandType.Text;

                CMD_INSERT_3.ExecuteNonQuery();
            }
        }

        DB_Connection.Close();
        Response.Redirect("~/Content/Tests.aspx?id=" + TestID);
    }

    // not in use atm
    private void Del_Test_Click(object sender, EventArgs e)
    {
        string id = (sender as LinkButton).ID;

        string SQL_DELETE = "DELETE FROM " + TestsDB + " WHERE TestID=" + id;
        SqlCommand CMD_DELETE = new SqlCommand(SQL_DELETE, DB_Connection);
        CMD_DELETE.CommandType = CommandType.Text;

        DB_Connection.Open();
        CMD_DELETE.ExecuteNonQuery();
        DB_Connection.Close();
        Response.Redirect("~/Content/Tests.aspx");
    }

    private void GenerateEmptyGridView()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;

        dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
        dt.Columns.Add(new DataColumn("Col1", typeof(string)));
        dt.Columns.Add(new DataColumn("Col2", typeof(string)));

        dr = dt.NewRow();
        dr["RowNumber"] = 1;
        dr["Col1"] = string.Empty;
        dr["Col2"] = string.Empty;
        dt.Rows.Add(dr);

        ViewState["CurrentTable"] = dt;

        NewTest_Questions_GridView.DataSource = dt;
        NewTest_Questions_GridView.DataBind();
    }

    protected void NewTest_AddQuestion_Click(object sender, EventArgs e)
    {
        int rowIndex = 0;

        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;

            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count; ++i)
                {
                    TextBox Question = (TextBox)NewTest_Questions_GridView.Rows[rowIndex].Cells[1].FindControl("question_");
                    TextBox Choices = (TextBox)NewTest_Questions_GridView.Rows[rowIndex].Cells[2].FindControl("choices_");

                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumber"] = i + 1;

                    dtCurrentTable.Rows[i - 1]["Col1"] = Question.Text;
                    dtCurrentTable.Rows[i - 1]["Col2"] = Choices.Text;
                    ++rowIndex;
                }
                dtCurrentTable.Rows.Add(drCurrentRow);
                ViewState["CurrentTable"] = dtCurrentTable;

                NewTest_Questions_GridView.DataSource = dtCurrentTable;
                NewTest_Questions_GridView.DataBind();

                for (int i = 0; i < NewTest_Questions_GridView.Rows.Count; ++i)
                    NewTest_Questions_GridView.Rows[i].Cells[0].Text = (i + 1).ToString();
            }
        }

        SetPreviousData();
    }

    private void SetPreviousData()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTable"] != null)
        {
            DataTable dt = (DataTable)ViewState["CurrentTable"];

            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; ++i)
                {
                    TextBox Question = (TextBox)NewTest_Questions_GridView.Rows[rowIndex].Cells[1].FindControl("question_");
                    TextBox Choices = (TextBox)NewTest_Questions_GridView.Rows[rowIndex].Cells[2].FindControl("choices_");

                    Question.Text = dt.Rows[i]["Col1"].ToString();
                    Choices.Text = dt.Rows[i]["Col2"].ToString();
                    ++rowIndex;
                }
            }
        }
    }

    protected void DeleteRow(object sender, GridViewDeleteEventArgs e)
    {
        SetRowData();

        if (ViewState["CurrentTable"] != null)
        {
            DataTable dt = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;

            int rowIndex = Convert.ToInt32(e.RowIndex);

            if (dt.Rows.Count > 1)
            {
                dt.Rows.Remove(dt.Rows[rowIndex]);
                drCurrentRow = dt.NewRow();
                ViewState["CurrentTable"] = dt;
                NewTest_Questions_GridView.DataSource = dt;
                NewTest_Questions_GridView.DataBind();

                for (int i = 0; i < NewTest_Questions_GridView.Rows.Count; ++i)
                    NewTest_Questions_GridView.Rows[i].Cells[0].Text = (i + 1).ToString();

                SetPreviousData();
            }
        }
    }

    private void SetRowData()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;

            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 0; i < dtCurrentTable.Rows.Count; ++i)
                {
                    TextBox Question = (TextBox)NewTest_Questions_GridView.Rows[rowIndex].Cells[1].FindControl("question_");
                    TextBox Choices = (TextBox)NewTest_Questions_GridView.Rows[rowIndex].Cells[2].FindControl("choices_");

                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumber"] = i + 1;
                    dtCurrentTable.Rows[i]["Col1"] = Question.Text;
                    dtCurrentTable.Rows[i]["Col2"] = Choices.Text;
                    ++rowIndex;
                }

                ViewState["CurrentTable"] = dtCurrentTable;
            }
        }
    }

    protected void next_question_Click(object sender, EventArgs e)
    {
        // ViewState["Questions"] [QuestionID,QuestionID] as int[]
        // ViewState["CurrentQuestion"] "QuestionID" as int
        // ViewState["PassedQuestions"] [QuestionID,QuestionID] as int[]
        // ViewState["Answers"] [ChoiceID,ChoiceID] as string[]
        // ViewState["QuestionTimer'] "QuestionTimer" as int

        if (ViewState["CurrentQuestion"] != null && ViewState["Questions"] != null)
        {
            int CurrentQuestion = int.Parse(ViewState["CurrentQuestion"].ToString());
            int[] questions = ViewState["Questions"] as int[];

            if (ViewState["PassedQuestions"] != null)
            {
                int[] passed_questions = ViewState["PassedQuestions"] as int[];
                int[] passed_questions_new = new int[passed_questions.Length + 1];

                // update array of passed questions with latest one
                for (int i = 0; i < passed_questions.Length; ++i)
                    passed_questions_new[i] = passed_questions[i];
                passed_questions_new[passed_questions_new.Length - 1] = CurrentQuestion;

                if (passed_questions_new.Length < questions.Length)
                {
                    // select next random question
                    while (CurrentQuestion == int.Parse(ViewState["CurrentQuestion"].ToString()))
                    {
                        int q = questions[new Random().Next(questions.Length)];

                        if (Array.IndexOf(passed_questions_new, q) < 0)
                            CurrentQuestion = q;
                    }

                    ViewState["PassedQuestions"] = passed_questions_new;
                    ViewState["CurrentQuestion"] = CurrentQuestion;
                    ViewState["QuestionTimer"] = Convert.ToInt32(ViewState["TestTimer"].ToString()) / ((ViewState["Questions"]) as int[]).Length;    
                }
                else
                    next_question.Text = "Завершити";
            }
            else // first question
            {
                int[] passed_questions = new int[1] { CurrentQuestion };

                // select next question
                while (CurrentQuestion == int.Parse(ViewState["CurrentQuestion"].ToString()))
                {
                    Random rnd = new Random();
                    int i = rnd.Next(questions.Length);
                    int q = 0;

                    q = questions[i];

                    if (CurrentQuestion != q)
                        CurrentQuestion = q;
                }

                // save variables and update
                ViewState["PassedQuestions"] = passed_questions;
                ViewState["CurrentQuestion"] = CurrentQuestion;

                if (ViewState["QuestionTimer"] != null && Convert.ToInt32(ViewState["QuestionTimer"]) > 0)
                    DisplayTest_TimerPeriodic.Enabled = true;
                else
                    DisplayTest_TimeLeft.Visible = false;

                next_question.Text = "Далі >>";
                DisplayTest_InfoForm.Visible = false;
            }
        }
    }

    protected void DisplayTest_TimerPeriodic_Tick(object sender, EventArgs e)
    {
        if (ViewState["QuestionTimer"] != null && ViewState["TestTimer"] != null && ViewState["Questions"] != null)
        {
            int TimeLeft = Convert.ToInt32(ViewState["QuestionTimer"].ToString());
            int TimeTotal = Convert.ToInt32(ViewState["TestTimer"].ToString()) / ((ViewState["Questions"]) as int[]).Length;

            --TimeLeft;

            // shedule next question
            if (TimeLeft == 1)
                Timer1.Enabled = true;

            DisplayTest_TimeLeft.Text = "Залишилось часу: " + TimeLeft.ToString() + " сек.";

            // change foreground color to yellow/red depending on time left
            if (TimeLeft <= TimeTotal / 5 || TimeLeft <= 10)
                DisplayTest_TimeLeft.ForeColor = System.Drawing.Color.Red;
            else if (TimeLeft <= TimeTotal / 2)
                DisplayTest_TimeLeft.ForeColor = System.Drawing.Color.Yellow;

            ViewState["QuestionTimer"] = TimeLeft;
        }
    }

    protected void TestsList_EditTest(object sender, GridViewEditEventArgs e)
    {
        Response.Redirect((TestsList.Rows[e.NewEditIndex].Cells[1].FindControl("TestLink") as HyperLink).NavigateUrl + "&action=edit");
    }

    protected void TestsList_DeleteTest(object sender, GridViewDeleteEventArgs e)
    {
        Response.Redirect((TestsList.Rows[e.RowIndex].Cells[1].FindControl("TestLink") as HyperLink).NavigateUrl + "&action=delete");
    }
}