<%@ Page Title="Stock" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="AppDev_GW.Stock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-6">
        <div class="card">

            <table>
                <tr>
                    <td class="p-1">
                        <asp:Label ID="Label1" runat="server" Text="Product Name"></asp:Label>
                    </td>
                    <td class="p-1">
                        <asp:DropDownList ID="ddlItem" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id" AutoPostBack="True" Height="35px" Width="178px"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Item]"></asp:SqlDataSource>
                    </td>
                    <td class="p-1"></td>
                </tr>
                <tr>
                    <td class="p-1">
                        <asp:Label ID="Label2" runat="server" Text="Quantity"></asp:Label>
                    </td>
                    <td class="p-1">
                        <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>

                    </td>
                    <td class="p-1">
                        <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtQuantity"
                            ErrorMessage="Please enter quantity" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="p-1">
                        <asp:Button ID="btnAdd" runat="server" Text="Add/Update" OnClick="btnAdd_Click" CssClass="btn btn-info btn-lg" />
                    </td>
                    <td class="p-1"></td>
                    <td class="p-1"></td>
                </tr>
            </table>
            <br />
            <div class="card table table-hover table-responsive">
                <asp:GridView ID="GridView1" orderStyle="None" GridLines="None" runat="server" EmptyDataText="No Items found"></asp:GridView>
            </div>
        </div>


    </div>
</asp:Content>
