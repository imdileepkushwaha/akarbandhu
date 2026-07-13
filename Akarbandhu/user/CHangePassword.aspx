<%@ Page Title="Change Password" Language="C#" MasterPageFile="usermaster.master" AutoEventWireup="true" CodeFile="CHangePassword.aspx.cs" Inherits="admin_CHangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
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
            <strong>CHange Password</strong>
        </div>
        <div class="card-body">
                                 <div class="row">
                                    <div class="col-md-2">Old Password</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtoldpassword" TextMode="Password"  CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">Password</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtuserpassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-1"></div>
                                   
                                </div>
                                   <div class="row">
                                    <div class="col-md-2">Confirm Password</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtconfirmpassword" TextMode="Password"  CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                  
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">   
  <asp:UpdatePanel runat="server" ID="uplMaster" >
        <ContentTemplate>
     <div id="myModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">OTP</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                               Enter OTP                      
                                <asp:TextBox runat="server" class="form-control" ID="txtotp"></asp:TextBox>
                            </div>
                         
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSend" runat="server" Text="Submit" OnClientClick="return validate2();" CssClass="btn btn-success" OnClick="btnSend_Click" />
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                     
                       
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtoldpassword.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Old Password');
                document.getElementById("<%=txtoldpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtuserpassword.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter New Password');
                document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtconfirmpassword.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Confirm Password');
                document.getElementById("<%=txtconfirmpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtuserpassword.ClientID%>").value != document.getElementById("<%=txtconfirmpassword.ClientID%>").value) {

                toastr.warning('Warning', 'Password Not Match');
                document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                return false;
            }
        }
    </script>
       <script type="text/javascript">
           function validate2() {
               if (document.getElementById("<%=txtotp.ClientID%>").value == "") {
                 alert("Enter OTP");
                 document.getElementById("<%=txtotp.ClientID%>").focus();
                return false;
            }
        }
    </script>

    <script type="text/javascript">
        function showModal() {
            $('#myModal').modal({ backdrop: 'static', keyboard: false })
        }
        function Closepopup() {
            $('#myModal').modal('hide');
            $('body').removeClass('modal-open');
            $('body').css('padding-right', '0');
            $('.modal-backdrop').remove();
        }
    </script>
</asp:Content>

