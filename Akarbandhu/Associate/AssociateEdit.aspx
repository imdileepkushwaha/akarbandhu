<%@ Page Title="Edit Associate Details" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="AssociateEdit.aspx.cs" Inherits="admin_UserEdit" %>

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
                <div class="center2">
                    <img alt="" src="loader.gif" />
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
                        <p>Update your contact, location, bank details and profile photo.</p>
                    </div>
                </div>

                <!-- Personal -->
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

                <!-- Bank -->
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

                <!-- Photo + Actions -->
                <div class="ab-section" style="margin-bottom:0;">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-image"></i></span>
                        <div>
                            <h3>Profile Photo</h3>
                            <span>Upload a clear photo for your associate profile</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="ab-upload">
                            <span class="ab-upload-icon"><i class="feather icon-upload"></i></span>
                            <div class="ab-upload-meta">
                                <strong>Choose image file</strong>
                                <span>JPG, PNG recommended</span>
                            </div>
                            <div>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                <asp:Label ID="lblimagename" Visible="false" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success" runat="server" Text="Save Changes" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                        <span class="ab-note">OTP confirmation may be required after save</span>
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
    <asp:UpdatePanel runat="server" ID="uplMaster">
        <ContentTemplate>
            <div id="myModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Verify OTP</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group ab-field" style="margin-bottom:0;">
                                <label for="<%= txtotp.ClientID %>">Enter OTP</label>
                                <asp:TextBox runat="server" class="form-control" ID="txtotp" placeholder="Enter OTP sent to your mobile"></asp:TextBox>
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
