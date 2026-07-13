<%@ Page Title="Site Details" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="SiteDetails.aspx.cs" Inherits="admin_SiteDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="assets/css/ab-forms.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Website Management</a></li>
    <li class="breadcrumb-item"><a href="#">Site Details</a></li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Site Details</h2>
                    <p>Update brand name, tagline, logo and legal details shown on the public website.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-globe"></i></span>
                        <div>
                            <h3>Brand &amp; SEO</h3>
                            <span>Public site identity</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Brand Name</label>
                                <asp:TextBox ID="txtBrandName" CssClass="form-control" runat="server" placeholder="Akar Bandhu"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Company Name</label>
                                <asp:TextBox ID="txtCompanyName" CssClass="form-control" runat="server" placeholder="AKAR BANDHU PVT. LTD."></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Tagline</label>
                                <asp:TextBox ID="txtTagline" CssClass="form-control" runat="server" placeholder="Building Bihar's Future"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Browser Title</label>
                                <asp:TextBox ID="txtSiteTitle" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-12 ab-field">
                                <label>Meta Description</label>
                                <asp:TextBox ID="txtMetaDescription" CssClass="form-control" TextMode="MultiLine" Rows="2" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-12 ab-field">
                                <label>Footer Mission Text</label>
                                <asp:TextBox ID="txtFooterMission" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-image"></i></span>
                        <div>
                            <h3>Logo</h3>
                            <span>Upload logo used in public navigation / footer</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="ab-file">
                            <div class="ab-file-preview">
                                <asp:Image ID="imgLogo" runat="server" CssClass="ab-logo-preview" Visible="false" />
                                <span runat="server" id="lblNoLogo" class="ab-file-empty"><i class="feather icon-image"></i></span>
                            </div>
                            <div class="ab-file-main">
                                <span class="ab-file-title">Site logo</span>
                                <span class="ab-file-hint">PNG, JPG, WEBP or GIF · square logo works best</span>
                                <label class="ab-file-pick">
                                    <asp:FileUpload ID="fuLogo" runat="server" CssClass="ab-file-input" />
                                    <span class="ab-file-btn"><i class="feather icon-upload"></i> Choose file</span>
                                    <span class="ab-file-name">No file selected</span>
                                </label>
                                <asp:HiddenField ID="hfLogoPath" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-file-text"></i></span>
                        <div>
                            <h3>Legal &amp; Hours</h3>
                            <span>Shown in footer and contact section</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>CIN</label>
                                <asp:TextBox ID="txtCin" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>PAN</label>
                                <asp:TextBox ID="txtPan" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>TAN</label>
                                <asp:TextBox ID="txtTan" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Office Hours</label>
                                <asp:TextBox ID="txtOfficeHours" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section" style="margin-bottom:0;">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-share-2"></i></span>
                        <div>
                            <h3>Social Links</h3>
                            <span>Use full URLs, or # to hide action</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Facebook</label>
                                <asp:TextBox ID="txtFacebook" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Instagram</label>
                                <asp:TextBox ID="txtInstagram" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Twitter / X</label>
                                <asp:TextBox ID="txtTwitter" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>YouTube</label>
                                <asp:TextBox ID="txtYoutube" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" Text="Save Site Details" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
