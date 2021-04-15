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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Check if both username and password is empty
            if (username == "" || password == "")
            {
                            
                Response.Write("<script language=javascript>alert('Please enter both username and password')</script>");
            } else
            {
                try
                {
                    String connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                    String queryString = $"SELECT * FROM [User] WHERE [Name] = '{username}' and [Password] = '{password}'";

                    // Connecting to database
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        SqlCommand cmd = new SqlCommand(queryString, con);
                        con.Open();

                        // Executing query
                        using(SqlDataReader reader = cmd.ExecuteReader())
                        {
                            // Check if output is empty
                            if (reader.HasRows)
                            {
                                // Read output
                                while (reader.Read())
                                {
                                    Session["id"] = reader["id"].ToString();
                                    Session["name"] = reader["name"].ToString();
                                    Session["type"] = reader["type"].ToString();
                                    Session["first"] = false;
                                    Response.Redirect("Default.aspx");
                                }
                            }
                            else
                            {
                                Response.Write("<script language=javascript>alert('Invalid username or password')</script>");
                            }
                        }                        
                    }
                } catch (Exception ex)
                {
                    Response.Write("<script language=javascript>alert('Problem connecting to server')</script>");
                } 
            }

        }
    }
}