<%@ Page Title="Jeevan Bhumi Coupon & Voucher" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="CouponVoucherGenerate.aspx.cs" Inherits="admin_CouponVoucherGenerate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .jb-actions .btn { margin: 2px; white-space: nowrap; }
        .jb-note { font-size: 13px; color: #555; margin-bottom: 12px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Jeevan Bhumi Coupon & Voucher</a></li>
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
                    <strong>Jeevan Bhumi Bonus Plan – Generate Coupon / Cashback Voucher</strong>
                </div>
                <div class="card-body">
                    <p class="jb-note">
                        Select associate (from bookings of 10 / 25 / 50 / 100 sqft). After submit, generate Immediate Coupon (with QR)
                        and 8 Cashback Vouchers (every 6 months from booking date; commission 10% × 7 + 30%).
                        Completed records move to the Generated Report.
                    </p>
                    <div class="row form-group">
                        <div class="col-md-2">Select Associate</div>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddassociate" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col-md-2">Plot Area (SqFt)</div>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddplotarea" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0">All</asp:ListItem>
                                <asp:ListItem Value="10">10</asp:ListItem>
                                <asp:ListItem Value="25">25</asp:ListItem>
                                <asp:ListItem Value="50">50</asp:ListItem>
                                <asp:ListItem Value="100">100</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <hr />
                    <div class="row form-group">
                        <div class="col-md-12">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            <a href="CouponVoucherReport.aspx" class="btn btn-info">Generated Report</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card" id="divList" runat="server" visible="false">
                <div class="card-header">
                    <strong>Pending Booking List</strong>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" Width="100%"
                            AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="#">
                                    <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                                    <HeaderStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User Id">
                                    <ItemTemplate>
                                        <asp:Label ID="lbluserid" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
                                        <asp:HiddenField ID="hdnaccountno" runat="server" Value='<%# Eval("AccountNo") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblusername" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Associate">
                                    <ItemTemplate>
                                        <%# Eval("AssociateId") %> - <%# Eval("AssociateName") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Booking Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblbookingdate" runat="server" Text='<%# Eval("BookingDateText") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Plot Area">
                                    <ItemTemplate>
                                        <asp:Label ID="lblplotarea" runat="server" Text='<%# Eval("PlotArea") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Plot Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblplotamount" runat="server" Text='<%# Eval("PlotAmount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="jb-actions">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnCoupon" runat="server" CssClass="btn btn-primary btn-sm"
                                            CommandName="createcoupon" CommandArgument='<%# Eval("AccountNo") %>' Text="Create Coupon"></asp:LinkButton>
                                        <asp:LinkButton ID="btnVoucher" runat="server" CssClass="btn btn-warning btn-sm"
                                            CommandName="createvoucher" CommandArgument='<%# Eval("AccountNo") %>' Text="Create Cashback Voucher"></asp:LinkButton>
                                        <asp:HyperLink ID="lnkPrintCoupon" runat="server" CssClass="btn btn-info btn-sm" Target="_blank"
                                            NavigateUrl='<%# "CouponPrint.aspx?AccountNo=" + Eval("AccountNo") %>' Text="Print Coupon" Visible="false"></asp:HyperLink>
                                        <asp:HyperLink ID="lnkPrintVoucher" runat="server" CssClass="btn btn-secondary btn-sm" Target="_blank"
                                            NavigateUrl='<%# "CashbackVoucherPrint.aspx?AccountNo=" + Eval("AccountNo") %>' Text="Print Vouchers" Visible="false"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="alert alert-info">No pending bookings found for selected criteria.</div>
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
