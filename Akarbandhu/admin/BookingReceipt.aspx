<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookingReceipt.aspx.cs" Inherits="Branch_BookingReceipt" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
           <rsweb:ReportViewer ID="rptfdreciept" runat="server" Font-Names="vardana" Font-Size="8pt" Height="100%" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="82%">
                        <LocalReport ReportPath="rptBookingReceipt.rdlc">
                         <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="Dataset1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
    </div>
    </form>
</body>
</html>
