<%@ Page Title="Customer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="AppDev_GW.Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-8">
        <div class="card">
            <asp:TextBox ID="txtId" runat="server" Visible="false"></asp:TextBox>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lbTitle" runat="server" Text="Name: " Font-Size="Large"></asp:Label>
                    </td>
                    <td>
                        <div class="form-input pl-3 p-1">
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtName"
                            ErrorMessage="Please enter customer name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Phone: " Font-Size="Large"></asp:Label></td>
                    <td>
                        <div class="form-input pl-3 p-1">
                            <asp:TextBox ID="txtNumber" runat="server" TextMode="Number" min="9800000000" max="9899999999" Height="33px" Width="184px"></asp:TextBox>
                        </div>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNumber"
                            ErrorMessage="Please enter customer phone number" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Address: " Font-Size="Large"></asp:Label></td>
                    <td>
                        <div class="form-input pl-3 p-1">
                            <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>

                        </div>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress"
                            ErrorMessage="Please enter customer address" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Email: " Font-Size="Large"></asp:Label></td>
                    <td>
                        <div class="form-input pl-3 p-1">
                            <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" ></asp:TextBox>

                        </div>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Please enter customer email" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Type: " Font-Size="Large"></asp:Label></td>
                    <td>
                        <div class="form-input pl-3 p-1">
                            <asp:DropDownList ID="ddlType" runat="server" Height="33px" Width="184px">
                                <asp:ListItem>Black</asp:ListItem>
                                <asp:ListItem>Gold</asp:ListItem>
                                <asp:ListItem>Platinum</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div class="form-input pl-3 p-1">
                            <asp:Button ID="btnAdd" runat="server" Text="Insert" OnClick="btnAddItem_Click" CssClass="btn btn-info btn-lg" />
                            <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CssClass="btn btn-danger btn-lg" />
                        </div>
                    </td>
                    <td></td>
            </table>
            <div class="card table table-hover table-responsive">
                <asp:GridView ID="GridView1" orderStyle="None" GridLines="None" runat="server" DataKeyNames="ID" OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing"
                    OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
                    AutoGenerateEditButton="True" AutoGenerateDeleteButton="True" CssClass="table table-striped">
                </asp:GridView>
            </div>
        </div>

    </div>

</asp:Content>
