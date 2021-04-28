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
    public partial class NotSoldLong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            String queryString = @"SELECT  i.[Id], i.[Name], i.[Description], i.[Price], s.[Quantity]
                                    FROM [Item] as i
                                    JOIN [Stock] s ON
                                    s.[ItemId] = i.Id
                                    WHERE NOT EXISTS ( 
                                            SELECT *
                                            FROM [Order]
                                            WHERE [ItemId] = i.[Id]
                                            AND [Date] >= Dateadd(Month, -3, sysdatetime())
                                    )";

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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "showModal();", true);
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            String queryString = @"DELETE FROM [Item]
                                    WHERE NOT EXISTS ( 
                                            SELECT *
                                            FROM [Order]
                                            WHERE  [ItemId] = [Item].[Id]
                                            AND [Date] >= Dateadd(Month, -3, sysdatetime())
                                    )";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(queryString, con);

                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Records Deleted Successfully')", true);
                }

                BindGrid();
            }
        }
    }
}