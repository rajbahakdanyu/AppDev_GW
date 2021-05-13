<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AppDev_GW._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-md-7">
        <div class="card card-success">
            <div class="card-header notification warning">
                <h3 class="card-title" style="color: white">Notification: Items with less than 10 stocks</h3>
            </div>
            <div class="card-body">
                <div class="container card mt-3">

                    <asp:GridView ID="GridView1" runat="server" class="table table-hover" BorderStyle="None" GridLines="None" EmptyDataText="No Items found">
                    </asp:GridView>

                </div>
               
            </div>
            <!-- /.card-body -->
        </div>
        <br />
        <div class="card card-success">
            <div class="card-header notification danger">
                <h3 class="card-title" style="color: white">Notification: Items Out of Stock</h3>
            </div>
            <div class="card-body">
                <div class="container card mt-3">

                    <asp:GridView ID="GridView2" runat="server" BorderStyle="None" GridLines="None" class="table table-hover" EmptyDataText="No Items found">
                    </asp:GridView>
                    <div class="pt-2 pb-2">
                    <a href="~/Stock"  class="btn btn-primary" runat="server">Refill Stocks</a>
                    <a href="#" class="btn btn-secondary">Do Nothing</a>
                </div>
                </div>
            </div>
            <!-- /.card-body -->
        </div>
    </div>

</asp:Content>

