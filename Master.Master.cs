using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MyGoalAssignment
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["User"] == null)
            {
                updateAccount.Visible= false;
                logOutbtn.Visible = false;

            }
            else
            { 
                updateAccount.Visible= true;
                logOutbtn.Visible = true;

            }
        }

        protected void updateAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("Update.aspx");
        }

        protected void logOutbtn_Click(object sender, EventArgs e)
        {
            Session["User"] = null;
            Session["U_FName"] = null;
            Session["U_LName"] = null;
            Session["ID"] = null;

            Response.Redirect("Login.aspx");
        }
    }
}