<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Content_Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <p style="font-size: medium;">Профіль користувача</p><br />
    <asp:Label ID="UsersMessage" runat="server" Text="" Visible="false"></asp:Label>
    <table class="BodyTable">
        <tr>
            <td>Користувач:</td>
            <td><asp:Label ID="UserInfo_SurnameName" runat="server" Text=""></asp:Label> | <asp:Label ID="UserInfo_Username" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Група:</td>
            <td><asp:HyperLink ID="UserInfo_Group" runat="server" Text=""></asp:HyperLink></td>
        </tr>
        <tr>
            <td>Стать:</td>
            <td><asp:Label ID="UserInfo_Gender" runat="server" Text="Не вказано"></asp:Label></td>
        </tr>
        <tr>
            <td>Востаннє в мережі:</td>
            <td><asp:Label ID="UserInfo_LastLogin" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Електронна адреса:</td>
            <td>
                <asp:Label ID="UserInfo_Email" runat="server" Text=""> </asp:Label>
                <asp:TextBox ID="UserInfo_EmailEdit" runat="server" Text="" Visible="false"></asp:TextBox>
                <asp:LinkButton ID="UserInfo_EmailUpdate" runat="server" Text="змінити" Visible="false" OnClick="UserInfo_EmailUpdate_Click"></asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>

