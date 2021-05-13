<%@ Page Title="Sale" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sale.aspx.cs" Inherits="AppDev_GW.Sale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-7">
        <div class="card p-2">
            <table>
                <tr>
                    <td class="p-1">
                        <asp:Label ID="lbName" runat="server" Text="Product Name"></asp:Label></td>
                    <td class="p-1">
                        <asp:DropDownList ID="ddlItem" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id" Height="35px" Width="178px"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Item]"></asp:SqlDataSource>
                    </td>
                    <td class="p-1"></td>
                </tr>
                <tr>
                    <td class="p-1">
                        <asp:Label ID="lbCustomer" runat="server" Text="Customer Name"></asp:Label></td>
                    <td class="p-1">
                        <asp:DropDownList ID="ddlCustomer" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Id" Height="35px" Width="178px"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Customer]"></asp:SqlDataSource>
                    </td>
                    <td class="p-1"></td>
                </tr>
                <tr>
                    <td class="p-1">
                        <asp:Label ID="lbQuantity" runat="server" Text="Quantity"></asp:Label></td>
                    <td class="p-1">
                        <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox></td>


                    <td class="p-1">
                        <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtQuantity"
                            ErrorMessage="Please enter quantity" ForeColor="Red"></asp:RequiredFieldValidator></td>

                </tr>
                <tr id="dynamicButtons" runat="server">
                    <td class="p-1">&nbsp;</td>
                    <td class="p-2">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" CssClass="btn btn-info btn-lg" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CssClass="btn btn-danger btn-lg" />
                    </td>
                    <td class="p-1"></td>
                </tr>
            </table>

            <br />
            <div class="card table table-hover table-responsive" id="sellGridView" runat="server">
                <asp:GridView ID="GridView1" orderStyle="None" GridLines="None" runat="server" EmptyDataText="Nothing has been sold yet"></asp:GridView>
            </div>
                    <div class="card" id="dialogSale" runat="server" visible="false">
                        <div class="card-header bg-success">
                             <h3 class="card-title" id="exampleModalLabel"><b>Order Conformation</b></h3>
                        </div>
                           
                        <div class="card-body">
                            <div  runat="server">
                                <table class="table table-hover table-responsive">
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Customer Name</th>
                                        <th>Product Quantity</th>
                                        <th>Total Amount</th>
                                    </tr>
                                    <tr>
                                        <td class="p-1">
                                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
                                        <td class="p-1">
                                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
                                        <td class="p-1">
                                            <asp:Label ID="Label3" runat="server" Text=""></asp:Label></td>
                                        <td class="p-1">
                                            <asp:Label ID="Label4" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnConfirm" runat="server" Text="Yes, Proceed" OnClick="btnConfirm_Click" CssClass="btn btn-info btn-lg" />
                            <asp:Button ID="btnCancel" runat="server" Text="cancel" onClick ="btnCancel_Click" CssClass="btn btn-danger btn-lg" />
                        </div>
            </div>
            </div>
        </div>

</asp:Content>
