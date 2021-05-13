<%@ Page Title="Out of Stock" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OutofStock.aspx.cs" Inherits="AppDev_GW.OutofStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-6">
        <div class="card">
            <table>
                <tr>

                    <td class="p-1">
                        <asp:Label ID="lbTitle" runat="server" Text="Products Out of Stock" Font-Size="Large"></asp:Label></td>
                    <td class="p-1"></td>
                    <td class="p-1"></td>
                </tr>
                <tr>

                    <td class="p-1">
                        <asp:Label ID="Label1" runat="server" Text="Select Product: " Font-Size="Large"></asp:Label></td>
                    <td class="p-1">
                        <asp:DropDownList ID="ddlSearch" runat="server" AutoPostBack="true" Height="33px" Width="184px">
                            <asp:ListItem Value="Name">Item Name</asp:ListItem>
                            <asp:ListItem Value="Quantity">Quantity</asp:ListItem>
                            <asp:ListItem Value="Date">Stocked Date</asp:ListItem>
                        </asp:DropDownList></td>
                    <td class="p-1">
                        <asp:Button ID="btnSort" runat="server" Text="Sort" OnClick="btnSort_Click"  CssClass="btn btn-info btn-lg" /></td>
                </tr>
            </table>
            <div class="card table table-hover table-responsive p-1">
                <asp:GridView ID="GridView1" orderStyle="None" GridLines="None" runat="server" EmptyDataText="All Items are stocked."></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
