<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Content_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <p style="font-size: medium;">Вхід в систему</p><br />

    <asp:Panel ID="Login_Notification" runat="server" Visible="false">
        <p><asp:Label ID="ActivationMessage" runat="server" Text=""></asp:Label></p>
        <p><asp:LinkButton ID="Login_Redirect" runat="server" Text="Ввійти в систему" Visible="false" OnClick="Login_Redirect_Click" /></p>
        <p><asp:LinkButton ID="Resend_Email" runat="server" Text="Надіслати повідомлення на електронну адресу ще раз" Visible="False" OnClick="Resend_Email_Click" /></p>
    </asp:Panel>

    <asp:Literal ID="Email_Resent" runat="server"></asp:Literal>

    <asp:Panel ID="Login_Form" runat="server" Visible="false">
        <table class="BodyTable">
            <tr>
                <td>Користувач:</td>
                <td><asp:TextBox ID="Login_Username" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Пароль:</td>
                <td><asp:TextBox ID="Login_Password" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2"><asp:CheckBox ID="Login_RememberMe" runat="server" Text=" Замап'ятати на місяць" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Login" runat="server" Text="Ввійти" Width="120px" OnClick="Login_Click" /></td>
            </tr>
            <tr>
                <td align="center"><a href="../Content/RestorePassword.aspx">Забули пароль?</a></td>
                <td align="center"><a href="../Content/Register.aspx">Зареєструватися</a></td>
            </tr>
        </table>
        <p><asp:Label ID="LoginMessage" runat="server" Visible="False" ForeColor="Red"></asp:Label></p>
    </asp:Panel>
</asp:Content>

