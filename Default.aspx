<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AppDev_GW._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <asp:Label ID="lbUser" runat="server" Text="Label"></asp:Label>
    </div>
    
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="exampleModalLabel">Stock low on these items</h3>
          </div>
          <div class="modal-body">
            <div id="dialog">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" BorderStyle="None" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Item Id" ItemStyle-Width="80" />
                        <asp:BoundField DataField="Name" HeaderText="Item Name" ItemStyle-Width="150" />
                        <asp:BoundField DataField="Quantity" HeaderText="Remaining" ItemStyle-Width="150" />
                    </Columns>
                </asp:GridView>
            </div>
          </div>
          <div class="modal-footer">
            <asp:Button ID="btnConfirm" class="btn btn-primary" runat="server" Text="Go Restock Them" PostBackUrl="~/Item" />
            <asp:Button ID="Button1" class="btn btn-secondary" runat="server" Text="Dismiss" data-dismiss="modal"/>
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

