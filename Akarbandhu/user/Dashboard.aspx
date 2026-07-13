<%@ Page Title="" Language="C#" MasterPageFile="usermaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="admin_Dashboard" %>

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

        .ab-dash .ab-status-pill .dot {
            width: 7px;
            height: 7px;
            border-radius: 50%;
            background: #22c55e;
            box-shadow: 0 0 0 3px rgba(34, 197, 94, 0.22);
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
            grid-template-columns: auto 1fr 1fr minmax(180px, 0.9fr);
            gap: 1.25rem;
            position: relative;
            z-index: 1;
            align-items: start;
        }

        .ab-dash .ab-avatar img {
            width: 88px;
            height: 88px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid rgba(230, 126, 34, 0.65);
            box-shadow: 0 0 0 4px rgba(230, 126, 34, 0.15);
            display: block;
            background: rgba(255, 255, 255, 0.08);
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
            gap: 0.4rem;
            font-size: 0.88rem;
            color: rgba(255, 255, 255, 0.82);
        }

        .ab-dash .ab-meta b {
            color: rgba(255, 255, 255, 0.5);
            font-weight: 500;
            min-width: 4.8rem;
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

        .ab-dash .ab-actions {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 1rem;
            margin-bottom: 0.5rem;
        }

        .ab-dash .ab-action {
            display: flex;
            align-items: center;
            gap: 0.85rem;
            background: #fff;
            border: 1px solid var(--ab-border);
            border-radius: 12px;
            padding: 1rem 1.15rem;
            text-decoration: none !important;
            color: var(--ab-ink);
            box-shadow: 0 8px 20px rgba(11, 28, 51, 0.04);
            transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
        }

        .ab-dash .ab-action:hover {
            transform: translateY(-2px);
            box-shadow: 0 14px 28px rgba(11, 28, 51, 0.08);
            border-color: rgba(230, 126, 34, 0.35);
            color: var(--ab-ink);
        }

        .ab-dash .ab-action-icon {
            width: 42px;
            height: 42px;
            border-radius: 10px;
            display: inline-flex!important;
            align-items: center;
            justify-content: center;
            background: rgba(230, 126, 34, 0.12);
            color: var(--ab-orange);
            flex-shrink: 0;
        }

        .ab-dash .ab-action-icon i {
            font-size: 1.1rem;
        }

        .ab-dash .ab-action strong {
            display: block;
            font-family: "Outfit", sans-serif;
            font-size: 0.98rem;
            font-weight: 700;
            margin-bottom: 0.1rem;
        }

        .ab-dash .ab-action span {
            display: block;
            font-size: 0.8rem;
            color: var(--ab-muted);
        }

        /* Keep legacy labels available for code-behind without showing old UI */
        .ab-dash .ab-legacy {
            display: none;
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

            .ab-dash .ab-actions {
                grid-template-columns: 1fr;
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
                <h2>Welcome back</h2>
                <p>Your account overview and banking details at a glance.</p>
            </div>
            <div class="ab-status-pill">
                <span class="dot"></span>
                Account Active
                <asp:Label ID="lblactivestatus" runat="server" Text=""></asp:Label>
            </div>
        </div>

        <div class="ab-profile-card">
            <div class="ab-profile-grid">
                <div class="ab-avatar">
                    <img alt="profile" src="assets/images/user/default.png" />
                </div>

                <div>
                    <p class="ab-section-label">Profile</p>
                    <h3 class="ab-name">
                        <asp:Label ID="lblusername" runat="server" Text=""></asp:Label>
                    </h3>
                    <div class="ab-id">
                        <asp:Label ID="lbluserid" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="ab-meta">
                        <div><b>Mobile</b> <asp:Label ID="lblmobile" runat="server" Text=""></asp:Label></div>
                        <div><b>Email</b> <asp:Label ID="lblemail" runat="server" Text=""></asp:Label></div>
                        <div><b>Address</b> <asp:Label ID="lbladdress" runat="server" Text=""></asp:Label></div>
                    </div>
                </div>

                <div class="ab-bank">
                    <p class="ab-section-label">Bank Details</p>
                    <div class="ab-meta">
                        <div><b>Holder</b> <asp:Label ID="lblaccountholdername" runat="server" Text=""></asp:Label></div>
                        <div><b>A/c No</b> <asp:Label ID="lblaccountno" runat="server" Text=""></asp:Label></div>
                        <div><b>Bank</b> <asp:Label ID="lblbank" runat="server" Text=""></asp:Label></div>
                        <div><b>IFSC</b> <asp:Label ID="lblifsc" runat="server" Text=""></asp:Label></div>
                        <div><b>PAN</b> <asp:Label ID="lblpan" runat="server" Text=""></asp:Label></div>
                    </div>
                </div>

                <div class="ab-news">
                    <p class="ab-section-label">Latest Updates</p>
                    <div class="ab-news-scroll">
                        <marquee behavior="scroll" direction="up" style="height: 150px;" onmouseover="this.stop();" onmouseout="this.start();">
                            <asp:Literal ID="ltnews" runat="server"></asp:Literal>
                        </marquee>
                    </div>
                </div>
            </div>
        </div>

        <div class="ab-actions">
            <a class="ab-action" href="UserEdit.aspx">
                <span class="ab-action-icon"><i class="feather icon-edit"></i></span>
                <span>
                    <strong>Edit Profile</strong>
                    <span>Update personal details</span>
                </span>
            </a>
            <a class="ab-action" href="CHangePassword.aspx">
                <span class="ab-action-icon"><i class="feather icon-lock"></i></span>
                <span>
                    <strong>Change Password</strong>
                    <span>Keep your account secure</span>
                </span>
            </a>
            <a class="ab-action" href="#">
                <span class="ab-action-icon"><i class="feather icon-book"></i></span>
                <span>
                    <strong>My Bookings</strong>
                    <span>View installment &amp; payments</span>
                </span>
            </a>
        </div>

        <%-- Legacy dashboard stats (kept for compatibility; currently unused in code-behind) --%>
        <div class="ab-legacy">
            <asp:Label ID="lblmypackage" runat="server" Text="0"></asp:Label>
            <asp:Label ID="lbltotalteam" runat="server" Text="0"></asp:Label>
            <asp:Label ID="lbldirectreferral" runat="server" Text="0"></asp:Label>
            <asp:Label ID="lblmyearning" runat="server" Text="0"></asp:Label>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
