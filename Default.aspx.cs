using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppDev_GW
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["name"] != null)
            {
                lbUser.Text = Session["name"].ToString();
            } else
            {
                Response.Redirect("Login.aspx");
            }

            // Check if this is the first visit to page
            if (!(bool)Session["first"])
            {
                Session["first"] = true;
                checkStock();
            }
        }

        protected void checkStock()
        {
            Response.Write("<script language=javascript>alert('First Visit')</script>");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}