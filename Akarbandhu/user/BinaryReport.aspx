<%@ Page Title="Binary Report" Language="C#" MasterPageFile="usermaster.master" AutoEventWireup="true" CodeFile="BinaryReport.aspx.cs" Inherits="admin_BinaryReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Binary Report</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnldata" runat="server">
                <div class="ab-wm">
                    <div class="ab-page-head">
                        <h2>Binary Report</h2>
                        <p>View your binary tree network structure.</p>
                    </div>

                    <div class="ab-section">
                        <div class="ab-section-head">
                            <span class="ab-section-icon"><i class="feather icon-search"></i></span>
                            <div>
                                <h3>Search Criteria</h3>
                                <span>Load binary tree for user id</span>
                            </div>
                        </div>
                        <div class="ab-section-body">
                            <div class="row">
                                <div class="col-md-4 ab-field">
                                    <label>User Id</label>
                                    <asp:TextBox ID="txtuserid" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
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
                            <span class="ab-section-icon"><i class="feather icon-list"></i></span>
                            <div>
                                <h3>Binary Tree</h3>
                                <span>Interactive binary network view</span>
                            </div>
                        </div>
                        <div class="ab-section-body ab-section-body--flush">
                            <div class="table-responsive">
                                <iframe id="f1" runat="server" style="height:850px;width:100%;border:0px;"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlnotauthorize" runat="server">
                <div class="ab-wm">
                    <div class="ab-page-head">
                        <h2>Binary Report</h2>
                        <p>View your binary tree network structure.</p>
                    </div>
                    <div class="ab-section">
                        <div class="ab-section-body">
                            <h3>You are not authorize to access this page</h3>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>
