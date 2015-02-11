using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Common
/// </summary>
public static class Common
{

    public static string stradmin = "admin";

    public static List<Employee> AdhikariList;

    public static string Concatenate(string str, bool isFirst = false, string Separator = ",")
    {
        if (str == null || str == "" || str == "0") return "";
        else 
        {
           if(isFirst) return  str;
           else return Separator + " " + str; 
        }
    }


    public enum AddressType
    {
        Office = 1,
        Residential =2,
        Other = 3,
        None = 4
    }

    public enum Gender
    {
        Male = 1,
        Female = 2,
        Other = 3,
        None = 4
    }

    public enum Status
    {
        Pending = 1,
        Completed = 2,
        Aborted = 3,
        None = 4
    }


    public static bool ValidateUserPass(Employee emp)
    {
        DataTable dt = DBHandler.ValidateUserPass(emp.UserName, emp.Password);
        if (dt.Rows.Count > 0) return true;
        else return false;

    }

    public static bool ValidateUser(Employee emp)
    {
        DataTable dt = DBHandler.ValidateUser(emp.UserName);
        if (dt.Rows.Count > 0) return true;
        else return false;
    }
}