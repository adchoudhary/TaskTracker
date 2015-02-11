using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    Employee empselected;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!Page.IsPostBack)
        {
            empselected = DBHandler.GetAdhikariByID(Convert.ToInt64(Request.QueryString["id"]));
            txtaddress.Text = empselected.EmpAddress.FullAddress;
            txtMobileNo.Text = empselected.EmpAddress.EmpContact.Mobile;
            txtName.Text = empselected.Name;
            txtPassword.Text = empselected.Password;
            txtPhoneNo.Text = empselected.PhoneNo;
            txtUserName.Text = empselected.UserName;
        }
        
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {



        Employee emp = new Employee(txtUserName.Text, txtPassword.Text, txtName.Text, Convert.ToInt64(Request.QueryString["id"]));
        emp.EmpAddress = new Address(txtaddress.Text);
        emp.EmpAddress.EmpContact = new Contact("", "");
        emp.EmpAddress.EmpContact.Phone1 = txtPhoneNo.Text;
        emp.EmpAddress.EmpContact.Mobile = txtMobileNo.Text;
        

        //check for duplicate user
        //if(Common.ValidateUser(emp)) 

        long recid = DBHandler.UpdateAdhikari(emp);

        if (recid == 0) Response.Redirect("NotConfirmation.aspx?op=Update");
        else { Common.AdhikariList = DBHandler.GetAdhikari(); Response.Redirect("Confirmation.aspx"); }
    }
}