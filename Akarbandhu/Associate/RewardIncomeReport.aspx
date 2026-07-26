<%@ Page Title="Reward Income Report" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="RewardIncomeReport.aspx.cs" Inherits="associate_RewardIncomeReport"  ValidateRequest="false" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Reward Income Report</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
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
                    <h2>Reward Income Report</h2>
                    <p>Power leg 60% + weaker legs 40% of target. Period business only (no self-business condition).</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-search"></i></span>
                        <div>
                            <h3>Search Criteria</h3>
                            <span>Filter by closing period</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>Closing Period</label>
                                <asp:DropDownList ID="ddclosingperiod" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Associate Id</label>
                                <asp:TextBox ID="txtuserid" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        <asp:Button ID="btnExcel" CssClass="btn btn-excel" runat="server" Text="Excel" OnClick="btnExcel_Click" />
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-award"></i></span>
                        <div>
                            <h3>Reward Income List</h3>
                            <span>Qualified reward income for closing period</span>
                        </div>
                    </div>
                    <div class="ab-section-body ab-section-body--flush">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table ab-table table-striped" Width="100%" AutoGenerateColumns="False" GridLines="None">
                               <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Closing Period">
                                        <ItemTemplate>
                                           <asp:Label ID="lblfromdate" runat="server" Text='<%#Eval("fromdate","{0:dd/MM/yyyy}") %>'></asp:Label>-
                                            <asp:Label ID="lbltodate" runat="server" Text='<%#Eval("todate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Associate Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("associateid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Associate Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusenamegf" runat="server" Text='<%#Eval("associatename") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Matching Business">
                                        <ItemTemplate>
                                            <asp:Label ID="lblteambusiness" runat="server" Text='<%#Eval("TeamBusiness") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Power Leg">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpowerleg" runat="server" Text='<%#Eval("PowerLegBusiness") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Weaker Leg">
                                        <ItemTemplate>
                                            <asp:Label ID="lblweakerleg" runat="server" Text='<%#Eval("WeakerLegBusiness") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Self Business">
                                        <ItemTemplate>
                                            <asp:Label ID="lblselfbusiness" runat="server" Text='<%#Eval("SelfBusiness") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Target Business">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltargetbusiness" runat="server" Text='<%#Eval("TargetBusiness") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Level Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllevelname" runat="server" Text='<%#Eval("LevelName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Reward Income">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrewardincome" runat="server" Text='<%#Eval("RewardName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldate" runat="server" Text='<%#Eval("mentiondate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
