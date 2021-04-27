﻿<%@ Page Title="Item" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="AppDev_GW.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <h3>Items page.</h3>
    <br />
    <div>
        <div style="font-size:x-large" >Item info Manage Form</div>
        <div>
            <table>
                <tr>
                    <td>
                        Item Id :
                    </td>
                    <td>
                         <asp:TextBox ID="txtItemID" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Item Name :
                    </td>
                     <td>
                          <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
                     </td>
                </tr>
                 <tr>
                    <td>
                        Item Description : 
                    </td>
                     <td>
                         <asp:TextBox ID="txtItemDescription" runat="server"></asp:TextBox>
                     </td>
                </tr>
                 <tr>
                    <td>
                        Item Price :
                    </td>
                     <td>
                          <asp:TextBox ID="txtItemPrice" runat="server"></asp:TextBox>
                     </td>
                </tr>
                 <tr>
                    <td>
                        Item Purchase Date : 
                    </td>
                     <td>
                         <asp:TextBox ID="txtItemPurchaseDate" runat="server"></asp:TextBox>
                     </td>
                </tr>
                 <tr>
                    <td>
                        Item Manufacture Date : 
                    </td>
                     <td>
                           <asp:TextBox ID="txtItemManufactureDate" runat="server"></asp:TextBox>
                     </td>
                </tr>
                 <tr>
                    <td>
                        Item Expiry Date : 
                    </td>
                     <td>
                         <asp:TextBox ID="txtItemExpiryDate" runat="server"></asp:TextBox>
                     </td>
                </tr>
                 <tr>
                    <td>
                        Item Quantity : 
                    </td>
                     <td><asp:TextBox ID="txtItemQuantity" runat="server"></asp:TextBox>
                        </td>
                </tr>
                 <tr>
                    <td>
                        Item Catagory : 
                    </td>
                     <td>
                         <asp:DropDownList ID="ddlCatagory" runat="server" DataSourceID="itemCatagory" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                         <asp:SqlDataSource ID="itemCatagory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                        </td>
                </tr>
          
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btnAddItem" runat="server" Text="Insert" OnClick="btnAddItem_Click"/>
                        <asp:Button ID="btnClear" runat="server" Text="Clear"  OnClick="btnClear_Click"/>
                    </td>
                    
                </tr>

            </table>
        </div>
        <div>
            <br />
           
            <asp:GridView ID="itemsGridView" runat="server" DataKeyNames="ID" OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" 
                OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
                AutoGenerateEditButton="True" AutoGenerateDeleteButton="True" CssClass="table table-striped">   
            </asp:GridView>
        </div>

    </div>
    <br />

</asp:Content>
