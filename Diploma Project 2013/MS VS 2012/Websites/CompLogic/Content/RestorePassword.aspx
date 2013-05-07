<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RestorePassword.aspx.cs" Inherits="Content_RestorePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <p style="font-size: medium;">Відновлення паролю</p><br />

    <asp:Literal ID="PR_Successful" runat="server"></asp:Literal>
    
    <asp:Panel ID="PRSend_Form" runat="server" Width="100%">
        
        <p>Тут ви можете відновити втрачений пароль до облікового запису. Процес відновлення складається з декількох кроків.</p><br />
        <p> <b>Крок 1.</b> Підтвердження електронної пошти.</p>
        <p>Введіть Ваше ім'я користувача в поле нижче, і ми віправимо Вам по електронній пошті детальну інформацію про наступні кроки.</p>
        <table class="BodyTable">
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="Ім'я користувача:"></asp:Label></td>
                <td><asp:TextBox ID="PR_Username" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="RestorePassword" runat="server" Text="Підтвердити" Width="50%" OnClick="RestorePassword_Click" /></td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="PRContinue_Form" runat="server" Visible="false" Width="100%">
        <p> <b>Крок 2.</b> Зміна паролю.</p>
        <p>Вкажіть новий пароль до облікового запису. Пам'ятайте, що пароль повинен бути <span style="text-decoration: underline;">не коротшим за 6 та не довшим за 30 символів.</span><span style="color: red;"> Пароль не чутливий до CapsLock / Shift</span>.</p>
        <table class="BodyTable">
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="Новий пароль:"></asp:Label></td>
                <td><asp:TextBox ID="PR_Password" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label3" runat="server" Text="Повторіть пароль:"></asp:Label></td>
                <td><asp:TextBox ID="PR_RePassword" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="ChangePassword" runat="server" Text="Підтвердити" OnClick="ChangePassword_Click" Width="50%" /></td>
            </tr>
        </table>
    </asp:Panel>

    <p><asp:Label ID="PRMessage" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></p>
</asp:Content>

