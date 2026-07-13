<%@ Page Title="Wallet Transfer" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="WalletTransfer2.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Wallet Transfer</a></li>
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
            <div class="ab-wm">
                <div class="ab-page-head" style="display:flex;flex-wrap:wrap;align-items:flex-end;justify-content:space-between;gap:0.85rem;margin-bottom:1.15rem;">
                    <div>
                        <h2>Wallet Transfer</h2>
                        <p>Transfer funds to another user account.</p>
                    </div>
                    <div class="ab-pay-summary-item ab-pay-summary-item--accent" style="margin:0;min-width:180px;">
                        <span>Available Balance</span>
                        <strong><i class="fas fa-rupee-sign" aria-hidden="true"></i> <asp:Label ID="lbluserbalance" runat="server" Text="Label"></asp:Label></strong>
                    </div>
                </div>

                <div class="ab-section" style="margin-bottom:0;">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-corner-up-right"></i></span>
                        <div>
                            <h3>Transfer Details</h3>
                            <span>Enter recipient and amount to transfer</span>
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
                            <div class="col-md-6 ab-field">
                                <label>Transfer User Id</label>
                                <asp:TextBox ID="txttransferuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txttransferuserid_TextChanged" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Transfer User Name</label>
                                <asp:TextBox ID="txttransferusername" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Amount</label>
                                <asp:TextBox ID="txtamount" onchange="gettotal();" onkeypress="return isNumber(event)" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Admin &amp; Transaction Charge (5%)</label>
                                <asp:TextBox ID="txtadmincharge" ReadOnly="true" onkeypress="return isNumber(event)" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Total Amount</label>
                                <asp:TextBox ID="txttotalamount" ReadOnly="true" onkeypress="return isNumber(event)" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Remark</label>
                                <asp:TextBox ID="txtremark" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
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
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
    <script type="text/javascript">

        function validate() {

            if (document.getElementById("<%=txttransferuserid.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter User Id');
                document.getElementById("<%=txttransferusername.Text%>").focus();
                return false;
            }
            if (document.getElementById("<%=txttransferusername.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter User Name');
                document.getElementById("<%=txttransferusername.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtamount.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Amount');
                document.getElementById("<%=txtamount.ClientID%>").focus();
                return false;
            }
        }
        function gettotal() {

            var amount = 0, admincharge = 0, totalamount = 0;
            if (document.getElementById("<%=txtamount.ClientID%>").value != "") {
                amount = document.getElementById("<%=txtamount.ClientID%>").value;
            }
            admincharge = (parseFloat(amount) * parseFloat(5)) / 100;
            document.getElementById("<%=txtadmincharge.ClientID%>").value = admincharge;


            totalamount = parseFloat(amount) + parseFloat(admincharge);
            document.getElementById("<%=txttotalamount.ClientID%>").value = totalamount;
        }
    </script>
</asp:Content>
