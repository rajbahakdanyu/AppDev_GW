<%@ Page Title="Purchase Detail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="AppDev_GW.Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:Label ID="lbTitle" runat="server" Text="Purchase Details" Font-Size="Large"></asp:Label>

    <div>
        <asp:DropDownList ID="ddlSearch" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Customer]"></asp:SqlDataSource>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"/>
    </div>

    <div>
        <asp:GridView ID="GridView1" runat="server" EmptyDataText="No Purchase History Found."></asp:GridView>
    </div>
</asp:Content>
