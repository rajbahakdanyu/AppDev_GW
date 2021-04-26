<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AppDev_GW._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="Jumbotron">
        <asp:Label ID="Label1" runat="server" Text="Items with Stock < 10"></asp:Label>

        <asp:GridView ID="GridView1" runat="server" BorderStyle="None" GridLines="None">
        </asp:GridView>
    </div>

    <br />

     <div class="Jumbotron">
        <asp:Label ID="Label2" runat="server" Text="Items Out of Stock"></asp:Label>

        <asp:GridView ID="GridView2" runat="server" BorderStyle="None" GridLines="None">
        </asp:GridView>
    </div>  

</asp:Content>

