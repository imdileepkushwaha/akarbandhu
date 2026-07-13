<%@ Page Title="" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="admin_Dashboard" %>

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
                <p class="ab-hero-eyebrow">Associate Portal</p>
                <h1>Welcome back, <asp:Label ID="lblusername" runat="server" Text=""></asp:Label></h1>
                <p class="ab-hero-sub">Track earnings, team growth, and business performance in one place.</p>
            </div>
            <div class="ab-hero-side">
                <div class="ab-status-pill">
                    <i class="feather icon-activity"></i>
                    <asp:Label ID="lblactivestatus" runat="server" Text=""></asp:Label>
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
                        <img alt="profile" class="img-circle circle-border m-b-md" src="assets/images/logo.jpg" style="display:none" />
                        <asp:Literal ID="ltimage" runat="server"></asp:Literal>
                        <span class="ab-avatar-online" title="Online"></span>
                    </div>
                    <div class="ab-identity-intro">
                        <span class="ab-identity-kicker">Your profile</span>
                        <h3 class="ab-identity-title">Contact &amp; shortcuts</h3>
                        <p class="ab-identity-desc">Registered details for quick reference and account actions.</p>
                    </div>
                    <a href="AssociateEdit.aspx" class="ab-identity-edit">
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
                        <div class="ab-meta-item">
                            <i class="feather icon-calendar"></i>
                            <div>
                                <span>Activated</span>
                                <strong><asp:Label ID="LblActivationdate" runat="server" Text="01/07/2024"></asp:Label></strong>
                            </div>
                        </div>
                    </div>
                    <div class="ab-quick-actions">
                        <a href="AssociateEdit.aspx" class="ab-quick-btn"><i class="feather icon-edit-2"></i> Edit Profile</a>
                        <a href="AssociateKYCAdd.aspx" class="ab-quick-btn"><i class="feather icon-file-text"></i> KYC</a>
                        <a href="WithdrawlRequstAdd.aspx" class="ab-quick-btn"><i class="feather icon-pocket"></i> Withdraw</a>
                        <a href="TreeView.aspx" class="ab-quick-btn"><i class="feather icon-aperture"></i> Tree</a>
                    </div>
                </div>
            </div>

            <div class="ab-panel ab-panel-bank">
                <div class="ab-panel-head">
                    <span class="ab-panel-icon"><i class="feather icon-credit-card"></i></span>
                    <div>
                        <h3>Bank &amp; KYC</h3>
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
                    <div class="ab-detail-row">
                        <i class="feather icon-shield"></i>
                        <div class="ab-detail-copy">
                            <span>Aadhaar</span>
                            <strong><asp:Label ID="lbladhaar" runat="server" Text=""></asp:Label></strong>
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

        <section class="ab-link-card" id="dvlink" runat="server" visible="True">
            <div class="ab-link-visual" aria-hidden="true">
                <i class="feather icon-link"></i>
            </div>
            <div class="ab-link-copy">
                <span class="ab-link-badge"><i class="feather icon-share-2"></i> Affiliate</span>
                <asp:Label ID="Label1" runat="server" CssClass="ab-link-label" Text="Your referral link"></asp:Label>
                <p>Share this link to register new associates under your network.</p>
            </div>
            <div class="ab-link-row">
                <asp:TextBox ID="TxtLeftLinkLink" runat="server" CssClass="form-control" />
                <asp:Button ID="Button1" runat="server" Text="Copy Link" CssClass="btn btn-primary ab-copy-btn" OnClientClick="CopyToClipboard(); return false;" />
            </div>
        </section>

        <div class="row" style="display:none">
            <div class="col-md-3">
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Affiliate Link (RIGHT)"></asp:Label>
                </div>
            </div>
            <div class="col-md-7">
                <div class="form-group">
                    <asp:TextBox ID="TxtRightLink" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="col-md-2">
                <asp:Button ID="Button2" runat="server" Text="Copy" CssClass="btn btn-primary" OnClientClick="CopyToClipboard2()" />
            </div>
        </div>

        <section class="ab-section">
            <div class="ab-section-head">
                <div>
                    <h2>Income Overview</h2>
                    <p>Your current earning breakdown</p>
                </div>
                <a class="ab-section-more" href="LevelIncomeReport.aspx">All income <i class="feather icon-arrow-right"></i></a>
            </div>
            <div class="ab-stat-grid">
                <article class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Conveyance Income</p>
                        <span class="ab-stat-icon"><i class="feather icon-package"></i></span>
                    </div>
                    <h3 class="ab-stat-value"><asp:Label ID="LblconveynceIncome" runat="server" Text="Label"></asp:Label></h3>
                    <a class="ab-stat-link" href="LevelIncomeReport.aspx">View report <i class="feather icon-arrow-right"></i></a>
                </article>
                <article class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Self Income</p>
                        <span class="ab-stat-icon"><i class="feather icon-user"></i></span>
                    </div>
                    <h3 class="ab-stat-value"><asp:Label ID="LblSelfIncome" runat="server" Text="Label"></asp:Label></h3>
                    <a class="ab-stat-link" href="LevelIncomeReport.aspx">View report <i class="feather icon-arrow-right"></i></a>
                </article>
                <article class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Level Income</p>
                        <span class="ab-stat-icon"><i class="feather icon-layers"></i></span>
                    </div>
                    <h3 class="ab-stat-value"><asp:Label ID="LblLevelIncome" runat="server" Text="Label"></asp:Label></h3>
                    <a class="ab-stat-link" href="LevelIncomeReport.aspx">View report <i class="feather icon-arrow-right"></i></a>
                </article>
                <article class="ab-stat ab-stat-accent">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Total Self + Level</p>
                        <span class="ab-stat-icon"><i class="feather icon-trending-up"></i></span>
                    </div>
                    <h3 class="ab-stat-value"><asp:Label ID="LblSlefLevel" runat="server" Text="Label"></asp:Label></h3>
                    <a class="ab-stat-link" href="LevelIncomeReport.aspx">View report <i class="feather icon-arrow-right"></i></a>
                </article>
                <article class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Level</p>
                        <span class="ab-stat-icon"><i class="feather icon-award"></i></span>
                    </div>
                    <h3 class="ab-stat-value"><asp:Label ID="lbllevel" runat="server" Text="Label"></asp:Label></h3>
                    <a class="ab-stat-link" href="LevelIncomeReport.aspx">View report <i class="feather icon-arrow-right"></i></a>
                </article>
            </div>
        </section>

        <section class="ab-section">
            <div class="ab-section-head">
                <div>
                    <h2>Team Overview</h2>
                    <p>Network size and membership status</p>
                </div>
                <a class="ab-section-more" href="DownlineReport.aspx">Team report <i class="feather icon-arrow-right"></i></a>
            </div>
            <div class="ab-stat-grid ab-stat-grid-3">
                <article class="ab-stat ab-stat-navy">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Total Team</p>
                        <span class="ab-stat-icon"><i class="feather icon-users"></i></span>
                    </div>
                    <h3 class="ab-stat-value"><asp:Label ID="LblTotalTeam" runat="server" Text="00"></asp:Label></h3>
                    <a class="ab-stat-link" href="DownlineReport.aspx">View downline <i class="feather icon-arrow-right"></i></a>
                </article>
                <article class="ab-stat ab-stat-navy">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Total Direct</p>
                        <span class="ab-stat-icon"><i class="feather icon-user-plus"></i></span>
                    </div>
                    <h3 class="ab-stat-value"><asp:Label ID="LblDIrect" runat="server" Text="00"></asp:Label></h3>
                    <a class="ab-stat-link" href="DirectDownlineReport.aspx">View directs <i class="feather icon-arrow-right"></i></a>
                </article>
                <article class="ab-stat ab-stat-navy">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Status</p>
                        <span class="ab-stat-icon"><i class="feather icon-check-circle"></i></span>
                    </div>
                    <h3 class="ab-stat-value"><asp:Label ID="LblStatus" runat="server" Text="Status"></asp:Label></h3>
                </article>
            </div>
        </section>

        <section class="ab-section">
            <div class="ab-section-head">
                <div>
                    <h2>Business Overview</h2>
                    <p>Self and team business performance</p>
                </div>
                <a class="ab-section-more" href="AssociateBusinessReport.aspx">Business report <i class="feather icon-arrow-right"></i></a>
            </div>
            <div class="ab-stat-grid ab-stat-grid-3">
                <article class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Team Business</p>
                        <span class="ab-stat-icon"><i class="feather icon-briefcase"></i></span>
                    </div>
                    <h3 class="ab-stat-value"><asp:Label ID="LblTeamBusiness" runat="server" Text="Label"></asp:Label></h3>
                    <a class="ab-stat-link" href="AssociateBusinessReport.aspx">View business <i class="feather icon-arrow-right"></i></a>
                </article>
                <article class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Self Business</p>
                        <span class="ab-stat-icon"><i class="feather icon-pocket"></i></span>
                    </div>
                    <h3 class="ab-stat-value"><asp:Label ID="LblSelfBusiness" runat="server" Text="Label"></asp:Label></h3>
                    <a class="ab-stat-link" href="AssociateBusinessReport.aspx">View business <i class="feather icon-arrow-right"></i></a>
                </article>
                <article class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Reward Status</p>
                        <span class="ab-stat-icon"><i class="feather icon-award"></i></span>
                    </div>
                    <h3 class="ab-stat-value"><asp:Label ID="LblReward" runat="server" Text="Status"></asp:Label></h3>
                    <a class="ab-stat-link" href="RewardReport.aspx">View rewards <i class="feather icon-arrow-right"></i></a>
                </article>
            </div>
        </section>

    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript" language="javascript">
        function CopyToClipboard() {
            var copyText = document.getElementById('<%=TxtLeftLinkLink.ClientID%>');
            copyText.select();
            copyText.setSelectionRange(0, 99999);
            try {
                if (navigator.clipboard && navigator.clipboard.writeText) {
                    navigator.clipboard.writeText(copyText.value);
                } else {
                    document.execCommand("Copy");
                }
            } catch (e) {
                document.execCommand("Copy");
            }
            var btn = document.getElementById('<%=Button1.ClientID%>');
            if (btn) {
                var old = btn.value;
                btn.value = "Copied!";
                setTimeout(function () { btn.value = old; }, 1600);
            }
        }
        function CopyToClipboard2() {
            var copyText1 = document.getElementById('<%=TxtRightLink.ClientID%>');
            copyText1.select();
            document.execCommand("Copy");
            alert("Copied the text: " + copyText1.value);
        }

        function primeclick() {
            if (confirm("Are you sure want to become a prime member ?")) {
                $.ajax({
                    url: "Dashboard.aspx/BecomePrimeMember",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{}",
                    success: function (r) {
                        if (r.d == 1) {
                            alert('Congrats! Your request has been send');
                            $(".spanprime").hide();
                            location.href = "Dashboard.aspx";
                        }
                        else if (r.d == 2) {
                            alert('error! you are already prime member');
                        }
                        else if (r.d == 3) {
                            alert('error! your previous request is already pending');
                        }
                        else {
                            return false;
                        }
                    },
                    error: function (r) { }
                });
            }
            else {
                return false;
            }
        }
    </script>
</asp:Content>
