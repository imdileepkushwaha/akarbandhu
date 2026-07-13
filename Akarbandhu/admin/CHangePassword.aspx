<%@ Page Title="Change Password" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="admin_NewMessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
      <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Change Password</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modal2">
                <div class="center2">
                    <img alt="" src="loader.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
           <div class="card">
        <div class="card-header">
            <strong>Change Password</strong>
        </div>

        <div class="card-body">
                               
                                  <div class="row form-group">
                                          <div class="col-md-2">Old Password</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtoldpassword" TextMode="Password"   CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                               <div class="row form-group">
                                          <div class="col-md-2">New Password</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtnewpassword" TextMode="Password"   CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="row form-group">
                                          <div class="col-md-2">Confirm Password</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtconfirmpassword" TextMode="Password"   CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <hr />
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                                    </div>
                                </div>
                          
                        </div>
                    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
       <script type="text/javascript">
           function validate() {
               if (document.getElementById("<%=txtoldpassword.ClientID%>").value == "") {
                   toastr.warning('Warning', 'Enter Old password');
                   document.getElementById("<%=txtoldpassword.ClientID%>").focus();
             return false;
         }
         if (document.getElementById("<%=txtnewpassword.ClientID%>").value == "") {

                   toastr.warning('Warning', 'Enter New password');
                   document.getElementById("<%=txtnewpassword.ClientID%>").focus();
             return false;
         }
         if (document.getElementById("<%=txtconfirmpassword.ClientID%>").value == "") {

                   toastr.warning('Warning', 'Enter confirm password');
                   document.getElementById("<%=txtconfirmpassword.ClientID%>").focus();
             return false;
         }
         if (document.getElementById("<%=txtnewpassword.ClientID%>").value != document.getElementById("<%=txtconfirmpassword.ClientID%>").value) {

                   toastr.warning('Warning', 'Password Not Match');
                   document.getElementById("<%=txtnewpassword.ClientID%>").focus();
                 return false;
             }
        }
    </script>
</asp:Content>

