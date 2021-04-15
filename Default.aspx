<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AppDev_GW._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div>
         <asp:Label ID="lbUser" runat="server" Text="Label"></asp:Label>
     </div>

     <div>
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" OnClick="btnLogout_Click" />
     </div>

</asp:Content>

