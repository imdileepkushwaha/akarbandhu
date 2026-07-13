<%@ Page Title="IP Booking Reverse" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="IPBookingReverse.aspx.cs" Inherits="admin_ProjectAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Installment Booking Reverse</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentData" runat="Server">
    <div class="ab-wm">
        <div class="ab-page-head">
            <h2>IP Booking Reverse</h2>
            <p>Look up and reverse an installment plan booking.</p>
        </div>

        <div class="ab-section">
            <div class="ab-section-head">
                <span class="ab-section-icon"><i class="feather icon-search"></i></span>
                <div>
                    <h3>Find Booking</h3>
                    <span>Enter booking number to load details</span>
                </div>
            </div>
            <div class="ab-section-body">
                <div class="row">
                    <div class="col-md-4 ab-field">
                        <label>Booking No</label>
                        <asp:TextBox ID="txtbookingid" runat="server" CssClass="form-control" />
                    </div>
                </div>
            </div>
            <div class="ab-actions">
                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </div>
        </div>

        <asp:Panel ID="pnldetail" runat="server" Visible="false">
            <div class="ab-section">
                <div class="ab-section-head">
                    <span class="ab-section-icon"><i class="feather icon-file-text"></i></span>
                    <div>
                        <h3>Booking Detail</h3>
                        <span>Review booking before reversing</span>
                    </div>
                </div>
                <div class="ab-section-body">
                    <div class="row">
                        <div class="col-md-4 ab-field">
                            <label>Booking Id</label>
                            <asp:Label ID="lblBookingid" runat="server" CssClass="form-control-plaintext font-weight-bold" Text=""></asp:Label>
                        </div>
                        <div class="col-md-4 ab-field">
                            <label>Customer Id</label>
                            <asp:Label ID="lblcustomerid" runat="server" CssClass="form-control-plaintext font-weight-bold" Text=""></asp:Label>
                        </div>
                        <div class="col-md-4 ab-field">
                            <label>Customer Name</label>
                            <asp:Label ID="lblcustomername" runat="server" CssClass="form-control-plaintext font-weight-bold" Text=""></asp:Label>
                        </div>
                        <div class="col-md-4 ab-field">
                            <label>Plan Name</label>
                            <asp:Label ID="lblplanname" runat="server" CssClass="form-control-plaintext font-weight-bold" Text=""></asp:Label>
                        </div>
                        <div class="col-md-4 ab-field">
                            <label>Booking Date</label>
                            <asp:Label ID="lblbookingdate" runat="server" CssClass="form-control-plaintext font-weight-bold" Text=""></asp:Label>
                        </div>
                        <div class="col-md-4 ab-field">
                            <label>Booking Amount</label>
                            <asp:Label ID="lblbookingamount" runat="server" CssClass="form-control-plaintext font-weight-bold" Text=""></asp:Label>
                        </div>
                        <div class="col-md-12 ab-field">
                            <label>Remark</label>
                            <asp:TextBox ID="txtremark" TextMode="MultiLine" Rows="3" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                </div>
                <div class="ab-actions">
                    <asp:Button ID="btnReverse" CssClass="btn btn-danger" runat="server" Text="Reverse" OnClick="btnReverse_Click" />
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
