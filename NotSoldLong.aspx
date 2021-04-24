<%@ Page Title="Not Sold Long" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NotSoldLong.aspx.cs" Inherits="AppDev_GW.NotSoldLong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:Label ID="lbTitle" runat="server" Text="Items Not Sold for a More Than 3 Months" Font-Size="Large"></asp:Label>

    <div>
        <asp:GridView ID="GridView1" runat="server" EmptyDataText="No Such Item Found."></asp:GridView>
    </div>

     <div>
         <asp:Button ID="btnDelete" runat="server" Text="Delete All Items" OnClick="btnDelete_Click" />
    </div>

     <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="exampleModalLabel">Important</h3>
          </div>
          <div class="modal-body">
            <div id="dialog">
                <p>You are about to delete all items which have not been sold for more than 3 months.
                    This action is irreverible.
                    Do you still wish to continue?</p>
            </div>
          </div>
          <div class="modal-footer">
            <asp:Button ID="btnConfirm" class="btn btn-primary" runat="server" Text="Yes, I understand" OnClick="btnConfirm_Click" />
            <asp:Button ID="btnCancel" class="btn btn-secondary" runat="server" Text="No" data-dismiss="modal"/>
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
