<%@ Page Title="Withdrawl Request" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="WithdrawlRequstAdd.aspx.cs" Inherits="user_WithdrawlRequstAdd" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Add Withdrawal Request</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modal2">
                <div class="center2 ab-ajax-loader">
                    <div class="ab-spinner"></div>
                    <span class="ab-ajax-loader-text">Please wait…</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Withdrawal Request</h2>
                    <p>Request a payout from your available balance.</p>
                </div>

                <asp:Panel ID="Panel1" Visible="false" runat="server">
                    <div class="ab-section">
                        <div class="ab-section-head">
                            <span class="ab-section-icon"><i class="feather icon-alert-triangle"></i></span>
                            <div>
                                <h3>Maintenance</h3>
                                <span>Withdrawal temporarily unavailable</span>
                            </div>
                        </div>
                        <div class="ab-section-body">
                            <p style="margin:0;color:#b42318;font-weight:600;">Due to maintenance, withdrawl request can not be processed right now</p>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlwithdrawl" runat="server">
                    <div class="ab-section" style="margin-bottom:0;">
                        <div class="ab-section-head">
                            <span class="ab-section-icon"><i class="feather icon-credit-card"></i></span>
                            <div>
                                <h3>Request Details</h3>
                                <span>Enter amount against your available balance</span>
                            </div>
                        </div>
                        <div class="ab-section-body">
                            <div class="row">
                                <div class="col-md-6 ab-field">
                                    <label>Associate Id</label>
                                    <asp:TextBox ID="txtuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txtuserid_TextChanged" />
                                </div>
                                <div class="col-md-6 ab-field">
                                    <label>Associate Name</label>
                                    <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />
                                </div>
                                <div class="col-md-6 ab-field">
                                    <label>Available Balance</label>
                                    <asp:TextBox ID="txtbalance" Enabled="false" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" />
                                </div>
                                <div class="col-md-6 ab-field">
                                    <label>Enter Amount</label>
                                    <asp:TextBox ID="txtamount" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" />
                                </div>
                            </div>
                            <p class="hint" style="margin:0;color:#b42318;font-weight:600;">Note : Withdrawl amount will be credited in your bank account within 1 to 6 days.</p>
                            <%--  <div class="row">
                                    <div class="col-md-12" style="color:red;"><h3>Note : 15 % admin & transaction charge will deduct from your withdrawl amount</h3></div>
                                   
                                </div>--%>
                        </div>
                        <div class="ab-actions">
                            <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlnotelegible" Visible="false" runat="server">
                    <div class="ab-section">
                        <div class="ab-section-head">
                            <span class="ab-section-icon"><i class="feather icon-slash"></i></span>
                            <div>
                                <h3>Not Eligible</h3>
                                <span>Withdrawal request cannot be submitted</span>
                            </div>
                        </div>
                        <div class="ab-section-body">
                            <p style="margin:0;color:#b42318;font-weight:600;">
                                <asp:Label ID="lblerrormsg" runat="server" Text="You are not elegible. Please sponser new id or topup any old id"></asp:Label>
                            </p>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlpool" Visible="false" runat="server">
                    <div class="ab-section">
                        <div class="ab-section-head">
                            <span class="ab-section-icon"><i class="feather icon-layers"></i></span>
                            <div>
                                <h3>Pool Requirement</h3>
                                <span>Complete pool eligibility first</span>
                            </div>
                        </div>
                        <div class="ab-section-body">
                            <p style="margin:0;color:#b42318;font-weight:600;">You can add withdrawl request only after reaching Pool 2</p>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">   
 
    <script type="text/javascript">
        function validate() {
        <%--    if (document.getElementById("<%=txtoldpassword.ClientID%>").value == "") {

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
            }--%>
          
        }
    </script>
</asp:Content>
