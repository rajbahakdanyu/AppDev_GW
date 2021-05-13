<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AppDev_GW.Login" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %></title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>

    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="css/login-style.css" rel="stylesheet" />
</head>

<body class="login-container">
    <div class="container">
        <div style="width:80%; background-color:white;">
            <div class="row">
                <div class="col-md-7 login-image">
                    <img src="images/login-image.png" class="login-content" alt="Alternate Text" width="100%" height="400px"/>
                </div>
                <div class="col-md-5 form-content">
                    <div>
                        <h1>Welcome User</h1>
                    </div>
                    <hr />
                    <form id="form1" runat="server" class="text-field-container">
                          <div class="form-input">
                            <asp:TextBox ID="txtUsername" class="text-field" runat="server" placeholder="Username" ></asp:TextBox>
                           </div>
                            <div class="form-input">
                                
                                <asp:TextBox ID="txtPassword" class="text-field" runat="server" TextMode="Password"  placeholder="Password"></asp:TextBox>
                            </div>
                            <hr />
                            <div class="form-input">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
                                <asp:Button ID="btnSubmit" runat="server" Text="Login" CssClass="btn btn-info submit-btn" OnClick="btnSubmit_Click" />
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
