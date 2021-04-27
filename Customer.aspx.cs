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
    public partial class Customer : System.Web.UI.Page
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

            String queryString = "SELECT * FROM [Customer]";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(queryString, con);

                DataTable dt = new DataTable("Customer");
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    dt.Load(sdr);
                }

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            try { 
            String connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            string id = txtId.Text.ToString() ?? "";
            string name = txtName.Text.ToString() ?? "";
            string number = txtNumber.Text.ToString() ?? "";
            string address = txtAddress.Text.ToString() ?? "";
            string email = txtEmail.Text.ToString() ?? "";
            string type = ddlType.Text.ToString() ?? "";
            String queryString = "";

            if (btnAdd.Text == "Insert")
            {
                queryString = $"INSERT INTO [Customer] ([Name], [Number], [Address], [Email], [Type]) VALUES ('{name}','{number}','{address}','{email}','{type}')";
            }
            else if (btnAdd.Text == "Update")
            {
                queryString = $"UPDATE [Customer] SET [Name] = '{name}', [Number] = '{number}', [Address] = '{address}', [Email] = '{email}', [Type] = '{type}' WHERE Id = {id}";
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

        protected void btnClear_Click(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
            clear();
            btnAdd.Text = "Insert";
        }

        protected void clear()
        {
            txtId.Text = txtName.Text = txtNumber.Text = txtAddress.Text = txtEmail.Text = "";
        }

        protected void populateFields(int rowIndex)
        {
            txtId.Text = this.GridView1.Rows[rowIndex].Cells[1].Text;
            txtName.Text = this.GridView1.Rows[rowIndex].Cells[2].Text;
            txtNumber.Text = this.GridView1.Rows[rowIndex].Cells[3].Text;
            txtAddress.Text = this.GridView1.Rows[rowIndex].Cells[4].Text;
            txtEmail.Text = this.GridView1.Rows[rowIndex].Cells[5].Text;
            ddlType.SelectedValue = this.GridView1.Rows[rowIndex].Cells[6].Text;
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ID = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string queryString = $"DELETE FROM [Customer] WHERE [Id] = {ID}";

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
            this.BindGrid();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[0].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            btnAdd.Text = "Update";
            populateFields(e.NewEditIndex);
            this.BindGrid();
        }
    }
}