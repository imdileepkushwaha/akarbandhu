<%@ Page Title="Installment Plan Booking" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="IPBooking.aspx.cs" Inherits="admin_UserAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Installment Booking</a></li>
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
                    <h2>Installment Plan Booking</h2>
                    <p>Create a new installment plan booking for a customer.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-calendar"></i></span>
                        <div>
                            <h3>Booking &amp; Customer</h3>
                            <span>Date and customer details</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>Booking Date</label>
                                <asp:TextBox ID="txtbookingdate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Customer Id</label>
                                <asp:TextBox ID="txtuserid" AutoPostBack="true" OnTextChanged="txtuserid_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Customer Name</label>
                                <asp:TextBox ID="txtusername" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Sponser Id</label>
                                <asp:TextBox ID="txtsponserid" Enabled="false" CssClass="form-control" runat="server" AutoPostBack="True" OnTextChanged="txtsponserid_TextChanged"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Sponser Name</label>
                                <asp:TextBox ID="txtsponsername" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Mobile</label>
                                <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Email</label>
                                <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-map"></i></span>
                        <div>
                            <h3>Project &amp; Plot</h3>
                            <span>Select project, block, plot and plan</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>Select Project</label>
                                <asp:DropDownList ID="ddproject" AutoPostBack="true" OnSelectedIndexChanged="ddproject_SelectedIndexChanged" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Project</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Block Name</label>
                                <asp:DropDownList ID="ddblock" AutoPostBack="true" OnTextChanged="ddblock_TextChanged" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Block</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Select Plot</label>
                                <asp:DropDownList ID="ddplot" AutoPostBack="true" OnSelectedIndexChanged="ddplot_SelectedIndexChanged" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Plot</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Select Plan</label>
                                <asp:DropDownList ID="ddplan" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddplan_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Plan</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="lblbookingamount" Visible="false" runat="server" Text="0"></asp:Label>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Landarea (sqft)</label>
                                <asp:TextBox ID="txtlandarea" CssClass="form-control" Enabled="false" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-pocket"></i></span>
                        <div>
                            <h3>Amounts</h3>
                            <span>Plot, booking and installment amounts</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>Amount (per sqft)</label>
                                <asp:TextBox ID="txtlandamount" AutoPostBack="true" OnTextChanged="txtlandamount_TextChanged" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Plot Amount</label>
                                <asp:TextBox ID="txtplotamount" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtplotamount_TextChanged" Enabled="false" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Booking Amount</label>
                                <asp:TextBox ID="txtbookingamount" CssClass="form-control" onkeypress="return isNumberKey(event);" AutoPostBack="true" OnTextChanged="txtbookingamount_TextChanged" runat="server"></asp:TextBox>
                                <asp:Label ID="lblterms" runat="server" Visible="false" Text="0"></asp:Label>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Other Charges</label>
                                <asp:TextBox ID="txtothercharge" AutoPostBack="true" OnTextChanged="txtothercharge_TextChanged" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Total Amount</label>
                                <asp:TextBox ID="txttotalamount" Enabled="false" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Total Inst.</label>
                                <asp:TextBox ID="txtttoalinst" Enabled="false" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Inst. Amt.</label>
                                <asp:TextBox ID="txtinstamount" Enabled="false" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Paid Amount</label>
                                <asp:TextBox ID="txtpaidamount" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-heart"></i></span>
                        <div>
                            <h3>Nominee</h3>
                            <span>Nominee details for the booking</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Nominee Name</label>
                                <asp:TextBox ID="txtnomineename" CssClass="form-control" runat="server"></asp:TextBox>
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
                        <span class="ab-section-icon"><i class="feather icon-credit-card"></i></span>
                        <div>
                            <h3>Payment Details</h3>
                            <span>Payment mode and transaction info</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>Payment Mode</label>
                                <asp:DropDownList ID="ddpaymentmode" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddpaymentmode_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem>Cash</asp:ListItem>
                                    <asp:ListItem Value="Cheque">Cheque/DD</asp:ListItem>
                                    <asp:ListItem Value="Online">Online Transaction</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div id="ChequeDetail" runat="server" visible="false">
                            <div class="row">
                                <div class="col-md-4 ab-field">
                                    <label>Cheque No</label>
                                    <asp:TextBox ID="txtchequeno" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4 ab-field">
                                    <label>Cheque Date</label>
                                    <asp:TextBox ID="txtchequedate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4 ab-field">
                                    <label>Bank Name</label>
                                    <asp:TextBox ID="txtbankname" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4 ab-field">
                                    <label>Branch Name</label>
                                    <asp:TextBox ID="txtbranchname" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>Transaction ID</label>
                                <asp:TextBox ID="txtonlinetransactionid" CssClass="form-control" runat="server"></asp:TextBox>
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
            if (document.getElementById("<%=txtbookingdate.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Booking Date');
                document.getElementById("<%=txtbookingdate.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtuserid.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Customer Id');
                document.getElementById("<%=txtuserid.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtusername.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Name');
                document.getElementById("<%=txtusername.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtmobile.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Mobile');
                document.getElementById("<%=txtmobile.ClientID%>").focus();
                return false;
            }
        }
    </script>
</asp:Content>
