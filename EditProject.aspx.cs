using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public Project proj = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if(!Page.IsPostBack)
        {
            proj = DBHandler.GetProjectByID(Convert.ToInt64(Request.QueryString["id"]));
            txtAdministrativeAmount.Text = proj.Administrative.amount.ToString();
            txtAdministrativeDate.Text = proj.Administrative.date.ToString("dd-MM-yy");
            txtCostEstimated.Text = proj.CostEstimated.ToString();
            txtGrantReleaseDate.Text = proj.GrantReleaseDate.ToShortDateString();
            txtProjectName.Text = proj.Name;
            txtRemarks.Text = proj.Remarks;
            txtSchemeName.Text = proj.SchemeName;
            txtTaluka.Text = proj.Taluka;
            txtTechnicalAmount.Text = proj.Technical.amount.ToString();
            txtTechnicalDate.Text = proj.Technical.date.ToShortDateString();
            txtVillage.Text = proj.Village;
            
        }
        
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        proj = DBHandler.GetProjectByID(Convert.ToInt64(Request.QueryString["id"]));
        Project pro = new Project(txtProjectName.Text,proj.ID,proj.Status);
        pro.Administrative.amount = Convert.ToDecimal(txtAdministrativeAmount.Text);
        pro.Administrative.date = Convert.ToDateTime(txtAdministrativeDate.Text);
        pro.CostEstimated = Convert.ToDecimal(txtCostEstimated.Text);
        pro.GrantReleaseDate = Convert.ToDateTime(txtGrantReleaseDate.Text);
        pro.Remarks = txtRemarks.Text;
        pro.SchemeName = txtSchemeName.Text;
        pro.StartDate = proj.StartDate;
        pro.Taluka = txtTaluka.Text;
        pro.Technical.date = Convert.ToDateTime(txtTechnicalDate.Text);
        pro.Technical.amount = Convert.ToDecimal(txtTechnicalAmount.Text);
        pro.utilizationDate = proj.utilizationDate;
        pro.Village = txtVillage.Text;
        pro.WorkOrderDate = proj.WorkOrderDate;
       


        long recid = DBHandler.UpdateProject(pro);

       if (recid == 0) Response.Redirect("NotConfirmation.aspx?op=Update");
       else Response.Redirect("Confirmation.aspx");
    }
    protected void txtCostEstimated_TextChanged(object sender, EventArgs e)
    {

    }
}