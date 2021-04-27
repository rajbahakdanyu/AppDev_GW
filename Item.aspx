<%@ Page Title="Item" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="AppDev_GW.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div style="font-size:x-large" >Items</div>
        <div>
            <table>
                <tr>
                    <td>
                         <asp:TextBox ID="txtItemID" runat="server" Visible="false"></asp:TextBox>
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
                         <asp:ImageButton ID="btnPurchase" runat="server" ImageUrl="~/calendar.png" ImageAlign="AbsBottom" OnClick="btnPurchase_Click"/>
                        <asp:Calendar ID="calPurchase" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="calPurchase_SelectionChanged" OnDayRender="calPurchase_DayRender">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                     </td>
                </tr>
                 <tr>
                    <td>
                        Item Manufacture Date : 
                    </td>
                     <td>
                           <asp:TextBox ID="txtItemManufactureDate" runat="server"></asp:TextBox>
                            <asp:ImageButton ID="btnManufacture" runat="server" ImageUrl="~/calendar.png" ImageAlign="AbsBottom" OnClick="btnManufacture_Click"/>
                        <asp:Calendar ID="calManufacture" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="calManufacture_SelectionChanged" OnDayRender="calManufacture_DayRender">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                     </td>
                </tr>
                 <tr>
                    <td>
                        Item Expiry Date : 
                    </td>
                     <td>
                         <asp:TextBox ID="txtItemExpiryDate" runat="server"></asp:TextBox>
                          <asp:ImageButton ID="btnExpiry" runat="server" ImageUrl="~/calendar.png" ImageAlign="AbsBottom" OnClick="btnExpiry_Click"/>
                        <asp:Calendar ID="calExpiry" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="calExpiry_SelectionChanged" OnDayRender="calExpiry_DayRender">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
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
