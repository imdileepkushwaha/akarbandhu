<%@ Page Title="InstallmentReceipt" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="InstallmentReceipt.aspx.cs" Inherits="admin_BookingReceipt" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentData" Runat="Server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <rsweb:ReportViewer ID="rptfdreciept" runat="server"></rsweb:ReportViewer>
    </div>
</asp:Content>

