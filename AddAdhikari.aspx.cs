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
        if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Employee emp = new Employee(txtUserName.Text, txtPassword.Text, txtName.Text);
        emp.EmpAddress = new Address(txtaddress.Text);
        emp.EmpAddress.EmpContact = new Contact("", "");
        emp.EmpAddress.EmpContact.Phone1 = txtPhoneNo.Text;
        emp.EmpAddress.EmpContact.Mobile = txtMobileNo.Text;

        //check for duplicate user
        //if(Common.ValidateUser(emp)) 

        long recid = DBHandler.AddAdhikari(emp);

        if (recid == 0) Response.Redirect("NotConfirmation.aspx");
        else { Common.AdhikariList = DBHandler.GetAdhikari(); Response.Redirect("Confirmation.aspx"); }
    }
}