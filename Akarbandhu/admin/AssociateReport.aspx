<%@ Page Title="Associate Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="AssociateReport.aspx.cs" Inherits="admin_UserReport" ValidateRequest="false" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Associate Report</a></li>
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
                    <h2>Associate Report</h2>
                    <p>Search, export and update associate records.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-filter"></i></span>
                        <div>
                            <h3>Search Criteria</h3>
                            <span>Filter associates by details and dates</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>Name</label>
                                <asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Mobile</label>
                                <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Email</label>
                                <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Associate Id</label>
                                <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>From Date</label>
                                <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>To Date</label>
                                <asp:TextBox ID="txttodate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Country</label>
                                <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Country</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>State</label>
                                <asp:DropDownList ID="ddstate" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select State</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>City</label>
                                <asp:TextBox ID="txtcityname" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Area</label>
                                <asp:DropDownList ID="ddarea" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Area</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        <asp:Button ID="btnExcel" CssClass="btn btn-excel" runat="server" Text="Excel" OnClick="btnExcel_Click" />
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-list"></i></span>
                        <div>
                            <h3>Associate List</h3>
                            <span>Matching associate records</span>
                        </div>
                    </div>
                    <div class="ab-section-body ab-section-body--flush">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table ab-table table-striped" AllowPaging="true" PageSize="40" OnPageIndexChanging="GridView1_PageIndexChanging" Width="100%" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Associate ID">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluserid" runat="server" Text='<%# Eval("Associateid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusername" runat="server" Text='<%# Eval("Associatename") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sponser Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsponserid" runat="server" Text='<%# Eval("sponserid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mobile">
                                        <ItemTemplate>
                                            <asp:Label ID="lblmobile" runat="server" Text='<%# Eval("mobile") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="City">
                                        <ItemTemplate>
                                            <asp:Label ID="lbladdress" runat="server" Text='<%# Eval("cityname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Level No">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllevelno" runat="server" Text='<%# Eval("levelno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Password">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpassword" runat="server" Text='<%# Eval("password") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldate" runat="server" Text='<%# Eval("mentiondate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Active Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblactivestatus" runat="server" Text='<%# Eval("activestatus") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbEdit" CssClass="ab-btn-edit" ToolTip="Edit" CommandName="edt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server">
                                                <i class="feather icon-edit-2"></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle Width="90px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <asp:UpdatePanel runat="server" ID="uplMaster" UpdateMode="Always">
        <ContentTemplate>
            <div id="myModal" class="modal fade ab-modal">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="ab-modal-head">
                                <span class="ab-modal-head-icon"><i class="feather icon-edit-2"></i></span>
                                <div>
                                    <h4 class="modal-title">Edit Associate</h4>
                                    <span class="ab-modal-sub">Update personal, network and bank details</span>
                                    <span class="ab-modal-id">ID: <asp:Label runat="server" ID="lbluseridedit"></asp:Label></span>
                                </div>
                            </div>
                            <button type="button" class="ab-modal-close" data-dismiss="modal" aria-label="Close">
                                <i class="feather icon-x"></i>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="ab-modal-section">
                                <h5 class="ab-modal-section-title"><i class="feather icon-user"></i> Personal Details</h5>
                                <div class="row">
                                    <div class="col-md-6 ab-field">
                                        <label>Name</label>
                                        <asp:TextBox ID="txtnameedit" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>Mobile</label>
                                        <asp:TextBox ID="txtmobileedit" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>Email</label>
                                        <asp:TextBox ID="txtemailedit" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>Gender</label>
                                        <asp:DropDownList ID="ddgenderedit" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                            <asp:ListItem Value="Male">Male</asp:ListItem>
                                            <asp:ListItem Value="Female">Female</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>Date of Birth</label>
                                        <asp:TextBox ID="txtdateofbirthedit" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>Age</label>
                                        <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12 ab-field">
                                        <label>Address</label>
                                        <asp:TextBox ID="txtaddressedit" TextMode="MultiLine" Rows="2" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="ab-modal-section">
                                <h5 class="ab-modal-section-title"><i class="feather icon-map-pin"></i> Location &amp; KYC</h5>
                                <div class="row">
                                    <div class="col-md-6 ab-field">
                                        <label>Country</label>
                                        <asp:DropDownList ID="ddcountryedit" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountryedit_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Select Country</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>State</label>
                                        <asp:DropDownList ID="ddstateedit" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select State</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>City</label>
                                        <asp:TextBox ID="txtcitynamedit" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>Pincode</label>
                                        <asp:TextBox ID="txtpincodeedit" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>Aadhaar Number</label>
                                        <asp:TextBox ID="txtadhar" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>PAN Number</label>
                                        <asp:TextBox ID="txtpancard" CssClass="form-control" autocomplete="off" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="ab-modal-section">
                                <h5 class="ab-modal-section-title"><i class="feather icon-layers"></i> Network</h5>
                                <div class="row">
                                    <div class="col-md-6 ab-field">
                                        <label>Level</label>
                                        <asp:DropDownList ID="ddleveledit" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>Team Name</label>
                                        <asp:TextBox ID="txtteamname" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>Sr. President Name</label>
                                        <asp:TextBox ID="txtsrpresident" CssClass="form-control" autocomplete="off" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="ab-modal-section">
                                <h5 class="ab-modal-section-title"><i class="feather icon-heart"></i> Nominee</h5>
                                <div class="row">
                                    <div class="col-md-6 ab-field">
                                        <label>Nominee Name</label>
                                        <asp:TextBox ID="txtnomineenameedit" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>Nominee Age</label>
                                        <asp:TextBox ID="txtagenomineedit" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>Nominee Relation</label>
                                        <asp:TextBox ID="TxtNomineerelatioedit" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="ab-modal-section">
                                <h5 class="ab-modal-section-title"><i class="feather icon-credit-card"></i> Bank Detail</h5>
                                <div class="row">
                                    <div class="col-md-6 ab-field">
                                        <label>Bank Name</label>
                                        <asp:DropDownList ID="DDBANK" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Bank</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>IFSC Code</label>
                                        <asp:TextBox ID="txtIFSCEdit" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>Account Number</label>
                                        <asp:TextBox ID="txtaccountedit" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="ab-modal-section">
                                <h5 class="ab-modal-section-title"><i class="feather icon-image"></i> Profile Image</h5>
                                <div class="row">
                                    <div class="col-md-12 ab-field">
                                        <div class="ab-file">
                                            <div class="ab-file-preview"><i class="feather icon-image"></i></div>
                                            <div class="ab-file-main">
                                                <span class="ab-file-title">Update image</span>
                                                <span class="ab-file-hint">JPG or PNG recommended</span>
                                                <label class="ab-file-pick">
                                                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="ab-file-input" />
                                                    <span class="ab-file-btn"><i class="feather icon-upload"></i> Choose file</span>
                                                    <span class="ab-file-name">No file selected</span>
                                                </label>
                                                <asp:Label ID="lblimagename" Visible="false" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update Associate" OnClientClick="return validate2();" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUpdate" />
        </Triggers>
    </asp:UpdatePanel>
    <script type="text/javascript">
        function validate2() {
            if (document.getElementById("<%=txtnameedit.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Name');
                document.getElementById("<%=txtnameedit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtmobileedit.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Mobile');
                document.getElementById("<%=txtmobileedit.ClientID%>").focus();
                return false;
            }
        }
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
