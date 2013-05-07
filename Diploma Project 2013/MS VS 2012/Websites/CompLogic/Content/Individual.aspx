<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Individual.aspx.cs" Inherits="Content_Individuals" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:Panel ID="IndividualsList_Form" runat="server" Visible="true">
        <p style="font-size: medium;">Перелік списків індивідуальних завдань</p><br />
        <asp:GridView ID="IndividualsList" runat="server" CellSpacing="10" GridLines="None" AutoGenerateColumns="false" ShowFooter="true" Width="100%" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="IndividualIndex"  HeaderText="№" HeaderStyle-Width="20" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Center" />
                <asp:TemplateField HeaderText="Тема" HeaderStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:HyperLink ID="IndividualLink" runat="server" Text='<%# Bind("Title") %>' NavigateUrl='<%# "~/Content/Individual.aspx?id=" + Eval("IndividualIndex") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Автор" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="160">
                    <ItemTemplate>
                        <asp:Label ID="Author" runat="server" Text='<%# Eval("Surname") + " " + Eval("Name") %>'></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:BoundField DataField="DateCreated" HeaderText="Складений" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="80" />
                <asp:TemplateField ItemStyle-VerticalAlign="Top">
                    <ItemTemplate>
                        <asp:ImageButton ID="IndividualsList_DeleteIndividual" runat="server" ImageUrl="~/Source/img/document-detach.png" ToolTip="видалити список індивідуальних завдань" Width="20" Height="20" AlternateText='<%# Eval("IndividualIndex") %>' OnClick="IndividualsList_DeleteIndividual" OnClientClick="return window.confirm('Дійсно бажаєте видалити цю Лабораторну роботу?');"></asp:ImageButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:HyperLink ID="IndividualsList_AddIndividual" runat="server" ImageUrl="~/Source/img/document-attach.png" ToolTip="написати список індивідуальних завдань" NavigateUrl="~/Content/Individual.aspx?id=new" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>

    <asp:HyperLink ID="Button_Return" runat="server" NavigateUrl="~/Content/Individual.aspx" Text="&larr; Повернутися до списку індивідуальних завдань"></asp:HyperLink>

    <asp:Panel ID="DisplayIndividual_Form" runat="server" Visible="false" Width="100%">
        <table width="100%" cellspacing="10">
            <tr>
                <td align="left" width="80%">
                    <asp:HyperLink ID="DisplayIndividual_AddIndividual" runat="server" ImageUrl="~/Source/img/document-attach.png" ToolTip="написати список індивідуальних завдань" Visible="false" NavigateUrl="~/Content/Individual.aspx?id=new" />
                    <asp:ImageButton ID="DisplayIndividual_DeleteIndividual" runat="server" ImageUrl="~/Source/img/document-detach.png" ToolTip="видалити список індивідуальних завдань" Visible="false" OnClientClick="return window.confirm('Дійсно бажаєте видалити цю Лабораторну роботу?')" OnClick="DisplayIndividual_DeleteIndividual_Click" />
                    <asp:ImageButton ID="DisplayIndividual_AddPage" runat="server" ImageUrl="~/Source/img/document-add.png" ToolTip="додати сторінку" Visible="false" OnClick="DisplayIndividual_AddPage_Click" />
                    <asp:ImageButton ID="DisplayIndividual_EditPage" runat="server" ImageUrl="~/Source/img/document-edit.png" ToolTip="правити сторінку" Visible="false" OnClick="DisplayIndividual_EditPage_Click" />
                    <asp:ImageButton ID="DisplayIndividual_DeletePage" runat="server" ImageUrl="~/Source/img/document-remove.png" ToolTip="видалити сторінку" Visible="false" OnClick="DisplayIndividual_DeletePage_Click" OnClientClick="return window.confirm('Дійсно бажаєте видалити цю сторінку?')" />
                </td>
                <td align="right" width="20%">
                    <asp:HyperLink ID="DisplayIndividual_Previous" runat="server" Text="&larr;" ToolTip="Попередня робота"></asp:HyperLink>
                    |
                    <asp:HyperLink ID="DisplayIndividual_Next" runat="server" Text="&rarr;" ToolTip="Наступна робота"></asp:HyperLink>
                </td>
            </tr>
            <tr><td colspan="2"><b>Тема: </b><asp:Label ID="DisplayIndividual_Title" runat="server" Text="" oncopy="return false;" oncut="return false;"></asp:Label></td></tr>
            <tr><td></td></tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="DisplayIndividual_Content" runat="server" Visible="false"></asp:Label>
                    <asp:ListView ID="DisplayIndividual_ListView" runat="server" DataSourceID="DisplayIndividual_DataSource" OnDataBound="DisplayIndividual_ListView_DataBound" OnPagePropertiesChanging="DisplayIndividual_ListView_PagePropertiesChanging">
                        <ItemTemplate>
                            <asp:Label ID="_content" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:ListView>
                    <center><asp:DataPager ID="DisplayIndividual_DataPager" runat="server" PagedControlID="DisplayIndividual_ListView" PageSize="1">
                        <Fields>
                            <asp:NextPreviousPagerField PreviousPageText="<" ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" ShowLastPageButton="false" />
                            <asp:NumericPagerField ButtonCount="10" />
                            <asp:NextPreviousPagerField NextPageText=">" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager></center>
                    <asp:SqlDataSource ID="DisplayIndividual_DataSource" runat="server" ConnectionString='<%$ ConnectionStrings:DBConnection %>'></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="NewIndividual_Form" runat="server" Visible="false" Width="100%">
        <table width="100%">
            <tr>
                <td>№ <asp:TextBox ID="NewIndividual_Index" runat="server" Width="20px" MaxLength="2"></asp:TextBox></td>
                <td width="40px">Тема:</td>
                <td><asp:TextBox ID="NewIndividual_Title" runat="server" Width="100%"></asp:TextBox></td>
            </tr>
        </table>
        <CKEditor:CKEditorControl ID="CKEditor" runat="server" Width="100%" IndentOffset="24" ResizeDir="Vertical"></CKEditor:CKEditorControl>
        <br />
        <asp:Button ID="NewIndividual_Preview" runat="server" Text="Попередній перегляд" Width="160px" OnClick="NewIndividual_Preview_Click" />
        <asp:Button ID="NewIndividual_Submit" runat="server" Text="Додати список" Width="120px" OnClick="NewIndividual_Submit_Click" />
        <asp:Button ID="NewIndividual_Update" runat="server" Text="Зберегти зміни" Visible="false" Width="120px" OnClick="NewIndividual_Update_Click" />
        <asp:Button ID="NewIndividual_AddPage" runat="server" Text="Додати сторінку" Visible="false" Width="120px" OnClick="NewIndividual_AddPage_Click" />
    </asp:Panel>
</asp:Content>

