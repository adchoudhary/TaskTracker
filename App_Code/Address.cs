using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Address
/// </summary>
public sealed class Address
{


    #region Properties 

    private long _ID;
    public long ID { get { return _ID; } set { _ID = value; } }

   private string _Value;
   public string Value { get { return _Value; } set {_Value = value;} }

   private string _City;
   public string City { get { return _City; } set {_City = value;} }

   private string _District;
   public string District { get { return _District; } set {_District = value;} }

   private string _State;
   public string State { get { return _State; } set {_State = value;} }

   private string _Country;
   public string Country { get { return _Country; } set {_Country = value;} }

   private int _PinCode;
   public int PinCode { get { return _PinCode; } set {_PinCode = value;} }

   private Common.AddressType _Type;
   public Common.AddressType Type { get { return _Type; } set { _Type = value; } }

   private Contact _Contact;
   public Contact EmpContact { get { return _Contact; } set { _Contact = value; } }


        public string FullAddress { get {return Common.Concatenate(_Value,true) + Common.Concatenate(_District) + Common.Concatenate(_City)
        + Common.Concatenate(_State) + Common.Concatenate(_PinCode.ToString()) + Common.Concatenate(_Country);} }

    #endregion 

 
  public Address( string Value,long ID = 0, string City = "", string District = "", string State = "", string Country = "", int PinCode = 0, Common.AddressType Type = Common.AddressType.Office)
  { 
    _Value= Value;
    _City= City;
    _District= District;
    _State= State;
    _Country= Country;
    _PinCode= PinCode;
    _Type = Type;
    _ID = ID;
  } 
  } 