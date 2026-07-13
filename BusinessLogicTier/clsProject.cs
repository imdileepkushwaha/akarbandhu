using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DataTier;
using System.Data.SqlClient;

namespace BusinessLogicTier
{
    public class clsProject
    {
        Data ObjData = new Data();
        public string PLCId { get; set; }
        public string PLCName { get; set; }
        public string ProjectId { get; set; }
        public string ProjectName { get; set; }
        public string BlockId { get; set; }
        public string BlockName { get; set; }
        public string PlotId { get; set; }
        public string PlotNo { get; set; }
        public string PlotNoFrom { get; set; }
        public string PlotNoTo { get; set; }
        public decimal Landarea { get; set; }
        public string Dimension { get; set; }
        public decimal PlCCharge { get; set; }
        public decimal DevelopmentCharge { get; set; }
        public string MentionBy { get; set; }
        public decimal BV { get; set; }
        public string PlotStatus { get; set; }

        public DataTable getPLC()
        {
            string str_query = "select * from PLCDetail order by PLCName";

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
        public DataTable getPlan()
        {
            string str_query = "select * from planmaster order by planid";

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

        public DataTable getProject()
        {
            string str_query = "select * from ProjectDetail order by ProjectName";

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
        public DataTable getBlockAll()
        {
            string str_query = "select bd.*,pd.projectname from BlockDetail bd  left join ProjectDetail pd on bd.projectid=pd.projectid order by pd.projectname,bd.BlockName";

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

        public DataTable getBlock(clsProject objProject)
        {
            string str_query = "select bd.*,pd.projectname from BlockDetail bd  left join ProjectDetail pd on bd.projectid=pd.projectid where bd.projectid=" + objProject.ProjectId + " order by pd.projectname,bd.BlockName";

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


        public DataTable getPlot(clsProject objProject)
        {
            string str_query = @"
SELECT CASE WHEN  isnull(bk.TotalAmount,-1)=isnull((SELECT sum(instamt) FROM InstallmentDetail ind WITH (nolock) WHERE ind.AccountNo=bk.accountno),0) THEN 'Sold' ELSE pld.plotstatus END AS plotstatus2,  pld.*,bd.blockname,pd.projectname from plotdetail pld left join blockdetail bd on bd.blockid=pld.blockid left join projectdetail pd on bd.projectid=pd.projectid 
LEFT JOIN bookingdetail bk WITH (nolock) ON bk.Plotid=pld.PlotId

where 1=1 ";

            if (objProject.ProjectId != "0")
            {
                str_query += "  and bd.projectid=" + objProject.ProjectId + " ";
            }

            if (objProject.BlockId != "0")
            {
                str_query += "  and pld.Blockid=" + objProject.BlockId + " ";
            }
            if (objProject.PlotNo != "")
            {
                str_query += "  and pld.plotno=" + objProject.PlotNo + " ";
            }
            if (objProject.PlotStatus != "0" && objProject.PlotStatus!=null)
            {
                str_query += "  and pld.plotstatus='" + objProject.PlotStatus + "' ";
            }
            str_query += " order by pd.projectname,bd.blockname,convert(int, pld.plotno) ";
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


        public DataTable getPlotForDelete(clsProject objProject)
        {
            string str_query = "select  pld.*,bd.blockname,pd.projectname,pcd.plcname from plotdetail pld left join blockdetail bd on bd.blockid=pld.blockid left join projectdetail pd on bd.projectid=pd.projectid left join plcdetail pcd on pld.plcid=pcd.plcid where 1=1 and pld.plotstatus='Vacant' ";

            if (objProject.ProjectId != "0")
            {
                str_query += "  and bd.projectid=" + objProject.ProjectId + " ";
            }

            if (objProject.BlockId != "0")
            {
                str_query += "  and pld.Blockid=" + objProject.BlockId + " ";
            }
            if (objProject.PlotNoFrom != "" && objProject.PlotNoTo!="")
            {
                str_query += "  and pld.plotno between  " + objProject.PlotNoFrom + "  and " + objProject.PlotNoTo + " ";
            }

            str_query += " order by pd.projectname,bd.blockname,convert(int, pld.plotno) ";
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


        public DataTable getPlotForBooking(clsProject objProject)
        {
            string str_query = "select  pld.*,bd.blockname,pd.projectname from plotdetail pld left join blockdetail bd on bd.blockid=pld.blockid left join projectdetail pd on bd.projectid=pd.projectid where 1=1 and pld.plotstatus in ('Vacant','Hold') ";

            if (objProject.ProjectId != "0")
            {
                str_query += "  and bd.projectid=" + objProject.ProjectId + " ";
            }

            if (objProject.BlockId != "0")
            {
                str_query += "  and pld.Blockid=" + objProject.BlockId + " ";
            }
           

            str_query += " order by pd.projectname,bd.blockname,convert(int, pld.plotno) ";
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


        public DataTable getPlotDetailById(clsProject objProject)
        {
            string str_query = "select  pld.*,bd.blockname,pd.projectname from plotdetail pld left join blockdetail bd on bd.blockid=pld.blockid left join projectdetail pd on bd.projectid=bd.projectid where  pld.plotid=" + objProject.PlotId + " ";
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


        public string Insert_PLC(clsProject objProject)
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
                s2 = "sp_add_PLCDetail";
                SqlParameter[] parameter = {   
                new SqlParameter("@PLCName",objProject.PLCName), 
                new SqlParameter("@MentionBy",objProject.MentionBy)
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
        public string Insert_Project(clsProject objProject)
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
                s2 = "sp_add_ProjectDetail";
                SqlParameter[] parameter = {                                              
              
                new SqlParameter("@ProjectName",objProject.ProjectName), 
                new SqlParameter("@BV",objProject.BV),
                new SqlParameter("@MentionBy",objProject.MentionBy)
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

        public string Edit_Block(clsProject objProject)
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
                s2 = "sp_edit_Block";
                SqlParameter[] parameter = {                                              
                new SqlParameter("@ProjectId",objProject.BlockId), 
                new SqlParameter("@BlockName",objProject.BlockName), 
                new SqlParameter("@MentionBy",objProject.MentionBy)
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

        public string Insert_Block(clsProject objProject)
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
                s2 = "sp_add_BlockDetail";
                SqlParameter[] parameter = {                                              
                new SqlParameter("@ProjectId",objProject.ProjectId), 
                new SqlParameter("@BlockName",objProject.BlockName), 
                new SqlParameter("@MentionBy",objProject.MentionBy)
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

        public string Insert_Plot(clsProject objProject)
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
                for (int i = Convert.ToInt32(objProject.PlotNoFrom); i <= Convert.ToInt32(objProject.PlotNoTo); i++)
                {
                    s2 = "sp_add_PlotDetail";
                    SqlParameter[] parameter = {                                              
                    new SqlParameter("@BlockId",objProject.BlockId), 
                    new SqlParameter("@PlotNo",i.ToString()), 
                    new SqlParameter("@LandArea",objProject.Landarea), 
                    new SqlParameter("@Dimension",objProject.Dimension), 
                    new SqlParameter("@MentionBy",objProject.MentionBy),
                };
                    res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                }

                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "e";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string Update_Project(clsProject objProject)
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
                s2 = "update ProjectDetail set Projectname='" + objProject.ProjectName + "' where Projectid='" + objProject.ProjectId + "'";
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

        public string Edit_Plot(clsProject objProject)
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

                s2 = "Update plotdetail  set landarea=" + objProject.Landarea + ",Dimension='" + objProject.Dimension + "' where Plotid=" + objProject.PlotId + " ";
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


        public int Delete_Plot(clsProject objProject)
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
                s2 = "delete plotdetail  WHERE plotid=" + objProject.PlotId + " and plotstatus='Vacant' ";
                ObjData.RunInsUpDelQueryTrans(s2, tr);

                tr.Commit();
                i = 1;
            }
            catch (Exception ex)
            {
                i = 0;
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return i;
        }


    }
}
