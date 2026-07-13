<%@ Page Title="Plot Availability" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="PlotAvailability.aspx.cs" Inherits="admin_AssociateReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .ab-plot-grid {
            display: block;
            width: 100%;
        }
        .ab-plot-grid table {
            width: 100%;
        }
        .ab-plot-grid td {
            vertical-align: top;
            padding: 0.55rem;
        }
        .ab-plot-card {
            background: #fff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 0.9rem 0.65rem 0.85rem;
            text-align: center;
            transition: border-color 0.2s ease, box-shadow 0.2s ease, transform 0.2s ease;
            min-height: 132px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            gap: 0.35rem;
        }
        .ab-plot-card:hover {
            border-color: rgba(230, 126, 34, 0.45);
            box-shadow: 0 8px 22px rgba(11, 28, 51, 0.08);
            transform: translateY(-2px);
        }
        .ab-plot-card img {
            height: 46px;
            width: auto;
            margin-bottom: 0.15rem;
        }
        .ab-plot-card .ab-plot-title {
            font-family: "Outfit", sans-serif;
            font-size: 0.88rem;
            font-weight: 700;
            color: #0b1c33;
            line-height: 1.25;
        }
        .ab-plot-card .ab-plot-meta {
            font-size: 0.78rem;
            color: #6b7c8f;
            font-weight: 500;
        }
        .ab-plot-legend {
            display: flex;
            flex-wrap: wrap;
            gap: 0.75rem 1.25rem;
            margin-bottom: 1rem;
            padding: 0.75rem 1rem;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
        }
        .ab-plot-legend-item {
            display: inline-flex;
            align-items: center;
            gap: 0.45rem;
            font-size: 0.82rem;
            font-weight: 600;
            color: #0b1c33;
        }
        .ab-plot-legend-item img {
            height: 22px;
            width: auto;
        }
        @media (max-width: 767px) {
            .ab-plot-grid td {
                display: block;
                width: 50% !important;
                float: left;
            }
        }
        @media (max-width: 480px) {
            .ab-plot-grid td {
                width: 100% !important;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Plot Availability</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Plot Availability</h2>
                    <p>Check vacant, booked and sold plots by project and block.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-filter"></i></span>
                        <div>
                            <h3>Search Criteria</h3>
                            <span>Select project and block to view plots</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>Select Project</label>
                                <asp:DropDownList ID="ddproject" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddproject_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Select Block</label>
                                <asp:DropDownList ID="ddblock" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Block</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnsearch" runat="server" OnClick="btnsearch_Click" CssClass="btn btn-primary" Text="Search"></asp:Button>
                    </div>
                </div>

                <asp:Panel ID="pnllist" runat="server">
                    <div class="ab-section">
                        <div class="ab-section-head">
                            <span class="ab-section-icon"><i class="feather icon-map"></i></span>
                            <div>
                                <h3>Plot Availability</h3>
                                <span>Status of plots in the selected block</span>
                            </div>
                        </div>
                        <div class="ab-section-body">
                            <div class="ab-plot-legend">
                                <span class="ab-plot-legend-item">
                                    <img src="assets/images/available.png" alt="" /> Vacant
                                </span>
                                <span class="ab-plot-legend-item">
                                    <img src="assets/images/booked.png" alt="" /> Booked
                                </span>
                                <span class="ab-plot-legend-item">
                                    <img src="assets/images/sold.png" alt="" /> Sold
                                </span>
                            </div>
                            <div class="ab-plot-grid">
                                <asp:DataList ID="DataList1" runat="server" RepeatColumns="8" OnItemDataBound="DataList1_ItemDataBound" Style="width: 100%;" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <div class="ab-plot-card">
                                            <asp:Literal ID="ltimage" runat="server"></asp:Literal>
                                            <div class="ab-plot-title">
                                                <asp:Label ID="lblblockname" runat="server" Text='<%#Eval("blockname") %>'></asp:Label>
                                                -
                                                <asp:Label ID="lblplotno" runat="server" Text='<%#Eval("plotno") %>'></asp:Label>
                                            </div>
                                            <div class="ab-plot-meta">
                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("landarea") %>'></asp:Label> sqft
                                            </div>
                                            <asp:Label ID="lblstatus" Visible="false" runat="server" Text='<%#Eval("plotstatus2") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
