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
            if (emailchkbox.Checked == true)
            {
                email.ReadOnly = false;
            }
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

                CompareValidator1.Enabled = true;
            }
            else
            {
                passwordtxt.ReadOnly = true;
                confirmPass.ReadOnly = true;

                confirmPass.Visible = false;

                CompareValidator1.Enabled = false;
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

        protected void YBOchkbox3_CheckedChanged(object sender, EventArgs e)
        {
            if (YBOchkbox3.Checked == true)
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
            SqlConnection update = new SqlConnection(updateSql.ConnectionString);

            SqlCommand comUp = new SqlCommand(updateSql.UpdateCommand);
            comUp.Connection = update;

            comUp.Parameters.AddWithValue("@Email", email.Text);
            comUp.Parameters.AddWithValue("@Password", passwordtxt.Text);
            comUp.Parameters.AddWithValue("@FName", fnametxt.Text);
            comUp.Parameters.AddWithValue("@LName", lnametxt.Text);
            comUp.Parameters.AddWithValue("@YOB", Convert.ToInt32(yobtxt.Text));

            //open connection,execute ,cloase & redirect
            update.Open();
            comUp.ExecuteNonQuery();
            Response.Redirect("Update.aspx");
        }
    }
}