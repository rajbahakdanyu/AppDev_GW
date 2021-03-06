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
    public partial class Category : System.Web.UI.Page
    {
        // Method to Load the Category Page
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGrid();
            }
        }


        // Method to Display Categories Details in the Categories Table From Database
        protected void BindGrid()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            String queryString = "SELECT * FROM [Category]";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(queryString, con);

                DataTable dt = new DataTable("Category");
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    dt.Load(sdr);
                }

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        // Method to Add New Category in the Application
        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            try
            {
                String connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                string id = txtId.Text.ToString() ?? "";
                string name = txtName.Text.ToString() ?? "";
                String queryString = "";

                if (btnAdd.Text == "Insert")
                {
                    queryString = $"INSERT INTO [Category] ([Name]) VALUES ('{name}')";
                }
                else if (btnAdd.Text == "Update")
                {
                    queryString = $"UPDATE [Category] SET [Name] = '{name}' WHERE Id = {id}";
                }

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(queryString, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write($"<script language=javascript>alert('Performed operation successfully.')</script>");
                }
                btnAdd.Text = "Insert";
                clear();
            }
            catch (Exception ex)
            {
                Response.Write($"<script language=javascript>alert('Problem connecting to database: {ex.Message}')</script>");
            }

            GridView1.EditIndex = -1;
            this.BindGrid();
        }


        // Method to Clear Text Fields
        protected void btnClear_Click(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
            clear();
            btnAdd.Text = "Insert";
        }

        protected void clear()
        {
            txtId.Text = txtName.Text = "";
        }


        // Method to Populate Category Id and Category Name
        protected void populateFields(int rowIndex)
        {
            txtId.Text = this.GridView1.Rows[rowIndex].Cells[1].Text;
            txtName.Text = this.GridView1.Rows[rowIndex].Cells[2].Text;
        }


        // Method to Delete Selected Category From the Database
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string ID = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string queryString = $"DELETE FROM [Category] WHERE [Id] = {ID}";

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
            }
            catch (Exception ex)
            {
                Response.Write($"<script language=javascript>alert('Problem connecting to database: {ex.Message}')</script>");
            }
            this.BindGrid();
        }


        // Method to Confirm the Deletion of Category From the Application
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[0].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }


        // Method to Edit Category From Categories Table
        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            btnAdd.Text = "Update";
            populateFields(e.NewEditIndex);
            this.BindGrid();
        }
    }
}