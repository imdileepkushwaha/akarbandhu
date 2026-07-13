<%@ Page Title="Contact Details" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="ContactDetails.aspx.cs" Inherits="admin_ContactDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="assets/css/ab-forms.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Website Management</a></li>
    <li class="breadcrumb-item"><a href="#">Contact Details</a></li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Contact Details</h2>
                    <p>Update email, mobile, WhatsApp and address — changes apply across the public website.</p>
                </div>

                <div class="ab-section ab-section--flush">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-phone"></i></span>
                        <div>
                            <h3>Public Contact Information</h3>
                            <span>Used in footer, contact page and WhatsApp button</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Email</label>
                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="info@example.com"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Mobile Number</label>
                                <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" placeholder="+91-98765-43210"></asp:TextBox>
                                <span class="hint">Shown on site and used for Call links</span>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>WhatsApp Number</label>
                                <asp:TextBox ID="txtWhatsApp" CssClass="form-control" runat="server" placeholder="919876543210"></asp:TextBox>
                                <span class="hint">Digits with country code preferred (e.g. 9198XXXXXXXX)</span>
                            </div>
                            <div class="col-md-12 ab-field" style="margin-bottom:0;">
                                <label>Address</label>
                                <asp:TextBox ID="txtAddress" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server" placeholder="Full office address"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" Text="Save Contact Details" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
