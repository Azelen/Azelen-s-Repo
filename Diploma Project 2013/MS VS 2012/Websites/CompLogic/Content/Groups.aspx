<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Groups.aspx.cs" Inherits="Content_Groups" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <p style="font-size: medium;">Список груп користувачів</p><br />
    <asp:Label ID="lbl1" runat="server" Text=""></asp:Label>
    <table class="BodyTable" width="100%">
        <tr>
            <td colspan="2" align="center">Виберіть групу зі списку:
            <asp:DropDownList ID="Sel_Group" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Sel_Group_SelectedIndexChanged"></asp:DropDownList></td>
        </tr>
        <tr>
            <td colspan="2"><br />
                <asp:Table ID="Students_List" runat="server" Width="100%">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell Text="№" Width="20"></asp:TableHeaderCell>
                        <asp:TableHeaderCell Text="Прізвище Ім'я"></asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>
            </td>
        </tr>
    </table>
</asp:Content>

