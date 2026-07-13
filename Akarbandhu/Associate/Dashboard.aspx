<%@ Page Title="" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .ab-dash {
            --ab-navy: #0b1c33;
            --ab-navy-mid: #122847;
            --ab-orange: #e67e22;
            --ab-orange-deep: #d35400;
            --ab-sky: #7eb8e8;
            --ab-muted: #6b7c8f;
            --ab-ink: #0f1a28;
            --ab-border: #e2e8f0;
            --ab-surface: #f4f7fb;
        }

        .ab-dash .ab-welcome {
            display: flex;
            flex-wrap: wrap;
            align-items: flex-end;
            justify-content: space-between;
            gap: 1rem;
            margin-bottom: 1.25rem;
        }

        .ab-dash .ab-welcome h2 {
            font-family: "Outfit", sans-serif;
            font-weight: 700;
            font-size: 1.55rem;
            color: var(--ab-ink);
            margin: 0 0 0.25rem;
            letter-spacing: -0.02em;
        }

        .ab-dash .ab-welcome p {
            margin: 0;
            color: var(--ab-muted);
            font-size: 0.92rem;
        }

        .ab-dash .ab-status-pill {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 0.4rem 0.85rem;
            border-radius: 999px;
            background: rgba(230, 126, 34, 0.12);
            color: var(--ab-orange-deep);
            font-size: 0.8rem;
            font-weight: 600;
        }

        .ab-dash .ab-profile-card {
            background: linear-gradient(145deg, var(--ab-navy) 0%, var(--ab-navy-mid) 55%, #1a3354 100%);
            border-radius: 14px;
            padding: 1.35rem 1.4rem;
            color: #fff;
            margin-bottom: 1.25rem;
            position: relative;
            overflow: hidden;
            border: none;
            box-shadow: 0 14px 32px rgba(11, 28, 51, 0.22);
        }

        .ab-dash .ab-profile-card::before {
            content: "";
            position: absolute;
            width: 220px;
            height: 220px;
            right: -60px;
            top: -70px;
            border-radius: 50%;
            border: 1px solid rgba(230, 126, 34, 0.28);
            box-shadow: 0 0 0 28px rgba(230, 126, 34, 0.06);
            pointer-events: none;
        }

        .ab-dash .ab-profile-grid {
            display: grid;
            grid-template-columns: auto 1fr 1fr minmax(180px, 0.85fr);
            gap: 1.25rem;
            position: relative;
            z-index: 1;
            align-items: start;
        }

        .ab-dash .ab-avatar img,
        .ab-dash .ab-avatar .img-circle {
            width: 88px !important;
            height: 88px !important;
            border-radius: 50% !important;
            object-fit: cover;
            border: 3px solid rgba(230, 126, 34, 0.65);
            box-shadow: 0 0 0 4px rgba(230, 126, 34, 0.15);
            display: block;
        }

        .ab-dash .ab-section-label {
            font-size: 0.68rem;
            font-weight: 600;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            color: rgba(255, 255, 255, 0.45);
            margin: 0 0 0.65rem;
        }

        .ab-dash .ab-name {
            font-family: "Outfit", sans-serif;
            font-size: 1.25rem;
            font-weight: 700;
            margin: 0 0 0.15rem;
            color: #fff;
        }

        .ab-dash .ab-id {
            color: var(--ab-orange);
            font-weight: 600;
            font-size: 0.9rem;
            margin-bottom: 0.75rem;
        }

        .ab-dash .ab-meta {
            display: grid;
            gap: 0.35rem;
            font-size: 0.88rem;
            color: rgba(255, 255, 255, 0.82);
        }

        .ab-dash .ab-meta b {
            color: rgba(255, 255, 255, 0.5);
            font-weight: 500;
            min-width: 4.5rem;
            display: inline-block;
        }

        .ab-dash .ab-bank {
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 0.85rem 1rem;
        }

        .ab-dash .ab-bank .ab-meta {
            font-size: 0.84rem;
        }

        .ab-dash .ab-news {
            background: rgba(230, 126, 34, 0.12);
            border: 1px solid rgba(230, 126, 34, 0.25);
            border-radius: 10px;
            padding: 0.75rem 0.9rem;
            height: 100%;
            min-height: 160px;
        }

        .ab-dash .ab-news .ab-section-label {
            color: var(--ab-orange);
        }

        .ab-dash .ab-news-scroll {
            height: 150px;
            overflow: hidden;
            color: rgba(255, 255, 255, 0.88);
            font-size: 0.86rem;
            line-height: 1.5;
        }

        .ab-dash .ab-news-scroll hr {
            border-color: rgba(255, 255, 255, 0.15);
            margin: 0.55rem 0;
        }

        .ab-dash .ab-link-card {
            background: #fff;
            border: 1px solid var(--ab-border);
            border-radius: 12px;
            padding: 1rem 1.15rem;
            margin-bottom: 1.25rem;
            box-shadow: 0 8px 20px rgba(11, 28, 51, 0.04);
        }

        .ab-dash .ab-link-card label,
        .ab-dash .ab-link-card .ab-link-label {
            display: block;
            font-size: 0.72rem;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--ab-orange);
            margin-bottom: 0.55rem;
        }

        .ab-dash .ab-link-row {
            display: flex;
            gap: 0.65rem;
            align-items: center;
        }

        .ab-dash .ab-link-row .form-control {
            flex: 1;
            height: 44px;
            border-radius: 8px;
            border-color: var(--ab-border);
            background: var(--ab-surface);
            font-size: 0.88rem;
        }

        .ab-dash .ab-link-row .btn {
            height: 44px;
            min-width: 90px;
            border-radius: 8px;
            font-weight: 600;
        }

        .ab-dash .ab-group-title {
            font-family: "Outfit", sans-serif;
            font-size: 1.05rem;
            font-weight: 700;
            color: var(--ab-ink);
            margin: 0.35rem 0 0.9rem;
            letter-spacing: -0.01em;
        }

        .ab-dash .ab-stat {
            background: #fff;
            border: 1px solid var(--ab-border);
            border-radius: 12px;
            padding: 1.1rem 1.15rem;
            height: 100%;
            position: relative;
            overflow: hidden;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            box-shadow: 0 8px 20px rgba(11, 28, 51, 0.04);
            margin-bottom: 1rem;
        }

        .ab-dash .ab-stat:hover {
            transform: translateY(-2px);
            box-shadow: 0 14px 28px rgba(11, 28, 51, 0.08);
        }

        .ab-dash .ab-stat::after {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 4px;
            background: linear-gradient(180deg, var(--ab-orange), var(--ab-orange-deep));
        }

        .ab-dash .ab-stat.ab-stat-navy::after {
            background: linear-gradient(180deg, var(--ab-navy-mid), var(--ab-sky));
        }

        .ab-dash .ab-stat-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 0.75rem;
            margin-bottom: 0.65rem;
        }

        .ab-dash .ab-stat-label {
            margin: 0;
            font-size: 0.82rem;
            font-weight: 600;
            color: var(--ab-muted);
            line-height: 1.3;
        }

        .ab-dash .ab-stat-icon {
            width: 36px;
            height: 36px;
            border-radius: 10px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: rgba(230, 126, 34, 0.12);
            color: var(--ab-orange);
            flex-shrink: 0;
        }

        .ab-dash .ab-stat-navy .ab-stat-icon {
            background: rgba(18, 40, 71, 0.1);
            color: var(--ab-navy-mid);
        }

        .ab-dash .ab-stat-value {
            font-family: "Outfit", sans-serif;
            font-size: 1.45rem;
            font-weight: 700;
            color: var(--ab-ink);
            margin: 0 0 0.65rem;
            letter-spacing: -0.02em;
            word-break: break-word;
        }

        .ab-dash .ab-stat-link {
            font-size: 0.8rem;
            font-weight: 600;
            color: var(--ab-orange);
            text-decoration: none;
        }

        .ab-dash .ab-stat-link:hover {
            color: var(--ab-orange-deep);
            text-decoration: underline;
        }

        @media (max-width: 1199px) {
            .ab-dash .ab-profile-grid {
                grid-template-columns: auto 1fr 1fr;
            }

            .ab-dash .ab-news {
                grid-column: 1 / -1;
            }
        }

        @media (max-width: 767px) {
            .ab-dash .ab-profile-grid {
                grid-template-columns: 1fr;
                justify-items: start;
            }

            .ab-dash .ab-link-row {
                flex-direction: column;
                align-items: stretch;
            }

            .ab-dash .ab-link-row .btn {
                width: 100%;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">

    <div class="ab-dash">

        <div class="ab-welcome">
            <div>
                <h2>Dashboard</h2>
                <p>Your associate summary, earnings, and team overview.</p>
            </div>
            <div class="ab-status-pill">
                <i class="feather icon-activity"></i>
                <asp:Label ID="lblactivestatus" runat="server" Text=""></asp:Label>
            </div>
        </div>

        <!-- Profile + Bank + News -->
        <div class="ab-profile-card">
            <div class="ab-profile-grid">
                <div class="ab-avatar">
                    <img alt="profile" class="img-circle circle-border m-b-md" src="assets/images/logo.jpg" style="display:none" />
                    <asp:Literal ID="ltimage" runat="server"></asp:Literal>
                </div>

                <div>
                    <p class="ab-section-label">Associate</p>
                    <h3 class="ab-name"><asp:Label ID="lblusername" runat="server" Text=""></asp:Label></h3>
                    <div class="ab-id">ID: <asp:Label ID="lbluserid" runat="server" Text=""></asp:Label></div>
                    <div class="ab-meta">
                        <div><b>Mobile</b> <asp:Label ID="lblmobile" runat="server" Text=""></asp:Label></div>
                        <div><b>Email</b> <asp:Label ID="lblemail" runat="server" Text=""></asp:Label></div>
                        <div><b>Address</b> <asp:Label ID="lbladdress" runat="server" Text=""></asp:Label></div>
                        <div><b>Activated</b> <asp:Label ID="LblActivationdate" runat="server" Text="01/07/2024"></asp:Label></div>
                    </div>
                </div>

                <div class="ab-bank">
                    <p class="ab-section-label">Bank &amp; KYC</p>
                    <div class="ab-meta">
                        <div><b>Holder</b> <asp:Label ID="lblaccountholdername" runat="server" Text=""></asp:Label></div>
                        <div><b>A/c No</b> <asp:Label ID="lblaccountno" runat="server" Text=""></asp:Label></div>
                        <div><b>Bank</b> <asp:Label ID="lblbank" runat="server" Text=""></asp:Label></div>
                        <div><b>IFSC</b> <asp:Label ID="lblifsc" runat="server" Text=""></asp:Label></div>
                        <div><b>PAN</b> <asp:Label ID="lblpan" runat="server" Text=""></asp:Label></div>
                        <div><b>Aadhaar</b> <asp:Label ID="lbladhaar" runat="server" Text=""></asp:Label></div>
                    </div>
                </div>

                <div class="ab-news">
                    <p class="ab-section-label">Latest News</p>
                    <marquee class="ab-news-scroll" behavior="scroll" direction="up" onmouseover="this.stop();" onmouseout="this.start();">
                        <asp:Literal ID="ltnews" runat="server"></asp:Literal>
                    </marquee>
                </div>
            </div>
        </div>

        <!-- Affiliate link -->
        <div class="ab-link-card" id="dvlink" runat="server" visible="True">
            <asp:Label ID="Label1" runat="server" CssClass="ab-link-label" Text="Affiliate Link (LEFT)"></asp:Label>
            <div class="ab-link-row">
                <asp:TextBox ID="TxtLeftLinkLink" runat="server" CssClass="form-control" />
                <asp:Button ID="Button1" runat="server" Text="Copy" CssClass="btn btn-primary" OnClientClick="CopyToClipboard(); return false;" />
            </div>
        </div>

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

        <!-- Income stats -->
        <h4 class="ab-group-title">Income Overview</h4>
        <div class="row">
            <div class="col-sm-6 col-xl-4">
                <div class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Conveyance Income</p>
                        <span class="ab-stat-icon"><i class="feather icon-truck"></i></span>
                    </div>
                    <h4 class="ab-stat-value"><asp:Label ID="LblconveynceIncome" runat="server" Text="Label"></asp:Label></h4>
                    <a class="ab-stat-link" href="LevelIncomeReport.aspx">More Info →</a>
                </div>
            </div>
            <div class="col-sm-6 col-xl-4">
                <div class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Self Income</p>
                        <span class="ab-stat-icon"><i class="feather icon-user"></i></span>
                    </div>
                    <h4 class="ab-stat-value"><asp:Label ID="LblSelfIncome" runat="server" Text="Label"></asp:Label></h4>
                    <a class="ab-stat-link" href="LevelIncomeReport.aspx">More Info →</a>
                </div>
            </div>
            <div class="col-sm-6 col-xl-4">
                <div class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Level Income</p>
                        <span class="ab-stat-icon"><i class="feather icon-layers"></i></span>
                    </div>
                    <h4 class="ab-stat-value"><asp:Label ID="LblLevelIncome" runat="server" Text="Label"></asp:Label></h4>
                    <a class="ab-stat-link" href="LevelIncomeReport.aspx">More Info →</a>
                </div>
            </div>
            <div class="col-sm-6 col-xl-4">
                <div class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Total Self And Level Income</p>
                        <span class="ab-stat-icon"><i class="feather icon-trending-up"></i></span>
                    </div>
                    <h4 class="ab-stat-value"><asp:Label ID="LblSlefLevel" runat="server" Text="Label"></asp:Label></h4>
                    <a class="ab-stat-link" href="LevelIncomeReport.aspx">More Info →</a>
                </div>
            </div>
            <div class="col-sm-6 col-xl-4">
                <div class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Level</p>
                        <span class="ab-stat-icon"><i class="feather icon-award"></i></span>
                    </div>
                    <h4 class="ab-stat-value"><asp:Label ID="lbllevel" runat="server" Text="Label"></asp:Label></h4>
                    <a class="ab-stat-link" href="LevelIncomeReport.aspx">More Info →</a>
                </div>
            </div>
        </div>

        <!-- Team stats -->
        <h4 class="ab-group-title">Team Overview</h4>
        <div class="row">
            <div class="col-sm-6 col-xl-4">
                <div class="ab-stat ab-stat-navy">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Total Team</p>
                        <span class="ab-stat-icon"><i class="feather icon-users"></i></span>
                    </div>
                    <h4 class="ab-stat-value"><asp:Label ID="LblTotalTeam" runat="server" Text="00"></asp:Label></h4>
                    <a class="ab-stat-link" href="DownlineReport.aspx">More Info →</a>
                </div>
            </div>
            <div class="col-sm-6 col-xl-4">
                <div class="ab-stat ab-stat-navy">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Total Direct</p>
                        <span class="ab-stat-icon"><i class="feather icon-user-plus"></i></span>
                    </div>
                    <h4 class="ab-stat-value"><asp:Label ID="LblDIrect" runat="server" Text="00"></asp:Label></h4>
                    <a class="ab-stat-link" href="DirectDownlineReport.aspx">More Info →</a>
                </div>
            </div>
            <div class="col-sm-6 col-xl-4">
                <div class="ab-stat ab-stat-navy">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Status</p>
                        <span class="ab-stat-icon"><i class="feather icon-check-circle"></i></span>
                    </div>
                    <h4 class="ab-stat-value"><asp:Label ID="LblStatus" runat="server" Text="Status"></asp:Label></h4>
                </div>
            </div>
        </div>

        <!-- Business stats -->
        <h4 class="ab-group-title">Business Overview</h4>
        <div class="row">
            <div class="col-sm-6 col-xl-4">
                <div class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Team Business</p>
                        <span class="ab-stat-icon"><i class="feather icon-briefcase"></i></span>
                    </div>
                    <h4 class="ab-stat-value"><asp:Label ID="LblTeamBusiness" runat="server" Text="Label"></asp:Label></h4>
                    <a class="ab-stat-link" href="LevelIncomeReport.aspx">More Info →</a>
                </div>
            </div>
            <div class="col-sm-6 col-xl-4">
                <div class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Self Business</p>
                        <span class="ab-stat-icon"><i class="feather icon-pocket"></i></span>
                    </div>
                    <h4 class="ab-stat-value"><asp:Label ID="LblSelfBusiness" runat="server" Text="Label"></asp:Label></h4>
                    <a class="ab-stat-link" href="LevelIncomeReport.aspx">More Info →</a>
                </div>
            </div>
            <div class="col-sm-6 col-xl-4">
                <div class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Reward Status</p>
                        <span class="ab-stat-icon"><i class="feather icon-gift"></i></span>
                    </div>
                    <h4 class="ab-stat-value"><asp:Label ID="LblReward" runat="server" Text="Status"></asp:Label></h4>
                    <a class="ab-stat-link" href="RewardReport.aspx">More Info →</a>
                </div>
            </div>
        </div>

    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript" language="javascript">
        function CopyToClipboard() {
            var copyText = document.getElementById('<%=TxtLeftLinkLink.ClientID%>');
            copyText.select();
            document.execCommand("Copy");
            alert("Copied the text: " + copyText.value);
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
