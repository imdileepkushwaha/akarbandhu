<%@ Page Title="Coupon & Voucher Generated Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="CouponVoucherReport.aspx.cs" Inherits="admin_CouponVoucherReport" ValidateRequest="false" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Coupon & Voucher Generated Report</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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

            <div class="card">
                <div class="card-header">
                    <strong>Search Criteria</strong>
                </div>
                <div class="card-body">
                    <div class="row form-group">
                        <div class="col-md-2">From Date</div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-2">To Date</div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txttodate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-2">Associate Id</div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtassociateid" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-2">User Id</div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-2">Booking / Account No</div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtaccountno" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <hr />
                    <div class="row form-group">
                        <div class="col-md-12">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            <a href="CouponVoucherGenerate.aspx" class="btn btn-primary">Generate Page</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <strong>Generated Coupon & Cashback Voucher Report</strong>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" Width="100%" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="#">
                                    <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="DocType" HeaderText="Type" />
                                <asp:BoundField DataField="DocNo" HeaderText="Coupon / Voucher No" />
                                <asp:BoundField DataField="AccountNo" HeaderText="Account No" />
                                <asp:BoundField DataField="UserId" HeaderText="User Id" />
                                <asp:BoundField DataField="UserName" HeaderText="User Name" />
                                <asp:BoundField DataField="AssociateId" HeaderText="Associate Id" />
                                <asp:BoundField DataField="AssociateName" HeaderText="Associate Name" />
                                <asp:BoundField DataField="PlotArea" HeaderText="Plot Area" />
                                <asp:BoundField DataField="PlotAmount" HeaderText="Plot Amount" />
                                <asp:BoundField DataField="CommissionPercent" HeaderText="Comm %" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                <asp:BoundField DataField="VoucherDate" HeaderText="Voucher Date" />
                                <asp:BoundField DataField="BookingDateText" HeaderText="Booking Date" />
                                <asp:BoundField DataField="MentionDateText" HeaderText="Generated On" />
                                <asp:TemplateField HeaderText="Print">
                                    <ItemTemplate>
                                        <a class="btn btn-sm btn-info" target="_blank"
                                           href='<%# Eval("DocType").ToString() == "Coupon" ? "CouponPrint.aspx?AccountNo=" + Eval("AccountNo") : "CashbackVoucherPrint.aspx?AccountNo=" + Eval("AccountNo") %>'>Print</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="alert alert-info">No generated records found.</div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>
