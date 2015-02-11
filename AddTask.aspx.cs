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

        if(!Page.IsPostBack)
        {
            if (Common.AdhikariList == null) Common.AdhikariList = DBHandler.GetAdhikari();

            //for (int i = 0; i < Common.AdhikariList.Count; i++)
            //    ddpadhikari.Items.Add(Common.AdhikariList[i].Name);
            ddpadhikari.DataSource = Common.AdhikariList;
            ddpadhikari.DataTextField = "Name";
            ddpadhikari.DataValueField = "ID";
            ddpadhikari.DataBind();
            ddpadhikari.Text = "";
        }
        
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        Project pro = new Project(txtProjectName.Text);
        pro.Administrative.amount = Convert.ToDecimal(txtAdministrativeAmount.Text);
        pro.Administrative.date = Convert.ToDateTime(txtAdministrativeDate.Text);
        pro.CostEstimated = Convert.ToDecimal(txtCostEstimated.Text);
        pro.GrantReleaseDate = Convert.ToDateTime(txtGrantReleaseDate.Text);
        pro.Remarks = txtRemarks.Text;
        pro.SchemeName = txtSchemeName.Text;
        pro.StartDate = DateTime.Now;
        pro.Taluka = txtTaluka.Text;
        pro.Technical.date = Convert.ToDateTime(txtTechnicalDate.Text);
        pro.Technical.amount = Convert.ToDecimal(txtTechnicalAmount.Text);
        pro.utilizationDate = DateTime.Now;
        pro.Village = txtVillage.Text;
        pro.WorkOrderDate = DateTime.Now;
        pro.GivenTo = DBHandler.GetAdhikariByID(Convert.ToInt64(ddpadhikari.SelectedValue));


        long recid = DBHandler.AddProject(pro, (DBHandler.GetAdhikariByName(Session["User"].ToString())).ID);

       if (recid == 0) Response.Redirect("NotConfirmation.aspx");
       else Response.Redirect("Confirmation.aspx");
    }
    protected void txtCostEstimated_TextChanged(object sender, EventArgs e)
    {

    }
}