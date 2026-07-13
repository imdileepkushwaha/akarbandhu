<%@ Page Title="" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="admin_Dashboard" %>

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

        .ab-dash .ab-hero {
            background: linear-gradient(145deg, var(--ab-navy) 0%, var(--ab-navy-mid) 55%, #1a3354 100%);
            border-radius: 14px;
            padding: 1.4rem 1.5rem;
            color: #fff;
            margin-bottom: 1.25rem;
            position: relative;
            overflow: hidden;
            box-shadow: 0 14px 32px rgba(11, 28, 51, 0.22);
        }

        .ab-dash .ab-hero::before {
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

        .ab-dash .ab-hero-inner {
            position: relative;
            z-index: 1;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
            gap: 1rem;
        }

        .ab-dash .ab-hero h3 {
            font-family: "Outfit", sans-serif;
            font-size: 1.35rem;
            font-weight: 700;
            margin: 0 0 0.35rem;
            color: #fff;
        }

        .ab-dash .ab-hero p {
            margin: 0;
            color: rgba(255, 255, 255, 0.65);
            font-size: 0.92rem;
            max-width: 32rem;
        }

        .ab-dash .ab-hero-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 0.6rem;
        }

        .ab-dash .ab-hero-actions a {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 0.55rem 0.95rem;
            border-radius: 8px;
            font-size: 0.82rem;
            font-weight: 600;
            text-decoration: none;
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.14);
            transition: background 0.2s ease, border-color 0.2s ease;
        }

        .ab-dash .ab-hero-actions a:hover {
            background: rgba(230, 126, 34, 0.9);
            border-color: transparent;
            color: #fff;
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

        .ab-dash .ab-chart-card {
            background: #fff;
            border: 1px solid var(--ab-border);
            border-radius: 12px;
            padding: 1.15rem 1.2rem 0.5rem;
            box-shadow: 0 8px 20px rgba(11, 28, 51, 0.04);
            margin-top: 0.5rem;
            margin-bottom: 1rem;
        }

        .ab-dash .ab-chart-card h4 {
            font-family: "Outfit", sans-serif;
            font-size: 1.05rem;
            font-weight: 700;
            color: var(--ab-ink);
            margin: 0 0 0.85rem;
        }

        #container {
            min-height: 320px;
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
                <p>Overview of customers, plots, and bookings across Akar Bandhu.</p>
            </div>
            <div class="ab-status-pill">
                <i class="feather icon-shield"></i>
                Admin Portal
            </div>
        </div>

        <div class="ab-hero">
            <div class="ab-hero-inner">
                <div>
                    <h3>Welcome, Admin</h3>
                    <p>Manage associates, customers, plots, and bookings from one place.</p>
                </div>
                <div class="ab-hero-actions">
                    <a href="AssociateAdd.aspx"><i class="feather icon-user-plus"></i> Add Associate</a>
                    <a href="UserAdd.aspx"><i class="feather icon-users"></i> Add Customer</a>
                    <a href="IPBooking.aspx"><i class="feather icon-book"></i> New Booking</a>
                </div>
            </div>
        </div>

        <h3 class="ab-group-title">Key metrics</h3>
        <div class="row">
            <div class="col-sm-6 col-xl-3">
                <div class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Total Users</p>
                        <span class="ab-stat-icon"><i class="feather icon-users"></i></span>
                    </div>
                    <p class="ab-stat-value"><asp:Label ID="lbltotaluser" runat="server" Text="0"></asp:Label></p>
                    <a class="ab-stat-link" href="UserReport.aspx">View customers</a>
                </div>
            </div>
            <div class="col-sm-6 col-xl-3">
                <div class="ab-stat ab-stat-navy">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Total Plots</p>
                        <span class="ab-stat-icon"><i class="feather icon-map"></i></span>
                    </div>
                    <p class="ab-stat-value"><asp:Label ID="lbltotalplot" runat="server" Text="0"></asp:Label></p>
                    <a class="ab-stat-link" href="PlotReport.aspx">View plots</a>
                </div>
            </div>
            <div class="col-sm-6 col-xl-3">
                <div class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Installment Bookings</p>
                        <span class="ab-stat-icon"><i class="feather icon-calendar"></i></span>
                    </div>
                    <p class="ab-stat-value"><asp:Label ID="lbltotalipbooking" runat="server" Text="0"></asp:Label></p>
                    <a class="ab-stat-link" href="IPReport.aspx">View report</a>
                </div>
            </div>
            <div class="col-sm-6 col-xl-3">
                <div class="ab-stat ab-stat-navy">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Full Payment Bookings</p>
                        <span class="ab-stat-icon"><i class="feather icon-check-circle"></i></span>
                    </div>
                    <p class="ab-stat-value"><asp:Label ID="lbltotalfpbooking" runat="server" Text="0"></asp:Label></p>
                    <a class="ab-stat-link" href="DPReport.aspx">View report</a>
                </div>
            </div>
        </div>

        <div class="ab-chart-card">
            <h4>User registration — last 7 days</h4>
            <div id="container"></div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script src="assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="assets/js/highcharts.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "../Webservices/cityservice.asmx/getuserDataDayWise",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var series = [];
                    var Days = [];
                    var TotalUsers = [];
                    for (var i in Result) {
                        Days.push(Result[i].Day);
                        TotalUsers.push(Result[i].Users);
                    }
                    series.push({ name: 'TotalUsers', data: TotalUsers });
                    BindChart(Days, series);
                },
                error: function () {
                    // Chart is optional; keep dashboard usable if the service is unavailable
                }
            });
        });

        function BindChart(categories, series) {
            $('#container').highcharts({
                chart: { type: 'column', backgroundColor: 'transparent' },
                colors: ['#e67e22'],
                title: { text: null },
                credits: { enabled: false },
                xAxis: {
                    categories: categories,
                    labels: { style: { color: '#6b7c8f', fontWeight: '600', fontSize: '12px' } }
                },
                legend: { enabled: false },
                yAxis: {
                    min: 0,
                    title: { text: 'Users', style: { color: '#6b7c8f' } },
                    labels: { style: { color: '#6b7c8f', fontWeight: '600', fontSize: '12px' } },
                    gridLineColor: '#e2e8f0'
                },
                tooltip: {
                    formatter: function () {
                        return '<b>' + this.x + '</b><br/>' + this.series.name + ': ' + this.y;
                    }
                },
                plotOptions: {
                    column: {
                        borderRadius: 4,
                        dataLabels: { enabled: true, color: '#0f1a28', style: { textOutline: 'none', fontWeight: '600' } }
                    }
                },
                series: series
            });
        }
    </script>
</asp:Content>
