using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyDapper;

namespace DataAccess.Common
{
    public class GeneralDataAccess
    {
        public static readonly string ConnecttionSTR = MyDapper.DBConnectionHelper.ConnectionSTR();//  DBConnectionHelper.ConnectionSTR();
        public static List<List2Item> GetLists(string sp, object parameter)
        {
            //using (IDbConnection connection =  new SqlConnection(conSTR))
            //{
            //    var mylist = connection.Query<List2Item>(sp, parameter).ToList();
            //  //  new { Operate = operate, UserID = userID, SchoolYear = schoolYear, SchoolCode = schoolCode, SchoolArea = schoolArea }).ToList();
            //    return mylist;
            //}
           //   string conSTR = MyDapper.DBConnectionHelper.ConnectionSTR();
            return EasyDataAccess.ListOfT<List2Item>(sp, parameter);
        }
        public static List<FormTitle> GetTitleList(string sp, object parameter)
        {
            //using (IDbConnection connection = new SqlConnection(conSTR))
            //{
            //    var mylist = connection.Query<FormTitle>(sp, parameter).ToList();
            //    return mylist;
            //}
            return EasyDataAccess.ListOfT<FormTitle>(sp, parameter);
        }
        public static List<FormContent> GetFormContentList(string sp, object parameter)
        {
            //using (IDbConnection connection = new SqlConnection(conSTR))
            //{
            //    try
            //    {
            //        var mylist = connection.Query<FormContent>(sp, parameter).ToList();
            //        return mylist;
            //    }
            //    catch (Exception ex)
            //    {
            //        var exm = ex.Message;
            //        return null;
            //    }

            //}

            return EasyDataAccess.ListOfT<FormContent>(sp, parameter);
        }
        public static List<School> GetSchoolList(string sp, object parameter)
        {
            //using (IDbConnection connection = new SqlConnection(conSTR))
            //{
            //    var schoollist = connection.Query<School>(sp, parameter).ToList();
            //    return schoollist;
            //}
            return EasyDataAccess.ListOfT<School>(sp, parameter);
        }
        public static List<SiteTeams> GetTeamList(string sp, object parameter)
        {
            //using (IDbConnection connection = new SqlConnection(conSTR))
            //{
            //    var mylist = connection.Query<SiteTeams>(sp, parameter).ToList();
            //    return mylist;
            //}
            return EasyDataAccess.ListOfT<SiteTeams>(sp, parameter);
        }

        public static string TextValue(string sp, object parameter)
        {
            //using (IDbConnection connection = new SqlConnection(conSTR))
            //{
            //    var myText = connection.QuerySingle<SingleString>(sp, parameter);
            //    return myText.MyText;
            //}
            return EasyDataAccess.ValueOfT<string>  (sp, parameter);
        }


        //public static List<SiteTeams> GetListsold(string operate, string userID, string userRole, string schoolYear, string schoolCode)
        //{
        //    using (IDbConnection connection = new SqlConnection(conSTR))
        //    {
        //        // connection.Query is a Dapper function
        //        //var output = connection.Query<Person>($"select * from People where LastName = '{lastName }'").ToList();
        //        string SP = "dbo.tcdsb_PLF_SchoolSiteTeamNew  @Operate,@UserID, @SchoolYear,@SchoolCode";
        //        ParameterSP1 parameter = new ParameterSP1 { Operate = operate, UserID = userID, UserRole = userRole, SchoolYear = schoolYear, SchoolCode = schoolCode };
        //        var mylist = connection.Query<SiteTeams>(SP, parameter).ToList();
        //        //  new { Operate = operate, UserID = userID, SchoolYear = schoolYear, SchoolCode = schoolCode,SchoolArea = schoolArea }).ToList();
        //        return mylist;
        //    }
        //}
        public static bool IsStringNull(string s)
        {
            return (s == null || s == String.Empty) ? true : false;
        }
    }
}
