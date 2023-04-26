using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyGoalAssignment
{
    public partial class Authentication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //validate the session if invalid user then redirect them to error page
            if (Session["User"] == null)
            {
                //if there is no user assigned then redirect them to error page
                Response.Redirect("Error.aspx");
            }
            // if valid user then allow access to the authentication page
            else
            {
                authenticationMsg.Text = "Hi" + " " + Session["User"] + "! " + "You are a authorized user.";

            }
        }
    }
}