using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MyGoalAssignment
{
    public partial class Update : System.Web.UI.Page
    {
     
         protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] == null)
                {

                    Response.Redirect("Login.aspx");
                }
                else
                {
                    //initialize 
                    string emailload = "";
                    string password = "";
                    string FName = "";
                    string LName = "";
                    string YOB = "";



                    //create connection
                    SqlConnection connUpd = new SqlConnection(updateSql.ConnectionString);
                    //create command 
                    SqlCommand comUpdate = new SqlCommand(updateSql.SelectCommand);
                    comUpdate.Connection = connUpd;
                    comUpdate.Parameters.AddWithValue("@User_ID", Session["ID"]);

                    //declare reader to select the dataset 
                    SqlDataReader drLoad;
                    //open connection 
                    connUpd.Open();
                    drLoad = comUpdate.ExecuteReader(CommandBehavior.CloseConnection);

                    while (drLoad.Read())
                    {
                        emailload = drLoad.GetString(1);
                        password = drLoad.GetString(2);
                        FName = drLoad.GetString(3);
                        LName = drLoad.GetString(4);
                        YOB = Convert.ToString(drLoad.GetInt32(5));

                    }
                    email.Text = emailload;
                    passwordtxt.Text = password;
                    fnametxt.Text = FName;
                    lnametxt.Text = LName;
                    yobtxt.Text = YOB;
                }
            }
        }
        

        protected void emailchkbox_CheckedChanged(object sender, EventArgs e)
        {
            //if email is checked allow to edit email
            if (emailchkbox.Checked == true)
            {
                email.ReadOnly = false;
            }
            //else disable email field

            else
            {
                email.ReadOnly = true;
            }
        }

        protected void passwordchkbox0_CheckedChanged(object sender, EventArgs e)
        {
            if (passwordchkbox0.Checked == true)
            {
                passwordtxt.ReadOnly = false;
                confirmPass.ReadOnly = false;

                confirmPass.Visible = true;

                //compPwVal.Visible = true;
            }
            else
            {
                passwordtxt.ReadOnly = true;
                confirmPass.ReadOnly = true;

                confirmPass.Visible = false;

                //compPwVal.Visible = false;
            }
        }

        protected void FNamechkbox1_CheckedChanged(object sender, EventArgs e)
        {
            if (FNamechkbox1.Checked == true)
            {
                fnametxt.ReadOnly = false;
            }
            else
            {
                fnametxt.ReadOnly = true;
            }
        }

        protected void LNamechkbox2_CheckedChanged(object sender, EventArgs e)
        {
            if (LNamechkbox2.Checked == true)
            {
                lnametxt.ReadOnly = false;
            }
            else
            {
                lnametxt.ReadOnly = true;
            }
        }

        protected void Yobchkbox2_CheckedChanged(Object sender, EventArgs e)
        {
            if (YobChkBox.Checked == true)
            {
                yobtxt.ReadOnly = false;
            }
            else
            {
                yobtxt.ReadOnly = true;
            }
        }

        protected void updateAccount_Click(object sender, EventArgs e)
        {
            //update to database 
            SqlConnection update = new SqlConnection(updateSql.ConnectionString);

            SqlCommand comUp = new SqlCommand(updateSql.UpdateCommand);
            comUp.Connection = update;

            //send entered data to database
            comUp.Parameters.AddWithValue("User_ID", Session["ID"]);
            comUp.Parameters.AddWithValue("U_Email", email.Text);
            comUp.Parameters.AddWithValue("U_Password", passwordtxt.Text);
            comUp.Parameters.AddWithValue("U_FName", fnametxt.Text);
            comUp.Parameters.AddWithValue("U_LName", lnametxt.Text);
            comUp.Parameters.AddWithValue("U_YoB", Convert.ToInt32(yobtxt.Text));

            //open connection,execute ,cloase & redirect
            update.Open();
            comUp.ExecuteNonQuery();

        //    ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessMessage", "showSuccessMessage();", true);
        
        Response.Redirect("Update.aspx");
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {

            //delete to database 
            SqlConnection delete = new SqlConnection(deleteSql.ConnectionString);

            SqlCommand comDel = new SqlCommand(deleteSql.DeleteCommand);
            comDel.Connection = delete;

            //send entered data to database
            comDel.Parameters.AddWithValue("User_ID", Session["ID"]);

            //open connection,execute ,cloase & redirect
            delete.Open();
            comDel.ExecuteNonQuery();

            //clear all the session
            Session["User"] = null;
            Session["U_FName"] = null;
            Session["U_LName"] = null;
            Session["ID"] = null;

            //redirect to login page
            Response.Redirect("Login.aspx");

        }
    }
}