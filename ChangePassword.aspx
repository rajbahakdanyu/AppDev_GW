<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="AppDev_GW.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lbPassword" runat="server" Text="Enter New Password"></asp:Label>
    <br />
    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtPassword"   
     ErrorMessage="Please enter password" ForeColor="Red"></asp:RequiredFieldValidator>  
    <br />
    <asp:Label ID="lbConfirm" runat="server" Text="Confirm Password"></asp:Label>
    <br />
    <asp:TextBox ID="txtConfirm" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtConfirm"   
    ErrorMessage="Please confirm password" ForeColor="Red"></asp:RequiredFieldValidator>  
    <br /><br />
    <asp:Button ID="btnChange" runat="server" Text="Change Password" OnClick="btnChange_Click" />
    &nbsp;
    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
</asp:Content>
