using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
 using DataAccess;
using BusinessOperation;

namespace PLF.PLFForm
{
    public partial class History : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                setPageAttribution();
                AssemblePage();
                BindGridViewData();
            }
        }
        private void setPageAttribution()
        {
            hfCategory.Value = "PLF";
            hfPageID.Value = "PLFList";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
        }
        private void AssemblePage()
        {
            AssembleListItem.SetLists(ddlSchoolYear, "SchoolYearbySchool", User.Identity.Name, WorkingProfile.UserRole, WorkingProfile.SchoolCode);
            AssembleListItem.SetValue(ddlSchoolYear, UserProfile.CurrentSchoolYear);

            AssembleListItem.SetLists2(ddlSchoolCode,ddlSchool,  "SchoolList", User.Identity.Name, WorkingProfile.UserRole, ddlSchoolYear.SelectedValue, WorkingProfile.SchoolCode);
            InitialPage();
        }
        private void InitialPage()
        {
            if (WorkingProfile.SchoolCode == "")
            {
                ddlSchool.SelectedIndex = 0;
                AssembleListItem.SetValue(ddlSchoolCode, ddlSchool.SelectedValue); 
                WorkingProfile.SchoolCode = ddlSchool.SelectedValue;
            }
            else
            {
                AssembleListItem.SetValue(  ddlSchool, WorkingProfile.SchoolCode);
                AssembleListItem.SetValue(ddlSchoolCode,   WorkingProfile.SchoolCode);

            }

        }
        private void BindGridViewData()
        {
            try
            {
                string schoolyear = ddlSchoolYear.SelectedValue;
                string schoolcode = ddlSchool.SelectedValue;
                PublishandSignOffList.BindGridView(ref GridView1, "SchoolHistory", "DataSet", User.Identity.Name, schoolyear, schoolcode);

            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }

        protected void ddlSchoolYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserLastWorking.SchoolYear = ddlSchoolYear.SelectedValue;
            BindGridViewData();
        }

        protected void ddlSchool_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserLastWorking.SchoolCode = ddlSchoolCode.SelectedValue;
            AssembleListItem.SetValue(ddlSchoolCode, ddlSchool.SelectedValue);
            BindGridViewData();
        }
        protected void ddlSchoolCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserLastWorking.SchoolCode = ddlSchoolCode.SelectedValue;
            AssembleListItem.SetValue(ddlSchool, ddlSchoolCode.SelectedValue);
            BindGridViewData();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridViewData();
        }

    }
}