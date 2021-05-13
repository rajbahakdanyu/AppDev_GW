<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="AppDev_GW.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-7">
        <div class="card">
            <table>
                <tr>
                    <td class="p-1">
                        <asp:Label ID="lbPassword" runat="server" Text="New Password"></asp:Label></td>
                    <td class="p-1">
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></td>
                    <td class="p-1">
                        <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Please enter password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="p-1">
                        <asp:Label ID="lbConfirm" runat="server" Text="Confirm Password"></asp:Label></td>
                    <td class="p-1">
                        <asp:TextBox ID="txtConfirm" runat="server"></asp:TextBox></td>
                    <td class="p-1">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtConfirm"
                            ErrorMessage="Please confirm password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="p-1"></td>
                    <td class="p-1">
                        <asp:Button ID="btnChange" runat="server" Text="Update" OnClick="btnChange_Click"  CssClass="btn btn-danger btn-lg" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click"  CssClass="btn btn-info btn-lg" />
                    </td>
                    <td></td>    

                </tr>
            </table>
        </div>
    </div>
</asp:Content>
