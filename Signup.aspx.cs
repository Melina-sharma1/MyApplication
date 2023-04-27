using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
namespace MyGoalAssignment
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            //declare sql connection
            SqlConnection conReg = new SqlConnection(SqlDataReg.ConnectionString);

            //declare sql command
            SqlCommand comInsert = new SqlCommand(SqlDataReg.InsertCommand);

            //get the input value to the parameter
            comInsert.Connection= conReg;
            comInsert.Parameters.AddWithValue("U_Email", email.Text);
            comInsert.Parameters.AddWithValue("U_Password", password.Text);
            comInsert.Parameters.AddWithValue("U_FName", firstName.Text);
            comInsert.Parameters.AddWithValue("U_LName", lastName.Text);
            comInsert.Parameters.AddWithValue("U_YoB", Convert.ToInt32(yearOfBirth.Text));//conver txt in integer
            
            //open database connection
            conReg.Open();

            //execute query 
            comInsert.ExecuteNonQuery();

            //close conntection
            conReg.Close();

            //redirect to login page
            Response.Redirect("Login.aspx");
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            //once signed up, redirect the user to login page. 
            Response.Redirect("Login.aspx");
        }
    }
    
}