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
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["name"] != null)
            {
                lbUser.Text = Session["name"].ToString();
            } else
            {
                Response.Redirect("Login.aspx");
            }

            // Check if this is the first visit to page
            if (!(bool)Session["first"])
            {
                Session["first"] = true;
                checkStock();
            }
        }

        protected void checkStock()
        {
            try
            {
                String connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                String queryString = "SELECT Id, Name, Quantity FROM [Item] WHERE [Quantity] < 10";

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

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}