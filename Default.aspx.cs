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
    public partial class _Default : Page
    {

        // Method to Load Main Page of the Application
        protected void Page_Load(object sender, EventArgs e)
        {
            lessThanTen();
            noStock();
        }


        // Method to Display List of Items Having Stock Less Than 10
        protected void lessThanTen()
        {
            try
            {
                String connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                String queryString = @"SELECT s.Id, i.Name, s.Quantity
                                        FROM[Stock] as s
                                        JOIN[Item] i ON
                                        i.Id = s.ItemId
                                        WHERE[Quantity] < 10";

                // Connecting to database
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(queryString, con);
                    con.Open();

                    // Executing query
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Check if output is empty
                        if (reader.HasRows)
                        {
                            // Bind output to gridview
                            GridView1.DataSource = reader;
                            GridView1.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language=javascript>alert('Problem connecting to server')</script>");
            }
        }


        // Method to Display List of Items Which Are Currently Out of Stock
        protected void noStock()
        {
            try
            {
                String connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                String queryString = @"SELECT i.[Id], i.[Name], s.[Quantity] 
                                        FROM Item as i 
                                        JOIN [Stock] s ON s.ItemId = i.Id 
                                        WHERE [Quantity] = 0";

                // Connecting to database
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(queryString, con);
                    con.Open();

                    // Executing query
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Check if output is empty
                        if (reader.HasRows)
                        {
                            // Bind output to gridview
                            GridView2.DataSource = reader;
                            GridView2.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language=javascript>alert('Problem connecting to server')</script>");
            }
        }
    }
}