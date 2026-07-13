<%@ Page Title="Add Fund Request" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="FundRequestAdd.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Add Fund Request</a></li>
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
                    <h2>Add Fund Request</h2>
                    <p>Submit a new fund deposit request with payment details.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-credit-card"></i></span>
                        <div>
                            <h3>Deposit Account Details</h3>
                            <span>Select the bank account for your deposit</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Select Deposit Account</label>
                                <asp:DropDownList ID="ddbankaccountno" AutoPostBack="true" OnSelectedIndexChanged="ddbankaccountno_SelectedIndexChanged" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Account No</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Deposit Account No</label>
                                <asp:TextBox ID="txtdepositaccountno" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Account Holder Name</label>
                                <asp:TextBox ID="txtaccountholdername" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Deposit Bank</label>
                                <asp:TextBox ID="txtdepositbank" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>IFSC Code</label>
                                <asp:TextBox ID="txtifsccode" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Branch Name</label>
                                <asp:TextBox ID="txtbranchname" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-user"></i></span>
                        <div>
                            <h3>User Details</h3>
                            <span>Your account information</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>User Id</label>
                                <asp:TextBox ID="txtuserid" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>User Name</label>
                                <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-clipboard"></i></span>
                        <div>
                            <h3>Payment Details</h3>
                            <span>Enter transaction and payment information</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Payment Mode</label>
                                <asp:DropDownList ID="ddpaymentmode" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Mode</asp:ListItem>
                                    <asp:ListItem>NEFT</asp:ListItem>
                                    <asp:ListItem>RTGS</asp:ListItem>
                                    <asp:ListItem>Cheque</asp:ListItem>
                                    <asp:ListItem>IMPS</asp:ListItem>
                                    <asp:ListItem>Cash Deposit</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Amount</label>
                                <asp:TextBox ID="txtamount" onkeypress="return isNumber(event)" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Transaction Id</label>
                                <asp:TextBox ID="txttransactionid" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Cheque No</label>
                                <asp:TextBox ID="txtchequeno" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Mobile No(In Bank)</label>
                                <asp:TextBox ID="txtmobilenoinbank" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Remark</label>
                                <asp:TextBox ID="txtremark" runat="server" TextMode="MultiLine" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" OnClick="btnCancel_Click1" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=ddbankaccountno.ClientID%>").value == "0") {
                toastr.warning('Warning', 'Select Bank Account');
                document.getElementById("<%=ddbankaccountno.ClientID%>").focus();
                   return false;
            }
            if (document.getElementById("<%=txtdepositaccountno.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Account No');
                document.getElementById("<%=txtdepositaccountno.ClientID%>").focus();
                   return false;
               }
            if (document.getElementById("<%=txtamount.ClientID%>").value == "") {
                   toastr.warning('Warning', 'Enter Amount');
                   document.getElementById("<%=txtamount.ClientID%>").focus();
                   return false;
            }
            if (document.getElementById("<%=ddpaymentmode.ClientID%>").value == "0") {
                toastr.warning('Warning', 'Select Payment Mode');
                document.getElementById("<%=ddpaymentmode.ClientID%>").focus();
                return false;
            }
           }

    </script>
</asp:Content>
