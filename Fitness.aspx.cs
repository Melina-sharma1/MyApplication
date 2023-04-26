using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyGoalAssignment
{
    public partial class Fitness : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                //validate the session if invalid user then redirect them to error page
                Response.Redirect("Error.aspx");
            }
            //if the user is valid then allow access to this page
            else
            {
                //else allow access to the content of the page
            }
        }
    }
}