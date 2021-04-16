using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppDev_GW
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["name"] == null)
            {
                Response.Redirect("Login.aspx");
            }

        }

        protected void Change(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }

        protected void LogOut(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}