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
            load_data();
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
                //Make the text field hidden.
                String ID = txtItemID.Text.ToString();
                queryString = $"UPDATE [Item] SET [Name] = '{itemName}', [Description] = '{itemDescription}', [Price] = {itemPrice}, [Purchase] = 'TO_DATE('{itemPurchaseDate}','dd/mm/yyyy')', [Category] = {itemCatagory}, [Manufacture] = 'TO_DATE('{itemManufactureDate}','dd/mm/yyyy')', [Expiry] = 'TO_DATE('{itemExpiryDate}','dd/mm/yyyy')' WHERE Id = {itemID}";
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(queryString, con);
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write($"<script language=javascript>alert('Performed operation successfully.')</script>");
            }
            btnAddItem.Text = "Insert";

            itemsGridView.EditIndex = -1;
            this.load_data();
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

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            itemsGridView.EditIndex = -1;
            btnAddItem.Text = "Insert";
            this.load_data();
            btnCancleUpdate.Visible = true;
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
            btnCancleUpdate.Visible = false;
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            //itemsGridView.EditIndex = e.NewEditIndex;
            btnCancleUpdate.Visible = true;
            itemsGridView.EditIndex = -1;
            txtItemID.Text = this.itemsGridView.Rows[e.NewEditIndex].Cells[1].Text;
            btnAddItem.Text = "Update";
            this.load_data();
        }


    }
}
