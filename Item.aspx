<%@ Page Title="Item" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="AppDev_GW.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-10">
        <div class="card">
            <div class="p-3">
                <table>
                    <tr>
                        <td class="p-1">
                            <asp:TextBox ID="txtItemID" runat="server" Visible="false"></asp:TextBox>
                        </td>
                        <td class="p-1"></td>
                        <td class="p-1"></td>
                    </tr>
                    <tr>
                        <td class="p-1">Item Name :
                        </td>
                        <td class="p-1">
                            <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
                        </td>
                        <td class="p-1">
                            <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtItemName"
                                ErrorMessage="Please enter item name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="p-1">Item Description : 
                        </td>
                        <td class="p-1">
                            <asp:TextBox ID="txtItemDescription" runat="server"></asp:TextBox>

                        </td>
                        <td class="p-1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtItemDescription"
                                ErrorMessage="Please enter item description" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="p-1">Item Price :
                        </td>
                        <td class="p-1">
                            <asp:TextBox ID="txtItemPrice" runat="server"></asp:TextBox>

                        </td>
                        <td class="p-1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtItemPrice"
                                ErrorMessage="Please enter item price" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="p-1">Item Purchase Date : 
                        </td>
                        <td class="p-1">
                            <asp:TextBox ID="txtItemPurchaseDate" runat="server"></asp:TextBox>
                            <asp:ImageButton ID="btnPurchase" runat="server" ImageUrl="~/calendar.png" ImageAlign="AbsBottom" OnClick="btnPurchase_Click" />

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
                        <td class="p-1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtItemPurchaseDate"
                                ErrorMessage="Please enter item purchase date" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="p-1">Item Manufacture Date : 
                        </td>
                        <td class="p-1">
                            <asp:TextBox ID="txtItemManufactureDate" runat="server"></asp:TextBox>
                            <asp:ImageButton ID="btnManufacture" runat="server" ImageUrl="~/calendar.png" ImageAlign="AbsBottom" OnClick="btnManufacture_Click" />
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
                        <td class="p-1"></td>
                    </tr>
                    <tr>
                        <td class="p-1">Item Expiry Date : 
                        </td>
                        <td class="p-1">
                            <asp:TextBox ID="txtItemExpiryDate" runat="server"></asp:TextBox>
                            <asp:ImageButton ID="btnExpiry" runat="server" ImageUrl="~/calendar.png" ImageAlign="AbsBottom" OnClick="btnExpiry_Click" />
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
                        <td class="p-1"></td>
                    </tr>
                    <tr>
                        <td class="p-1">Item Catagory : 
                        </td>
                        <td class="p-1">
                            <asp:DropDownList ID="ddlCatagory" runat="server" DataSourceID="itemCatagory" DataTextField="Name" DataValueField="Id" Height="22px" Width="128px">
                                <asp:ListItem>Select an item</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="itemCatagory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                        </td>

                        <td class="p-1"></td>
                    </tr>

                    <tr>
                        <td class="p-1">&nbsp;</td>
                        <td class="p-1">
                            <asp:Button ID="btnAddItem" runat="server" Text="Insert" CssClass="btn btn-info btn-lg" OnClick="btnAddItem_Click" />
                            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-danger btn-lg" OnClick="btnClear_Click" />
                        </td>
                        <td class="p-1"></td>

                    </tr>

                </table>
            </div>
            <div>
                <br />
                <div class="card table table-hover table-responsive">
                    <asp:GridView ID="itemsGridView" orderStyle="None" GridLines="None" runat="server" DataKeyNames="ID" OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing"
                        OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
                        AutoGenerateEditButton="True" AutoGenerateDeleteButton="True" CssClass="table table-striped">
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <br />

</asp:Content>
