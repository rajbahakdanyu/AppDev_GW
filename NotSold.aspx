<%@ Page Title="Not Sold Item" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NotSold.aspx.cs" Inherits="AppDev_GW.NotSold" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lbTitle" runat="server" Text="Items Not Sold for a Month" Font-Size="Large"></asp:Label>

    <div>
        <asp:GridView ID="GridView1" runat="server" EmptyDataText="All Items are selling well."></asp:GridView>
    </div>
</asp:Content>
