<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Administrating.aspx.cs" Inherits="Content_Administrating" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <p style="font-size: medium;">Сторінка адміністрування</p><br />
    <asp:Label ID="AdminMessage" runat="server" Text="Ви не маєте права переглядати цю сторінку." ForeColor="Red"></asp:Label>
    <asp:MultiView ID="AdminMultiview" runat="server">
        <asp:View ID="View1" runat="server">
            <table class="BodyTable">
                <tr>
                    <td>Надати/прибрати права доступу:</td>
                    <td><asp:DropDownList ID="Admin_Access_Username" runat="server" Width="100%"></asp:DropDownList></td>
                    <td>
                        <asp:DropDownList ID="Admin_Access_YesNo" runat="server">
                            <asp:ListItem Value="1">Студент</asp:ListItem>
                            <asp:ListItem Value="2">Викладач</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td><asp:Button ID="Admin_Access" runat="server" Text="Виконати" Width="130%" OnClick="Admin_Access_Click" /></td>
                </tr>
                <tr>
                    <td>Добавити групу:</td>
                    <td><asp:TextBox ID="Admin_Group_Name" runat="server" MaxLength="10" Width="100%"></asp:TextBox></td>
                    <td></td>
                    <td><asp:Button ID="Admin_Add_Group" runat="server" Text="Виконати" OnClick="Admin_Add_Group_Click" Width="130%" /></td>
                </tr>
                <tr>
                    <td>Видалити групу:</td>
                    <td><asp:DropDownList ID="Admin_GroupsList" runat="server" Width="100%"></asp:DropDownList></td>
                    <td></td>
                    <td><asp:Button ID="Admin_Del_Group" runat="server" Text="Виконати" OnClick="Admin_Del_Group_Click" OnClientClick="return window.confirm('Дійсно бажаєте видалити цю групу?');" Width="130%" /></td>
                </tr>
                <tr>
                    <td>Активувати обліковий запис:</td>
                    <td><asp:DropDownList ID="Admin_Activate_Username" runat="server" ToolTip="Введіть ім'я користувача (Username)" Width="100%"></asp:DropDownList></td>
                    <td></td>
                    <td><asp:Button ID="Admin_Activate" runat="server" Text="Виконати" OnClick="Admin_Activate_Click" Width="130%" /></td>
                </tr>
                <tr>
                    <td>Завантажити файл на сервер:</td>
                    <td><asp:FileUpload ID="Admin_FileUpload" runat="server" /></td>
                    <td></td>
                    <td><asp:Button ID="Admin_Upload" runat="server" Text="Завантажити" Width="130%" OnClick="Admin_Upload_Click" /></td>
                </tr>
                <tr>
                    <td colspan="4"><asp:Label ID="FileUpload_Result" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td valign="top">Виконати SQL команду:</td>
                    <td colspan="2"><asp:TextBox ID="Admin_SQL" runat="server" Width="100%" TextMode="MultiLine" CssClass="MultilineTextBox"></asp:TextBox></td>
                    <td valign="top"><asp:Button ID="Admin_SQL_Execute" runat="server" Text="Виконати" Width="130%" OnClick="Admin_SQL_Execute_Click" /></td>
                </tr>
                <tr>
                    <td colspan="4"><asp:Label ID="SQL_Result" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

