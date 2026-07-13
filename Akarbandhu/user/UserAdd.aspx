<%@ Page Title="Add User" Language="C#" MasterPageFile="usermaster.master" AutoEventWireup="true" CodeFile="UserAdd.aspx.cs" Inherits="admin_UserAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="assets/css/ab-edit.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Add User</a></li>
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
            <div class="ab-edit">

                <div class="ab-page-head">
                    <div>
                        <h2>Add User</h2>
                        <p>Register a new user under your sponsor network.</p>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-user"></i></span>
                        <div>
                            <h3>Personal Details</h3>
                            <span>Sponsor, placement and basic information</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Sponser Id</label>
                                <asp:TextBox ID="txtsponserid" AutoPostBack="true" OnTextChanged="txtsponserid_TextChanged" CssClass="form-control" runat="server" placeholder="Enter sponsor id"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Sponser Name</label>
                                <asp:TextBox ID="txtsponsername" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Standing Position</label>
                                <asp:RadioButtonList ID="rbstandingposition" RepeatDirection="Horizontal" runat="server">
                                    <asp:ListItem Selected="True">Left</asp:ListItem>
                                    <asp:ListItem>Right</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Name</label>
                                <asp:TextBox ID="txtname" CssClass="form-control" runat="server" placeholder="Enter full name"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Mobile</label>
                                <asp:TextBox ID="txtmobile" MaxLength="10" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" placeholder="10-digit mobile"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Email</label>
                                <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" placeholder="Enter email address"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Gender</label>
                                <asp:DropDownList ID="ddgender" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Date of Birth</label>
                                <asp:TextBox ID="txtdateofbirth" CssClass="form-control form_date" autocomplete="off" runat="server" placeholder="DD/MM/YYYY"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Pan No</label>
                                <asp:TextBox ID="txtpanno" CssClass="form-control" runat="server" placeholder="PAN number"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-map-pin"></i></span>
                        <div>
                            <h3>Contact &amp; Location</h3>
                            <span>Address and location details</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-12 ab-field">
                                <label>Address</label>
                                <asp:TextBox ID="txtaddress" TextMode="MultiLine" Rows="3" CssClass="form-control" runat="server" placeholder="Enter full address"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Country</label>
                                <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Country</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>State</label>
                                <asp:DropDownList ID="ddstate" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select State</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>City</label>
                                <asp:TextBox ID="txtcityname" CssClass="form-control" runat="server" placeholder="Enter city"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Area Name</label>
                                <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server" placeholder="Area / locality"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Landmark</label>
                                <asp:TextBox ID="txtlandmark" CssClass="form-control" runat="server" placeholder="Nearby landmark"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Pincode</label>
                                <asp:TextBox ID="txtpincode" MaxLength="6" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" placeholder="6-digit pincode"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-lock"></i></span>
                        <div>
                            <h3>Security &amp; Password</h3>
                            <span>Set login credentials for the new user</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field ab-password-narrow">
                                <label>Password</label>
                                <div class="ab-password">
                                    <asp:TextBox ID="txtuserpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Enter password" autocomplete="new-password"></asp:TextBox>
                                    <button type="button" class="ab-password-toggle" data-target="<%= txtuserpassword.ClientID %>" aria-label="Show password" title="Show / hide">
                                        <i class="feather icon-eye"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-6 ab-field ab-password-narrow">
                                <label>Confirm Password</label>
                                <div class="ab-password">
                                    <asp:TextBox ID="txtconfirmpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Confirm password" autocomplete="new-password"></asp:TextBox>
                                    <button type="button" class="ab-password-toggle" data-target="<%= txtconfirmpassword.ClientID %>" aria-label="Show password" title="Show / hide">
                                        <i class="feather icon-eye"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section" style="margin-bottom:0;">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-image"></i></span>
                        <div>
                            <h3>Photo Upload</h3>
                            <span>Profile image for the new user</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-8 ab-field" style="margin-bottom:0;">
                                <label>Upload Image</label>
                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                <span class="hint">Optional — JPG, JPEG or PNG format</span>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                    </div>
                </div>

            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">

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
           <%-- if (document.getElementById("<%=ddepin.ClientID%>").value == "0") {
                toastr.warning('Warning', 'Select E Pin');
                document.getElementById("<%=ddepin.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddplan.ClientID%>").value == "0") {
                toastr.warning('Warning', 'Select Plan');
                document.getElementById("<%=ddplan.ClientID%>").focus();
                return false;
            }--%>
            if (document.getElementById("<%=txtmobile.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Mobile');
                document.getElementById("<%=txtmobile.ClientID%>").focus();
                return false;
            }


            if (document.getElementById("<%=txtuserpassword.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Password');
                document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtconfirmpassword.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Confirm Password');
                document.getElementById("<%=txtconfirmpassword.ClientID%>").focus();
                return false;
            }

            if (document.getElementById("<%=FileUpload1.ClientID%>").value != "") {

                if (document.getElementById("<%=FileUpload1.ClientID%>").value.endsWith(".jpg") || document.getElementById("<%=FileUpload1.ClientID%>").value.endsWith(".png") || document.getElementById("<%=FileUpload1.ClientID%>").value.endsWith(".jpeg")) {
                }
                else {
                    toastr.warning('Warning', 'Image  should be in .jpg or .jpeg or .png format');
                    document.getElementById("<%=FileUpload1.ClientID%>").focus();
                    return false;
                }
            }
            if (document.getElementById("<%=txtuserpassword.ClientID%>").value != document.getElementById("<%=txtconfirmpassword.ClientID%>").value) {
                toastr.warning('Warning', 'Password Not Match');
                document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                return false;
            }
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
