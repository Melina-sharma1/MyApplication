using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyGoalAssignment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void OnClick_login(object sender, EventArgs e)
        {

            //declare username & password
            string username = "";
            string password = "";


            //declare sql connection
            SqlConnection conReg = new SqlConnection(SqlDataLogin.ConnectionString);

            //declare sql command
            SqlCommand comSelect = new SqlCommand(SqlDataLogin.SelectCommand);

            comSelect.Connection = conReg;
            comSelect.Parameters.AddWithValue("U_Email", txtemail.Text);
            comSelect.Parameters.AddWithValue("U_Password", txtPassword.Text);


            //open database connection
            conReg.Open();

            //declare reader to select the dataset 
            DbDataReader Myreader;
            //execute query 
            Myreader = comSelect.ExecuteReader(CommandBehavior.CloseConnection);

            Console.WriteLine(Myreader.ToString());

            string U_Email = "";
            string U_Password = "";
            string U_FName = "";
            string U_LName = "";
            int Id = 0;

            // get the value from the reader
            while (Myreader.Read())
            {
                Id = Myreader.GetInt32(0);
                U_Email = Myreader.GetString(Myreader.GetOrdinal("U_Email"));
                U_Password = Myreader.GetString(Myreader.GetOrdinal("U_Password"));
                U_FName = Myreader.GetString(Myreader.GetOrdinal("U_FName"));
                U_LName = Myreader.GetString(Myreader.GetOrdinal("U_LName"));

            }

            //get the username and password
            username = txtemail.Text;
            password = txtPassword.Text;

            //verify the username and password
            if (username == U_Email && password == U_Password)
            {
                //set the session of the user
                Session["User"] = username;
                Session["U_FName"] = U_FName;
                Session["U_LName"] = U_LName;
                Session["ID"] = Id;


                // Redirect the user to the protected page
                Response.Redirect("Authentication.aspx");
            }
            else
            {
                // Display an error message
                ErrorMessagelbl.Text = "ERROR!!! Invalid username or password.";
                ErrorMessagelbl.Visible = true;
            }
        }

        protected void signupBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }

    }
}