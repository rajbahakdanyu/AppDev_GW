using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppDev_GW
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                calPurchase.Visible = false;
                calManufacture.Visible = false;
                calExpiry.Visible = false;
                load_data();
            }
        }

        public void load_data()
        {
            try
            {
                String connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                String queryString = "Select * from [Item]";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(queryString, con);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        itemsGridView.DataSource = reader;
                        itemsGridView.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language=javascript>alert('Problem connecting to server')</script>");
            }
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            string itemID = txtItemID.Text.ToString() ?? "";
            string itemName = txtItemName.Text.ToString() ?? "";
            string itemDescription = txtItemDescription.Text.ToString() ?? "";
            int itemPrice = txtItemPrice.Text.ToString().Length != 0 ? Int32.Parse(txtItemPrice.Text.ToString()) : 0;
            string itemPurchaseDate = txtItemPurchaseDate.Text.ToString() ?? "";
            string itemCatagory = ddlCatagory.Text.ToString() ?? "";
            string itemManufactureDate = txtItemManufactureDate.Text.ToString() ?? "";
            string itemExpiryDate = txtItemExpiryDate.Text.ToString() ?? "";
            String queryString = "";

            if (btnAddItem.Text == "Insert")
            {
                queryString = $"INSERT INTO [Item] ([Name], [Description], [Price], [Purchase], [Category], [Manufacture], [Expiry]) VALUES ('{itemName}', '{itemDescription}', {itemPrice}, '{itemPurchaseDate}', {itemCatagory}, '{itemManufactureDate}', '{itemExpiryDate}')";
            }
            else if (btnAddItem.Text == "Update")
            {
                queryString = $"UPDATE [Item] SET [Name] = '{itemName}', [Description] = '{itemDescription}', [Price] = {itemPrice}, [Purchase] = '{itemPurchaseDate}', [Category] = {itemCatagory}, [Manufacture] = '{itemManufactureDate}', [Expiry] = '{itemExpiryDate}' WHERE Id = {itemID}";
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(queryString, con);
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write($"<script language=javascript>alert('Performed operation successfully.')</script>");
            }
            btnAddItem.Text = "Insert";
            clear();

            itemsGridView.EditIndex = -1;
            this.load_data();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            itemsGridView.EditIndex = -1;
            this.load_data();
            clear();
            btnAddItem.Text = "Insert";
        }

        protected void clear()
        {
            txtItemDescription.Text = txtItemExpiryDate.Text = txtItemID.Text = txtItemManufactureDate.Text = txtItemName.Text = txtItemPrice.Text = txtItemPurchaseDate.Text = "";
        }

        protected void populateFields(int rowIndex)
        {
            txtItemID.Text = this.itemsGridView.Rows[rowIndex].Cells[1].Text;
            txtItemName.Text = this.itemsGridView.Rows[rowIndex].Cells[2].Text;
            txtItemDescription.Text = this.itemsGridView.Rows[rowIndex].Cells[3].Text;
            txtItemPrice.Text = this.itemsGridView.Rows[rowIndex].Cells[4].Text;
            txtItemPurchaseDate.Text  = this.itemsGridView.Rows[rowIndex].Cells[5].Text;
            ddlCatagory.SelectedIndex = Convert.ToInt32(this.itemsGridView.Rows[rowIndex].Cells[6].Text);
            txtItemManufactureDate.Text = this.itemsGridView.Rows[rowIndex].Cells[7].Text;
            txtItemExpiryDate.Text = this.itemsGridView.Rows[rowIndex].Cells[8].Text;
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ID = itemsGridView.DataKeys[e.RowIndex].Values[0].ToString();
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string queryString = $"DELETE FROM [Item] WHERE [Id] = {ID}";

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(queryString))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.load_data();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != itemsGridView.EditIndex)
            {
                (e.Row.Cells[0].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            itemsGridView.EditIndex = -1;
            btnAddItem.Text = "Update";
            populateFields(e.NewEditIndex);
            this.load_data();
        }

        protected void btnPurchase_Click(object sender, ImageClickEventArgs e)
        {
            itemsGridView.EditIndex = -1;
            this.load_data();
            if (calPurchase.Visible)
            {
                calPurchase.Visible = false;
            }
            else
            {
                calPurchase.Visible = true;
            }
        }

        protected void calPurchase_SelectionChanged(object sender, EventArgs e)
        {
            txtItemPurchaseDate.Text = calPurchase.SelectedDate.ToString("MM/dd/yyyy");
            calPurchase.Visible = false;
        }

        protected void calPurchase_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void btnManufacture_Click(object sender, ImageClickEventArgs e)
        {
            itemsGridView.EditIndex = -1;
            this.load_data();
            if (calManufacture.Visible)
            {
                calManufacture.Visible = false;
            }
            else
            {
                calManufacture.Visible = true;
            }
        }

        protected void calManufacture_SelectionChanged(object sender, EventArgs e)
        {
            txtItemManufactureDate.Text = calManufacture.SelectedDate.ToString("MM/dd/yyyy");
            calManufacture.Visible = false;
        }

        protected void calManufacture_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
            }
        }


        protected void btnExpiry_Click(object sender, ImageClickEventArgs e)
        {
            itemsGridView.EditIndex = -1;
            this.load_data();
            if (calExpiry.Visible)
            {
                calExpiry.Visible = false;
            }
            else
            {
                calExpiry.Visible = true;
            }
        }

        protected void calExpiry_SelectionChanged(object sender, EventArgs e)
        {
            txtItemExpiryDate.Text = calExpiry.SelectedDate.ToString("MM/dd/yyyy");
            calExpiry.Visible = false;
        }

        protected void calExpiry_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
            }
        }
    }
}
