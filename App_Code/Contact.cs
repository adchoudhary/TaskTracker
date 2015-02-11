using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Contact
/// </summary>
public class Contact
{
    #region Properties

    private int _ID;
    public int ID { get { return _ID; } set { _ID = value; } }

    private string _Name;
    public string Name { get { return _Name; } set { _Name = value; } }

    private string _Designation;
    public string Designation { get { return _Designation; } set { _Designation = value; } }

    private string _Phone1;
    public string Phone1 { get { return _Phone1; } set { _Phone1 = value; } }

    private string _Phone2;
    public string Phone2 { get { return _Phone2; } set { _Phone2 = value; } }

    private string _Mobile;
    public string Mobile { get { return _Mobile; } set { _Mobile = value; } }

    private string _Fax;
    public string Fax { get { return _Fax; } set { _Fax = value; } }

    private string _Email;
    public string Email { get { return _Email; } set { _Email = value; } }

    private Common.Gender _Gender;
    public Common.Gender Gender { get { return _Gender; } set { _Gender = value; } }

    private string _STDCode;
    public string STDCode { get { return _STDCode; } set { _STDCode = value; } }

    private string _Extension;
    public string Extension { get { return _Extension; } set { _Extension = value; } }
    #endregion


    public Contact(string Name, string Phone1, Common.Gender Gender = Common.Gender.Male, int ID = 0, string Designation = "", string Phone2 = "", string Mobile = "", string Fax = "", string Email = "", string STDCode = "", string Extension = "")
    {
        _ID = ID;
        _Name = Name;
        _Designation = Designation;
        _Phone1 = Phone1;
        _Phone2 = Phone2;
        _Mobile = Mobile;
        _Fax = Fax;
        _Email = Email;
        _Gender = Gender;
        _STDCode = STDCode;
        _Extension = Extension;
    } 

}