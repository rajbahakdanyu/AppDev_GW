<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AppDev_GW._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div>
         <asp:Label ID="lbUser" runat="server" Text="Label"></asp:Label>
     </div>

    <div id="dialog" style="display: none">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Item Id" ItemStyle-Width="80" />
                <asp:BoundField DataField="Name" HeaderText="Item Name" ItemStyle-Width="150" />
                <asp:BoundField DataField="Quantity" HeaderText="Remaining" ItemStyle-Width="150" />
            </Columns>
        </asp:GridView>
    </div>

     <div>
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" OnClick="btnLogout_Click" />
     </div>

    <script type="text/javascript">
    $("[id*=btnShowPopup]").click(function () {
            ShowPopup();
            return false;
     });

    function ShowPopup() {
        $("#dialog").dialog({
            title: "GridView",
            width: 450,
            buttons: {
                Ok: function () {
                    $(this).dialog('close');
                }
            },
            modal: true
        }); });
    }
    </script>
</asp:Content>

