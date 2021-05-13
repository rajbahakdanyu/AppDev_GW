<%@ Page Title="Purchase Detail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="AppDev_GW.Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-md-7">
        <div class="card">
            <table>
                <tr>
                    <td class="p-1">
                        <asp:Label ID="lbTitle" runat="server" Text="Purchase Details for the Past Month" Font-Size="Large"></asp:Label></td>
                    <td class="p-1"></td>
                    <td class="p-1"></td>
                </tr>
                <tr>
                    <td class="p-1">
                        <asp:DropDownList ID="ddlSearch" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id" Height="33px" Width="184px"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Customer]"></asp:SqlDataSource>
                    </td>
                    <td class="p-1">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-info btn-lg" /></td>
                    <td class="p-1">
                        <asp:Label ID="Label1" runat="server" Text="Purchase Details" Font-Size="Large" ForeColor="White"></asp:Label></td>
                </tr>
            </table>




            <div class="card table table-hover table-responsive p-1">
                <asp:GridView ID="GridView1" runat="server" orderStyle="None" GridLines="None" EmptyDataText="No Purchase History Found."></asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>
