﻿<%@ Page Title="Category" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="AppDev_GW.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lbTitle" runat="server" Text="Product Category" Font-Size="Larger"></asp:Label>

    <div>        
         <asp:TextBox ID="txtId" runat="server" Visible="false"></asp:TextBox>
        <asp:Label ID="lbName" runat="server" Text="Category Name"></asp:Label>
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    </div>

    <div>
        <asp:Button ID="btnAdd" runat="server" Text="Insert" onClick="btnAddItem_Click"/>
        <asp:Button ID="btnClear" runat="server" Text="Clear" onClick="btnClear_Click"/>
    </div>

    <div>
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="ID" OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" 
        OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
        AutoGenerateEditButton="True" AutoGenerateDeleteButton="True" CssClass="table table-striped">   
        </asp:GridView>
    </div>
</asp:Content>
