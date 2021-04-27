<%@ Page Title="Sale" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sale.aspx.cs" Inherits="AppDev_GW.Sale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <asp:Label ID="lbTitle" runat="server" Text="Sales" Font-Size="Large"></asp:Label>

    <div>
        <table>
            <tr>
                <td><asp:Label ID="lbName" runat="server" Text="Product Name"></asp:Label></td>
                <td><asp:DropDownList ID="ddlItem" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Item]"></asp:SqlDataSource></td>
            </tr>
            <tr>
                <td><asp:Label ID="lbCustomer" runat="server" Text="Customer Name"></asp:Label></td>
                <td><asp:DropDownList ID="ddlCustomer" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Customer]"></asp:SqlDataSource></td>
            </tr>
            <tr>
                <td><asp:Label ID="lbQuantity" runat="server" Text="Quantity"></asp:Label></td>
                <td><asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox></td>
                <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtQuantity"   
                ErrorMessage="Please enter quantity" ForeColor="Red"></asp:RequiredFieldValidator>  
            </tr>
             <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                </td>
                </tr>
        </table>
    </div>

    <div>
        <asp:GridView ID="GridView1" runat="server" EmptyDataText="Nothing has been sold yet"></asp:GridView>
    </div>

         <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="exampleModalLabel">Invoice</h3>
          </div>
          <div class="modal-body">
            <div id="dialog">
                <table>
                    <tr>
                        <th>Product Name</th>
                        <th>Customer Name</th>
                        <th>Product Quantity</th>
                        <th>Total Amount</th>
                    </tr>
                    <tr>
                        <td><asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
                        <td><asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
                        <td><asp:Label ID="Label3" runat="server" Text=""></asp:Label></td>
                        <td><asp:Label ID="Label4" runat="server" Text=""></asp:Label></td>
                    </tr>
                </table>
            </div>
          </div>
          <div class="modal-footer">
            <asp:Button ID="btnConfirm" class="btn btn-primary" runat="server" Text="Yes, Proceed" OnClick="btnConfirm_Click" />
            <asp:Button ID="btnCancel" class="btn btn-secondary" runat="server" Text="cancel" data-dismiss="modal" />
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript">
        function showModal() {
            $("#exampleModal").modal('show');
        }
    </script>
</asp:Content>
