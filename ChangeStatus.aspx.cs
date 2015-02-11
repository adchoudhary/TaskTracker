using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public Project proj;
    public Common.Status current;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        proj = DBHandler.GetProjectByID(Convert.ToInt64(Request.QueryString["id"]));


        if(!Page.IsPostBack)
        {

            ddlStatus.Items.Add("Complete");
            ddlStatus.Items.Add("Incomplete");
            ddlStatus.Items.Add("Rejected");
            ddlStatus.Items.Add("Not Started");

            if (proj.Status == Common.Status.Aborted) ddlStatus.SelectedIndex = 2;
            else if (proj.Status == Common.Status.Completed) ddlStatus.SelectedIndex = 0;
            else if (proj.Status == Common.Status.None) ddlStatus.SelectedIndex = 3;
            else if (proj.Status == Common.Status.Pending) ddlStatus.SelectedIndex = 1;
        }
        
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        proj = DBHandler.GetProjectByID(Convert.ToInt64(Request.QueryString["id"]));

        long recid = 0;

        if (ddlStatus.SelectedItem.Text == "Complete")
        {
            proj.Status = Common.Status.Completed;
            proj.Actual.amount = Convert.ToDecimal(txtTotalActualExpense.Text);
            proj.Actual.date = Convert.ToDateTime(txtCompletedDate.Text);
            recid = DBHandler.CompleteProject(proj);
        }
        else
        {
            if (ddlStatus.SelectedItem.Text == "Rejected") proj.Status = Common.Status.Aborted;
            else if (ddlStatus.SelectedItem.Text == "Incomplete") proj.Status = Common.Status.Pending;
            else if (ddlStatus.SelectedItem.Text == "Not Started") proj.Status = Common.Status.None;
             recid = DBHandler.ChangeStatus(proj);
        }
        

       if (recid == 0) Response.Redirect("NotConfirmation.aspx?op=Status Change");
       else Response.Redirect("Confirmation.aspx");
    }
    protected void txtCostEstimated_TextChanged(object sender, EventArgs e)
    {

    }
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
}