<%@ Page Title="Stock" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="AppDev_GW.Stock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lbTitle" runat="server" Text="Stock" Font-Size="Large"></asp:Label>

    <div>
        <asp:Label ID="Label1" runat="server" Text="Product Name"></asp:Label>
        <asp:DropDownList ID="ddlItem" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Item]"></asp:SqlDataSource>
        <asp:Label ID="Label2" runat="server" Text="Quantity"></asp:Label>
        <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
        <asp:Button ID="btnAdd" runat="server" Text="Add/Update" OnClick="btnAdd_Click" />
    </div>

    <div>
        <asp:GridView ID="GridView1" runat="server" EmptyDataText="No Items found"></asp:GridView>
    </div>
</asp:Content>
