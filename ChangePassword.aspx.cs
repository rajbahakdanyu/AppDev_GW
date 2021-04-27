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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            string password = txtPassword.Text;
            string confirm = txtConfirm.Text;

                if (confirm == password)
                {
                    Change(confirm);
                }
                else
                {
                    Response.Write("<script language=javascript>alert('Both password do not match')</script>");
                }
            
        }

        protected void Change(string password)
        {
            try
            {
                string id = Session["id"].ToString();

                String connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                String queryString = $"UPDATE [User] SET [Password] = '{password}' WHERE [Id] = {id}";

                // Connecting to database
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(queryString, con);
                    con.Open();

                    // Executing query
                    int i = cmd.ExecuteNonQuery();

                    if (i == 1)
                    {
                        Response.Redirect("Default.aspx");
                        Response.Write("<script language=javascript>alert('Password Changed Successfully')</script>");
                    }
                    else
                    {
                        Response.Write("<script language=javascript>alert('Could not change password')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script language=javascript>alert('Problem connecting to database: {ex.Message}')</script>");
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtConfirm.Text = "";
            txtPassword.Text = "";
        }
    }
}