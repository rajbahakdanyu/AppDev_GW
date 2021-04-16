using System;
using System.Collections.Generic;
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
        }
    }
}