using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUserName.Text;
        string password = txtPassword.Text;

        if (Common.ValidateUserPass(new Employee(username,password)))
        {
            Session["User"] = username;
            Common.AdhikariList = DBHandler.GetAdhikari();

            Response.Redirect("welcome.aspx");
        }
        else
        {
            Label1.Text = "Invalid Username and/or Password";
        }
    }
}