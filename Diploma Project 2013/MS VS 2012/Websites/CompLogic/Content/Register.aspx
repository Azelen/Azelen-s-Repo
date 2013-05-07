<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Content_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:Literal ID="Register_Success" runat="server"></asp:Literal>

    <asp:Panel ID="Register_Form" runat="server">
        <p style="font-size: medium;">Реєстрація в електронному посібнику</p><br />
        <p>Заповніть форму представлену нижче щоб отримати статус користувача електронного посібника. При заповненні форми вкажіть Ваші <span style="text-decoration: underline;">справжні ім'я та прізвище а також
            реальну адресу електронної пошти</span>, на яку після реєстрації буде відправлено вказівки щодо активації Вашого облікового запису.</p><br />
        <p>Пароль до облікового запису повинен бути <span style="text-decoration: underline;">не коротшим за 6 та не довшим за 30 символів.</span><span style="color: red;"> Пароль не чутливий до CapsLock / Shift</span>.
            Для більшої надійності пароля рекомендовано використовувати в ньому не лише букви чи цифри, а комбінацію букв, цифр і допоміжних символів.</p><br />
        <p><b>* Всі поля є обов'язковими для заповнення.</b></p><br />
        <p><asp:Label ID="RegisterMessage" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label></p>
        <table class="BodyTable">
            <tr>
                <td>Ім'я користувача:</td>
                <td><asp:TextBox ID="Register_Username" runat="server" MaxLength="24"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Електронна адреса:</td>
                <td><asp:TextBox ID="Register_Email" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Пароль:</td>
                <td><asp:TextBox ID="Register_Password" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Повторіть пароль:</td>
                <td><asp:TextBox ID="Register_RePassword" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Прізвише:</td>
                <td><asp:TextBox ID="Register_Surname" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Ім'я:</td>
                <td><asp:TextBox ID="Register_Name" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Група:</td>
                <td><asp:DropDownList ID="Register_Group" runat="server" Width="100%"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Стать:</td>
                <td>
                    <asp:DropDownList ID="Register_Gender" runat="server" Width="100%">
                        <asp:ListItem Text="Не вказано"></asp:ListItem>
                        <asp:ListItem Text="Чоловіча"></asp:ListItem>
                        <asp:ListItem Text="Жіноча"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td valign="top">Показувати мою<br />електронну адресу:</td>
                <td>
                    <asp:RadioButtonList ID="Register_EmailOptions" runat="server">
                        <asp:ListItem Value="0" Selected="True"> всім</asp:ListItem>
                        <asp:ListItem Value="1"> групі і викладачам</asp:ListItem>
                        <asp:ListItem Value="2"> викладачам</asp:ListItem>
                        <asp:ListItem Value="3"> нікому</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td style="padding: 15px 0 15px 0;" align="center"><asp:Button ID="Register_Submit" runat="server" Text="Зареєструватися" Width="130px" OnClick="Register_Submit_Click" /></td>
                <td style="padding: 15px 0 15px 0;" align="center"><asp:Button ID="Register_Clean" runat="server" Text="Очистити форму" Width="140px" OnClick="Register_Clean_Click" /></td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

