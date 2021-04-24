<%@ Page Title="Out of Stock" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OutofStock.aspx.cs" Inherits="AppDev_GW.OutofStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lbTitle" runat="server" Text="Products Out of Stock" Font-Size="Large"></asp:Label>

    <div>
        <asp:DropDownList ID="ddlSearch" runat="server" AutoPostBack = "true">
            <asp:ListItem Value="Name">Item Name</asp:ListItem>
            <asp:ListItem Value="Quantity">Quantity</asp:ListItem>
            <asp:ListItem Value="Purchase">Stocked Date</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btnSort" runat="server" Text="Sort" OnClick="btnSort_Click"/>
    </div>

    <div>
        <asp:GridView ID="GridView1" runat="server" EmptyDataText="All Items are stocked."></asp:GridView>
    </div>
</asp:Content>
