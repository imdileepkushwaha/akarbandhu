<%@ Page Title="Change Password" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="CHangePassword.aspx.cs" Inherits="admin_CHangePassword" %>

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
                <div class="center2 ab-ajax-loader">
                    <div class="ab-spinner" aria-hidden="true"></div>
                    <span class="ab-ajax-loader-text">Please wait…</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Change Password</h2>
                    <p>Update your account password securely.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-lock"></i></span>
                        <div>
                            <h3>Password Details</h3>
                            <span>Enter your current password and choose a new one</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field ab-password-narrow">
                                <label>Old Password</label>
                                <div class="ab-password">
                                    <asp:TextBox ID="txtoldpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Enter old password" autocomplete="current-password"></asp:TextBox>
                                    <button type="button" class="ab-password-toggle" data-target="<%= txtoldpassword.ClientID %>" aria-label="Show password" title="Show / hide">
                                        <i class="feather icon-eye"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 ab-field ab-password-narrow">
                                <label>New Password</label>
                                <div class="ab-password">
                                    <asp:TextBox ID="txtuserpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Enter new password" autocomplete="new-password"></asp:TextBox>
                                    <button type="button" class="ab-password-toggle" data-target="<%= txtuserpassword.ClientID %>" aria-label="Show password" title="Show / hide">
                                        <i class="feather icon-eye"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 ab-field ab-password-narrow">
                                <label>Confirm Password</label>
                                <div class="ab-password">
                                    <asp:TextBox ID="txtconfirmpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Confirm new password" autocomplete="new-password"></asp:TextBox>
                                    <button type="button" class="ab-password-toggle" data-target="<%= txtconfirmpassword.ClientID %>" aria-label="Show password" title="Show / hide">
                                        <i class="feather icon-eye"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Update Password" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <asp:UpdatePanel runat="server" ID="uplMaster">
        <ContentTemplate>
            <div id="myModal" class="modal fade ab-modal">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="ab-modal-head">
                                <span class="ab-modal-head-icon"><i class="feather icon-shield"></i></span>
                                <div>
                                    <h4 class="modal-title">Verify OTP</h4>
                                    <span class="ab-modal-id">Enter the OTP sent to your registered contact</span>
                                </div>
                            </div>
                            <button type="button" class="ab-modal-close" data-dismiss="modal" aria-label="Close">
                                <i class="feather icon-x"></i>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="ab-field">
                                <label>OTP</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtotp" placeholder="Enter OTP"></asp:TextBox>
                            </div>
                        </div>
                        <div class="modal-footer ab-actions" style="justify-content:flex-end;border-top:1px solid #e2e8f0;margin:0;padding:1rem 1.25rem;">
                            <asp:Button ID="btnSend" runat="server" Text="Submit OTP" OnClientClick="return validate2();" CssClass="btn btn-primary" OnClick="btnSend_Click" />
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
        function validate2() {
            if (document.getElementById("<%=txtotp.ClientID%>").value == "") {
                alert("Enter OTP");
                document.getElementById("<%=txtotp.ClientID%>").focus();
                return false;
            }
        }
        function showModal() {
            $('#myModal').modal({ backdrop: 'static', keyboard: false });
        }
        function Closepopup() {
            $('#myModal').modal('hide');
            $('body').removeClass('modal-open');
            $('body').css('padding-right', '0');
            $('.modal-backdrop').remove();
        }

        function bindPasswordToggles(root) {
            var scope = root || document;
            scope.querySelectorAll('.ab-password-toggle').forEach(function (btn) {
                if (btn._abPwBound) return;
                btn._abPwBound = true;
                btn.addEventListener('click', function () {
                    var id = btn.getAttribute('data-target');
                    var input = id ? document.getElementById(id) : null;
                    if (!input) return;
                    var show = input.type === 'password';
                    input.type = show ? 'text' : 'password';
                    var icon = btn.querySelector('i');
                    if (icon) {
                        icon.className = show ? 'feather icon-eye-off' : 'feather icon-eye';
                    }
                    btn.setAttribute('aria-label', show ? 'Hide password' : 'Show password');
                });
            });
        }
        document.addEventListener('DOMContentLoaded', function () { bindPasswordToggles(document); });
        if (typeof Sys !== 'undefined' && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                bindPasswordToggles(document);
            });
        }
    </script>
</asp:Content>
