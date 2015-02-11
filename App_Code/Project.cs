using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Project
/// </summary>
public class Project
{
    #region Properties

    private long _ID;
    public long ID { get { return _ID; } set { _ID = value; } }

    //Kaam no sadar
    private string _Name;
    public string Name { get { return _Name; } set { _Name = value; } }

    //date of utilization
    private DateTime _utilizationDate;
    public DateTime utilizationDate { get { return _utilizationDate; } set { _utilizationDate = value; } }

         private DateTime _StartDate;
    public DateTime StartDate { get { return _StartDate; } set { _StartDate = value; } }

    private DateTime _WorkOrderDate;
    public DateTime WorkOrderDate { get { return _WorkOrderDate; } set { _WorkOrderDate = value; } }


    // actual expenditure and completed date
    private Approval _Actual;
    public Approval Actual { get { return _Actual; } set { _Actual = value; } }

    private Common.Status _Status;
    public Common.Status Status { get { return _Status; } set { _Status = value; } }
    public string GetStatus
    {
        get
        {
            if (_Status == Common.Status.Aborted) return "Rejected";
            else if (_Status == Common.Status.Completed) return "Complete";
            else if (_Status == Common.Status.Pending) return "Not Complete";
            else return "Not Started";
        }
    }

    private Task _TaskList;
    public Task TaskList { get { return _TaskList; } set { _TaskList = value; } }

    private string _Village;
    public string Village { get { return _Village; } set { _Village = value; } }

    private string _Taluka;
    public string Taluka { get { return _Taluka; } set { _Taluka = value; } }

        // Jogvari no prakar
        private string _SchemeName;
        public string SchemeName { get { return _SchemeName; } set { _SchemeName = value; } }

        private decimal _CostEstimated;
        public decimal CostEstimated { get { return _CostEstimated; } set { _CostEstimated = value; } }

        //Tantrik Manjuri ni tarik - technical section approved like engg
        private Approval _Technical;
        public Approval Technical { get { return _Technical; } set { _Technical = value; } }

        //Prathmik Manjuri ni rakam 
        private Approval _Administrative;
        public Approval Administrative { get { return _Administrative; } set { _Administrative = value; } }

        private DateTime _GrantReleaseDate;
        public DateTime GrantReleaseDate { get { return _GrantReleaseDate; } set { _GrantReleaseDate = value; } }

        private string _Remarks;
        public string Remarks { get { return _Remarks; } set { _Remarks = value; } }

        private Employee _GivenTo;
        public Employee GivenTo { get { return _GivenTo; } set { _GivenTo = value; } }
        public string GivenToName { get { return _GivenTo.Name; } }

        private Employee _Owner;
        public Employee Owner { get { return _Owner; } set { _Owner = value; } }
        public string OwnerName { get { return _Owner.Name; } }

    #endregion


    public Project(string Name, long ID = 0, Common.Status Status = Common.Status.Pending)
    {
        _ID = ID;
        _Name = Name;
        _Status = Status;
        _Technical = new Approval();
        _Administrative = new Approval();
        _Actual = new Approval();
    } 

}

public class Approval
{
    public DateTime date;
    public decimal amount;
}