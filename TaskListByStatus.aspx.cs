﻿using System;
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

        if (!Page.IsPostBack)
        {
            ddlStatus.Items.Add("None");
            ddlStatus.Items.Add("All");
            ddlStatus.Items.Add("Complete");
            ddlStatus.Items.Add("Incomplete");
            ddlStatus.Items.Add("Rejected");
            ddlStatus.Items.Add("Not Started");

        }

        ddlStatus_SelectedIndexChanged(sender, e);
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<Project> pro = DBHandler.GetProjectByEmpID(DBHandler.GetAdhikariByName(Session["User"].ToString()).ID);
        

        if (ddlStatus.SelectedItem.Text == "All")
        {
            Repeater1.DataSource = pro;
            Repeater1.DataBind();
        }
        else if (ddlStatus.SelectedItem.Text == "None")
        {
            Repeater1.DataSource = null;
            Repeater1.DataBind();
        }
        else if (ddlStatus.SelectedItem.Text == "Complete")
        {
            var studentlt = from aa in pro
                            where aa.Status == Common.Status.Completed
                            select aa;

            Repeater1.DataSource = studentlt;
            Repeater1.DataBind();
        }
        else if (ddlStatus.SelectedItem.Text == "Incomplete")
        {
            var studentlt = from aa in pro
                            where aa.Status == Common.Status.Pending
                            select aa;

            Repeater1.DataSource = studentlt;
            Repeater1.DataBind();
        }
        else if (ddlStatus.SelectedItem.Text == "Rejected")
        {
            var studentlt = from aa in pro
                            where aa.Status == Common.Status.Aborted
                            select aa;

            Repeater1.DataSource = studentlt;
            Repeater1.DataBind();
        }
        else if (ddlStatus.SelectedItem.Text == "Not Started")
        {

            var studentlt = from aa in pro
                            where aa.Status == Common.Status.None
                            select aa;

            Repeater1.DataSource = studentlt;
            Repeater1.DataBind();
        }
    }
}