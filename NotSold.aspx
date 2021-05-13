<%@ Page Title="Not Sold Item" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NotSold.aspx.cs" Inherits="AppDev_GW.NotSold" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-5">
        <div class="card p-2">
            <asp:Label ID="lbTitle" runat="server" Text="Items Not Sold for a Month" Font-Size="Large"></asp:Label>

            <div class="card table table-hover table-responsive p-1">
                <asp:GridView ID="GridView1" orderStyle="None" GridLines="None" runat="server" EmptyDataText="All Items are selling well."></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
