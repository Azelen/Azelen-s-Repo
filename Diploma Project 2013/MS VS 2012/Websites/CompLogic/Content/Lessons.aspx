<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Lessons.aspx.cs" Inherits="Content_Lessons" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:Panel ID="LessonsList_Form" runat="server" Visible="true">
        <p style="font-size: medium;">Список лекцій</p><br />
        <asp:GridView ID="LessonsList" runat="server" CellSpacing="10" GridLines="None" AutoGenerateColumns="false" ShowFooter="true" Width="100%" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="LessonIndex"  HeaderText="№" HeaderStyle-Width="20" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Center" />
                <asp:TemplateField HeaderText="Тема" HeaderStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:HyperLink ID="LessonLink" runat="server" Text='<%# Bind("Title") %>' NavigateUrl='<%# "~/Content/Lessons.aspx?id=" + Eval("LessonIndex") %>'></asp:HyperLink>
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
                        <asp:ImageButton ID="LessonsList_DeleteLesson" runat="server" ImageUrl="~/Source/img/document-detach.png" ToolTip="видалити лекцію" AlternateText='<%# Eval("LessonIndex") %>' Width="20" Height="20" OnClick="LessonsList_DeleteLesson" OnClientClick="return window.confirm('Дійсно бажаєте видалити цю лекцію?');"></asp:ImageButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:HyperLink ID="LessonsList_AddLesson" runat="server" ImageUrl="~/Source/img/document-attach.png" ToolTip="написати нову лекцію" Width="20" Height="20" NavigateUrl="~/Content/Lessons.aspx?id=new" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>

    <asp:HyperLink ID="Button_Return" runat="server" NavigateUrl="../Content/Lessons.aspx" Text="&larr; Повернутися до списку лекцій"></asp:HyperLink>

    <asp:Panel ID="DisplayLesson_Form" runat="server" Visible="false" Width="100%">
        <table width="100%" cellspacing="10">
            <tr>
                <td align="left" width="80%">
                    <asp:HyperLink ID="DisplayLesson_AddLesson" runat="server" ImageUrl="~/Source/img/document-attach.png" ToolTip="написати лекцію" Visible="false" NavigateUrl="~/Content/Lessons.aspx?id=new" />
                    <asp:ImageButton ID="DisplayLesson_DeleteLesson" runat="server" ImageUrl="~/Source/img/document-detach.png" ToolTip="видалити лекцію" Visible="false" OnClientClick="return window.confirm('Дійсно бажаєте видалити цю лекцію?')" OnClick="DisplayLesson_DeleteLesson_Click" />
                    <asp:ImageButton ID="DisplayLesson_AddPage" runat="server" ImageUrl="~/Source/img/document-add.png" ToolTip="додати сторінку" Visible="false" OnClick="DisplayLesson_AddPage_Click" />
                    <asp:ImageButton ID="DisplayLesson_EditPage" runat="server" ImageUrl="~/Source/img/document-edit.png" ToolTip="правити сторінку" Visible="false" OnClick="DisplayLesson_EditPage_Click" />
                    <asp:ImageButton ID="DisplayLesson_DeletePage" runat="server" ImageUrl="~/Source/img/document-remove.png" Visible="false" ToolTip="видалити сторінку" OnClientClick="return window.confirm('Дійсно бажаєте видалити цю сторінку?')" OnClick="DisplayLesson_DeletePage_Click" />
                </td>
                <td align="right" width="20%">
                    <asp:HyperLink ID="DisplayLesson_Previous" runat="server" Text="&larr;" ToolTip="Попередня лекція"></asp:HyperLink>
                    |
                    <asp:HyperLink ID="DisplayLesson_Next" runat="server" Text="&rarr;" ToolTip="Наступна лекція"></asp:HyperLink>
                </td>
            </tr>
            <tr><td colspan="2"><b>Тема: </b><asp:Label ID="DisplayLesson_Title" runat="server" Text="" oncopy="return false;" oncut="return false;"></asp:Label></td></tr>
            <tr><td colspan="2"><b>Мета: </b><asp:Label ID="DisplayLesson_Subtitle" runat="server" Text="" oncopy="return false;" oncut="return false;"></asp:Label></td></tr>
            <tr><td></td></tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="DisplayLesson_Content" runat="server" Visible="false"></asp:Label>
                    <asp:ListView ID="DisplayLesson_ListView" runat="server" DataSourceID="DisplayLesson_DataSource">
                        <ItemTemplate>
                            <asp:Label ID="_content" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:ListView>
                    <center><asp:DataPager ID="DisplayLesson_DataPager" runat="server" PagedControlID="DisplayLesson_ListView" PageSize="1">
                        <Fields>
                            <asp:NextPreviousPagerField PreviousPageText="<" ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" ShowLastPageButton="false" />
                            <asp:NumericPagerField ButtonCount="10" />
                            <asp:NextPreviousPagerField NextPageText=">" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager></center>
                    <asp:SqlDataSource ID="DisplayLesson_DataSource" runat="server" ConnectionString='<%$ ConnectionStrings:DBConnection %>'></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="NewLesson_Form" runat="server" Visible="false" Width="100%">
        <table width="100%">
            <tr>
                <td>№ <asp:TextBox ID="NewLesson_Index" runat="server" Width="20px" MaxLength="2"></asp:TextBox></td>
                <td width="40px">Тема:</td>
                <td><asp:TextBox ID="NewLesson_Title" runat="server" Width="100%"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td width="40px">Мета:</td>
                <td><asp:TextBox ID="NewLesson_Subtitle" runat="server" Width="100%"></asp:TextBox></td>
            </tr>
        </table>
        <CKEditor:CKEditorControl ID="CKEditor" runat="server" Width="100%" IndentOffset="24" ResizeDir="Vertical"></CKEditor:CKEditorControl>
        <br />
        <asp:Button ID="NewLesson_Preview" runat="server" Text="Попередній перегляд" Width="160px" OnClick="NewLesson_Preview_Click" />
        <asp:Button ID="NewLesson_Submit" runat="server" Text="Додати лекцію" Width="120px" OnClick="NewLesson_Submit_Click" />
        <asp:Button ID="NewLesson_Update" runat="server" Text="Зберегти зміни" Visible="false" Width="120px" OnClick="NewLesson_Update_Click" />
        <asp:Button ID="NewLesson_AddPage" runat="server" Text="Додати сторінку" Visible="false" Width="120px" OnClick="NewLesson_AddPage_Click" />
    </asp:Panel>
</asp:Content>