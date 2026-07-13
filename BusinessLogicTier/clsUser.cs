using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTier;
using System.Data;
using System.Data.SqlClient;
using ARA_StringHunt;

namespace BusinessLogicTier
{
    public class clsUser
    {
        Data ObjData = new Data();
        public string UserId { get; set; }
        public string PlanId { get; set; }
        public string SponserId { get; set; }
        public string NewSponserId { get; set; }
        public string UserName { get; set; }
        public string Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public int age { get; set; }

        public string NomineeAge { get; set; }
        public string PaytmMobileNo { get; set; }
        public string Address { get; set; }
        public string Pincode { get; set; }
        public string Password { get; set; }

        public string Teamname { get; set; }
        public string SrPresident { get; set; }
        public string MentionBy { get; set; }
        public string CountryId { get; set; }
        public string StateId { get; set; }
        public string CityName { get; set; }
        public string EpinNo { get; set; }
        public int PoolNo { get; set; }
        public string StandingPosition { get; set; }
        public string AreaName { get; set; }
        public string AdharNo { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }
        public string TransferUserId { get; set; }
        public int NoOfEpin { get; set; }
        public string ParentUserId { get; set; }
        public string NomineeName { get; set; }
        public string FatherName { get; set; }
        public string NomineeRelation { get; set; }
        public string AccHolderName { get; set; }
        public string AccNo { get; set; }
        public string BankName { get; set; }
        public string BranchName { get; set; }
        public string IFSCCode { get; set; }
        public string PanCardNo { get; set; }
        public string Regtype { get; set; }
        public string Remark { get; set; }
        public decimal Amount { get; set; }
        public string PrevPackageId { get; set; }
        public decimal AdminCharge { get; set; }
        public decimal TotalAmount { get; set; }
        public string Id { get; set; }
        public string BankAccountId { get; set; }
        public string PaymentMode { get; set; }
        public string OnlineTransactionId { get; set; }
        public string ChequeNo { get; set; }
        public string Status { get; set; }
        public string PackageId { get; set; }
        public string LandMark { get; set; }
        public string LevelNo { get; set; }
        public DataTable dtData { get; set; }
        public string WalletType { get; set; }
        public string ImageName { get; set; }
        public string ltimage {get; set;}
        public decimal TransferAmount { get; set; }
        public DateTime PaymentDate { get; set; }
        public string PanCardImage { get; set; }
        public string AadharCardNo { get; set; }
        public string AadharCardImage { get; set; }
        public string AadharCardImage2 { get; set; }
        public string PanCardStatus { get; set; }
        public string AadharCardStatus { get; set; }
        public string BankProofName { get; set; }
        public string BankProofImage { get; set; }
        public string BankProofStatus { get; set; }
        public DataTable getUserReport(clsUser objUser)
        {
            string str_query = "SELECT ud.sponserid, ud.userid, ud.username,ud.Mobile,ud.Email,ud.Gender,ud.Address,ud.CityName,ud.MentionDate,ld.password,isnull(ud.balanceamount,0) as balanceamount,case when ud.activestatus ='1' then 'Active' else 'Deactive'  end as activestatus FROM userdetail ud with (nolock) left join Logindetail ld  with (nolock)  on ud.userid=ld.username and ld.role='user' where 1=1 ";


            if (objUser.FromDate != DateTime.MinValue && objUser.ToDate != DateTime.MinValue)
            {
                str_query += "  and ud.MentionDate  >= '" + objUser.FromDate + "'   and ud.MentionDate   <= '" + objUser.ToDate + "' ";
            }
            if (objUser.UserName != "")
            {
                str_query += "  and ud.username = '" + objUser.UserName + "' ";
            }
            if (objUser.UserId != "")
            {
                str_query += "  and ud.UserId = '" + objUser.UserId + "' ";
            }
            if (objUser.Mobile != "")
            {
                str_query += "  and ud.mobile = '" + objUser.Mobile + "' ";
            }
            if (objUser.Email != "")
            {
                str_query += "  and ud.email = '" + objUser.Email + "' ";
            }
            if (objUser.CityName != "")
            {
                str_query += "  and ud.CityName = '" + objUser.CityName + "' ";
            }

            str_query += " order by ud.username  desc";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getAssociateReport(clsUser objUser)
        {
            string str_query = "SELECT ud.sponserid, ud.Associateid, ud.Associatename,ud.Mobile,ud.Email,ud.Gender,ud.Address,ud.CityName,ud.MentionDate,ld.password,isnull(ud.balanceamount,0) as balanceamount,case when ud.joiningstatus ='1' then 'Active' else 'Deactive'  end as activestatus,ud.levelno FROM Associatedetail ud with (nolock) left join Logindetail ld  with (nolock)  on ud.Associateid=ld.username and ld.role='Associate' where 1=1 ";


            if (objUser.FromDate != DateTime.MinValue && objUser.ToDate != DateTime.MinValue)
            {
                str_query += "  and ud.MentionDate  >= '" + objUser.FromDate + "'   and ud.MentionDate   <= '" + objUser.ToDate + "' ";
            }
            if (objUser.UserName != "")
            {
                str_query += "  and ud.Associatename = '" + objUser.UserName + "' ";
            }
            if (objUser.UserId != "")
            {
                str_query += "  and ud.AssociateId = '" + objUser.UserId + "' ";
            }
            if (objUser.Mobile != "")
            {
                str_query += "  and ud.mobile = '" + objUser.Mobile + "' ";
            }
            if (objUser.Email != "")
            {
                str_query += "  and ud.email = '" + objUser.Email + "' ";
            }
            if (objUser.CityName != "")
            {
                str_query += "  and ud.CityName = '" + objUser.CityName + "' ";
            }

            str_query += " order by ud.Associatename  desc";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable getUserReportSubadmin(clsUser objUser)
        {
            string str_query = "SELECT case when  ud.sponserid='INDIA01' then '*******' else ud.sponserid end as sponserid , ud.userid, ud.username,ud.Mobile,ud.Email,ud.Gender,ud.Address,ud.CityName,ud.MentionDate,ld.password,isnull(ud.balanceamount,0) as balanceamount,case when ud.activestatus ='1' then 'Active' else 'Deactive'  end as activestatus FROM userdetail ud with (nolock) left join Logindetail ld  with (nolock)  on ud.userid=ld.username where 1=1 and ud.userid!='INDIA01' ";


            if (objUser.FromDate != DateTime.MinValue && objUser.ToDate != DateTime.MinValue)
            {
                str_query += "  and ud.MentionDate  >= '" + objUser.FromDate + "'   and ud.MentionDate   <= '" + objUser.ToDate + "' ";
            }
            if (objUser.UserName != "")
            {
                str_query += "  and ud.username = '" + objUser.UserName + "' ";
            }
            if (objUser.UserId != "")
            {
                str_query += "  and ud.UserId = '" + objUser.UserId + "' ";
            }
            if (objUser.Mobile != "")
            {
                str_query += "  and ud.mobile = '" + objUser.Mobile + "' ";
            }
            if (objUser.Email != "")
            {
                str_query += "  and ud.email = '" + objUser.Email + "' ";
            }
            if (objUser.CityName != "")
            {
                str_query += "  and ud.CityName = '" + objUser.CityName + "' ";
            }

            str_query += " order by ud.MentionDate  desc";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getUserTopupReport(clsUser objUser)
        {
            string str_query = "SELECT up.*,ud.UserName,ud.Email,ud.Mobile,pm.PlanName,pm.Amount,pm.ROIAmount FROM UserTopupDetail up WITH (nolock) LEFT JOIN userdetail ud WITH (nolock) ON up.UserId=ud.UserId LEFT JOIN epinmaster em WITH (nolock) ON em.EPinNo=up.EPinNo LEFT JOIN planmaster pm WITH (nolock) ON em.PlanId=pm.PlanId where 1=1 ";


            if (objUser.FromDate != DateTime.MinValue && objUser.ToDate != DateTime.MinValue)
            {
                str_query += "  and up.MentionDate  >= '" + objUser.FromDate + "'   and up.MentionDate   <= '" + objUser.ToDate + "' ";
            }
            if (objUser.UserName != "")
            {
                str_query += "  and ud.username = '" + objUser.UserName + "' ";
            }
            if (objUser.MentionBy != "")
            {
                str_query += "  and up.mentionby = '" + objUser.MentionBy + "' ";
            }
            if (objUser.UserId != "")
            {
                str_query += "  and up.UserId = '" + objUser.UserId + "' ";
            }
            if (objUser.Mobile != "")
            {
                str_query += "  and ud.mobile = '" + objUser.Mobile + "' ";
            }
            if (objUser.Email != "")
            {
                str_query += "  and ud.email = '" + objUser.Email + "' ";
            }
           

            str_query += " order by up.MentionDate  desc";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getUserCurrentPool(clsUser objUser)
        {
            string str_query = @"; WITH MyCTE
AS ( SELECT id,userid,username,   parentuserid,0 AS userlevel
FROM userdetail with (nolock) 
WHERE UserId ='"+objUser.UserId+@"'
UNION ALL
SELECT UserDetail.id,userdetail.userid,userdetail.username,  userdetail.parentuserid ,MyCTE.userlevel+1 
FROM userdetail with (nolock) 
INNER JOIN MyCTE ON userdetail.parentuserid = MyCTE.userid
WHERE userdetail.userid !='" + objUser.UserId + @"' )


SELECT TOP 1 p1.*,(SELECT count(MyCTE.id) FROM MyCTE   WHERE mycte.userid!='" + objUser.UserId + @"') as totalusers
,isnull( (SELECT sum(p2.totaljoining ) FROM PoolLevelMaster p2 WHERE (p2.LevelNo)<=p1.LevelNo+1 ),0)  AS totalcountnewlevel
,isnull((SELECT sum(p2.totaljoining ) FROM PoolLevelMaster p2 WHERE (p2.LevelNo)<=p1.LevelNo ),0)  AS totalcountcurrentlevel
FROM PoolLevelMaster p1 WHERE p1.TotalJoining<=
(SELECT count(MyCTE.id) FROM MyCTE   WHERE mycte.userid!='" + objUser.UserId + @"')
 ORDER BY p1.TotalJoining desc 
 option ( MaxRecursion 0 );";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable getDashboardAdmin()
        {
            string str_query = @"select count(userid) as totaluser,(select count(plotid) from plotdetail with (nolock)) as totalplot,(SELECT count(bd.id) FROM bookingdetail bd WITH (nolock) LEFT JOIN plandetail pd WITH (nolock) ON bd.PlanId=pd.PlanId WHERE pd.PlanType='IP') as totalipbooking,(SELECT count(bd.id) FROM bookingdetail bd WITH (nolock) LEFT JOIN plandetail pd WITH (nolock) ON bd.PlanId=pd.PlanId WHERE pd.PlanType='FP') as totalfpbooking from userdetail with (nolock) ";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getDashboardSubadmin()
        {
            string str_query = @"SELECT count(id) AS totaluser
,(SELECT count (id) FROM UserDetail WHERE datepart(mm,mentiondate)=datepart(mm,getdate()) and  userid!='INDIA01'  )  AS MonthUser
,(SELECT count (id) FROM UserDetail WHERE 
mentiondate >= dateadd(day, 1-datepart(dw, getdate()), CONVERT(date,getdate()) ) 
AND mentiondate <  dateadd(day, 8-datepart(dw, getdate()), CONVERT(date,getdate()))

 )  AS WeekUser
,(SELECT count (id) FROM UserDetail WHERE convert(DATE, mentiondate)=convert(DATE, getdate()))  AS Todayuser
FROM UserDetail where userid!='INDIA01' ";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getFundRequestReport(clsUser objUser)
        {
            string str_query = "SELECT fd.*,ud.UserName,cs.AccountNo+'('+cs.bankname+')' as accno2 FROM FundRequestDetail fd LEFT JOIN userdetail ud with (nolock) ON fd.UserId=ud.UserId left join CompanyAccountDetail cs on fd.bankaccountid=cs.id where 1=1 ";
            if (objUser.FromDate != DateTime.MinValue && objUser.ToDate != DateTime.MinValue)
            {
                str_query += "  and fd.MentionDate  >= '" + objUser.FromDate + "'   and fd.MentionDate   <= '" + objUser.ToDate + "' ";
            }

            if (objUser.UserId != "")
            {
                str_query += "  and fd.UserId = '" + objUser.UserId + "' ";
            }

            str_query += " order by fd.MentionDate  desc";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getCallbackReport(clsUser objuser)
        {
            string str_query = "SELECT cd.*,ud.UserName FROM CallbackRequestDetail cd LEFT JOIN userdetail ud with (nolock)  ON cd.UserId=ud.UserId where 1=1  ";
            if (objuser.FromDate != DateTime.MinValue && objuser.ToDate != DateTime.MinValue)
            {
                str_query += "  and cd.mentiondate  >= '" + objuser.FromDate + "'   and cd.mentiondate   <= '" + objuser.ToDate + "' ";
            }
            if (objuser.UserId != "")
            {
                str_query += "  and cd.UserId = '" + objuser.UserId + "' ";
            }
            str_query += " order by cd.mentiondate  desc";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getUserNameForUpgrade(clsUser objUser)
        {
            string str_query = "SELECT ut.*,ud.Username,pm.packagename+'('+convert(NVARCHAR,pm.minpv)+'-'+convert(NVARCHAR,pm.maxpv)+')' AS packagename2 FROM UserTopupDetail ut with (nolock)  LEFT JOIN userdetail ud with (nolock) ON ut.UserId=ud.UserId LEFT JOIN packagemaster pm ON ut.PackageId=pm.PackageId where ut.UserId = '" + objUser.UserId + "' ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getAssociateLedger(clsUser objbooking)
        {
            //  string str_query = "SELECT convert(DATEtime, convert(nvarchar, ac.Paymentdate,111)+' '+convert(nvarchar, ac.mentiondate,108)), ac.*,isnull(ac.recovery,0) as recovery2, (SELECT ((sum(ac2.Payout)-sum(ac2.Payment))-sum(ac2.Advance))-sum(isnull(ac2.recovery,0)) FROM associateledger ac2 WITH (nolock) WHERE ac2.AssociateId=ac.AssociateId AND ac2.id<=ac.id AND convert(DATEtime, convert(nvarchar, ac2.Paymentdate,111)+' '+convert(nvarchar, ac2.mentiondate,108))<=convert(DATEtime, convert(nvarchar, ac.Paymentdate,111)+' '+convert(nvarchar, ac.mentiondate,108)) ) AS balance,ad.AssociateName FROM associateledger ac WITH (nolock) LEFT JOIN associatedetail ad WITH (nolock) ON ac.AssociateId=ad.AssociateId where ac.associateid='"+objbooking.AssociateId+"'   ORDER BY convert(DATEtime, convert(nvarchar, ac.Paymentdate,111)+' '+convert(nvarchar, ac.mentiondate,108))";
            string str_query = "SELECT  ac2.* FROM associateledger ac2 WITH (nolock) WHERE  ac2.associateid='" + objbooking.UserId + "'   ORDER BY ac2.paymentdate";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable getCallbackReportSUbadmin(clsUser objuser)
        {
            string str_query = "SELECT cd.*,ud.UserName FROM CallbackRequestDetail cd LEFT JOIN userdetail ud with (nolock)  ON cd.UserId=ud.UserId where 1=1 and cd.userid!='INDIA01' ";
            if (objuser.FromDate != DateTime.MinValue && objuser.ToDate != DateTime.MinValue)
            {
                str_query += "  and cd.mentiondate  >= '" + objuser.FromDate + "'   and cd.mentiondate   <= '" + objuser.ToDate + "' ";
            }
            if (objuser.UserId != "")
            {
                str_query += "  and cd.UserId = '" + objuser.UserId + "' ";
            }
            str_query += " order by cd.mentiondate  desc";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getUserName(clsUser objUser)
        {
            string str_query = "SELECT isnull(em.Amount,0) AS amount,em.PlanId, ud.SponserId,ud2.associatename AS sponsername, ud.userid, ud.username,ud.mobile,isnull(ud.imagename,'default.png') as imagename,ud.email FROM userdetail ud with (nolock) LEFT JOIN associatedetail ud2 WITH(nolock) ON ud.SponserId=ud2.associateid LEFT JOIN usertopupdetail ut WITH (nolock) ON ut.UserId=ud.UserId LEFT JOIN epinmaster em WITH (nolock) ON ut.EPinNo=em.EPinNo   where ud.UserId = '" + objUser.UserId + "' ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable getIncome(clsUser objUser)
        {
            string str_query = " SELECT levelname FROM LevelMaster WHERE LevelNo= '" + objUser.CountryId + "' ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getAssociateName(clsUser objUser)
        {
            string str_query = "SELECT  ud.SponserId,ud2.AssociateName AS sponsername, ud.Associateid, ud.Associatename,ud.mobile,isnull(ud.imagename,'default.png') as imagename,ud.email FROM Associatedetail ud with (nolock) LEFT JOIN Associatedetail ud2 WITH(nolock) ON ud.SponserId=ud2.AssociateId   where ud.AssociateId = '" + objUser.UserId + "' ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable getLevelByadmin(clsUser objUser)
        {
            string str_query = "SELECT LevelNo,Income   FROM levelmaster  ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable getLevelBySponser(clsUser objUser)
        {
            string str_query = "SELECT LevelNo,Income   FROM levelmaster WITH (nolock) WHERE LevelNo<=(SELECT LevelNo FROM associatedetail WITH (nolock) WHERE AssociateId='" + objUser.UserId + "')  ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable getUserNameDownline(clsUser objUser)
        {
            string str_query = "SELECT ud.SponserId,ud2.UserName AS sponsername, ud.userid, ud.username,ud.mobile,isnull(ud.imagename,'default.png') as imagename FROM userdetail ud with (nolock) LEFT JOIN userdetail ud2 WITH(nolock) ON ud.SponserId=ud2.UserId   where ud.UserId = '" + objUser.UserId + "' ";

            str_query = @"; WITH MyCTE
AS ( SELECT id,userid,username,   sponserid,0 AS userlevel
FROM userdetail with (nolock) 
WHERE UserId ='" + objUser.UserId + @"'
UNION ALL
SELECT UserDetail.id,userdetail.userid,userdetail.username,  userdetail.sponserid ,MyCTE.userlevel+1 
FROM userdetail with (nolock) 
INNER JOIN MyCTE ON userdetail.sponserid = MyCTE.userid
WHERE userdetail.userid !='" + objUser.UserId + @"' )
SELECT ud.SponserId,ud2.UserName AS sponsername, ud.userid, ud.username,ud.mobile,isnull(ud.imagename,'default.png') as imagename FROM userdetail ud with (nolock) LEFT JOIN userdetail ud2 WITH(nolock) ON ud.SponserId=ud2.UserId   where ud.UserId = '" + objUser.UserId + @"' and ud.userid in (select userid from mycte) 
option (maxrecursion 0)";
            
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getUserNameForTopup(clsUser objUser)
        {
            string str_query = "SELECT  ud.userid, ud.username,ud.mobile,ud.planid FROM userdetail ud with (nolock) where ud.UserId = '" + objUser.UserId + "' and ud.activestatus='0' ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getUserNameSubadmin(clsUser objUser)
        {
            string str_query = "SELECT ud.SponserId,ud2.UserName AS sponsername, ud.userid, ud.username,ud.mobile,isnull(ud.imagename,'default.png') as imagename FROM userdetail ud with (nolock) LEFT JOIN userdetail ud2 WITH(nolock) ON ud.SponserId=ud2.UserId   where ud.UserId = '" + objUser.UserId + "' and ud.Userid!='INDIA01' ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
   
        public DataTable getTeamTopupCount(clsUser objUser)
        {
            string str_query = "SELECT count(id) as total FROM UserTopupDetail  with (nolock)  WHERE UserId IN (SELECT userid FROM UserDetail  with (nolock)  WHERE SponserId='" + objUser.UserId + "')";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
   
        public DataTable getWalletTransferUserName(clsUser objUser)
        {
            string str_query = "";

            str_query = @"; WITH MyCTE
AS ( SELECT id,userid,username,   ParentUserId,0 AS userlevel
FROM userdetail with (nolock) 
WHERE UserId ='" + objUser.UserId + @"'
UNION ALL
SELECT UserDetail.id,userdetail.userid,userdetail.username,  userdetail.ParentUserId ,MyCTE.userlevel+1 
FROM userdetail with (nolock) 
INNER JOIN MyCTE ON userdetail.parentuserid = MyCTE.userid
WHERE userdetail.userid !='" + objUser.UserId + @"' )
SELECT MyCTE.*
FROM MyCTE where mycte.userid='" + objUser.TransferUserId + "' ";



            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getUserNameWithBalance(clsUser objUser)
        {
            string str_query = "SELECT ud.userid, ud.username,ud.mobile,(select isnull(sum(td.cramount),0)-isnull(sum(td.dramount),0) from transactiondetail td with (nolock)  where td.userid=ud.userid) AS balance FROM userdetail ud with (nolock)  where ud.UserId = '" + objUser.UserId + "' ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }



        public DataTable getTOtalDirect(clsUser objUser)
        {
            string str_query = "";
            str_query = @"select count(ud3.id) as totaluser from userdetail ud3  with (nolock)  where ud3.sponserid='" + objUser.UserId + @"' ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getTotalusers()
        {
            string str_query = "";
            str_query = @"select count(ud3.id) as totaluser from userdetail ud3  with (nolock)   ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataSet get_DashboardUser(clsUser objuser)
        {
            string s2 = "";
            DataSet ds = new DataSet();
            ObjData.StartConnection();
            try
            {
                s2 = "sp_getUserDashboard";
                SqlParameter[] parameter = { 
                                               new SqlParameter("@userid",objuser.UserId), 
                };
                ds = ObjData.RunDataSetProcedure(s2, parameter);
            }
            catch (Exception ex)
            {

            }
            finally
            {
                ObjData.EndConnection();

            }
            return ds;
        }
        public DataTable get_UserBinaryData(clsUser objuser)
        {
            string s2 = "";
            DataTable dt = new DataTable();
            ObjData.StartConnection();
            try
            {
                s2 = "getuserBinary";
                SqlParameter[] parameter = { 
                                               new SqlParameter("@userid",objuser.UserId)
                };
                dt = ObjData.RunDataTableProcedure(s2, parameter);
            }
            catch (Exception ex)
            {

            }
            finally
            {
                ObjData.EndConnection();

            }
            return dt;
        }
        public DataTable getAssociateKYCDetails(clsUser objUser)
        {
            string str_query = "SELECT uk.*,ud.associatename from AssociateKYCDetail uk left join Associatedetail ud with (nolock) on uk.userid=ud.associateid   where uk.UserId = '" + objUser.UserId + "' ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable get_AssociateBinaryData(clsUser objuser)
        {
            string s2 = "";
            DataTable dt = new DataTable();
            ObjData.StartConnection();
            try
            {
                s2 = "getAssociateBinary";
                SqlParameter[] parameter = {
                                               new SqlParameter("@associateid",objuser.UserId)
                };
                dt = ObjData.RunDataTableProcedure(s2, parameter);
            }
            catch (Exception ex)
            {

            }
            finally
            {
                ObjData.EndConnection();

            }
            return dt;
        }
        public DataTable getUserDownline(clsUser objUser)
        {
            string str_query = "";
            str_query = @"; WITH MyCTE
AS ( SELECT id,userid,username,   parentuserid,0 AS userlevel,standingposition
FROM userdetail with (nolock) 
WHERE UserId ='" + objUser.UserId + @"'
UNION ALL
SELECT UserDetail.id,userdetail.userid,userdetail.username,  userdetail.parentuserid ,MyCTE.userlevel+1 ,userdetail.standingposition
FROM userdetail with (nolock) 
INNER JOIN MyCTE ON userdetail.parentuserid = MyCTE.userid
WHERE userdetail.userid !='" + objUser.UserId + @"' )
SELECT MyCTE.*,ud.username as parentname
,
ut.MentionDate AS topupdate
FROM MyCTE left join userdetail ud with (nolock)  on mycte.parentuserid=ud.userid
LEFT JOIN usertopupdetail ut WITH (nolock) ON ud.UserId=ut.UserId
 where mycte.userid!='" + objUser.UserId + @"' order by mycte.username
option (maxrecursion 0)";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getAssociateDownline(clsUser objUser)
        {
            string str_query = "";
            str_query = @"; WITH MyCTE
AS ( SELECT id,Associateid,Associatename,   parentAssociateid,0 AS Associatelevel,standingposition,levelno
FROM Associatedetail with (nolock) 
WHERE AssociateId ='" + objUser.UserId + @"'
UNION ALL
SELECT AssociateDetail.id,Associatedetail.Associateid,Associatedetail.Associatename,  Associatedetail.parentAssociateid ,MyCTE.Associatelevel+1 ,Associatedetail.standingposition,associatedetail.levelno
FROM Associatedetail with (nolock) 
INNER JOIN MyCTE ON Associatedetail.parentAssociateid = MyCTE.Associateid
WHERE Associatedetail.Associateid !='" + objUser.UserId + @"' )
SELECT MyCTE.*,ud.Associatename as parentname
FROM MyCTE left join Associatedetail ud with (nolock)  on mycte.parentAssociateid=ud.Associateid
 where mycte.Associateid!='" + objUser.UserId + @"' order by mycte.Associatelevel, mycte.Associatename
option (maxrecursion 0)";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getAssociateBusinessReport(clsUser objassociate)
        {

            string str_associatequery = "";
            if (objassociate.StandingPosition == "Left")
            {
                str_associatequery = @"declare @associateid nvarchar(100);set @associateid=(select associateid from associatedetail with (nolock) where parentassociateid='" + objassociate.UserId + "' and standingposition='Left')";
            }
            else if (objassociate.StandingPosition == "Right")
            {
                str_associatequery = @"declare @associateid nvarchar(100);set @associateid=(select associateid from associatedetail with (nolock) where parentassociateid='" + objassociate.UserId + "' and standingposition='Right')";
            }
            else
            {
                str_associatequery = @"declare @associateid nvarchar(100);set @associateid='" + objassociate.UserId + "'";
            }

            string str_query = "";
            str_query = str_associatequery + @"; WITH MyCTE
AS ( SELECT id,associateid, parentassociateid,0 AS associatelevel,standingposition
FROM associatedetail with (nolock) 
WHERE associateId =@associateid
UNION ALL
SELECT associateDetail.id,associatedetail.associateid,  associatedetail.parentassociateid ,MyCTE.associatelevel+1 ,associatedetail.standingposition
FROM associatedetail with (nolock) 
INNER JOIN MyCTE ON associatedetail.parentassociateid = MyCTE.associateid
WHERE associatedetail.associateid !=@associateid )
SELECT pd.InstAmt,pd.AccountNo,pd.PaymentDate,pd.PaymentMode,bd.SponserId,bd.UserId,ad.AssociateName,ud.UserName from
  paymentdetail pd LEFT JOIN bookingdetail bd WITH (nolock) ON pd.AccountNo=bd.AccountNo 
  LEFT JOIN associatedetail ad WITH (nolock) ON ad.AssociateId=bd.SponserId
  LEFT JOIN userdetail ud WITH (nolock) ON ud.UserId=bd.UserId
   WHERE bd.SponserId IN (SELECT associateid FROM mycte)";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getUserDownlineSubadmin(clsUser objUser)
        {
            string str_query = "";
            str_query = @"; WITH MyCTE
AS ( SELECT id,userid,username,   sponserid,0 AS userlevel
FROM userdetail with (nolock) 
WHERE UserId ='" + objUser.UserId + @"'
UNION ALL
SELECT UserDetail.id,userdetail.userid,userdetail.username,  userdetail.sponserid ,MyCTE.userlevel+1 
FROM userdetail with (nolock) 
INNER JOIN MyCTE ON userdetail.sponserid = MyCTE.userid
WHERE userdetail.userid !='" + objUser.UserId + @"' )
SELECT MyCTE.*,ud.username as parentname

FROM MyCTE left join userdetail ud with (nolock)  on mycte.sponserid=ud.userid where mycte.userid!='" + objUser.UserId + @"' and mycte.userid!='INDIA01' order by mycte.userlevel
option (maxrecursion 0)";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getDirectDownline(clsUser objUser)
        {
            string str_query = "";
            str_query = "SELECT ud.* FROM UserDetail ud  WHERE ud.sponserid='" + objUser.UserId + "' ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getSingleLegDownlineCount(clsUser objUser)
        {
            string str_query = "";
            str_query = @"; WITH MyCTE
AS ( SELECT id,userid,username,   ParentUserId,1 AS userlevel
FROM userdetail with (nolock)
WHERE UserId ='"+objUser.UserId+ @"'
UNION ALL
SELECT UserDetail.id,userdetail.userid,userdetail.username,  userdetail.ParentUserId ,MyCTE.userlevel+1 
FROM userdetail  with (nolock)
INNER JOIN MyCTE ON userdetail.parentuserid = MyCTE.userid
WHERE userdetail.userid !='" + objUser.UserId + @"' )
SELECT  count(id)
FROM MyCTE WHERE userid!='" + objUser.UserId + @"'
option (maxrecursion 0)";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable FillSubNode(clsUser objuser)
        {
            DataTable dt = new DataTable();
            ObjData.StartConnection();
            try
            {
                string qry = "SELECT ad.associateid,ad.associatename,(select count(associateid) from associatedetail with (nolock)  where sponserid=ad.associateid) as Subnode FROM associatedetail ad with (nolock)  where ad.sponserid='" + objuser.UserId + "'   and ad.sponserid !=ad.associateid ";
                dt = ObjData.RunDataTable(qry);
            }
            catch (Exception v)
            {
                dt = null;
            }
            finally
            {
                ObjData.EndConnection();
            }
            return dt;
        }
        public DataSet Find_UserDetail2(clsUser objuser)
        {

            string s = "";
            string s1 = "";
            DataSet ds = null;
            ObjData.StartConnection();

            try
            {
                s1 = "SELECT ad.userid,ad.UserName,(select count(userid) from userdetail  with (nolock) where sponserid=ad.userid) as Subnode FROM userdetail ad  with (nolock)  where ad.userid='" + objuser.UserId + "'";
                ds = ObjData.RunSelectQuery(s1);
            }
            catch (Exception ex)
            {
                ds = null;
            }
            ObjData.EndConnection();
            return ds;
        }
        public DataSet Find_AssociateDetail2(clsUser objuser)
        {

            string s = "";
            string s1 = "";
            DataSet ds = null;
            ObjData.StartConnection();

            try
            {
                s1 = "SELECT ad.Associateid,ad.AssociateName,(select count(Associateid) from Associatedetail  with (nolock) where sponserid=ad.Associateid) as Subnode FROM Associatedetail ad  with (nolock)  where ad.Associateid='" + objuser.UserId + "'";
                ds = ObjData.RunSelectQuery(s1);
            }
            catch (Exception ex)
            {
                ds = null;
            }
            ObjData.EndConnection();
            return ds;
        }
        public DataTable getLoginReport(clsUser objUser)
        {
            string str_query = "SELECT ud.userid, ud.username,ud.Mobile,ud.Email,ud.Gender,ud.Address,ud.CityName,ud.MentionDate,ld.password,ld.status, case when ld.status='1' then 'Active' else 'Deactive' end as loginstatus FROM userdetail ud with (nolock)  left join Logindetail ld  with (nolock)  on ud.userid=ld.username and ld.role='User' where 1=1 ";


            if (objUser.FromDate != DateTime.MinValue && objUser.ToDate != DateTime.MinValue)
            {
                str_query += "  and ud.MentionDate  >= '" + objUser.FromDate + "'   and ud.MentionDate   <= '" + objUser.ToDate + "' ";
            }
            if (objUser.UserName != "")
            {
                str_query += "  and ud.username = '" + objUser.UserName + "' ";
            }
            if (objUser.UserId != "")
            {
                str_query += "  and ud.UserId = '" + objUser.UserId + "' ";
            }
            if (objUser.Mobile != "")
            {
                str_query += "  and ud.mobile = '" + objUser.Mobile + "' ";
            }
            str_query += " order by ud.username  desc";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable getAssociateLoginReport(clsUser objAssociate)
        {
            string str_query = "SELECT ud.Associateid, ud.AssociateName,ud.Mobile,ud.Email,ud.Gender,ud.Address,ud.CityName,ud.MentionDate,ld.password,ld.status, case when ld.status='1' then 'Active' else 'Deactive' end as loginstatus FROM Associatedetail ud with (nolock)  left join Logindetail ld  with (nolock)  on ud.Associateid=ld.Username and ld.role='Associate' where 1=1  ";


            if (objAssociate.FromDate != DateTime.MinValue && objAssociate.ToDate != DateTime.MinValue)
            {
                str_query += "  and ud.MentionDate  >= '" + objAssociate.FromDate + "'   and ud.MentionDate   <= '" + objAssociate.ToDate + "' ";
            }
            if (objAssociate.UserName != "")
            {
                str_query += "  and ud.Associatename = '" + objAssociate.UserName + "' ";
            }
            if (objAssociate.UserId != "")
            {
                str_query += "  and ud.AssociateId = '" + objAssociate.UserId + "' ";
            }
            if (objAssociate.Mobile != "")
            {
                str_query += "  and ud.mobile = '" + objAssociate.Mobile + "' ";
            }
            str_query += " order by ud.Associatename  desc";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable getLoginReportSubadmin(clsUser objUser)
        {
            string str_query = "SELECT ud.userid, ud.username,ud.Mobile,ud.Email,ud.Gender,ud.Address,ud.CityName,ud.MentionDate,ld.password,ld.status, case when ld.status='1' then 'Active' else 'Deactive' end as loginstatus FROM userdetail ud with (nolock)  left join Logindetail ld  with (nolock)  on ud.userid=ld.username where 1=1 and ud.userid!='INDIA01' ";


            if (objUser.FromDate != DateTime.MinValue && objUser.ToDate != DateTime.MinValue)
            {
                str_query += "  and ud.MentionDate  >= '" + objUser.FromDate + "'   and ud.MentionDate   <= '" + objUser.ToDate + "' ";
            }
            if (objUser.UserName != "")
            {
                str_query += "  and ud.username = '" + objUser.UserName + "' ";
            }
            if (objUser.UserId != "")
            {
                str_query += "  and ud.UserId = '" + objUser.UserId + "' ";
            }
            if (objUser.Mobile != "")
            {
                str_query += "  and ud.mobile = '" + objUser.Mobile + "' ";
            }
            str_query += " order by ud.MentionDate  desc";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getUserDetail(clsUser objUser)
        {
            string str_query = "SELECT ud.*,isnull(ud.imagename,'default.png') as imagename2,isnull( ud.stateid,0) as stateid,isnull( sm.countryid,0) as countryid FROM userdetail ud with (nolock)   left join statemaster sm with (nolock)  on ud.stateid=sm.stateid where ud.UserId = '" + objUser.UserId + "' ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getAssociateDetail(clsUser objuser)
        {
            string str_query = "SELECT ud.*,isnull(ud.imagename,'default.png') as imagename2,isnull( ud.stateid,0) as stateid,isnull( sm.countryid,0) as countryid FROM Associatedetail ud with (nolock)   left join statemaster sm with (nolock)  on ud.stateid=sm.stateid where ud.AssociateId = '" + objuser.UserId + "' ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable getUserChild(clsUser objUser)
        {
            string str_query = "SELECT isnull(em.Amount,0) AS amount,em.PlanId, ud.SponserId,ud2.UserName AS sponsername, ud.userid, ud.username,ud.mobile,isnull(ud.imagename,'default.png') as imagename FROM userdetail ud with (nolock) LEFT JOIN userdetail ud2 WITH(nolock) ON ud.SponserId=ud2.UserId LEFT JOIN usertopupdetail ut WITH (nolock) ON ut.UserId=ud.UserId LEFT JOIN epinmaster em WITH (nolock) ON ut.EPinNo=em.EPinNo     where isnull(ud.parentuserid,'-1')='" + objUser.ParentUserId + "'  and ud.StandingPosition='" + objUser.StandingPosition + "' ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getAssociateChild(clsUser objUser)
        {
            string str_query = "SELECT  ud.SponserId,ud2.AssociateName AS sponsername, ud.Associateid, ud.Associatename,ud.mobile,isnull(ud.imagename,'default.png') as imagename FROM Associatedetail ud with (nolock) LEFT JOIN Associatedetail ud2 WITH(nolock) ON ud.SponserId=ud2.AssociateId   where isnull(ud.parentAssociateid,'-1')='" + objUser.ParentUserId + "'  and ud.StandingPosition='" + objUser.StandingPosition + "' ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable getRightDataPlanWise2(clsUser objUser)
        {
            string str_query = "";

            str_query = @"DECLARE @child NVARCHAR(100)

SELECT @child=userid FROM UserDetail with (nolock)  WHERE ParentUserId='" + objUser.UserId + @"' AND StandingPosition='Right'
; WITH MyCTE
AS ( SELECT id,userid,username,  StandingPosition, ParentUserId,1 AS userlevel,StandingPosition,regdate
FROM userdetail with (nolock) 
WHERE UserId =@child
UNION ALL
SELECT UserDetail.id,userdetail.userid, UserDetail.username,UserDetail.StandingPosition, userdetail.ParentUserId ,MyCTE.userlevel+1 ,userdetail.StandingPosition,userdetail.regdate
FROM userdetail with (nolock) 
INNER JOIN MyCTE ON userdetail.parentuserid = MyCTE.userid
WHERE userdetail.userid !=@child )
 
 SELECT count(id) AS totaluser
 
FROM MyCTE  
option (maxrecursion 0)
";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getLeftDataPlanWise2(clsUser objUser)
        {

            string str_query = "";
            str_query = @"DECLARE @child NVARCHAR(100)

SELECT @child=userid FROM UserDetail WHERE ParentUserId='" + objUser.UserId + @"' AND StandingPosition='Left'
; WITH MyCTE
AS ( SELECT id,userid,username,  StandingPosition, ParentUserId,1 AS userlevel,StandingPosition,regdate
FROM userdetail
WHERE UserId =@child
UNION ALL
SELECT UserDetail.id,userdetail.userid, UserDetail.username,UserDetail.StandingPosition, userdetail.ParentUserId ,MyCTE.userlevel+1 ,userdetail.StandingPosition,userdetail.regdate
FROM userdetail
INNER JOIN MyCTE ON userdetail.parentuserid = MyCTE.userid
WHERE userdetail.userid !=@child )
 
 SELECT count(id) AS totaluser
 
FROM MyCTE  
option (maxrecursion 0)
";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public string Insert_Associate(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {

                s2 = "sp_add_AssociateDetail";
                SqlParameter[] parameter = {
                    new SqlParameter("@SponserId",objUser.SponserId),
                    new SqlParameter("@Associatename",objUser.UserName),
                    new SqlParameter("@DateofBirth",objUser.DateOfBirth),
                    new SqlParameter("@Gender",objUser.Gender),
                    new SqlParameter("@Email",objUser.Email),
                    new SqlParameter("@Mobile",objUser.Mobile),
                    new SqlParameter("@Address",objUser.Address),
                     new SqlParameter("@NomineeAge",objUser.NomineeAge),
                  
                    new SqlParameter("@AreaName",objUser.AreaName),
                  
                    new SqlParameter("@Password",objUser.Password),
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                    new SqlParameter("@RegType",objUser.Regtype),
                    new SqlParameter("@imagename",objUser.ImageName),
                     new SqlParameter("@Teamname", objUser.Teamname),
                    new SqlParameter("@Srpresident",  objUser.SrPresident),
                    new SqlParameter("@FatherName",objUser.FatherName),
                    new SqlParameter("@NomineeName",objUser.NomineeName),
                    new SqlParameter("@NomineeRelation",objUser.NomineeRelation),
                    new SqlParameter("@Stateid",objUser.StateId),
                     new SqlParameter("@Adhar",objUser.AdharNo),
                    //new SqlParameter("@planid",objUser.PlanId),
                    new SqlParameter("@landmark",objUser.LandMark),
                    new SqlParameter("@LevelNo",objUser.LevelNo),
                    //new SqlParameter("@StandingPosition",objUser.StandingPosition),
                    //new SqlParameter("@EpinNo",objUser.EpinNo),
                    //new SqlParameter("@pannumber",objUser.PanCardNo),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                try
                {
                    if (res != "f" && res != "s")
                    {
                        //string url = "http://www.apihub.online/api/Services/transact?token=ce4f9f4c676718405d7033ddb36dee00&skey=SST&to=" + objUser.Mobile + "&sender=ETOPUP&smstext=" + "Dear Sir/Madam you are successfully registered on  securepaysystems.co.in. Your login details are-username:" + res + ", password:" + objUser.Password + "&smsformat=TEXT&format=json";
                        //    string url = "http://mysms.msg24.in/api/mt/SendSMS?user=prideandproperty786@gmail.com&password=prideandproperty786@gmail.com&senderid=GLOBAL&channel=trans&DCS=0&flashsms=0&number=" + objUser.Mobile + "&text=" + "Dear User you are successfully registered on prideandproperty.net.in. Your login details are-username:" + res + ", password:" + objUser.Password + "&route=27";
                        //string url = "http://sms.sandhyasoftware.com/vendorsms/pushsms.aspx?user=sandhya&password=sandhya12&msisdn=" + objUser.Mobile + "&sid=SENDIT&msg=" + "Dear Associate you are successfully registered on prideandproperty.net.in. Your login details are-username:" + res + ", password:" + objUser.Password + "&fl=0&gwid=2";
                        //string Result = url.CallURL();
                        //Insert_SendSMS(objUser.Mobile, Result, url);
                    }
                }
                catch { }
                tr.Commit();

            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public DataTable getConfirmationMessage(clsUser objUser)
        {
            string str_query = "SELECT AssociateDetail.AssociateId AS USerId,AssociateDetail.SponserId,Sponsor.AssociateName AS SponsorName,AssociateDetail.AssociateName,L.Password,L.Password AS TransPassword FROM AssociateDetail  LEFT OUTER  JOIN AssociateDetail AS Sponsor ON AssociateDetail.SponserId=Sponsor.AssociateId LEFT OUTER JOIN LoginDetail L ON L.Username=AssociateDetail.AssociateId WHERE AssociateDetail.AssociateId='" + objUser.UserId + "' ";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            string USerId = dt.Rows[0]["USerId"].ToString();
            string UserName = dt.Rows[0]["AssociateName"].ToString();
            string Password = dt.Rows[0]["Password"].ToString();

            string url = string.Concat(new string[]
                {
                   //"http://sms.sandhyasoftware.com/vendorsms/pushsms.aspx?user=OJASSM&password=OJASSM &msisdn=",
                   //objUser.Mobile,
                   //"&sid=OJASSM&msg=CONGRATULATION DEAR "+UserName+" Welcome to http://ojasnetwork.in/user/index.aspx   Your Login id is "+USerId+"  and password "+Password +"   ",
                   //"&fl=0&gwid=2"
                });
            string Result = url.CallURL();
            Insert_SendSMS(objUser.Mobile, Result, url);

            ObjData.EndConnection();
            return dt;
        }

        public string Insert_User(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {

                s2 = "sp_add_UserDetail";
                SqlParameter[] parameter = { 
                    new SqlParameter("@SponserId",objUser.SponserId), 
                    new SqlParameter("@username",objUser.UserName), 
                    new SqlParameter("@DateofBirth",objUser.DateOfBirth), 
                    new SqlParameter("@Gender",objUser.Gender), 
                    new SqlParameter("@Email",objUser.Email), 
                    new SqlParameter("@Mobile",objUser.Mobile), 
                    new SqlParameter("@Address",objUser.Address),
                    new SqlParameter("@CityName",objUser.CityName), 
                    new SqlParameter("@AreaName",objUser.AreaName), 
                    new SqlParameter("@Pincode",objUser.Pincode), 
                    new SqlParameter("@Password",objUser.Password), 
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                    new SqlParameter("@RegType",objUser.Regtype),
                    new SqlParameter("@imagename",objUser.ImageName),
                    new SqlParameter("@Stateid",objUser.StateId),
                     new SqlParameter("@Adhar",objUser.AdharNo),
                    //new SqlParameter("@planid",objUser.PlanId),
                    new SqlParameter("@landmark",objUser.LandMark),
                    new SqlParameter("@FatherName",objUser.FatherName),
                    new SqlParameter("@NomineeName",objUser.NomineeName),
                    new SqlParameter("@NomineeRelation",objUser.NomineeRelation),
                    //new SqlParameter("@StandingPosition",objUser.StandingPosition),
                    //new SqlParameter("@EpinNo",objUser.EpinNo),
                    //new SqlParameter("@pannumber",objUser.PanCardNo),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                try
                {
                    if (res != "f" && res != "s")
                    {
                        //string url = "http://www.apihub.online/api/Services/transact?token=ce4f9f4c676718405d7033ddb36dee00&skey=SST&to=" + objUser.Mobile + "&sender=ETOPUP&smstext=" + "Dear Sir/Madam you are successfully registered on  securepaysystems.co.in. Your login details are-username:" + res + ", password:" + objUser.Password + "&smsformat=TEXT&format=json";
                        //    string url = "http://mysms.msg24.in/api/mt/SendSMS?user=prideandproperty786@gmail.com&password=prideandproperty786@gmail.com&senderid=GLOBAL&channel=trans&DCS=0&flashsms=0&number=" + objUser.Mobile + "&text=" + "Dear User you are successfully registered on prideandproperty.net.in. Your login details are-username:" + res + ", password:" + objUser.Password + "&route=27";
                        //string url = "http://sms.sandhyasoftware.com/vendorsms/pushsms.aspx?user=sandhya&password=sandhya12&msisdn=" + objUser.Mobile + "&sid=SENDIT&msg=" + "Dear User you are successfully registered on prideandproperty.net.in. Your login details are-username:" + res + ", password:" + objUser.Password + "&fl=0&gwid=2";
                        //string Result = url.CallURL();
                        //Insert_SendSMS(objUser.Mobile, Result, url);
                    }
                }
                catch { }
                tr.Commit();

            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string Insert_TopupUser(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "sp_add_UserTopupDetail";
                SqlParameter[] parameter = { 
                    new SqlParameter("@userid",objUser.UserId), 
                    new SqlParameter("@EPinNo",objUser.EpinNo), 
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string Insert_ReTopupUser(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "sp_add_UserReTopup";
                SqlParameter[] parameter = { 
                    new SqlParameter("@userid",objUser.UserId), 
                    new SqlParameter("@TopupType","ReTopup"), 
                    new SqlParameter("@PoolNo",objUser.PoolNo), 
                    new SqlParameter("@EPinNo",objUser.EpinNo), 
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        //public string Update_UserProfile(clsUser objUser)
        //{
        //    string res = "";
        //    string s2 = "";
        //    SqlConnection cn;
        //    SqlTransaction tr = null;
        //    DataSet ds = new DataSet();
        //    cn = ObjData.StartConnectionInTransaction();
        //    tr = cn.BeginTransaction(IsolationLevel.Serializable);
        //    try
        //    {
        //        s2 = "update UserDetail  set username='" + objUser.UserName + "', email='" + objUser.Email + "',dateofbirth='" + objUser.DateOfBirth.ToString("yyyy/MM/dd") + "',gender='" + objUser.Gender + "' ,mobile='" + objUser.Mobile + "', address='" + objUser.Address + "', cityid='" + objUser.CityId + "',areaName='" + objUser.AreaName + "' ,pincode='" + objUser.Pincode + "'  where UserId='" + objUser.UserId + "'   ";
        //        ObjData.RunInsUpDelQueryTrans(s2, tr);
        //        res = "t";
        //        tr.Commit();
        //    }
        //    catch (Exception ex)
        //    {
        //        res = "0";
        //        tr.Rollback();
        //    }
        //    finally
        //    {
        //        ObjData.EndConnection();
        //        tr.Dispose();
        //    }
        //    return res;
        //}


        public string User_Activate(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "update logindetail set status='1' where username='" + objUser.UserId + "'";
                ObjData.RunInsUpDelQueryTrans(s2, tr);
                res = "t";
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string EPinTransfer(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                DataTable dt = new DataTable();
                dt = ObjData.RunSelectQueryTTrans("select * from userdetail  with (nolock)  where userid='" + objUser.TransferUserId + "'", tr);
                if (dt.Rows.Count > 0)
                {
                    DataTable dtepin = new DataTable();
                    dtepin = ObjData.RunSelectQueryTTrans("SELECT * FROM epinmaster WHERE GenerateUserId='" + objUser.UserId + "' and planid="+objUser.PlanId+"   AND EPinStatus='Active'", tr);
                    int totalpins = dtepin.Rows.Count;
                    if (totalpins >= objUser.NoOfEpin)
                    {
                        for (int c = 0; c < objUser.NoOfEpin; c++)
                        {
                            s2 = " declare @id int ; set @id=(select isnull(max(id),0)+1 from EPinTransferHistory) ; insert into EPinTransferHistory ( id, EPinNo  ,UserIdFrom  ,    UserIdTo  ,MentionBy ,mentionDate ) values (@id,'" + dtepin.Rows[c]["EPinNo"].ToString() + "','" + objUser.UserId + "','" + objUser.TransferUserId + "','" + objUser.MentionBy + "',getdate() ) ";
                            ObjData.RunInsUpDelQueryTrans(s2, tr);

                            s2 = "update EPinMaster set generateuserid='" + objUser.TransferUserId + "' where EpinNo='" + dtepin.Rows[c]["EPinNo"].ToString() + "'  ";
                            ObjData.RunInsUpDelQueryTrans(s2, tr);
                        }
                        res = "t";
                    }
                    else
                    {
                        res = "n";
                    }
                }
                else
                {
                    res = "f";
                }
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public DataTable getFundTransferReport(clsUser objUser)
        {
            string str_query = "SELECT ft.transferamount,ft.transferuserid,ft.mentiondate, ft.userid, ud.username,ud2.username as transferusername FROM Fundtransferdetail ft left join userdetail ud  with (nolock) on ft.userid=ud.userid LEFT JOIN userdetail ud2  with (nolock) ON ft.transferuserid=ud2.userid where 1=1 ";


            if (objUser.FromDate != DateTime.MinValue && objUser.ToDate != DateTime.MinValue)
            {
                str_query += "  and ft.MentionDate  >= '" + objUser.FromDate + "'   and ft.MentionDate   <= '" + objUser.ToDate + "' ";
            }

            if (objUser.UserId != "")
            {
                str_query += "  and ft.UserId = '" + objUser.UserId + "' ";
            }
            if (objUser.TransferUserId != "")
            {
                str_query += "  and ft.transferuserid = '" + objUser.TransferUserId + "' ";
            }

            str_query += " order by ft.MentionDate  desc";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public string Insert_AssociateAdvancePayment(clsUser objassociate)
        {
            int i = 0;
            string s2 = "";
            string res = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "sp_AssociateAdvancePayment";

                SqlParameter[] parameter = {
                new SqlParameter( "@AssociateId",  objassociate.UserId),
                new SqlParameter( "@amount",  objassociate.Amount),
                new SqlParameter( "@PaymentMode",  objassociate.PaymentMode),
                new SqlParameter( "@PaymentDate",  objassociate.PaymentDate),
                new SqlParameter( "@ChequeNo",  objassociate.ChequeNo),
                new SqlParameter( "@mentionby",  objassociate.MentionBy),


                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string Insert_AssociateAdvanceRepayment(clsUser objassociate)
        {
            int i = 0;
            string s2 = "";
            string res = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "sp_AssociateAdvanceRepayment";

                SqlParameter[] parameter = {
                new SqlParameter( "@AssociateId",  objassociate.UserId),
                new SqlParameter( "@amount",  objassociate.Amount),
                new SqlParameter( "@PaymentMode",  objassociate.PaymentMode),
                new SqlParameter( "@PaymentDate",  objassociate.PaymentDate),
                new SqlParameter( "@ChequeNo",  objassociate.ChequeNo),
                new SqlParameter( "@mentionby",  objassociate.MentionBy),


                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string FundTransferAdmin(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {

                s2 = "sp_add_FundTransferAdmin";
                SqlParameter[] parameter = {              
                    new SqlParameter("@Userid",objUser.UserId),
                    new SqlParameter("@Amount",objUser.Amount), 
                    //new SqlParameter("@WalletType",objUser.WalletType), 
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();

            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string Update_PanCardStatus(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "update associateKYCDetail set pancardstatus='" + objUser.PanCardStatus + "' where userid='" + objUser.UserId + "'";
                ObjData.RunInsUpDelQueryTrans(s2, tr);
                res = "t";
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string Update_AadharCardStatus(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "update associateKYCDetail set aadharcardstatus='" + objUser.AadharCardStatus + "' where userid='" + objUser.UserId + "'";
                ObjData.RunInsUpDelQueryTrans(s2, tr);
                res = "t";
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string Update_BankProofStatus(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "update associateKYCDetail set bankproofstatus='" + objUser.BankProofStatus + "' where userid='" + objUser.UserId + "'";
                ObjData.RunInsUpDelQueryTrans(s2, tr);
                res = "t";
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public DataTable getAssociateKYCReport(clsUser objUser)
        {
            string str_query = "SELECT  ud.associatename,uk.* FROM AssociateKYCDetail uk with (nolock)  LEFT join associatedetail ud with (nolock) ON ud.associateId=uk.UserId  where 1=1 ";


            if (objUser.FromDate != DateTime.MinValue && objUser.ToDate != DateTime.MinValue)
            {
                str_query += "  and ud.MentionDate  >= '" + objUser.FromDate + "'   and ud.MentionDate   <= '" + objUser.ToDate + "' ";
            }
            if (objUser.UserName != "")
            {
                str_query += "  and ud.username = '" + objUser.UserName + "' ";
            }
            if (objUser.UserId != "")
            {
                str_query += "  and ud.associate = '" + objUser.UserId + "' ";
            }
            if (objUser.Mobile != "")
            {
                str_query += "  and ud.mobile = '" + objUser.Mobile + "' ";
            }
            if (objUser.Email != "")
            {
                str_query += "  and ud.email = '" + objUser.Email + "' ";
            }

            if (objUser.PanCardStatus != "0")
            {
                str_query += "  and uk.pancardstatus = '" + objUser.PanCardStatus + "' ";
            }

            str_query += " order by ud.associatename  desc";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public string InsertUserUpgradeDetail(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "sp_add_UserUpgradePlanDetail";
                SqlParameter[] parameter = {              
                    new SqlParameter("@UserId",objUser.UserId), 
                    new SqlParameter("@PrevPackageId",objUser.PrevPackageId), 
                    new SqlParameter("@NewPackageID",objUser.PackageId), 
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();

            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string InsertAssociateKYCDetail(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {

                s2 = "sp_add_AssociateKYCDetail";
                SqlParameter[] parameter = {
                    new SqlParameter("@Userid",objUser.UserId),
                    new SqlParameter("@PanCardNo",objUser.PanCardNo),
                    new SqlParameter("@PanCardImageName",objUser.PanCardImage),
                    new SqlParameter("@PanCardStatus",objUser.PanCardStatus),
                    new SqlParameter("@AadharCardNo",objUser.AadharCardNo),
                    new SqlParameter("@AadharCardImageName",objUser.AadharCardImage),
                     new SqlParameter("@AadharCardImageNameBack",objUser.AadharCardImage2),
                    new SqlParameter("@AadharCardStatus",objUser.AadharCardStatus),
                    new SqlParameter("@BankProofNo",objUser.BankProofName),
                    new SqlParameter("@BankProofImageName",objUser.BankProofImage),
                    new SqlParameter("@BankProofStatus",objUser.BankProofStatus),
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();

            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string FundDebitAdmin(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {

                s2 = "sp_debit_FundTransferAdmin";
                SqlParameter[] parameter = {              
                    new SqlParameter("@Userid",objUser.UserId),
                    new SqlParameter("@Amount",objUser.Amount), 
                    //new SqlParameter("@WalletType",objUser.WalletType), 
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();

            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string WalletTransferAdmin(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {

                s2 = "sp_add_WalletTransferAdmin";
                SqlParameter[] parameter = {              
                    new SqlParameter("@FromUserId",objUser.UserId), 
                    new SqlParameter("@ToUserId",objUser.TransferUserId), 
                    new SqlParameter("@Amount",objUser.Amount), 
                    new SqlParameter("@Remark",objUser.Remark), 
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();

            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string FundTransfer(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {

                s2 = "sp_FundTransfer";
                SqlParameter[] parameter = {              
                    new SqlParameter("@UserId",objUser.UserId), 
                    new SqlParameter("@TransferUserid",objUser.TransferUserId),  
                    new SqlParameter("@TransferAmount",objUser.TransferAmount), 
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);

                tr.Commit();

            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string SponserEdit(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "sp_editSponser";
                SqlParameter[] parameter = {              
                    new SqlParameter("@UserId",objUser.UserId), 
                    new SqlParameter("@OldSponserId",objUser.SponserId), 
                    new SqlParameter("@NewSponserId",objUser.NewSponserId), 
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();

            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string WalletTransferUser(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "sp_add_WalletTransferUser";
                SqlParameter[] parameter = {              
                    new SqlParameter("@FromUserId",objUser.UserId), 
                    new SqlParameter("@ToUserId",objUser.TransferUserId), 
                    new SqlParameter("@Amount",objUser.Amount), 
                    new SqlParameter("@AdminCharge",objUser.AdminCharge), 
                    new SqlParameter("@TotalAmount",objUser.TotalAmount), 
                    new SqlParameter("@Remark",objUser.Remark), 
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();

            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string ReverseWalletTransfer(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "sp_reverse_WalletTransfer";
                SqlParameter[] parameter = {              
                    new SqlParameter("@id",objUser.Id),
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();

            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string InsertFundRequest(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "sp_add_FundRequestDetail";
                SqlParameter[] parameter = {              
                    new SqlParameter("@BankAccountId",objUser.BankAccountId), 
                    new SqlParameter("@UserId",objUser.UserId), 
                    new SqlParameter("@Amount",objUser.Amount), 
                    new SqlParameter("@Remark",objUser.Remark), 
                    new SqlParameter("@PaymentMode",objUser.PaymentMode), 
                    new SqlParameter("@OnlineTransactionId",objUser.OnlineTransactionId), 
                    new SqlParameter("@MobileNoInBank",objUser.Mobile), 
                    new SqlParameter("@ChequeNo",objUser.ChequeNo), 
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();

            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string UpdateFundRequest(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "sp_update_FundRequest";
                SqlParameter[] parameter = {              
                    new SqlParameter("@id",objUser.Id), 
                    new SqlParameter("@status",objUser.Status), 
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();

            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string SendPassword(clsUser objUser)
        {

            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataTable dt = new DataTable();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "SELECT ud.userid,ud.mobile,ld.Password FROM UserDetail ud WITH  (nolock)  LEFT JOIN logindetail ld WITH (nolock) ON ud.UserId=ld.Username  AND ld.role='user'  where ud.userid='" + objUser.UserId + "' ";
                dt = ObjData.RunSelectQueryTTrans(s2, tr);
                if (dt.Rows.Count > 0)
                {
                    objUser.Mobile = dt.Rows[0]["mobile"].ToString();
                    string password = dt.Rows[0]["password"].ToString();

                  
                    //string url = "http://www.apihub.online/api/Services/transact?token=ce4f9f4c676718405d7033ddb36dee00&skey=SST&to=" + objUser.Mobile + "&sender=ETOPUP&smstext=" + "Dear User your password is " + password + "&smsformat=TEXT&format=json";

                    //string Result = url.CallURL();
                    //Insert_SendSMS(objUser.Mobile, Result, url);

                    res = objUser.Mobile;
                }
                else
                {
                    res = "f";
                } tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;


        }
        public string senddms()
        {
            string url = "http://www.apihub.online/api/Services/transact?token=ce4f9f4c676718405d7033ddb36dee00&skey=SST&to=8957737107&sender=ETOPUP&smstext=ttt&smsformat=TEXT&format=json";
            //ObjData.SendMsg("8957737107", "hello");
            string Result = url.CallURL();
            return Result;
        }
        public string User_Deactivate(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "update logindetail set status='0' where username='" + objUser.UserId + "'";
                ObjData.RunInsUpDelQueryTrans(s2, tr);
                res = "t";
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string Update_UserProfile(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "update UserDetail  set username='" + objUser.UserName + "', email='" + objUser.Email + "',dateofbirth='" + objUser.DateOfBirth.ToString("yyyy/MM/dd") + "',gender='" + objUser.Gender + "' ,mobile='" + objUser.Mobile + "', address='" + objUser.Address + "', CityName='" + objUser.CityName + "',areaName='" + objUser.AreaName + "' ,pincode='" + objUser.Pincode + "',imagename='" + objUser.ImageName + "',stateid='" + objUser.StateId + "'  where UserId='" + objUser.UserId + "'   ";
                ObjData.RunInsUpDelQueryTrans(s2, tr);
                res = "t";
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string Update_UserProfile2(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "update UserDetail  set username='" + objUser.UserName + "', email='" + objUser.Email + "',dateofbirth='" + objUser.DateOfBirth.ToString("yyyy/MM/dd") + "',gender='" + objUser.Gender + "' ,mobile='" + objUser.Mobile + "', address='" + objUser.Address + "',stateid='" + objUser.StateId + "', CityName='" + objUser.CityName + "',areaName='" + objUser.AreaName + "' ,pincode='" + objUser.Pincode + "',AccountHolderName='" + objUser.AccHolderName + "',AccountNo='" + objUser.AccNo + "',IFSCCode='" + objUser.IFSCCode + "',BankName='" + objUser.BankName + "',BranchName='" + objUser.BranchName + "',PanNumber='" + objUser.PanCardNo + "',NomineeName='" + objUser.NomineeName + "',NomineeRelation='" + objUser.NomineeRelation + "',imagename='" + objUser.ImageName + "',paytmmobileno ='" + objUser.PaytmMobileNo + "'  where UserId='" + objUser.UserId + "'   ";
                ObjData.RunInsUpDelQueryTrans(s2, tr);
                res = "t";
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string Update_UserProfilenew(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "update UserDetail  set username='" + objUser.UserName + "', email='" + objUser.Email + "',mobile='" + objUser.Mobile + "', address='" + objUser.Address + "',stateid='" + objUser.StateId + "', CityName='" + objUser.CityName + "',AccountHolderName='" + objUser.AccHolderName + "',AccountNo='" + objUser.AccNo + "',IFSCCode='" + objUser.IFSCCode + "',BankName='" + objUser.BankName + "',BranchName='" + objUser.BranchName + "',PanNumber='" + objUser.PanCardNo + "',imagename='" + objUser.ImageName + "'  where UserId='" + objUser.UserId + "'   ";
                ObjData.RunInsUpDelQueryTrans(s2, tr);
                res = "t";
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string Update_AssociateProfile(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "update AssociateDetail  set Associatename='" + objUser.UserName + "', email='" + objUser.Email + "',gender='" + objUser.Gender + "' ,mobile='" + objUser.Mobile + "', levelno='" + objUser.LevelNo + "', address='" + objUser.Address + "', CityName='" + objUser.CityName + "',areaName='" + objUser.AreaName + "' ,pincode='" + objUser.Pincode + "',imagename='" + objUser.ImageName + "',stateid='" + objUser.StateId + "',AccountHolderName='" + objUser.AccHolderName + "',BranchName='" + objUser.BranchName + "',NomineeName='" + objUser.NomineeName + "',NomineeRelation='" + objUser.NomineeRelation + "',nomineeage='" + objUser.NomineeAge + "',bankname='" + objUser.BankAccountId + "',IFSCCode='" + objUser.IFSCCode + "',AccountNo='" + objUser.AccNo + "' ,Srpresidentname='" + objUser.SrPresident + "' ,Adharnumber='" + objUser.AdharNo + "' ,PanNumber='" + objUser.PanCardNo + "' ,teamname='" + objUser.Teamname + "'  where AssociateId='" + objUser.UserId + "'   ";
                ObjData.RunInsUpDelQueryTrans(s2, tr);
                res = "t";
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string Insert_SendSMS(string str_Mobile, string str_Result, string str_Message)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "insert into SendSms(CreateDate,Mobile,Result,Message)  values (getdate(),'" + str_Mobile + "','" + str_Result.Replace("'", "''") + "','" + str_Message.Replace("'", "''") + "') ";
                ObjData.RunInsUpDelQueryTrans(s2, tr);
                res = "t";
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string InsertCallbackRequest(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "sp_add_CallbackRequestDetail";
                SqlParameter[] parameter = {              
                    new SqlParameter("@UserId",objUser.UserId), 
                    new SqlParameter("@MobileNo",objUser.Mobile), 
                    new SqlParameter("@MentionBy",objUser.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();

            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string ValidatePassword(clsUser objUser)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "sp_ValidatePassword";
                SqlParameter[] parameter = {              
                    new SqlParameter("@username",objUser.UserId), 
                    new SqlParameter("@password",objUser.Password), 
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();

            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string SendOTP(clsUser objUser)
        {

            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataTable dt = new DataTable();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {              
                    Random random = new Random();
                    string otp = random.Next(1000, 9999).ToString();

                    string url = "http://www.apihub.online/api/Services/transact?token=ce4f9f4c676718405d7033ddb36dee00&skey=SST&to=" + objUser.Mobile + "&sender=ETOPUP&smstext=" + "Dear User your OTP is : " + otp + "&smsformat=TEXT&format=json";
                    string Result = url.CallURL();
                    Insert_SendSMS(objUser.Mobile, Result, url);
                    res = otp;
               
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string sendPromotionalMessage(string str_message)
        {
            string str_query = "select distinct mobile from userdetail with (nolock) WHERE Mobile IS NOT NULL AND len(mobile)=10 and activestatus='1'";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();

            decimal dccounter = Convert.ToDecimal(dt.Rows.Count) / Convert.ToDecimal("100");
            int counter = Convert.ToInt32(Math.Ceiling(dccounter));
            string str_mobile = "";
            for (int i = 1; i <= counter; i++)
            {
                str_mobile = "";
                int c = 1 * i;
                if (i < counter)
                {
                    for (; c <= 100 * i; c++)
                    {
                        str_mobile += dt.Rows[(c - 1)]["mobile"].ToString() + ",";
                    }
                }
                else
                {
                    for (; c <= dt.Rows.Count; c++)
                    {
                        str_mobile += dt.Rows[(c - 1)]["mobile"].ToString() + ",";
                    }
                }
                string url = "http://www.apihub.online/api/Services/transact?token=ce4f9f4c676718405d7033ddb36dee00&skey=SST&to=" + str_mobile + "&sender=ETOPUP&smstext=" + str_message + "&smsformat=TEXT&format=json";
                string Result = url.CallURL();
                Insert_SendSMS(str_mobile, Result, url);
            }
            return "t";           
        }
    }
}
