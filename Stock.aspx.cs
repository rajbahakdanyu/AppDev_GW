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
    public partial class Stock : System.Web.UI.Page
    {

        // Method to Load Stocks Page
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGrid();
            }
        }


        // Method to Display Stock Details in Table From the Database
        protected void BindGrid()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            String queryString = @"SELECT i.[Id], i.[Name], i.[Price], s.[Quantity], s.[Date]
                                    FROM [Item] as i
                                    JOIN [Stock] s ON
                                    s.[ItemId] = i.Id";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(queryString, con);

                DataTable dt = new DataTable("Items");
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    dt.Load(sdr);
                }

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }


        // Method to Add Stock of Items
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int item = Convert.ToInt32(ddlItem.SelectedValue);

            if (txtQuantity.Text != "")
            {
                try
                {
                    int quantity = Convert.ToInt32(txtQuantity.Text);

                    if (quantity > 0)
                    {
                        int remaining = getQuantity(item);
                        int total = remaining + quantity;

                        restock(item, total);
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
            else
            {
                Response.Write($"<script language=javascript>alert('Please Enter Quantity')</script>");
            }
        }


        // Method to Get Quantity of Product Into the Table
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

        // Method to Update Stock Details
        protected void restock(int Id, int quantity)
        {
            try
            {
                var current = DateTime.Today;
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                String queryString = $"UPDATE [Stock] SET [Quantity] = {quantity}, [Date] = '{current}'  WHERE ItemId = {Id}";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(queryString, con);

                    int sdr = cmd.ExecuteNonQuery();

                    if (sdr == 1)
                    {
                        Response.Write($"<script language=javascript>alert('Item was successfully restocked')</script>");
                        txtQuantity.Text = "";
                        BindGrid();
                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write($"<script language=javascript>alert('Error with Database')</script>");
            }
        }
    }
}