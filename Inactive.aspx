<%@ Page Title="Inactive Customers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inactive.aspx.cs" Inherits="AppDev_GW.Inactive" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-7">
        <div class="card p-2">
        <asp:Label ID="lbTitle" runat="server" Text="Customer Who Haven't Bought Anything for a Month" Font-Size="Large"></asp:Label>

    <div class="card table table-hover table-responsive p-1">
        <asp:GridView ID="GridView1" runat="server" orderStyle="None" GridLines="None" EmptyDataText="All Customer are frequent buyers."></asp:GridView>
    </div>
            </div></div>
</asp:Content>
