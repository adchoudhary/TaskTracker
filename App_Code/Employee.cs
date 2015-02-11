using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Employee
/// </summary>
public class Employee
{
    #region Properties

    private long _ID;
    public long ID { get { return _ID; } set { _ID = value; } }

    private string _Name;
    public string Name { get { return _Name; } set { _Name = value; } }

    private string _UserName;
    public string UserName { get { return _UserName; } set { _UserName = value; } }

    private string _Password;
    public string Password { get { return _Password; } set { _Password = value; } }

    public string FullAddress { get { return _EmpAddress.FullAddress; } }
    public string PhoneNo { get { return _EmpAddress.EmpContact.Phone1; } }

    private Address _EmpAddress;
    public Address EmpAddress { get { return _EmpAddress; } set { _EmpAddress = value; } }
    #endregion


    public Employee( string UserName, string Password, string Name = "", long ID = 0)
    {
        _ID = ID;
        _UserName = UserName;
        _Password = Password;
        _Name = Name;
    } 

}