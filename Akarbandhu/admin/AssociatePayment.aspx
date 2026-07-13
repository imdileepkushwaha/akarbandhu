<%@ Page Title="Associate Advance Payment" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="AssociatePayment.aspx.cs" Inherits="admin_ProjectAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentHeader" runat="Server">
  <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Associate Payment Advance</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentData" runat="Server">
     <div class="card">
                <div class="card-header">
                    <strong>Associate Advance Payment</strong>
                </div>

                <div class="card-body">
                        <div class="row  form-group">
                            <div class="col-md-3">
                                <label class="control-label">Associate Id</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtassociateid" CssClass="form-control" runat="server" AutoPostBack="True" OnTextChanged="txtassociateid_TextChanged"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label class="control-label">Associate Name</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtassociatename" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                   
                        <div class="row form-group">
                            <div class="col-md-3">
                                <label class="control-label">Amount</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtamount" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                             <div class="col-md-3">
                                <label class="control-label">Payment Date</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtpaymentdate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-3">
                                <label class="control-label">Payment Mode</label>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddpaymentmode" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem>Cash</asp:ListItem>
                                    <asp:ListItem Value="Cheque">Cheque/DD</asp:ListItem>
                                    <asp:ListItem Value="Online">Online Transaction</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                             <div class="col-md-3">
                                <label class="control-label">Transaction ID/Cheque No</label>   
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txttransactionid" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" OnClientClick="return validate();" Text="Submit" OnClick="btnSubmit_Click1" />

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



