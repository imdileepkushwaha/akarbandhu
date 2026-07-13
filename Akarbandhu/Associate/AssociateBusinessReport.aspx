<%@ Page Title="Associate Business Report" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="AssociateBusinessReport.aspx.cs" Inherits="admin_DownlineReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
     <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Associate Business Report</a></li>
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
                        <div class="col-md-2">Associate Id</div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtuserid" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                         <%-- <div class="col-md-1"></div>
                          <div class="col-md-2">Standing Position</div>
                            <div class="col-md-3">
                                <asp:RadioButtonList ID="rbstandingposition" RepeatDirection="Horizontal" runat="server" style="width:100%;">
                                    <asp:ListItem >Left</asp:ListItem>
                                    <asp:ListItem>Right</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>--%>
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
                    <strong>Associate Business List</strong>
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
                                <asp:TemplateField HeaderText="Associate ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("sponserid") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Associate Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblusername" runat="server" Text='<%#Eval("Associatename") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsponserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsponsername" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Booking Id">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsponsername" runat="server" Text='<%#Eval("accountno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Inst Amt">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsponsername" runat="server" Text='<%#Eval("InstAmt") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Payment Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldate" runat="server" Text='<%#Eval("paymentdate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Payment Mode">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldate" runat="server" Text='<%#Eval("paymentmode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                <%--  <asp:TemplateField HeaderText="Level">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluserlevel" runat="server" Text='<%#Eval("userlevel") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
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

