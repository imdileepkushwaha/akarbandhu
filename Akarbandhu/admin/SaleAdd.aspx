<%@ Page Title="New Product Sale" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="SaleAdd.aspx.cs" Inherits="admin_UserAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">New Product Sale</a></li>
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
                    <h2>New Product Sale</h2>
                    <p>Record a new product sale with customer and payment details.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-shopping-cart"></i></span>
                        <div>
                            <h3>Sale Details</h3>
                            <span>Customer, category and product information</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>Sale Date</label>
                                <asp:TextBox ID="txtsaledate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
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
                            <div class="col-md-4 ab-field">
                                <label>Select Category</label>
                                <asp:DropDownList ID="ddcategory" AutoPostBack="true" OnSelectedIndexChanged="ddcategory_SelectedIndexChanged" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Category</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Tenure</label>
                                <asp:TextBox ID="txttenure" CssClass="form-control" Enabled="false" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>BV</label>
                                <asp:TextBox ID="txtbv" CssClass="form-control" Enabled="false" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Total Installment</label>
                                <asp:TextBox ID="txttotalinstallment" CssClass="form-control" Enabled="false" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-8 ab-field">
                                <label>Product</label>
                                <asp:TextBox ID="txtproduct" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Amount</label>
                                <asp:TextBox ID="txtamount" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-12 ab-field">
                                <label>Remark</label>
                                <asp:TextBox ID="txtremark" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-credit-card"></i></span>
                        <div>
                            <h3>Payment Details</h3>
                            <span>Payment mode and transaction information</span>
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
            if (document.getElementById("<%=txtsaledate.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Booking Date');
                document.getElementById("<%=txtsaledate.ClientID%>").focus();
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
             if (document.getElementById("<%=txtamount.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Amount');
                document.getElementById("<%=txtamount.ClientID%>").focus();
                return false;
            }
            
             if (document.getElementById("<%=ddcategory.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Category');
                document.getElementById("<%=ddcategory.ClientID%>").focus();
                return false;
            }
        }
    </script>
</asp:Content>
