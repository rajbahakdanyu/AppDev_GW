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
    public partial class Detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string customer = ddlSearch.SelectedValue;

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                String queryString = $"SELECT * FROM [Order] WHERE [CustomerId] = {customer} AND [Date] >= Dateadd(DAY, -31, sysdatetime()) ORDER BY [Date] DESC";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(queryString, con);

                    DataTable dt = new DataTable("Purchase Detail");
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        dt.Load(sdr);
                    }

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            } catch (Exception ex)
            {
                Response.Write($"<script language=javascript>alert('Problem connecting to database')</script>");
            }
        }
    }
}