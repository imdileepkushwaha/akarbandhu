<%@ Page Title="Change Password" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="admin_NewMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="assets/css/ab-forms.css" />
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
                    <p>Update your admin login password. Keep it strong and private.</p>
                </div>

                <div class="ab-section ab-section--flush ab-password-narrow">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-lock"></i></span>
                        <div>
                            <h3>Password Details</h3>
                            <span>Old password is required to set a new one</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="ab-field">
                            <label>Old Password</label>
                            <div class="ab-password">
                                <asp:TextBox ID="txtoldpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Enter current password" autocomplete="current-password"></asp:TextBox>
                                <button type="button" class="ab-password-toggle" data-toggle-password aria-label="Show password">
                                    <i class="feather icon-eye"></i>
                                </button>
                            </div>
                        </div>
                        <div class="ab-field">
                            <label>New Password</label>
                            <div class="ab-password">
                                <asp:TextBox ID="txtnewpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Enter new password" autocomplete="new-password"></asp:TextBox>
                                <button type="button" class="ab-password-toggle" data-toggle-password aria-label="Show password">
                                    <i class="feather icon-eye"></i>
                                </button>
                            </div>
                        </div>
                        <div class="ab-field" style="margin-bottom:0;">
                            <label>Confirm Password</label>
                            <div class="ab-password">
                                <asp:TextBox ID="txtconfirmpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Re-enter new password" autocomplete="new-password"></asp:TextBox>
                                <button type="button" class="ab-password-toggle" data-toggle-password aria-label="Show password">
                                    <i class="feather icon-eye"></i>
                                </button>
                            </div>
                            <span class="hint">New password and confirm password must match</span>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success" runat="server" Text="Update Password" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click" />
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

        (function () {
            function bindPasswordToggles(root) {
                var scope = root || document;
                scope.querySelectorAll('[data-toggle-password]').forEach(function (btn) {
                    if (btn._abPassBound) return;
                    btn._abPassBound = true;
                    btn.addEventListener('click', function () {
                        var wrap = btn.closest('.ab-password');
                        if (!wrap) return;
                        var input = wrap.querySelector('input');
                        var icon = btn.querySelector('i');
                        if (!input) return;
                        var show = input.type === 'password';
                        input.type = show ? 'text' : 'password';
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
        })();
    </script>
</asp:Content>
