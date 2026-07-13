<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="usermaster.master" AutoEventWireup="true" CodeFile="UserEdit.aspx.cs" Inherits="admin_UserEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="assets/css/ab-edit.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Edit Profile</a></li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentData" Runat="Server">
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
            <div class="ab-edit">

                <div class="ab-page-head">
                    <div>
                        <h2>Edit Profile</h2>
                        <p>Update your contact, location and bank information.</p>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-user"></i></span>
                        <div>
                            <h3>Personal Details</h3>
                            <span>Basic identity and contact information</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Sponsor Id</label>
                                <asp:TextBox ID="txtsponserid" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                <span class="hint">Locked field</span>
                            </div>
                            <div class="col-md-6 ab-field" style="display:none;">
                                <label>Sponsor Name</label>
                                <asp:TextBox ID="txtsponsername" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Name</label>
                                <asp:TextBox ID="txtname" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                <span class="hint">Locked field</span>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Mobile</label>
                                <asp:TextBox ID="txtmobile" Enabled="false" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                <span class="hint">Locked field</span>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Email <span class="req">*</span></label>
                                <asp:TextBox ID="txtemail" CssClass="form-control" placeholder="Enter email address" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-12 ab-field">
                                <label>Address <span class="req">*</span></label>
                                <asp:TextBox ID="txtaddress" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="Enter full address" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Country <span class="req">*</span></label>
                                <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Country</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>State <span class="req">*</span></label>
                                <asp:DropDownList ID="ddstate" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select State</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>City <span class="req">*</span></label>
                                <asp:TextBox ID="txtcityname" CssClass="form-control" placeholder="Enter city" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-credit-card"></i></span>
                        <div>
                            <h3>Bank Details</h3>
                            <span>Account and KYC related information</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>A/c Holder Name</label>
                                <asp:TextBox ID="txtaccountholdername" CssClass="form-control" placeholder="Account holder name" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>A/c No</label>
                                <asp:TextBox ID="txtaccountno" CssClass="form-control" placeholder="Account number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>IFSC Code</label>
                                <asp:TextBox ID="txtifsccode" CssClass="form-control" placeholder="IFSC code" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>PAN Number</label>
                                <asp:TextBox ID="txtpan" CssClass="form-control" placeholder="PAN number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Bank</label>
                                <asp:DropDownList ID="ddbank" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Branch</label>
                                <asp:TextBox ID="txtbranchname" CssClass="form-control" placeholder="Branch name" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section" style="margin-bottom:0;">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-lock"></i></span>
                        <div>
                            <h3>Confirm &amp; Save</h3>
                            <span>Enter password to verify and update profile</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field ab-password-narrow" style="margin-bottom:0;">
                                <label>Password <span class="req">*</span></label>
                                <div class="ab-password">
                                    <asp:TextBox ID="txtuserpassword" TextMode="Password" CssClass="form-control" placeholder="Enter current password" runat="server" autocomplete="current-password"></asp:TextBox>
                                    <button type="button" class="ab-password-toggle" data-target="<%= txtuserpassword.ClientID %>" aria-label="Show password" title="Show / hide">
                                        <i class="feather icon-eye"></i>
                                    </button>
                                </div>
                                <span class="hint">OTP will be sent after password verification</span>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Save Changes" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                        <span class="ab-note">Changes apply after OTP confirmation</span>
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
                                <label for="<%= txtotp.ClientID %>">OTP</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtotp" placeholder="Enter OTP sent to your mobile"></asp:TextBox>
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
            if (document.getElementById("<%=txtsponserid.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Sponser Id');
                document.getElementById("<%=txtsponserid.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtname.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Name');
                document.getElementById("<%=txtname.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtmobile.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Mobile');
                document.getElementById("<%=txtmobile.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtemail.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Email');
                document.getElementById("<%=txtemail.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtaddress.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Address');
                document.getElementById("<%=txtaddress.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddcountry.ClientID%>").value == "0") {
                toastr.warning('Warning', 'Select Country');
                document.getElementById("<%=ddcountry.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddstate.ClientID%>").value == "0") {
                toastr.warning('Warning', 'Select State');
                document.getElementById("<%=ddstate.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtcityname.ClientID%>").value == "0" || document.getElementById("<%=txtcityname.ClientID%>").value == "") {
                toastr.warning('Warning', 'Select City');
                document.getElementById("<%=txtcityname.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtuserpassword.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Password');
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
