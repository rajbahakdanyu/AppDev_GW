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
    public partial class OutofStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid(string expression = "[Id]", string direction = "ASC")
        {
            int id = Convert.ToInt32(Session["id"].ToString());

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            String queryString = $"SELECT i.[Id], i.[Name], i.[Description], s.[Quantity] FROM Item as i JOIN [Stock] s ON s.ItemId = i.Id WHERE [Quantity] = 0 ORDER BY {expression} {direction} ";

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

        protected void btnSort_Click(object sender, EventArgs e)
        {
            string expression = ddlSearch.SelectedItem.Value;
            string direction;

            switch (expression)
            {
                case "Name":
                    direction = "ASC";
                    break;
                default:
                    direction = "DESC";
                    break;
            }

            BindGrid(expression, direction);
        }
    }
}