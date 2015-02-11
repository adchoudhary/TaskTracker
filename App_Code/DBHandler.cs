using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBHandler
/// </summary>
public static class DBHandler
{
    public static DataTable ValidateUserPass(string UserName, string password)
    {
        return Functions.ExecuteParamerizedSelectCommand("ChkUserPass", new SqlParameter[] 
            { 
                new SqlParameter("@username", UserName) ,
                new SqlParameter("@password", password) 
            });
    }

    public static DataTable ValidateUser(string UserName)
    {
        return Functions.ExecuteParamerizedSelectCommand("ChkUser", new SqlParameter[] 
            { 
                new SqlParameter("@username", UserName)
            });
    }

    public static long AddAdhikari(Employee emp)
    {
        return Functions.ExecuteNonQuery("iEmployee", new SqlParameter[]
            {
                new SqlParameter("@name", emp.Name),
                new SqlParameter("@username", emp.UserName),
                new SqlParameter("@password", emp.Password),
                new SqlParameter("@Address", emp.EmpAddress.FullAddress),
                new SqlParameter("@phoneNo", emp.EmpAddress.EmpContact.Phone1),
                new SqlParameter("@MobileNo", emp.EmpAddress.EmpContact.Mobile)
            });
    }

    public static long UpdateAdhikari(Employee emp)
    {
        return Functions.ExecuteNonQuery("uEmployee", new SqlParameter[]
            {
                 new SqlParameter("@ID", emp.ID),
                new SqlParameter("@name", emp.Name),
                new SqlParameter("@username", emp.UserName),
                new SqlParameter("@password", emp.Password),
                new SqlParameter("@Address", emp.EmpAddress.FullAddress),
                new SqlParameter("@phoneNo", emp.EmpAddress.EmpContact.Phone1),
                new SqlParameter("@MobileNo", emp.EmpAddress.EmpContact.Mobile)
            });
    }

    public static long DeleteAdhikari(Int64 ID)
    {
        return Functions.ExecuteNonQuery("dEmployee", new SqlParameter[]
            {
                 new SqlParameter("@ID", ID)
            });
    }

