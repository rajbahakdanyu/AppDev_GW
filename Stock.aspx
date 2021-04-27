<%@ Page Title="Stock" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="AppDev_GW.Stock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lbTitle" runat="server" Text="Stock" Font-Size="Large"></asp:Label>

    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Product Name"></asp:Label>
                </td>
                <td>
        <asp:DropDownList ID="ddlItem" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Item]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Quantity"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtQuantity"   
                     ErrorMessage="Please enter quantity" ForeColor="Red"></asp:RequiredFieldValidator> 
                </td>
                <td>                    
                    <asp:Button ID="btnAdd" runat="server" Text="Add/Update" OnClick="btnAdd_Click" />
                </td>
            </tr>
        </table>
    </div>

    <div>
        <asp:GridView ID="GridView1" runat="server" EmptyDataText="No Items found"></asp:GridView>
    </div>
</asp:Content>
