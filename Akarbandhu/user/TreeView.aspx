<%@ Page Title="Tree View" Language="C#" MasterPageFile="usermaster.master" AutoEventWireup="true" CodeFile="TreeView.aspx.cs" Inherits="admin_DownlineReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .treeviewclass div table tr {
            display: inline-table;
            margin-top: 5px;
            margin-bottom: 5px;
        }
        .treeNode {
            transition: all .25s ease;
            padding: 12px 14px;
            text-align: center;
            min-width: 250px !important;
            text-decoration: none !important;
            color: #fff !important;
            border-radius: 10px;
            background-color: #0b1c33;
            margin: 10px 0;
            border: 1px solid rgba(11, 28, 51, 0.35);
            box-shadow: 0 2px 8px rgba(11, 28, 51, 0.12);
        }
        .treeNode:hover {
            background-color: #132a47;
        }
        .rootNode {
            font-size: 18px;
            font-weight: 700;
            color: #fff !important;
            border-radius: 10px;
            background-color: #e67e22;
            margin: 10px 0;
            border: 1px solid rgba(230, 126, 34, 0.45);
            box-shadow: 0 2px 10px rgba(230, 126, 34, 0.25);
        }
        .leafNode {
            padding: 10px 14px;
            font-weight: 600;
            color: #0b1c33 !important;
            border-radius: 10px;
            background-color: #f4f7fb;
            margin: 10px 0;
            border: 1px solid #d7e0ea;
        }
        .selectNode {
            font-weight: 700;
            color: #fff !important;
            border-radius: 10px;
            background-color: #d35400;
            margin: 10px 0;
            border: 1px solid #c0392b;
            box-shadow: 0 2px 10px rgba(211, 84, 0, 0.3);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Treeview Report</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" Runat="Server">
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
                    <h2>Tree View</h2>
                    <p>Visualize your network hierarchy by user ID.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-filter"></i></span>
                        <div>
                            <h3>Search Criteria</h3>
                            <span>Enter user ID to load tree</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>User Id</label>
                                <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-share-2"></i></span>
                        <div>
                            <h3>Tree View</h3>
                            <span>User network structure</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <asp:Panel ID="pnllist" runat="server" Visible="false">
                            <div class="table-responsive">
                                <asp:TreeView ShowLines="true" ID="Account_Chart" runat="server" ExpandDepth="0" ImageSet="Simple" OnTreeNodePopulate="Account_Chart_TreeNodePopulate" BorderStyle="None" NodeStyle-CssClass="treeNode"
                                    RootNodeStyle-CssClass="rootNode"
                                    LeafNodeStyle-CssClass="leafNode" SelectedNodeStyle-CssClass="selectNode" CssClass="treeviewclass">
                                </asp:TreeView>
                                <asp:Literal ID="ltteam" runat="server"></asp:Literal>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>
