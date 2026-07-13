<%@ Page Title="Generate Direct Income Closing" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="DirectIncomeClosingGenerate.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
       <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Generate Direct Income Closing</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" Runat="Server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modal2">
                <div class="center2">
                    <img alt="" src="loader.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
      
       <div class="card">
        <div class="card-header">
            <strong>GenerateDirect Income Closing</strong>
        </div>

        <div class="card-body">
                        <div class="row form-group">
                            <div class="col-md-2">From Date</div>
                            <div class="col-md-3">
                                 <asp:TextBox ID="txtfromdate"  CssClass="form-control form_date" autocomplete="off" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                              <div class="col-md-1"></div>
                             <div class="col-md-2">To Date</div>
                            <div class="col-md-3">
                                 <asp:TextBox ID="txttodate"  CssClass="form-control form_date" autocomplete="off"  runat="server"></asp:TextBox>
                            </div>
                        </div>                  
                        <hr />
                        <div class="row form-group">
                            <div class="col-md-12">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
                            </div>
                        </div>
                </div>
            </div>
      </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
       <script type="text/javascript">
           function validate() {
               if (document.getElementById("<%=txtfromdate.ClientID%>").value == "") {
                   toastr.warning('Warning', 'Enter From Date');
                   document.getElementById("<%=txtfromdate.Text%>").focus();
                   return false;
               }
               if (document.getElementById("<%=txttodate.ClientID%>").value == "") {
                   toastr.warning('Warning', 'Enter To Date');
                   document.getElementById("<%=txttodate.Text%>").focus();
                   return false;
                  }
              
           }          
    </script>
</asp:Content>

