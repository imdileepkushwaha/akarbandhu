<%@ Page Title="Tree View" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="TreeView.aspx.cs" Inherits="admin_DownlineReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .treeviewclass div table tr {
            display: inline-table;
            margin-top: 5px;
            margin-bottom: 5px;
        }
        .treeNode {
            transition: all .3s;
            padding: 12px 5px;
            text-align: center;
            min-width: 250px !important;
            text-decoration: none !important;
            color: white;
            border-radius: 5px;
            background-color: #FF5252;
            margin: 10px 0px;
        }
        .rootNode {
            font-size: 18px;
            color: white;
            border-radius: 5px;
            background-color: #6bd404;
            margin: 10px 0px;
        }
        .leafNode {
            padding: 10px;
            background-color: #eeeeee;
            font-weight: bold;
            border-radius: 5px;
            background-color: #d705bb;
            margin: 10px 0px;
        }
        .selectNode {
            background-color: Black;
            font-weight: bold;
            color: #fff;
            border-radius: 5px;
            background-color: lawngreen;
            margin: 10px 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Treeview Report</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Tree View</h2>
                    <p>Visualize associate network hierarchy by associate ID.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-filter"></i></span>
                        <div>
                            <h3>Search Criteria</h3>
                            <span>Enter associate ID to load tree</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>Associate Id</label>
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
                            <span>Associate network structure</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <asp:Panel ID="pnllist" runat="server" Visible="false">
                            <asp:TreeView ShowLines="true" ID="Account_Chart" runat="server" ExpandDepth="0" ImageSet="Simple" OnTreeNodePopulate="Account_Chart_TreeNodePopulate" BorderStyle="None" NodeStyle-CssClass="treeNode"
                                RootNodeStyle-CssClass="rootNode"
                                LeafNodeStyle-CssClass="leafNode" SelectedNodeStyle-CssClass="selectNode" CssClass="treeviewclass">
                            </asp:TreeView>
                            <asp:Literal ID="ltteam" runat="server"></asp:Literal>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>
