<%@ Page Title="" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="DirectDownlineReport.aspx.cs" Inherits="admin_DownlineReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Direct Report</a></li>
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
                    <h2>Direct Report</h2>
                    <p>Search and view your direct downline associates.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-search"></i></span>
                        <div>
                            <h3>Search Criteria</h3>
                            <span>Filter direct downline by user id</span>
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
                        <span class="ab-section-icon"><i class="feather icon-list"></i></span>
                        <div>
                            <h3>Downline List</h3>
                            <span>Matching direct downline associates</span>
                        </div>
                    </div>
                    <div class="ab-section-body ab-section-body--flush">
                        <div class="row" style="padding: 0 1rem 0.75rem;">
                            <div class="col-md-8"></div>
                            <div class="col-md-4 ab-field text-right">
                                <label>Records</label>
                                <asp:DropDownList ID="ddlRecordFilter" runat="server" CssClass="form-control pull-right margin-left-10" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlRecordFilter_SelectedIndexChanged" Width="80px">
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>100</asp:ListItem>
                                    <asp:ListItem>500</asp:ListItem>
                                    <asp:ListItem>All</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <asp:GridView ID="grdBank" runat="server" CssClass="table ab-table table-striped" Width="100%" AutoGenerateColumns="false" EmptyDataText="No Data Found" GridLines="None">
                                <Columns>
                                    <%--<asp:BoundField DataField="UserId" HeaderText="User ID" />
                                                <asp:BoundField DataField="UserName" HeaderText="User Name" />                                              
                                                <asp:BoundField DataField="Gender" HeaderText="Gender" />                                            
                                                <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                                                <asp:BoundField DataField="Address" HeaderText="Address" />
                                                <asp:BoundField DataField="RegDate" HeaderText="D. O. J." />
                                             <asp:BoundField DataField="ParentUserID" HeaderText="Parent ID" />
                                             <asp:BoundField DataField="parentname" HeaderText="Parent Name" />
                                             
                                                <asp:BoundField DataField="Status" HeaderText="Status" />--%>

                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="SponserId" HeaderText="Sponsor ID" />
                                    <asp:BoundField DataField="AssociateId" HeaderText="User ID" />
                                    <asp:BoundField DataField="AssociateName" HeaderText="User Name" />
                                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                    <asp:BoundField DataField="RegDate" HeaderText="D. O. J." />
                                    <%--   <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>' CssClass='<%#Eval("Status") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>                                --%>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>
