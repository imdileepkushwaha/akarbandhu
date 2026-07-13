using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BusinessLogicTier;

/// <summary>
/// Summary description for SecureService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class SecureService : System.Web.Services.WebService {

    public SecureService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    
    [WebMethod]
    public void Login(String _UserId, String _UPassword, String _DeviceId)
    {
        PrintJson(new clsSecureService().Login(_UserId, _UPassword, _DeviceId));
    }
    [WebMethod]
    public void GetUserDetail(String _UserId, String _UPassword)
    {
        PrintJson(new clsSecureService().GetUserDetail(_UserId, _UPassword));
    }
    [WebMethod]
    public void GetUserBalance(String _UserId, String _UPassword)
    {
        PrintJson(new clsSecureService().GetUserBalance(_UserId, _UPassword));
    }
    [WebMethod]
    public void GetNews(String _UserId, String _UPassword)
    {
        PrintJson(new clsSecureService().GetNews(_UserId, _UPassword));
    }
    [WebMethod]
    public void GetDownlineCount(String _UserId, String _UPassword)
    {
        PrintJson(new clsSecureService().GetUserDownlineCount(_UserId, _UPassword));
    }
    [WebMethod]
    public void GetDownlineReport(String _UserId, String _UPassword)
    {
        PrintJson(new clsSecureService().getDownlineReport(_UserId, _UPassword));
    }
    [WebMethod]
    public void GetBankList(String _UserId)
    {
        PrintJson(new clsSecureService().GeBankList(_UserId));
    }
    [WebMethod]
    public void GetCountryList(String _UserId)
    {
        PrintJson(new clsSecureService().GeCountryList(_UserId));
    }
    [WebMethod]
    public void GetStateList(String _UserId, String _CountryId)
    {
        PrintJson(new clsSecureService().GeStateList(_UserId, _CountryId));
    }
    [WebMethod]
    public void GetCityList(String _UserId, String _StateId)
    {
        PrintJson(new clsSecureService().GeCityList(_UserId, _StateId));
    }
    [WebMethod]
    public void UpdateUserDetail(String UserId, String UPassword, String username, String mobile, String email, String gender, String address, String cityid, String stateid, String countryid, String areaname, String pincode, String dateofbirth, String mentionby, String nomineename, String nomineerelation, String accountholdername, String accountno, String ifsccode, String panno, String bankname, String branchname)
    {
        PrintJson(new clsSecureService().UpdateUserDetail(UserId, UPassword ,  username,  mobile,  email,  gender,  address,  cityid,  stateid,  countryid,  areaname,  pincode,  dateofbirth,  mentionby,  nomineename,  nomineerelation,  accountholdername,  accountno,  ifsccode,   panno,  bankname,  branchname ));
    }
    [WebMethod]
    public void UserAdd(String userid, String password, String username, String mobile, String email, String gender, String address, String cityid, String areaname, String pincode, String dateofbirth, String Newpassword, String epinno)
    {
        PrintJson(new clsSecureService().UserAdd( userid,  password,  username,  mobile,  email,  gender,  address,  cityid,  areaname,  pincode,  dateofbirth,  Newpassword,  epinno));
    }

    [WebMethod]
    public void GenerateEPin(String UserId, String UPassword, String NoOfEpin,String amount)
    {
        PrintJson(new clsSecureService().GenerateEPin(UserId, UPassword , NoOfEpin,amount));
    }
    [WebMethod]
    public void GenerateEPinOnline(String userid, String password, String TransactionId, String amount, String NoOfEpin, String EpinAmount, String Request)
    {
        PrintJson(new clsSecureService().GenerateEPinOnline( userid,  password,  TransactionId,  amount,  NoOfEpin,  EpinAmount,  Request));
    }
    [WebMethod]
    public void EPinTransfer(String UserId, String UPassword, String NoOfEpin, String TransferUserId)
    {
        PrintJson(new clsSecureService().EPinTrasnfer(UserId, UPassword, NoOfEpin, TransferUserId));
    }
    [WebMethod]
    public void getOperator(String _UserId)
    {
        PrintJson(new clsSecureService().GeOperatorList(_UserId));
    }
    [WebMethod]
    public void getNumberList(String _UserId)
    {
        PrintJson(new clsSecureService().GeNumberList(_UserId));
    }
    [WebMethod]
    public void Recharge(String UserId, String UPassword, String RechargeMobile, String RechargeAmount, String OperatorId,  String RechargeType)
    {
        PrintJson(new clsSecureService().Recharge(UserId, UPassword, RechargeMobile, RechargeAmount, OperatorId,  RechargeType));
    }
    [WebMethod]
    public void getRechargeReport(String _UserId, String UPassword, String RechargeMobile, String FromDate, String ToDate)
    {
        PrintJson(new clsSecureService().getRechargeReport(_UserId, UPassword, RechargeMobile, FromDate, ToDate));
    }
    [WebMethod]
    public void getEPinReport(String _UserId, String UPassword, String EPinStatus, String GenerateUserId, String UsedUserId, String FromDate, String ToDate)
    {
        PrintJson(new clsSecureService().getEPinReport(_UserId, UPassword,  EPinStatus,  GenerateUserId,  UsedUserId,  FromDate,  ToDate));
    }
    [WebMethod]
    public void getLevelIncomeReport(String _UserId, String UPassword,  String FromDate, String ToDate)
    {
        PrintJson(new clsSecureService().getLevelIncomeReport(_UserId, UPassword,  FromDate, ToDate));
    }
    [WebMethod]
    public void getTransactionReport(String _UserId, String UPassword, String FromDate, String ToDate)
    {
        PrintJson(new clsSecureService().getTransactionReport(_UserId, UPassword, FromDate, ToDate));
    }
    [WebMethod]
    public void getEPinForReg(String _UserId, String UPassword)
    {
        PrintJson(new clsSecureService().getEPinForReg(_UserId, UPassword));
    }
    protected void PrintJson(String jsonstr)
    {
        try
        {
            HttpContext.Current.Response.ContentType = "application/json";
            HttpContext.Current.Response.Write(jsonstr);
            HttpContext.Current.Response.End();
        }
        catch { }
    }

    [WebMethod]
    public void GetSender(String _UMobile, String _UPassword, String _SenderMobileNo)
    {
        PrintJson(new clsSecureService().GetSender(_UMobile, _UPassword, _SenderMobileNo));
    }

    [WebMethod]
    public void GetBeneficiary(String _UMobile, String _UPassword, String _SenderMobileNo)
    {

        PrintJson(new clsSecureService().GetBeneficiary(_UMobile, _UPassword, _SenderMobileNo));
    }


    [WebMethod]
    public void CreateSender(String _UMobile, String _UPassword, String _SenderMobileNo, String _SenderName)
    {

        PrintJson(new clsSecureService().CreateSender(_UMobile, _UPassword, _SenderMobileNo, _SenderName));
    }
    [WebMethod]
    public void AddBeneficiary(String _UMobile, String _UPassword, String _SenderMobileNo, String _BeneName, String _BeneMobileNo, String _BeneBankAccount, String _BeneBankCode_IFSC, int ValidateStatus, int BankId)
    {

        PrintJson(new clsSecureService().AddBeneficiary(_UMobile, _UPassword, _SenderMobileNo, _BeneName, _BeneMobileNo, _BeneBankAccount, _BeneBankCode_IFSC, ValidateStatus, BankId));
    }

    [WebMethod]
    public void VerifyBeneficiary(String _UMobile, String _UPassword, String _SenderMobileNo, String _BankAccount, String _BackCode)
    {
        PrintJson(new clsSecureService().VerifyBeneficiary(_UMobile, _UPassword, _SenderMobileNo, _BankAccount, _BackCode));
    }

    [WebMethod]
    public void DeleteBeneficiary(String _UMobile, String _UPassword, String _SenderMobileNo, String _RecipientId)
    {
        PrintJson(new clsSecureService().DeleteBeneficiary(_UMobile, _UPassword, _SenderMobileNo, _RecipientId));
    }
    [WebMethod]
    public void VerifySender(String _UMobile, String _UPassword, String _SenderMobileNo, String _OTP, String _SenderName)
    {

        PrintJson(new clsSecureService().VerifySender(_UMobile, _UPassword, _SenderMobileNo, _OTP, _SenderName));
    }
    [WebMethod]
    public void ResendOtp(String _UMobile, String _UPassword, String _SenderMobileNo)
    {

        PrintJson(new clsSecureService().ResendOtp(_UMobile, _UPassword, _SenderMobileNo));
    }
    //[WebMethod]
    //public void GetIFSC(String _UMobile, String _UPassword, String _BankId)
    //{

    //    PrintJson(new clsSecureService().GetIFSC(_UMobile, _UPassword, _BankId));
    //}

    [WebMethod]
    public void DMRTransaction(String _UMobile, String _UPassword, String _FromDate, String _ToDate, String _AccontNo)
    {

        PrintJson(new clsSecureService().DMRTransaction(_UMobile, _UPassword, _FromDate, _ToDate, _AccontNo));
    }



    [WebMethod]
    public void SendMoney(String _UMobile, String _UPassword, String _SenderMobileNo, String _BankAccount, String _Amount, String _Recipientid, String _Channel)
    {
        PrintJson(new clsSecureService().SendMoney(_UMobile, _UPassword, _SenderMobileNo, _BankAccount, _Amount, _Recipientid, _Channel));
    }

    //[WebMethod]
    //public void Refund(String _UMobile, String _UPassword, String _SenderMobileNo, String _VenderID)
    //{
    //    PrintJson(new B2BSecureService_BL().Refund(_UMobile, _UPassword, _SenderMobileNo, _VenderID));
    //}

    //[WebMethod]
    //public void VerifyRefund(String _UMobile, String _UPassword, String _SenderMobileNo, String _VenderID, String _OTP, String _TransactionID)
    //{
    //    PrintJson(new B2BSecureService_BL().VerifyRefund(_UMobile, _UPassword, _SenderMobileNo, _VenderID, _OTP, _TransactionID));
    //}
    [WebMethod]
    public void GetDownlineUserName(String _UserId, String _UPassword, String _DownlineUserId)
    {
        PrintJson(new clsSecureService().GetDownlineUserName(_UserId, _UPassword, _DownlineUserId));
    }
    [WebMethod]
    public void WalletTransfer(String UserId, String UPassword,  String amount, String TransferUserId, String Remark)
    {
        PrintJson(new clsSecureService().WalletTransferUser(UserId, UPassword, TransferUserId, amount, Remark));
    }
    [WebMethod]
    public void getWalletTransferReport(String _UserId, String UPassword, String ToUserId, String FromDate, String ToDate)
    {
        PrintJson(new clsSecureService().getWalletTransferReport(_UserId, UPassword,ToUserId, FromDate, ToDate));
    }
    [WebMethod]
    public void WalletTransferReverse(String UserId, String UPassword, String id)
    {
        PrintJson(new clsSecureService().WalletTransferReverse(UserId, UPassword, id));
    }
    [WebMethod]
    public void GetCompanyBankAccountList(String _UserId, String _UPassword)
    {
        PrintJson(new clsSecureService().GetCompanyBankAccount(_UserId, _UPassword));
    }
    [WebMethod]
    public void GetCompanyBankAccountDetail(String _UserId, String _UPassword,String id)
    {
        PrintJson(new clsSecureService().GetCompanyBankAccountDetail(_UserId, _UPassword, id));
    }
    [WebMethod]
    public void FundRequestAdd(String UserId, String UPassword, String AccountId, String paymentMode, String amount, String Transactionid, String ChequeNo, String MobileNoInBank, String Remark)
    {
        PrintJson(new clsSecureService().FundRequestAdd( UserId,  UPassword,  AccountId,  paymentMode,  amount,  Transactionid,  ChequeNo,  MobileNoInBank,  Remark));
    }
    [WebMethod]
    public void CallbackRequestAdd(String UserId, String UPassword, String MobileNo)
    {
        PrintJson(new clsSecureService().CallbackRequestAdd(UserId, UPassword, MobileNo));
    }
    [WebMethod]
    public void FundRequestReport(String _UserId, String UPassword, String ToUserId, String FromDate, String ToDate)
    {
        PrintJson(new clsSecureService().FundRequestReport(_UserId, UPassword, FromDate, ToDate));
    }
    [WebMethod]
    public void DisputeRequestAdd(String UserId, String UPassword, String ReferenceId)
    {
        PrintJson(new clsSecureService().DisputeRequestAdd(UserId, UPassword, ReferenceId));
    }
}
