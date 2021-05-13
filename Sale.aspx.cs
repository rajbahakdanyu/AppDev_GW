using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppDev_GW
{
    public partial class Sale : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGrid();
            }
        }

        protected void BindGrid()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            String queryString = @"SELECT * FROM [Order]";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(queryString, con);

                DataTable dt = new DataTable("Sales");
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    dt.Load(sdr);
                }

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        int total, customer, item, quantity;

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            customer = Convert.ToInt32(ddlCustomer.SelectedValue);
            item = Convert.ToInt32(ddlItem.SelectedValue);

            try
            {
                quantity = Convert.ToInt32(txtQuantity.Text);

                if (quantity > 0)
                {
                    int remaining = getQuantity(item);

                    if (remaining == 0)
                    {
                        Response.Write($"<script language=javascript>alert('Sorry the product is out of stock')</script>");
                    }
                    else if (quantity > remaining)
                    {
                        Response.Write($"<script language=javascript>alert('Requested amount is greater than stock')</script>");
                    }
                    else
                    {
                        total = getPrice(item) * quantity;

                        display();
                        dialogSale.Visible = true;
                        dynamicButtons.Visible = false;
                        sellGridView.Visible = false;
                    }
                }
                else
                {
                    Response.Write($"<script language=javascript>alert('Quantity must be more than 0')</script>");
                }
            }
            catch (FormatException ex)
            {
                Response.Write($"<script language=javascript>alert('Quantity must be a number')</script>");
            }

        }

        protected int getQuantity(int Id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            String queryString = $"SELECT [Quantity] FROM [Stock] WHERE ItemId = {Id}";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(queryString, con);

                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        return Convert.ToInt32(sdr["Quantity"]);
                    }
                }
                return 0;
            }
        }

        protected int getPrice(int Id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            String queryString = $"SELECT [Price] FROM [item] WHERE [Id] = {Id}";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(queryString, con);

                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        return Convert.ToInt32(sdr["Price"]);
                    }
                }
                return 0;
            }
        }

        protected void display()
        {
            Label1.Text = ddlItem.SelectedItem.Text;
            Label2.Text = ddlCustomer.SelectedItem.Text;
            Label3.Text = quantity.ToString();
            Label4.Text = total.ToString();
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "showModal();", true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            dialogSale.Visible = false;
            sellGridView.Visible = true;
            dynamicButtons.Visible = true;
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                var current = DateTime.Today;
                customer = Convert.ToInt32(ddlCustomer.SelectedValue);
                item = Convert.ToInt32(ddlItem.SelectedValue);
                quantity = Convert.ToInt32(txtQuantity.Text);
                total = getPrice(item) * quantity;

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                String queryString = $"INSERT INTO [Order] ([Order].[CustomerId], [Order].[ItemId], [Quantity], [TotalAmt], [Date]) VALUES ({customer}, {item}, {quantity}, {total}, '{current}')";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(queryString, con);

                    cmd.ExecuteNonQuery();

                    Response.Write($"<script language=javascript>alert('Item was sold successfully')</script>");
                    txtQuantity.Text = "";
                    BindGrid();
                    updateStock(item, quantity);
                    sellGridView.Visible = true;
                    dialogSale.Visible = false;
                    dynamicButtons.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script language=javascript>alert('Problem connecting to database: {ex.Message}')</script>");
            }

        }

        protected void updateStock(int Id, int quantity)
        {
            try
            {
                int remaining = getQuantity(Id) - quantity;

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                String queryString = $"UPDATE [Stock] SET [Quantity] = {remaining}  WHERE ItemId = {Id}";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(queryString, con);
                    cmd.ExecuteNonQuery();
                }

            }
            catch (Exception ex)
            {
                Response.Write($"<script language=javascript>alert('Error with Database')</script>");
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtQuantity.Text = "";
        }
    }
}