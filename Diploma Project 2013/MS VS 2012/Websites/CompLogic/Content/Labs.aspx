<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Labs.aspx.cs" Inherits="Content_Labs" ValidateRequest="false" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:Panel ID="LabsList_Form" runat="server" Visible="true">
        <p style="font-size: medium;">Список лабораторних робіт</p><br />
        <asp:GridView ID="LabsList" runat="server" CellSpacing="10" GridLines="None" AutoGenerateColumns="false" ShowFooter="true" Width="100%" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="LabIndex"  HeaderText="№" HeaderStyle-Width="20" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Center" />
                <asp:TemplateField HeaderText="Тема" HeaderStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:HyperLink ID="LabLink" runat="server" Text='<%# Bind("Title") %>' NavigateUrl='<%# "~/Content/Labs.aspx?id=" + Eval("LabIndex") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Автор" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="160">
                    <ItemTemplate>
                        <asp:Label ID="Author" runat="server" Text='<%# Eval("Surname") + " " + Eval("Name") %>'></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:BoundField DataField="DateCreated" HeaderText="Написана" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="80" />
                <asp:TemplateField ItemStyle-VerticalAlign="Top">
                    <ItemTemplate>
                        <asp:ImageButton ID="LabsList_DeleteLab" runat="server" ImageUrl="~/Source/img/document-detach.png" ToolTip="видалити роботу" Width="20" Height="20" AlternateText='<%# Eval("LabIndex") %>' OnClick="LabsList_DeleteLab" OnClientClick="return window.confirm('Дійсно бажаєте видалити цю Лабораторну роботу?');"></asp:ImageButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:HyperLink ID="LabsList_AddLab" runat="server" ImageUrl="~/Source/img/document-attach.png" ToolTip="написати нову робота" Width="20" Height="20" NavigateUrl="~/Content/Labs.aspx?id=new" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>

    <asp:HyperLink ID="Button_Return" runat="server" NavigateUrl="~/Content/Labs.aspx" Text="&larr; Повернутися до списку лабораторних робіт"></asp:HyperLink>

    <asp:Panel ID="DisplayLab_Form" runat="server" Visible="false" Width="100%">
        <table width="100%" cellspacing="10">
            <tr>
                <td align="left" width="80%">
                    <asp:HyperLink ID="DisplayLab_AddLab" runat="server" ImageUrl="~/Source/img/document-attach.png" ToolTip="написати роботу" Visible="false" NavigateUrl="~/Content/Labs.aspx?id=new" />
                    <asp:ImageButton ID="DisplayLab_DeleteLab" runat="server" ImageUrl="~/Source/img/document-detach.png" ToolTip="видалити роботу" Visible="false" OnClientClick="return window.confirm('Дійсно бажаєте видалити цю Лабораторну роботу?')" OnClick="DisplayLab_DeleteLab_Click" />
                    <asp:ImageButton ID="DisplayLab_AddPage" runat="server" ImageUrl="~/Source/img/document-add.png" ToolTip="додати сторінку" Visible="false" OnClick="DisplayLab_AddPage_Click" />
                    <asp:ImageButton ID="DisplayLab_EditPage" runat="server" ImageUrl="~/Source/img/document-edit.png" ToolTip="правити сторінку" Visible="false" OnClick="DisplayLab_EditPage_Click" />
                    <asp:ImageButton ID="DisplayLab_DeletePage" runat="server" ImageUrl="~/Source/img/document-remove.png" ToolTip="видалити сторінку" Visible="false" OnClick="DisplayLab_DeletePage_Click" OnClientClick="return window.confirm('Дійсно бажаєте видалити цю сторінку?')" />
                </td>
                <td align="right" width="20%">
                    <asp:HyperLink ID="DisplayLab_Previous" runat="server" Text="&larr;" ToolTip="Попередня робота"></asp:HyperLink>
                    |
                    <asp:HyperLink ID="DisplayLab_Next" runat="server" Text="&rarr;" ToolTip="Наступна робота"></asp:HyperLink>
                </td>
            </tr>
            <tr><td colspan="2"><b>Тема: </b><asp:Label ID="DisplayLab_Title" runat="server" Text="" oncopy="return false;" oncut="return false;"></asp:Label></td></tr>
            <tr><td colspan="2"><b>Мета: </b><asp:Label ID="DisplayLab_Subtitle" runat="server" Text="" oncopy="return false;" oncut="return false;"></asp:Label></td></tr>
            <tr><td></td></tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="DisplayLab_Content" runat="server" Visible="false"></asp:Label>
                    <asp:ListView ID="DisplayLab_ListView" runat="server" DataSourceID="DisplayLab_DataSource" OnDataBound="DisplayLab_ListView_DataBound" OnPagePropertiesChanging="DisplayLab_ListView_PagePropertiesChanging">
                        <ItemTemplate>
                            <asp:Label ID="_content" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:ListView>
                    <center><asp:DataPager ID="DisplayLab_DataPager" runat="server" PagedControlID="DisplayLab_ListView" PageSize="1">
                        <Fields>
                            <asp:NextPreviousPagerField PreviousPageText="<" ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" ShowLastPageButton="false" />
                            <asp:NumericPagerField ButtonCount="10" />
                            <asp:NextPreviousPagerField NextPageText=">" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager></center>
                    <asp:SqlDataSource ID="DisplayLab_DataSource" runat="server" ConnectionString='<%$ ConnectionStrings:DBConnection %>'></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="NewLab_Form" runat="server" Visible="false" Width="100%">
        <table width="100%">
            <tr>
                <td>№ <asp:TextBox ID="NewLab_Index" runat="server" Width="20px" MaxLength="2"></asp:TextBox></td>
                <td width="40px">Тема:</td>
                <td><asp:TextBox ID="NewLab_Title" runat="server" Width="100%"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td width="40px">Мета:</td>
                <td><asp:TextBox ID="NewLab_Subtitle" runat="server" Width="100%"></asp:TextBox></td>
            </tr>
        </table>
        <CKEditor:CKEditorControl ID="CKEditor" runat="server" Width="100%" IndentOffset="24" ResizeDir="Vertical"></CKEditor:CKEditorControl>
        <br />
        <asp:Button ID="NewLab_Preview" runat="server" Text="Попередній перегляд" Width="160px" OnClick="NewLab_Preview_Click" />
        <asp:Button ID="NewLab_Submit" runat="server" Text="Додати роботу" Width="120px" OnClick="NewLab_Submit_Click" />
        <asp:Button ID="NewLab_Update" runat="server" Text="Зберегти зміни" Visible="false" Width="120px" OnClick="NewLab_Update_Click" />
        <asp:Button ID="NewLab_AddPage" runat="server" Text="Додати сторінку" Visible="false" Width="120px" OnClick="NewLab_AddPage_Click" />
    </asp:Panel>
</asp:Content>