    public static List<Employee> GetAdhikari()
    {
        List<Employee> empList = new List<Employee>();
        DataTable dt = Functions.ExecuteSelectCommand("gEmployee");
        if(dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                empList.Add(new Employee(dt.Rows[i]["username"].ToString(), dt.Rows[i]["password"].ToString(), dt.Rows[i]["name"].ToString(), Convert.ToInt64(dt.Rows[i]["ID"])));
                empList[empList.Count - 1].EmpAddress = new Address(dt.Rows[i]["Address"].ToString());
                empList[empList.Count - 1].EmpAddress.EmpContact = new Contact("", "");
                empList[empList.Count - 1].EmpAddress.EmpContact.Phone1 = dt.Rows[i]["phoneNo"].ToString();
                empList[empList.Count - 1].EmpAddress.EmpContact.Mobile = dt.Rows[i]["MobileNo"].ToString();
            }
        }
        return empList;
    }

    public static Employee GetAdhikariByID(Int64 ID)
    {
        Employee emp = new Employee("","");
        DataTable dt = Functions.ExecuteParamerizedSelectCommand("gEmployeeByID",new SqlParameter[]
            {
                new SqlParameter("@ID", ID)
            });

        if (dt.Rows.Count > 0)
        {
                emp = new Employee(dt.Rows[0]["username"].ToString(), dt.Rows[0]["password"].ToString(), dt.Rows[0]["name"].ToString(), Convert.ToInt64(dt.Rows[0]["ID"]));
                emp.EmpAddress = new Address(dt.Rows[0]["Address"].ToString());
                emp.EmpAddress.EmpContact = new Contact("", "");
                emp.EmpAddress.EmpContact.Phone1 = dt.Rows[0]["phoneNo"].ToString();
                emp.EmpAddress.EmpContact.Mobile = dt.Rows[0]["MobileNo"].ToString();
        }
        return emp;
    }

    public static Employee GetAdhikariByName(string strname)
    {
        Employee emp = null;
        DataTable dt = Functions.ExecuteParamerizedSelectCommand("gEmployeeByName", new SqlParameter[]
            {
                new SqlParameter("@name",strname)
            });
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["username"].ToString() == strname)
                {
                    emp = new Employee(dt.Rows[i]["username"].ToString(), dt.Rows[i]["password"].ToString(), dt.Rows[i]["name"].ToString(), Convert.ToInt64(dt.Rows[i]["ID"]));
                    emp.EmpAddress = new Address(dt.Rows[i]["Address"].ToString());
                    emp.EmpAddress.EmpContact = new Contact("", "");
                    emp.EmpAddress.EmpContact.Phone1 = dt.Rows[i]["phoneNo"].ToString();
                    emp.EmpAddress.EmpContact.Mobile = dt.Rows[i]["MobileNo"].ToString();
                    break;
                }
            }
        }
        return emp;
    }

    public static long AddProject(Project pro, Int64 empID)
    {
        return Functions.ExecuteNonQuery("iProject", new SqlParameter[]
            {
                new SqlParameter("@EmpID", empID),
                new SqlParameter("@name", pro.Name),
                new SqlParameter("@utilizationDate", pro.utilizationDate),
                new SqlParameter("@StartDate", pro.StartDate),
                new SqlParameter("@WorkOrderDate", pro.WorkOrderDate),
                new SqlParameter("@Status", Convert.ToInt16(pro.Status)),
                new SqlParameter("@Village", pro.Village),
                new SqlParameter("@Taluka", pro.Taluka),
                new SqlParameter("@SchemeName", pro.SchemeName),
                new SqlParameter("@CostEstimated", pro.CostEstimated),
                new SqlParameter("@TechnicalDate", pro.Technical.date),
                new SqlParameter("@TechnicalAmt", pro.Technical.amount),
                new SqlParameter("@AdministrativeDate", pro.Administrative.date),
                 new SqlParameter("@AdministrativeAmt", pro.Administrative.amount),
                new SqlParameter("@GrantReleaseDate", pro.GrantReleaseDate),
                new SqlParameter("@Remarks", pro.Remarks),
                 new SqlParameter("@GivenTo", pro.GivenTo.ID)
            });
    }

    public static List<Project> GetProjectByEmpID(Int64 EmpID)
    {
        List<Project> pro = new List<Project>();
        DataTable dt = Functions.ExecuteParamerizedSelectCommand("gProjectByEmp", new SqlParameter[]
            {
                new SqlParameter("@EmpID", EmpID)
            });

        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                pro.Add(new Project(dt.Rows[i]["name"].ToString(), Convert.ToInt64(dt.Rows[i]["ID"]), (Common.Status)dt.Rows[i]["Status"]));
                pro[pro.Count - 1].Administrative.amount = Convert.ToDecimal(dt.Rows[i]["AdministrativeAmt"]);
                pro[pro.Count - 1].Administrative.date = Convert.ToDateTime(dt.Rows[i]["AdministrativeDate"]);
                pro[pro.Count - 1].CostEstimated = Convert.ToDecimal(dt.Rows[i]["CostEstimated"]);
                pro[pro.Count - 1].GivenTo = GetAdhikariByID(Convert.ToInt64(dt.Rows[i]["GivenTo"]));
                pro[pro.Count - 1].Owner = GetAdhikariByID(Convert.ToInt64(dt.Rows[i]["EmpID"]));
                pro[pro.Count - 1].GrantReleaseDate = Convert.ToDateTime(dt.Rows[i]["GrantReleaseDate"]); ;
                pro[pro.Count - 1].Remarks = dt.Rows[i]["Remarks"].ToString();
                pro[pro.Count - 1].SchemeName = dt.Rows[i]["SchemeName"].ToString();
                pro[pro.Count - 1].StartDate = Convert.ToDateTime(dt.Rows[i]["StartDate"]); ;
                pro[pro.Count - 1].Taluka = dt.Rows[i]["Taluka"].ToString();
                pro[pro.Count - 1].Technical.amount = Convert.ToDecimal(dt.Rows[i]["TechnicalAmt"]);
                pro[pro.Count - 1].Technical.date = Convert.ToDateTime(dt.Rows[i]["TechnicalDate"]);
                pro[pro.Count - 1].utilizationDate = Convert.ToDateTime(dt.Rows[i]["utilizationDate"]);
                pro[pro.Count - 1].Village = dt.Rows[i]["Village"].ToString();
                pro[pro.Count - 1].WorkOrderDate = Convert.ToDateTime(dt.Rows[i]["WorkOrderDate"]);
            }
           
        }
        return pro;
    }

    public static long UpdateProject(Project pro)
    {
        return Functions.ExecuteNonQuery("uProject", new SqlParameter[]
            {
                new SqlParameter("@ID", pro.ID),
                new SqlParameter("@name", pro.Name),
                new SqlParameter("@utilizationDate", pro.utilizationDate),
                new SqlParameter("@StartDate", pro.StartDate),
                new SqlParameter("@WorkOrderDate", pro.WorkOrderDate),
                new SqlParameter("@Status", Convert.ToInt16(pro.Status)),
                new SqlParameter("@Village", pro.Village),
                new SqlParameter("@Taluka", pro.Taluka),
                new SqlParameter("@SchemeName", pro.SchemeName),
                new SqlParameter("@CostEstimated", pro.CostEstimated),
                new SqlParameter("@TechnicalDate", pro.Technical.date),
                new SqlParameter("@TechnicalAmt", pro.Technical.amount),
                new SqlParameter("@AdministrativeDate", pro.Administrative.date),
                 new SqlParameter("@AdministrativeAmt", pro.Administrative.amount),
                new SqlParameter("@GrantReleaseDate", pro.GrantReleaseDate),
                new SqlParameter("@Remarks", pro.Remarks)
                
            });
    }

    public static long CompleteProject(Project pro)
    {
        return Functions.ExecuteNonQuery("CompleteProject", new SqlParameter[]
            {
                new SqlParameter("@ID", pro.ID),
                new SqlParameter("@Status", Convert.ToInt16(pro.Status)),
                 new SqlParameter("@TotalActualExpense", pro.Actual.amount),
                new SqlParameter("@CompletedDate", pro.Actual.date),
                
            });
    }

    public static long ChangeStatus(Project pro)
    {
        return Functions.ExecuteNonQuery("ChangeStatus", new SqlParameter[]
            {
                new SqlParameter("@ID", pro.ID),
                new SqlParameter("@Status", Convert.ToInt16(pro.Status)),
               
            });
    }

    public static long DeleteProject(Int64 ID)
    {
        return Functions.ExecuteNonQuery("dProject", new SqlParameter[]
            {
                 new SqlParameter("@ID", ID)
            });
    }

    public static Project GetProjectByID(Int64 ID)
    {
        Project pro = null;
        DataTable dt = Functions.ExecuteParamerizedSelectCommand("gProjectByID", new SqlParameter[]
            {
                new SqlParameter("@ID", ID)
            });

        if (dt.Rows.Count > 0)
        {
            pro = new Project(dt.Rows[0]["name"].ToString(), Convert.ToInt64(dt.Rows[0]["ID"]), (Common.Status)dt.Rows[0]["Status"]);
            pro.Administrative.amount = Convert.ToDecimal(dt.Rows[0]["AdministrativeAmt"]);
            pro.Administrative.date = Convert.ToDateTime(dt.Rows[0]["AdministrativeDate"]);
            pro.CostEstimated = Convert.ToDecimal(dt.Rows[0]["CostEstimated"]);
            pro.GivenTo = GetAdhikariByID(Convert.ToInt64(dt.Rows[0]["GivenTo"]));
            pro.Owner = GetAdhikariByID(Convert.ToInt64(dt.Rows[0]["EmpID"]));
            pro.GrantReleaseDate = Convert.ToDateTime(dt.Rows[0]["GrantReleaseDate"]); ;
            pro.Remarks = dt.Rows[0]["Remarks"].ToString();
            pro.SchemeName = dt.Rows[0]["SchemeName"].ToString();
            pro.StartDate = Convert.ToDateTime(dt.Rows[0]["StartDate"]); ;
            pro.Taluka = dt.Rows[0]["Taluka"].ToString();
            pro.Technical.amount = Convert.ToDecimal(dt.Rows[0]["TechnicalAmt"]);
            pro.Technical.date = Convert.ToDateTime(dt.Rows[0]["TechnicalDate"]);
            pro.utilizationDate = Convert.ToDateTime(dt.Rows[0]["utilizationDate"]);
            pro.Village = dt.Rows[0]["Village"].ToString();
            pro.WorkOrderDate = Convert.ToDateTime(dt.Rows[0]["WorkOrderDate"]);
        }
        return pro;
    }
}