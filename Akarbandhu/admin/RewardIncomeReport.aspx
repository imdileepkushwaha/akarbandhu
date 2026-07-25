<%@ Page Title="Reward Income Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="RewardIncomeReport.aspx.cs" Inherits="admin_RewardIncomeReport"  ValidateRequest="false" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
      <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Reward Income Report</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
             <div class="card">
        <div class="card-header">
            <strong>Search Criteria</strong>
        </div>
        <div class="card-body">
                            
                                  <div class="row form-group">
                                    <div class="col-md-2">Closing Period</div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddclosingperiod"   CssClass="form-control " runat="server"></asp:DropDownList>
                                    </div>
                                   <div class="col-md-1"></div>
                                        <div class="col-md-2">Associate Id</div>
                                    <div class="col-md-3">
                                      <asp:TextBox ID="txtuserid"  CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                               
                               
                                <hr />
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit"  CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                         <asp:Button ID="btnExcel" CssClass="btn info" runat="server" Text="Excel" OnClick="btnExcel_Click" />
                                    </div>
                                </div>
                </div>
            </div>

            <div class="card">
        <div class="card-header">
            <strong>Reward Income Report</strong>
            <small class="text-muted"> (Min Self Purchase: 6,00,000)</small>
        </div>
        <div class="card-body">

                        <div class="table-responsive">

                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" Width="100%" AutoGenerateColumns="False">
                               <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
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
                                     <asp:TemplateField HeaderText="Level">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllevelno" runat="server" Text='<%#Eval("LevelNo") %>'></asp:Label>
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
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
