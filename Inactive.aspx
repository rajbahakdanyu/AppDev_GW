<%@ Page Title="Inactive Customers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inactive.aspx.cs" Inherits="AppDev_GW.Inactive" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <asp:Label ID="lbTitle" runat="server" Text="Customer Who Haven't Bought Anything for a Month" Font-Size="Large"></asp:Label>

    <div>
        <asp:GridView ID="GridView1" runat="server" EmptyDataText="All Customer are frequent buyers."></asp:GridView>
    </div>
</asp:Content>
