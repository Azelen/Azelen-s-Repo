<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Tests.aspx.cs" Inherits="Content_Tests" ValidateRequest="false" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>

    <asp:Panel ID="TestsList_Form" runat="server" Visible="true">
        <p style="font-size: medium;">Список тестів</p><br />
        <asp:GridView ID="TestsList" runat="server" CellSpacing="10" GridLines="None" AutoGenerateColumns="false" Width="100%" AllowPaging="true" ShowFooter="true">
            <Columns>
                <asp:BoundField DataField="TestID" Visible="false" />
                <asp:TemplateField HeaderText="Тема" HeaderStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top">
                    <ItemTemplate>
                        <asp:HyperLink ID="TestLink" runat="server" Text='<%# Bind("Title") %>' NavigateUrl='<%# "~/Content/Tests.aspx?id=" + Eval("TestID") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="QuestionsLimit" HeaderText="Запитань" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="80" />
                <asp:TemplateField HeaderText="Тривалість" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" HeaderStyle-Width="100">
                    <ItemTemplate>
                        <asp:Label ID="TimeLimit" runat="server" Text='<%# Convert.ToInt32(Eval("TimeLimit")) > 0 ? Eval("TimeLimit") + " хв." : "--" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Тип" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" HeaderStyle-Width="80">
                    <ItemTemplate>
                        <asp:Label ID="IsFree" runat="server" Text='<%# Convert.ToBoolean(Eval("IsFreeTest")) ? "Пробний" : "Звичайний" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-VerticalAlign="Top">
                    <ItemTemplate>
                        <asp:ImageButton ID="TestsList_DeleteTest" runat="server" ImageUrl="~/Source/img/stats-delete.png" ToolTip="видалити тест" Width="20" Height="20" AlternateText='<%# Eval("TestID") %>' OnClick="TestsList_DeleteTest_Click" OnClientClick="return window.confirm('Дійсно бажаєте видалити цей тест?');"></asp:ImageButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:HyperLink ID="TestsList_AddTest" runat="server" ImageUrl="~/Source/img/stats-add.png" ToolTip="створити новий тест" Width="20" Height="20" NavigateUrl="~/Content/Tests.aspx?id=new" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    
    <asp:Panel ID="NewTest_Form" runat="server" Visible="false">
        <p style="font-size: medium;">Створення нового тесту</p><br />
        <p>Форматування варіантів відповіді: кожен з можливих варіантів відповіді повинен бути поміщений у []. Порядковий номер правильного варіанту відповіді повинен бути поміщений у {}.
            Номер правильної відповіді відповідає порядковому номеру варіанту відповіді. Наприклад:</p><br />
        <p align="center">[у 1945р.] [у 1951р.] [у 1884р.] {1}</p><br />
        <p>Тести помічені як "Пробний" будуть доступні користувачам без реєстрації і результати про їх проходження не будуть внесені до бази даних. В полях можна використовувати HTML теги.</p><br />
        <p><asp:Label ID="ErrorMessage" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></p>
        <table width="100%">
            <tr>
                <td width="270px">Назва тесту:</td>
                <td><asp:TextBox ID="NewTest_Title" runat="server" Width="100%"></asp:TextBox></td>
                <td width="100px" align="right"><asp:CheckBox ID="NewTest_IsFree" runat="server" />Пробний?</td>
            </tr>
            <tr>
                <td width="270px">Кількість питань за раз:</td>
                <td><asp:TextBox ID="QuestionsRequired" runat="server" Width="50px" MaxLength="3"></asp:TextBox></td>
                <td></td>
            </tr>
            <tr>
                <td width="270px">Загальний час на проходження тесту:</td>
                <td><asp:TextBox ID="TimeLimit" runat="server" Width="50px" MaxLength="3"></asp:TextBox> хв.</td>
                <td></td>
            </tr>
            <tr>
                <td width="270px">Максимальна кількість спроб:</td>
                <td><asp:TextBox ID="ChancesLimit" runat="server" Width="50px" MaxLength="3"></asp:TextBox></td>
            </tr>
        </table>
        <asp:GridView ID="NewTest_Questions_GridView" runat="server" CellPadding="4" CellSpacing="7" ShowFooter="true" AutoGenerateColumns="false" GridLines="None" OnRowDeleting="DeleteRow" Width="100%">
            <Columns>
                <asp:BoundField DataField="RowNumber" HeaderText="№" />
                <asp:TemplateField HeaderText="Питання">
                    <ItemTemplate>
                        <asp:TextBox ID="question_" runat="server" Width="100%"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Варіанти відповіді">
                    <ItemTemplate>
                        <asp:TextBox ID="choices_" runat="server" Width="100%"></asp:TextBox><br />
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Right" />
                    <FooterTemplate>
                        <asp:Button ID="NewTest_AddQuestion" runat="server" Text="Додати запитання" Width="140" OnClick="NewTest_AddQuestion_Click" />
                        <asp:Button ID="NewTest_Submit" runat="server" Text="Зберегти тест" Width="100" OnClick="NewTest_Submit_Click" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="true" DeleteText="вилучити" ItemStyle-HorizontalAlign="center" />
            </Columns>
        </asp:GridView>
    </asp:Panel>

    <asp:Panel ID="DisplayTest_Form" runat="server" Visible="false">
        <center><asp:Label ID="DisplayTest_Title" runat="server" Text="" Font-Bold="true" Font-Size="medium"></asp:Label></center><br />

        <asp:Panel ID="DisplayTest_InfoForm" runat="server" Visible="false">
            <table width="100%">
                <tr>
                    <td>Користувач:</td>
                    <td><asp:Label ID="TestInfo_UserInfo" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Кількість питань:</td>
                    <td><asp:Label ID="TestInfo_QuestionsLimit" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Час на проходження тесту:</td>
                    <td><asp:Label ID="TestInfo_TimeLimit" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Часу на одне запитання:</td>
                    <td><asp:Label ID="TestInfo_TimePerQuestionLimit" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Кількість спроб:</td>
                    <td><asp:Label ID="TestInfo_TimesPassed" runat="server" Text="0"></asp:Label></td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="DisplayTest_QuestionForm" runat="server" Visible="false">
            <asp:Table runat="server" Width="100%">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Right">
                        <asp:Timer ID="DisplayTest_TimerPeriodic" runat="server" Interval="1000" Enabled="false" OnTick="DisplayTest_TimerPeriodic_Tick"></asp:Timer>
                        <asp:Timer ID="Timer1" runat="server" Interval="1000" Enabled="false" OnTick="DisplayTest_TimerPeriodic_Tick"></asp:Timer>
                        <asp:UpdatePanel ID="DisplayTest_TimerPanel" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="DisplayTest_TimeLeft" runat="server" Text="" ForeColor="LightGreen" BackColor="Black"></asp:Label>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="Timer1" />
                                <asp:AsyncPostBackTrigger ControlID="DisplayTest_TimerPeriodic" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="DisplayTest_QuestionIndex" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="DisplayTest_QuestionText" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:RadioButtonList ID="DisplayTest_ChoicesList" runat="server"></asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </asp:Panel>

        <asp:Button ID="next_question" runat="server" Text="Почати тест" OnClick="next_question_Click" Width="120px" />

        <asp:Panel ID="DisplayTest_ResultForm" runat="server" Visible="false">
            <asp:Label ID="DisplayTest_Result" runat="server" Text=""></asp:Label>
        </asp:Panel>
    </asp:Panel>
</asp:Content>