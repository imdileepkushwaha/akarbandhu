using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTier;
using System.Data;
using System.Data.SqlClient;


    public class clsUtility
    {

        public static string ProjectName { get { return "AKAR BANDHU PVT. LTD"; } }
        public static string ProjectAbbreviation { get { return "AKAR BANDHU PVT. LTD"; } }
        public static string ProjectWebsite { get { return "https://akarbandhu.in/"; } }
        public static string Company { get { return "AKAR BANDHU PVT. LTD"; } }
        public static string Session { get { return "2025-2026"; } }

        public static string Day { get { return DateTime.Now.ToString("ddd, MMM dd, yyyy"); } }

    }

