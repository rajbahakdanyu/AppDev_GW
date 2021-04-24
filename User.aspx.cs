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
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is admin
            if (Session["type"].ToString() != "Admin")
            {
                Response.Redirect("Default.aspx");
            }
            BindGrid();
        }

        private void BindGrid()
        {
            int id = Convert.ToInt32(Session["id"].ToString());

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            String queryString = $"SELECT * FROM [User] WHERE [Id] NOT IN(SELECT [Id] FROM [User] WHERE [Id] = {id})";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(queryString, con);

                DataTable dt = new DataTable("Users");
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    dt.Load(sdr);
                }

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        public void Clear()
        {
            txtName.Text = txtPassword.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                String name = txtName.Text.ToString();
                String password = txtPassword.Text.ToString();
                String type = ddlType.SelectedValue;

                if (name != null || password != null)
                {
                    String queryString = $"INSERT INTO [User] ([Name], [Password], [Type]) VALUES ('{name}', '{password}', '{type}')";

                    String connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand(queryString, con);

                        try
                        {
                            int i = cmd.ExecuteNonQuery();

                            if (i == 0)
                            {
                                Response.Write($"<script language=javascript>alert('Added user successfully')</script>");
                            }
                        }
                        catch (Exception ex)
                        {
                            Response.Write($"<script language=javascript>alert('{ex.Message}')</script>");
                        }
                    }

                    this.BindGrid();
                }
                else
                {
                    Response.Write($"<script language=javascript>alert('Please enter all fields')</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write($"<script language=javascript>alert('{ex.Message}')</script>");
            }
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

            string queryString = $"DELETE FROM [User] WHERE [Id] = {id}";

            String connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(queryString, conn);
                conn.Open();
                try
                {
                    command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Response.Write($"<script language=javascript>alert('{ex.Message}')</script>");
                }
                finally
                {
                    conn.Close();
                }
            }

            this.BindGrid();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[0].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = GridView1.SelectedRow.Cells[0].Text;
            Response.Write($"<script language=javascript>alert('{id}')</script>");
        }
    }
}
