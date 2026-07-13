<%@ Page Title="" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="admin_Dashboard" %>

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
                <p class="ab-hero-eyebrow">Akar Bandhu · Admin Portal</p>
                <h1>Operations overview</h1>
                <p class="ab-hero-sub">Track customers, plots, and bookings — then jump straight into the work that matters.</p>
            </div>
            <div class="ab-hero-side">
                <div class="ab-status-pill">
                    <i class="feather icon-shield"></i>
                    Admin
                </div>
                <div class="ab-hero-id">
                    <span>Today</span>
                    <strong id="ab-today-date">—</strong>
                </div>
            </div>
        </section>

        <section class="ab-section">
            <div class="ab-section-head">
                <div>
                    <h2>Key metrics</h2>
                    <p>Live counts across users, inventory, and bookings</p>
                </div>
            </div>
            <div class="ab-stat-grid">
                <article class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Total Users</p>
                        <span class="ab-stat-icon"><i class="feather icon-users"></i></span>
                    </div>
                    <h3 class="ab-stat-value"><asp:Label ID="lbltotaluser" runat="server" Text="0"></asp:Label></h3>
                    <a class="ab-stat-link" href="UserReport.aspx">View customers <i class="feather icon-arrow-right"></i></a>
                </article>
                <article class="ab-stat ab-stat-navy">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Total Plots</p>
                        <span class="ab-stat-icon"><i class="feather icon-map"></i></span>
                    </div>
                    <h3 class="ab-stat-value"><asp:Label ID="lbltotalplot" runat="server" Text="0"></asp:Label></h3>
                    <a class="ab-stat-link" href="PlotReport.aspx">View plots <i class="feather icon-arrow-right"></i></a>
                </article>
                <article class="ab-stat">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Installment Bookings</p>
                        <span class="ab-stat-icon"><i class="feather icon-calendar"></i></span>
                    </div>
                    <h3 class="ab-stat-value"><asp:Label ID="lbltotalipbooking" runat="server" Text="0"></asp:Label></h3>
                    <a class="ab-stat-link" href="IPReport.aspx">View report <i class="feather icon-arrow-right"></i></a>
                </article>
                <article class="ab-stat ab-stat-navy">
                    <div class="ab-stat-top">
                        <p class="ab-stat-label">Full Payment Bookings</p>
                        <span class="ab-stat-icon"><i class="feather icon-check-circle"></i></span>
                    </div>
                    <h3 class="ab-stat-value"><asp:Label ID="lbltotalfpbooking" runat="server" Text="0"></asp:Label></h3>
                    <a class="ab-stat-link" href="DPReport.aspx">View report <i class="feather icon-arrow-right"></i></a>
                </article>
            </div>
        </section>

        <section class="ab-section">
            <div class="ab-section-head">
                <div>
                    <h2>Quick access</h2>
                    <p>Common admin actions</p>
                </div>
            </div>
            <div class="ab-quick-grid">
                <a href="AssociateAdd.aspx" class="ab-quick-card">
                    <span class="ab-quick-icon"><i class="feather icon-user-plus"></i></span>
                    <span class="ab-quick-copy">
                        <strong>Add Associate</strong>
                        <em>Register a new associate</em>
                    </span>
                    <i class="feather icon-arrow-right ab-quick-arrow"></i>
                </a>
                <a href="UserAdd.aspx" class="ab-quick-card">
                    <span class="ab-quick-icon"><i class="feather icon-users"></i></span>
                    <span class="ab-quick-copy">
                        <strong>Add Customer</strong>
                        <em>Create a customer account</em>
                    </span>
                    <i class="feather icon-arrow-right ab-quick-arrow"></i>
                </a>
                <a href="IPBooking.aspx" class="ab-quick-card">
                    <span class="ab-quick-icon"><i class="feather icon-book"></i></span>
                    <span class="ab-quick-copy">
                        <strong>New Booking</strong>
                        <em>Installment plan booking</em>
                    </span>
                    <i class="feather icon-arrow-right ab-quick-arrow"></i>
                </a>
                <a href="PlotAdd.aspx" class="ab-quick-card">
                    <span class="ab-quick-icon"><i class="feather icon-map"></i></span>
                    <span class="ab-quick-copy">
                        <strong>Add Plot</strong>
                        <em>Update inventory</em>
                    </span>
                    <i class="feather icon-arrow-right ab-quick-arrow"></i>
                </a>
                <a href="FundRequestReport.aspx" class="ab-quick-card">
                    <span class="ab-quick-icon"><i class="feather icon-inbox"></i></span>
                    <span class="ab-quick-copy">
                        <strong>Fund Requests</strong>
                        <em>Review pending deposits</em>
                    </span>
                    <i class="feather icon-arrow-right ab-quick-arrow"></i>
                </a>
                <a href="WithdrawlRequestReport.aspx" class="ab-quick-card">
                    <span class="ab-quick-icon"><i class="feather icon-pocket"></i></span>
                    <span class="ab-quick-copy">
                        <strong>Withdrawals</strong>
                        <em>Process payout requests</em>
                    </span>
                    <i class="feather icon-arrow-right ab-quick-arrow"></i>
                </a>
            </div>
        </section>

        <section class="ab-section ab-section--chart">
            <div class="ab-section-head">
                <div>
                    <h2>User registration</h2>
                    <p>New sign-ups over the last 7 days</p>
                </div>
                <a class="ab-section-more" href="UserReport.aspx">All users <i class="feather icon-arrow-right"></i></a>
            </div>
            <div class="ab-chart-card">
                <div id="container"></div>
            </div>
        </section>

    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script src="assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="assets/js/highcharts.js" type="text/javascript"></script>
    <script type="text/javascript">
        (function () {
            var el = document.getElementById('ab-today-date');
            if (el) {
                var opts = { weekday: 'short', day: 'numeric', month: 'short', year: 'numeric' };
                el.textContent = new Date().toLocaleDateString('en-IN', opts);
            }
        })();

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
                    series.push({ name: 'Total Users', data: TotalUsers });
                    BindChart(Days, series);
                },
                error: function () {
                    // Chart is optional; keep dashboard usable if the service is unavailable
                }
            });
        });

        function BindChart(categories, series) {
            $('#container').highcharts({
                chart: {
                    type: 'column',
                    backgroundColor: 'transparent',
                    spacingTop: 8,
                    spacingBottom: 8
                },
                colors: ['#e67e22'],
                title: { text: null },
                credits: { enabled: false },
                xAxis: {
                    categories: categories,
                    lineColor: '#e2e8f0',
                    tickColor: '#e2e8f0',
                    labels: {
                        style: {
                            color: '#6b7c8f',
                            fontWeight: '600',
                            fontSize: '12px',
                            fontFamily: 'DM Sans, sans-serif'
                        }
                    }
                },
                legend: { enabled: false },
                yAxis: {
                    min: 0,
                    allowDecimals: false,
                    title: {
                        text: 'Users',
                        style: { color: '#6b7c8f', fontWeight: '600', fontFamily: 'DM Sans, sans-serif' }
                    },
                    labels: {
                        style: {
                            color: '#6b7c8f',
                            fontWeight: '600',
                            fontSize: '12px',
                            fontFamily: 'DM Sans, sans-serif'
                        }
                    },
                    gridLineColor: '#eef2f7'
                },
                tooltip: {
                    backgroundColor: '#0b1c33',
                    borderWidth: 0,
                    borderRadius: 8,
                    style: { color: '#fff', fontFamily: 'DM Sans, sans-serif' },
                    formatter: function () {
                        return '<b>' + this.x + '</b><br/>' + this.series.name + ': <b>' + this.y + '</b>';
                    }
                },
                plotOptions: {
                    column: {
                        borderRadius: 6,
                        borderWidth: 0,
                        pointPadding: 0.18,
                        groupPadding: 0.12,
                        dataLabels: {
                            enabled: true,
                            color: '#0f1a28',
                            style: {
                                textOutline: 'none',
                                fontWeight: '700',
                                fontFamily: 'Outfit, sans-serif',
                                fontSize: '11px'
                            }
                        }
                    }
                },
                series: series
            });
        }
    </script>
</asp:Content>
