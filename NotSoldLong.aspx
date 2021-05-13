<%@ Page Title="Not Sold Long" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NotSoldLong.aspx.cs" Inherits="AppDev_GW.NotSoldLong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-5">
        <div class="card p-2">
            <asp:Label ID="lbTitle" runat="server" Text="Items Not Sold for a More Than 3 Months" Font-Size="Large"></asp:Label>

            <div class="card table table-hover table-responsive p-1">
                <asp:GridView ID="GridView1" orderStyle="None" GridLines="None" runat="server" EmptyDataText="No Such Item Found."></asp:GridView>
            </div>
            <div id="popupMessage" runat="server" visible="false">
                <div class="card">
                    <div class="card-header" style="background-color: red; color: white; font-weight: bold">
                        Warning
                    </div>
                    <div class="card-body">
                        <div id="dialog">
                            <p>
                                You are about to delete all items which have not been sold for more than 3 months.
                    This action is irreverible.
                    Do you still wish to continue?
                            </p>
                            <asp:Button ID="btnConfirm" class="btn btn-primary" runat="server" Text="Yes, I understand" OnClick="btnConfirm_Click" />
                            <asp:Button ID="btnCancel" class="btn btn-secondary" runat="server" Text="No" data-dismiss="modal" OnClick="btnCancel_delete" />
                        </div>
                    </div>

                </div>

            </div>
            <div>
                <asp:Button ID="btnDelete" runat="server" Text="Delete All Items" OnClick="btnDelete_Click" CssClass="btn btn-danger btn-lg" />
            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLabel">Important</h3>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
