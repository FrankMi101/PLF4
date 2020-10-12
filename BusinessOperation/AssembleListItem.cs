using ClassLibrary;
using DataAccess.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace BusinessOperation
{
    public static class AssembleListItem
    {
        public static void SetLists(System.Web.UI.WebControls.ListControl myListControl, string operate, string userID, string userRole, string schoolYear)
        {
            string sp = "dbo.tcdsb_PLF_ListDDL2New @Operate,@UserID,@UserRole,@SchoolYear";
            ParameterSP parameter = new ParameterSP { Operate = operate, UserID = userID, UserRole = userRole, SchoolYear = schoolYear };
            List<List2Item> myList = GeneralDataAccess.GetLists(sp, parameter);
            // List<List2Item> myList = UListItem.GetLists(operate, userID, userRole, schoolYear); /// new List<List2Item>();
            AssemblingMyList(myListControl, myList);
        }
        private static void AssemblingMyList(System.Web.UI.WebControls.ListControl myListControl, List<List2Item> myList)
        {
            try
            {
                // List<List2Item> myList = myList;
                myListControl.Items.Clear();
                myListControl.DataSource = myList;
                myListControl.DataTextField = "MyText";
                myListControl.DataValueField = "MyValue";
                myListControl.DataBind();


            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }
        }

        public static void SetValue(System.Web.UI.WebControls.ListControl myListControl, object _Value)

        {
            myListControl.ClearSelection();
            if (myListControl.Items.Count == 1)
            {
                myListControl.SelectedIndex = 0;
            }
            else
            {
                if (_Value.ToString() == "0")
                {
                    myListControl.SelectedIndex = 0;
                }
                else
                {
                    foreach (ListItem _item in myListControl.Items)
                    {
                        if (_item.Value.ToString().ToLower() == _Value.ToString().ToLower())
                        {
                            _item.Selected = true;
                            break;
                        }
                    }
                }
            }
        }

        public static void SetLists2(System.Web.UI.WebControls.DropDownList myListControl, System.Web.UI.WebControls.DropDownList myListControl2, string operate, string userID, string userRole, string schoolYear, string schoolCode)
        {
            string sp = "dbo.tcdsb_PLF_ListSchoolsNew @Operate,@UserID,@UserRole,@SchoolYear,@SchoolCode";
            ParameterSP parameter = new ParameterSP { Operate = operate, UserID = userID, UserRole = userRole, SchoolYear = schoolYear, SchoolCode = schoolCode };
            List<List2Item> myList = GeneralDataAccess.GetLists(sp, parameter);


            //List<List2Item> myList = new List<List2Item>();
            //   myList = DAListItem.GetLists(operate, userID);
          //  myList = UListItem.GetLists(operate, userID, userRole, schoolYear, schoolCode);
            AssemblingSchoolList(myListControl, myListControl2, myList);
        }
        private static void AssemblingSchoolList(System.Web.UI.WebControls.DropDownList myListControl, System.Web.UI.WebControls.DropDownList myListControl2, List<List2Item> myList)
        {
            try
            {

                myListControl.Items.Clear();
                myListControl.DataSource = myList;
                myListControl.DataTextField = "myValue";
                myListControl.DataValueField = "myValue";
                myListControl.DataBind();

                myListControl2.Items.Clear();
                myListControl2.DataSource = myList;
                myListControl2.DataTextField = "myText";
                myListControl2.DataValueField = "myValue";
                myListControl2.DataBind();
            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }
        }




    }
}
