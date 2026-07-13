<%@ Page Title="Add Associate" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="AssociateAdd.aspx.cs" Inherits="admin_UserAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Add Associate</a></li>
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
                    <h2>Add Associate</h2>
                    <p>Register a new associate with personal, sponsor, nominee and login details.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-user"></i></span>
                        <div>
                            <h3>Personal Details</h3>
                            <span>Basic associate information</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row" style="display: none;">
                            <div class="col-md-6 ab-field">
                                <asp:TextBox ID="lable2" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Name</label>
                                <asp:TextBox ID="txtname" oninput="this.value = this.value.toUpperCase()" CssClass="form-control" runat="server"></asp:TextBox>
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
                                <label>S/o, D/o, W/o</label>
                                <asp:TextBox ID="txtfathername" oninput="this.value = this.value.toUpperCase()" CssClass="form-control" runat="server" placeholder="As per bank account"></asp:TextBox>
                                <span class="hint">Use capital letters as per bank account</span>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Date Of Birth</label>
                                <asp:TextBox ID="txtdateofbirth" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Age</label>
                                <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Occupation</label>
                                <asp:TextBox ID="txtlandmark" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Mobile No.</label>
                                <asp:TextBox ID="txtmobile" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Email</label>
                                <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-12 ab-field">
                                <label>Address</label>
                                <asp:TextBox ID="txtaddress" oninput="this.value = this.value.toUpperCase()" TextMode="MultiLine" Rows="2" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-shield"></i></span>
                        <div>
                            <h3>KYC</h3>
                            <span>PAN and Aadhaar details</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>PAN Card No.</label>
                                <asp:TextBox ID="txtpanno" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Aadhaar Card No.</label>
                                <asp:TextBox ID="txtadhar" CssClass="form-control" runat="server" MaxLength="12"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-users"></i></span>
                        <div>
                            <h3>Sponsor &amp; Level</h3>
                            <span>Network placement details</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row" style="display: none;">
                            <div class="col-md-6 ab-field">
                                <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Country</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6 ab-field">
                                <asp:DropDownList ID="ddstate" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select State</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Sponsor Id</label>
                                <asp:TextBox ID="txtsponserid" AutoPostBack="true" OnTextChanged="txtsponserid_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Sponsor Name</label>
                                <asp:TextBox ID="txtsponsername" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Level</label>
                                <asp:DropDownList ID="ddlevel" CssClass="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlevel_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Rank</label>
                                <asp:TextBox ID="txtIncome" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Team Name</label>
                                <asp:TextBox ID="txtteamname" autocomplete="off" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Sr. President Name</label>
                                <asp:TextBox ID="txtsrpresident" CssClass="form-control" autocomplete="off" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-heart"></i></span>
                        <div>
                            <h3>Nominee Details</h3>
                            <span>Optional nominee information</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Nominee Name</label>
                                <asp:TextBox ID="txtnomineename" oninput="this.value = this.value.toUpperCase()" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Nominee Age</label>
                                <asp:TextBox ID="txtnomineenameAge" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Relationship</label>
                                <asp:TextBox ID="txtnomineerelation" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-lock"></i></span>
                        <div>
                            <h3>Login &amp; Photo</h3>
                            <span>Password and profile image</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Password</label>
                                <asp:TextBox ID="txtuserpassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Confirm Password</label>
                                <asp:TextBox ID="txtconfirmpassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-8 ab-field">
                                <label>Upload Image</label>
                                <div class="ab-file">
                                    <div class="ab-file-preview"><i class="feather icon-image"></i></div>
                                    <div class="ab-file-main">
                                        <span class="ab-file-title">Profile image</span>
                                        <span class="ab-file-hint">JPG or PNG recommended</span>
                                        <label class="ab-file-pick">
                                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="ab-file-input" />
                                            <span class="ab-file-btn"><i class="feather icon-upload"></i> Choose file</span>
                                            <span class="ab-file-name">No file selected</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" CausesValidation="false" />
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
            if (document.getElementById("<%=ddlevel.ClientID%>").value == "0") {
                toastr.warning('Warning', 'Select level');
                document.getElementById("<%=ddlevel.ClientID%>").focus();
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
            if (document.getElementById("<%=txtadhar.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Adhar Number');
                document.getElementById("<%=txtadhar.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=FileUpload1.ClientID%>").value != "") {
                var v = document.getElementById("<%=FileUpload1.ClientID%>").value.toLowerCase();
                if (!(v.endsWith(".jpg") || v.endsWith(".png") || v.endsWith(".jpeg"))) {
                    toastr.warning('Warning', 'Image should be in .jpg or .jpeg or .png format');
                    document.getElementById("<%=FileUpload1.ClientID%>").focus();
                    return false;
                }
            }
        }
    </script>
</asp:Content>
