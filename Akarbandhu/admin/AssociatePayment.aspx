<%@ Page Title="Associate Advance Payment" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="AssociatePayment.aspx.cs" Inherits="admin_ProjectAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Associate Payment Advance</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentData" runat="Server">
    <div class="ab-wm">
        <div class="ab-page-head">
            <h2>Associate Advance Payment</h2>
            <p>Record advance payment for an associate.</p>
        </div>

        <div class="ab-section">
            <div class="ab-section-head">
                <span class="ab-section-icon"><i class="feather icon-credit-card"></i></span>
                <div>
                    <h3>Payment Details</h3>
                    <span>Enter associate and payment information</span>
                </div>
            </div>
            <div class="ab-section-body">
                <div class="row">
                    <div class="col-md-6 ab-field">
                        <label>Associate Id</label>
                        <asp:TextBox ID="txtassociateid" CssClass="form-control" runat="server" AutoPostBack="True" OnTextChanged="txtassociateid_TextChanged"></asp:TextBox>
                    </div>
                    <div class="col-md-6 ab-field">
                        <label>Associate Name</label>
                        <asp:TextBox ID="txtassociatename" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 ab-field">
                        <label>Amount</label>
                        <asp:TextBox ID="txtamount" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 ab-field">
                        <label>Payment Date</label>
                        <asp:TextBox ID="txtpaymentdate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 ab-field">
                        <label>Payment Mode</label>
                        <asp:DropDownList ID="ddpaymentmode" CssClass="form-control" runat="server">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                            <asp:ListItem>Cash</asp:ListItem>
                            <asp:ListItem Value="Cheque">Cheque/DD</asp:ListItem>
                            <asp:ListItem Value="Online">Online Transaction</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6 ab-field">
                        <label>Transaction ID/Cheque No</label>
                        <asp:TextBox ID="txttransactionid" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="ab-actions">
                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" OnClientClick="return validate();" Text="Submit" OnClick="btnSubmit_Click1" />
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtassociateid.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Associate Id');
                document.getElementById("<%=txtassociateid.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtamount.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Amount');
                document.getElementById("<%=txtamount.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtpaymentdate.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Payment Date');
                document.getElementById("<%=txtpaymentdate.ClientID%>").focus();
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
