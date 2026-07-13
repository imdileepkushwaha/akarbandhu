<%@ Page Title="Isntallment Plan Booking Report" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="IPReport.aspx.cs" Inherits="admin_UserReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Installment Booking Report</a></li>
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
                    <h2>Installment Booking Report</h2>
                    <p>Search and review installment plan bookings.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-filter"></i></span>
                        <div>
                            <h3>Search Criteria</h3>
                            <span>Filter bookings by date, customer and project</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>From Booking Date</label>
                                <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>To Booking Date</label>
                                <asp:TextBox ID="txttodate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Booking Id</label>
                                <asp:TextBox ID="txtbookingid" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Customer Id</label>
                                <asp:TextBox ID="txtcustomerid" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Customer Name</label>
                                <asp:TextBox ID="txtcustomername" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Sponser Id</label>
                                <asp:TextBox ID="txtassociateid" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Select Project</label>
                                <asp:DropDownList ID="ddproject" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddproject_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Select Block</label>
                                <asp:DropDownList ID="ddblock" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddblock_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Block</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Select Plot</label>
                                <asp:DropDownList ID="ddplot" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Plot</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-list"></i></span>
                        <div>
                            <h3>Installment Plan Booking Report</h3>
                            <span>Matching installment plan bookings</span>
                        </div>
                    </div>
                    <div class="ab-section-body ab-section-body--flush">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"
                                CssClass="table ab-table table-striped" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Booking Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbookingid" runat="server" Text='<%#Eval("accountno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Customer Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcustomerid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Customer Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcustomername" Text='<%#Eval("username") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Booking Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbookingdate" Text='<%#Eval("bookingdate","{0:dd/MM/yyyy}") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sponser Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAssociaterid" runat="server" Text='<%#Eval("SponserId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Plan Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblplanname" Text='<%#Eval("planname") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Project Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblprojectname" Text='<%#Eval("projectname") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Plot No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblplotno" Text='<%#Eval("plotname") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Plot Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblplotamount" Text='<%#Eval("plotamount") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DP Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbookingamount" Text='<%#Eval("bookingamount") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Paid DP Amt">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpaidamount" Text='<%#Eval("totalpaid") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <a href='BookingReceipt.aspx?BookingId=<%#Eval("accountno") %>' class="ab-btn-receipt" target="_blank" title="Receipt">
                                                <i class="feather icon-printer"></i>
                                            </a>
                                            <%--<asp:LinkButton ID="btnInst" runat="server" CommandName="Inst" CssClass="ab-btn-inst" ToolTip="Pay Installment" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"><i class="feather icon-pocket"></i></asp:LinkButton>--%>
                                            <%--<asp:LinkButton ID="btnPay" runat="server" CommandName="mypay" CssClass="btn btn-warning btn-xs" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>">Pay DP</asp:LinkButton>--%>
                                        </ItemTemplate>
                                        <HeaderStyle Width="80px" />
                                        <ItemStyle HorizontalAlign="Center" CssClass="text-nowrap" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <asp:Panel ID="pnlInstallment" runat="server" Visible="false">
                    <div class="ab-section">
                        <div class="ab-section-head">
                            <span class="ab-section-icon"><i class="feather icon-check-circle"></i></span>
                            <div>
                                <h3>Prev Paid Installment</h3>
                                <span>Previously paid installments for selected booking</span>
                            </div>
                        </div>
                        <div class="ab-section-body ab-section-body--flush">
                            <div class="table-responsive">
                                <asp:GridView ID="grdInstallment" PageSize="15" AutoGenerateColumns="false" CssClass="table ab-table table-striped" runat="server" OnRowDataBound="grdInstallment_RowDataBound" GridLines="None">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Inst. No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblinstno" runat="server" Text='<%# Eval("InstNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Booking ID">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBookingid" runat="server" Text='<%# Eval("accountno") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Inst. Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblinstdate" runat="server" Text='<%# Eval("InstDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Inst. Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblinstamount" runat="server" Text='<%# Eval("instamt") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblinststatus" runat="server" Text="Paid"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payment Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblpaiddate" runat="server" Text='<%# Eval("paymentdate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <a href='InstallmentReceipt.aspx?BookingId=<%#Eval("accountno") %>&instno=<%# Eval("InstNo") %>' class="ab-btn-receipt" target="_blank" title="Receipt">
                                                    <i class="feather icon-printer"></i>
                                                </a>
                                            </ItemTemplate>
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>

                    <div class="ab-section">
                        <div class="ab-section-head">
                            <span class="ab-section-icon"><i class="feather icon-credit-card"></i></span>
                            <div>
                                <h3>Pay Installment</h3>
                                <span>Review booking summary and record payment</span>
                            </div>
                        </div>
                        <div class="ab-section-body">
                            <div class="ab-pay-summary">
                                <div class="ab-pay-summary-item">
                                    <span>Booking Id</span>
                                    <strong><asp:Label ID="lblBookingid" runat="server" Text=""></asp:Label></strong>
                                </div>
                                <div class="ab-pay-summary-item">
                                    <span>Customer Id</span>
                                    <strong><asp:Label ID="lblcustomerid" runat="server" Text=""></asp:Label></strong>
                                </div>
                                <div class="ab-pay-summary-item">
                                    <span>Customer Name</span>
                                    <strong><asp:Label ID="lblcustomername" runat="server" Text=""></asp:Label></strong>
                                </div>
                                <div class="ab-pay-summary-item">
                                    <span>Plan Name</span>
                                    <strong><asp:Label ID="lblplanname" runat="server" Text=""></asp:Label></strong>
                                </div>
                                <div class="ab-pay-summary-item">
                                    <span>Booking Date</span>
                                    <strong><asp:Label ID="lblbookingdate" runat="server" Text=""></asp:Label></strong>
                                </div>
                                <div class="ab-pay-summary-item">
                                    <span>Booking Amount</span>
                                    <strong><asp:Label ID="lblbookingamount" runat="server" Text=""></asp:Label></strong>
                                </div>
                                <div class="ab-pay-summary-item ab-pay-summary-item--accent">
                                    <span>Installment No</span>
                                    <strong><asp:Label ID="lblinstno" runat="server" Text=""></asp:Label></strong>
                                </div>
                                <div class="ab-pay-summary-item ab-pay-summary-item--accent">
                                    <span>Due Date</span>
                                    <strong><asp:Label ID="lblinstduedate" runat="server" Text=""></asp:Label></strong>
                                </div>
                                <div class="ab-pay-summary-item ab-pay-summary-item--accent">
                                    <span>Installment Amount</span>
                                    <strong><asp:Label ID="lblinstamount" runat="server" Text=""></asp:Label></strong>
                                </div>
                            </div>

                            <div class="ab-pay-form">
                                <h5 class="ab-pay-form-title"><i class="feather icon-edit-2"></i> Payment Details</h5>
                                <div class="row">
                                    <div class="col-md-4 ab-field">
                                        <label>Payment Date</label>
                                        <asp:TextBox ID="txtpaymentdate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4 ab-field">
                                        <label>Payment Mode</label>
                                        <asp:DropDownList ID="ddpaymentmode" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddpaymentmode_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem>Cash</asp:ListItem>
                                            <asp:ListItem Value="Cheque">Cheque/DD</asp:ListItem>
                                            <asp:ListItem Value="Online">Online Transaction</asp:ListItem>
                                            <asp:ListItem Value="CP Credit">CP Credit</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-4 ab-field">
                                        <label>Transaction ID</label>
                                        <asp:TextBox ID="txtonlinetransactionid" CssClass="form-control" runat="server"></asp:TextBox>
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
                                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ab-actions">
                            <asp:Button ID="btnPay" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnPay_Click" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </ContentTemplate>
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
                                    <h4 class="modal-title">Edit User Details</h4>
                                    <span class="ab-modal-id">ID: <asp:Label runat="server" ID="lbluseridedit"></asp:Label></span>
                                </div>
                            </div>
                            <button type="button" class="ab-modal-close" data-dismiss="modal" aria-label="Close">
                                <i class="feather icon-x"></i>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="ab-modal-section">
                                <h5 class="ab-modal-section-title"><i class="feather icon-user"></i> User</h5>
                                <div class="row">
                                    <div class="col-md-6 ab-field">
                                        <label>User Id</label>
                                        <asp:TextBox ID="txtuseridedit" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>User Name</label>
                                        <asp:TextBox ID="txtusernameedit" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="ab-modal-section">
                                <h5 class="ab-modal-section-title"><i class="feather icon-credit-card"></i> Bank Detail</h5>
                                <div class="row">
                                    <div class="col-md-6 ab-field">
                                        <label>A/c Holder Name</label>
                                        <asp:TextBox ID="txtaccountholdername" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>A/c No</label>
                                        <asp:TextBox ID="txtaccountno" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>IFSC Code</label>
                                        <asp:TextBox ID="txtifsccode" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>PAN number</label>
                                        <asp:TextBox ID="txtpan" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>Bank</label>
                                        <asp:DropDownList ID="ddbank" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>Branch</label>
                                        <asp:TextBox ID="txtbranchname" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 ab-field">
                                        <label>Paytm Mobile No</label>
                                        <asp:TextBox ID="txtpaytmmobileno" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
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
