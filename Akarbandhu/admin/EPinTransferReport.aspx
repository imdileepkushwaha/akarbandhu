<%@ Page Title="" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="EPinTransferReport.aspx.cs" Inherits="admin_EPinReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <h3 class="main-title">E-Pin Transfer Report </h3>
    <span>Dashboard / E-Pin Transfer Report </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
              <div class="card">
        <div class="card-header">
            <strong>Search Criteria</strong>
        </div>
        <div class="card-body">
                                <div class="row form-group">
                                    <div class="col-md-3">From User ID</div>
                                    <div class="col-md-3">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtgenerateuserid"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">To User ID</div>
                                    <div class="col-md-3">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtuseduserid"></asp:TextBox>
                                    </div>
                                   
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-3">From Date</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">To Date</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txttodate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <hr />
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                </div>
            </div>
             <div class="card">
        <div class="card-header">
            <strong>E-Pin Transfer List</strong>
        </div>
        <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" Width="100%" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                            <asp:Label ID="lblId" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="E-Pin No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepinno" runat="server" Text='<%#Eval("EPinNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="From User Id ">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGenerateUserId" runat="server" Text='<%#Eval("UserIdFrom") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                        <asp:TemplateField HeaderText="To User Id ">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGeneraffteUserId" runat="server" Text='<%#Eval("UserIdTo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  
                                  
                                    
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMentionDate" runat="server" Text='<%#Eval("MentionDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>

