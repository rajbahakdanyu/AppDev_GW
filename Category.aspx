<%@ Page Title="Category" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="AppDev_GW.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lbTitle" runat="server" Text="Product Category" Font-Size="Larger"></asp:Label>

    <div>        
        <asp:Label ID="lbName" runat="server" Text="Category Name"></asp:Label>
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    </div>

    <div>
        <asp:Button ID="btnAdd" runat="server" Text="Add" />
        <asp:Button ID="btnUpdate" runat="server" Text="Update" />
    </div>

    <div>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    </div>
</asp:Content>
