<%@ Page Title="" Language="C#" MasterPageFile="usermaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="assets/css/ab-dashboard.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">

    <div class="ab-dash">

        <section class="ab-hero">
            <div class="ab-hero-copy">
                <p class="ab-hero-eyebrow">User Portal</p>
                <h1>Welcome back, <asp:Label ID="lblusername" runat="server" Text=""></asp:Label></h1>
                <p class="ab-hero-sub">Your profile, bank details, and account shortcuts in one place.</p>
            </div>
            <div class="ab-hero-side">
                <div class="ab-status-pill">
                    <i class="feather icon-activity"></i>
                    <asp:Label ID="lblactivestatus" runat="server" Text="Account Active"></asp:Label>
                </div>
                <div class="ab-hero-id">
                    <span>ID</span>
                    <strong><asp:Label ID="lbluserid" runat="server" Text=""></asp:Label></strong>
                </div>
            </div>
        </section>

        <section class="ab-identity">
            <div class="ab-identity-main">
                <div class="ab-identity-top">
                    <div class="ab-avatar">
                        <img alt="profile" src="assets/images/user/default.png" />
                        <span class="ab-avatar-online" title="Online"></span>
                    </div>
                    <div class="ab-identity-intro">
                        <span class="ab-identity-kicker">Your profile</span>
                        <h3 class="ab-identity-title">Contact &amp; shortcuts</h3>
                        <p class="ab-identity-desc">Registered details for quick reference and account actions.</p>
                    </div>
                    <a href="UserEdit.aspx" class="ab-identity-edit">
                        <i class="feather icon-edit-2"></i>
                        <span>Edit</span>
                    </a>
                </div>

                <div class="ab-identity-meta">
                    <div class="ab-meta-grid">
                        <div class="ab-meta-item">
                            <i class="feather icon-phone"></i>
                            <div>
                                <span>Mobile</span>
                                <strong><asp:Label ID="lblmobile" runat="server" Text=""></asp:Label></strong>
                            </div>
                        </div>
                        <div class="ab-meta-item">
                            <i class="feather icon-mail"></i>
                            <div>
                                <span>Email</span>
                                <strong><asp:Label ID="lblemail" runat="server" Text=""></asp:Label></strong>
                            </div>
                        </div>
                        <div class="ab-meta-item ab-meta-item--wide">
                            <i class="feather icon-map-pin"></i>
                            <div>
                                <span>Address</span>
                                <strong><asp:Label ID="lbladdress" runat="server" Text=""></asp:Label></strong>
                            </div>
                        </div>
                    </div>
                    <div class="ab-quick-actions">
                        <a href="UserEdit.aspx" class="ab-quick-btn"><i class="feather icon-edit-2"></i> Edit Profile</a>
                        <a href="CHangePassword.aspx" class="ab-quick-btn"><i class="feather icon-lock"></i> Password</a>
                        <a href="#" class="ab-quick-btn"><i class="feather icon-book"></i> Bookings</a>
                        <a href="logout.aspx" class="ab-quick-btn"><i class="feather icon-log-out"></i> Logout</a>
                    </div>
                </div>
            </div>

            <div class="ab-panel ab-panel-bank">
                <div class="ab-panel-head">
                    <span class="ab-panel-icon"><i class="feather icon-credit-card"></i></span>
                    <div>
                        <h3>Bank Details</h3>
                        <p>Account and identity details</p>
                    </div>
                </div>
                <div class="ab-detail-list">
                    <div class="ab-detail-row">
                        <i class="feather icon-user"></i>
                        <div class="ab-detail-copy">
                            <span>Holder</span>
                            <strong><asp:Label ID="lblaccountholdername" runat="server" Text=""></asp:Label></strong>
                        </div>
                    </div>
                    <div class="ab-detail-row">
                        <i class="feather icon-hash"></i>
                        <div class="ab-detail-copy">
                            <span>A/c No</span>
                            <strong><asp:Label ID="lblaccountno" runat="server" Text=""></asp:Label></strong>
                        </div>
                    </div>
                    <div class="ab-detail-row">
                        <i class="feather icon-home"></i>
                        <div class="ab-detail-copy">
                            <span>Bank</span>
                            <strong><asp:Label ID="lblbank" runat="server" Text=""></asp:Label></strong>
                        </div>
                    </div>
                    <div class="ab-detail-row">
                        <i class="feather icon-lock"></i>
                        <div class="ab-detail-copy">
                            <span>IFSC</span>
                            <strong><asp:Label ID="lblifsc" runat="server" Text=""></asp:Label></strong>
                        </div>
                    </div>
                    <div class="ab-detail-row">
                        <i class="feather icon-file-text"></i>
                        <div class="ab-detail-copy">
                            <span>PAN</span>
                            <strong><asp:Label ID="lblpan" runat="server" Text=""></asp:Label></strong>
                        </div>
                    </div>
                </div>
            </div>

            <div class="ab-panel ab-panel-news">
                <div class="ab-panel-head">
                    <span class="ab-panel-icon"><i class="feather icon-bell"></i></span>
                    <div>
                        <h3>Latest News</h3>
                        <p>Updates from Akar Bandhu</p>
                    </div>
                    <span class="ab-live-dot">Live</span>
                </div>
                <div class="ab-news-body">
                    <marquee class="ab-news-scroll" behavior="scroll" direction="up" onmouseover="this.stop();" onmouseout="this.start();">
                        <asp:Literal ID="ltnews" runat="server"></asp:Literal>
                    </marquee>
                </div>
            </div>
        </section>

        <section class="ab-section">
            <div class="ab-section-head">
                <div>
                    <h2>Quick Access</h2>
                    <p>Common account actions</p>
                </div>
            </div>
            <div class="ab-stat-grid ab-stat-grid-3">
                <a href="UserEdit.aspx" class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Edit Profile</p>
                        <span class="ab-stat-icon"><i class="feather icon-edit-2"></i></span>
                    </div>
                    <h3 class="ab-stat-value">Update details</h3>
                    <span class="ab-stat-link">Open <i class="feather icon-arrow-right"></i></span>
                </a>
                <a href="CHangePassword.aspx" class="ab-stat ab-stat-navy">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Security</p>
                        <span class="ab-stat-icon"><i class="feather icon-lock"></i></span>
                    </div>
                    <h3 class="ab-stat-value">Change password</h3>
                    <span class="ab-stat-link">Open <i class="feather icon-arrow-right"></i></span>
                </a>
                <a href="#" class="ab-stat ab-stat-accent">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">My Bookings</p>
                        <span class="ab-stat-icon"><i class="feather icon-book"></i></span>
                    </div>
                    <h3 class="ab-stat-value">Installment &amp; payments</h3>
                    <span class="ab-stat-link">Open <i class="feather icon-arrow-right"></i></span>
                </a>
            </div>
        </section>

        <%-- Legacy dashboard stats (kept for compatibility; currently unused in code-behind) --%>
        <div style="display:none;" aria-hidden="true">
            <asp:Label ID="lblmypackage" runat="server" Text="0"></asp:Label>
            <asp:Label ID="lbltotalteam" runat="server" Text="0"></asp:Label>
            <asp:Label ID="lbldirectreferral" runat="server" Text="0"></asp:Label>
            <asp:Label ID="lblmyearning" runat="server" Text="0"></asp:Label>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
