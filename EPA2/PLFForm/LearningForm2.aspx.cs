using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Web.UI.HtmlControls;
using BusinessOperation;

namespace PLF.PLFForm
{
    public partial class LearningForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                string yID = Request.QueryString["yID"];
                
                 if (! String.IsNullOrEmpty(yID))   
                {
                    WorkingProfile.SchoolYear = Page.Request.QueryString["yID"];
                    WorkingProfile.SchoolCode = Page.Request.QueryString["sID"];
                }
                Assemblies_Title();
                Loading_Data();
            }
        }
        private void Assemblies_Title()
        { string userID = User.Identity.Name;
            LabelSchoolyear.Text = DateFC.SchoolYearFrom("-", WorkingProfile.SchoolYear);
            LabelSchool.Text = WorkingProfile.SchoolName;
            LabelPrincipal.Text = WorkingProfile.SchoolPrincipal;
            LabelSuperintendent.Text = WorkingProfile.UserArea;
            hfSchoolcode.Value = WorkingProfile.SchoolCode;
            hfSchoolyear.Value = WorkingProfile.SchoolYear;
            hfUserRole.Value = WorkingProfile.UserRole;
            hfUserID.Value = User.Identity.Name;
            hfSignOff.Value = SignOff.Signature("Result", userID, WorkingProfile.UserRole, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode, "School");
            hfSignOffSO.Value = SignOff.Signature("Result", userID, WorkingProfile.UserRole, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode, "SO");
            hfPublish.Value = SignOff.Signature("Result", userID, WorkingProfile.UserRole, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode, "Publish");
            try
            {               
                foreach (Control pControl in FormContent.Controls)
                {
                    if (pControl is Label)
                        {
                        string code = pControl.ID.Replace("Label", "");
                        Label lbl = (Label)pControl;
                        lbl.Text =  FormData.Title(code);
                    }
                }
                
            }
            catch (Exception ex)
            {
                var ms = ex.Message;
            }

        }
        private void Loading_Data() {
       
            string userID = User.Identity.Name;
            try
            {
                foreach (Control pControl in FormContent.Controls)
                {
                    if (pControl is HtmlTextArea)
                    {
                        string code = pControl.ID.Replace("Text", "");
                        HtmlTextArea txt = (HtmlTextArea)pControl;
                        txt.Value =FormData.Content("Get",userID, WorkingProfile.UserRole, WorkingProfile.SchoolYear,WorkingProfile.SchoolCode, code);
                    }
                }

            }
            catch (Exception ex)
            {
                var ms = ex.Message;
            }
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {

        }
    }
}