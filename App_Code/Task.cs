using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Task
/// </summary>
public class Task
{
	 #region Properties

    private int _ID;
    public int ID { get { return _ID; } set { _ID = value; } }

    private string _Name;
    public string Name { get { return _Name; } set { _Name = value; } }

    private DateTime _StartDate;
    public DateTime StartDate { get { return _StartDate; } set { _StartDate = value; } }

    private DateTime _CompletedDate;
    public DateTime CompletedDate { get { return _CompletedDate; } set { _CompletedDate = value; } }

    private Common.Status _Status;
    public Common.Status Status { get { return _Status; } set { _Status = value; } }
    #endregion


    public Task(string Name, int ID = 0, Common.Status Status = Common.Status.Pending)
    {
        _ID = ID;
        _Name = Name;
        _Status = Status;
    } 
}