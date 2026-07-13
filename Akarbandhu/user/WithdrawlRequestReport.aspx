<%@ Page Title="Withdrawl Report" Language="C#" MasterPageFile="usermaster.master" AutoEventWireup="true" CodeFile="WithdrawlRequestReport.aspx.cs" Inherits="admin_UserReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
 <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Withdrawal Request Report</a></li>
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
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label for="exampleInputEmail1">From Date</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox runat="server" CssClass="form-control form_date" autocomplete="off" ID="txtfromdate"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-3">
                                        <label for="exampleInputEmail1">To Date</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox runat="server" CssClass="form-control form_date" autocomplete="off" ID="txttodate"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row" style="display:none;">
                                    <div class="col-md-3">
                                        <label for="exampleInputEmail1">Status</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddstatus" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Status</asp:ListItem>
                                            <asp:ListItem>Pending</asp:ListItem>
                                            <asp:ListItem>Approved</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btncancel_Click" />
                                    </div>
                                </div>
                </div>
            </div>
            <div class="card">
        <div class="card-header">
            <strong>Withdrawl List</strong>
        </div>
        <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" Width="100%" AutoGenerateColumns="False" OnRowDataBound="grdGetHelp_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                            <asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date of Request">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcreatingdate" runat="server" Text='<%#Eval("mentiondate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Approve Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblreleasedate" runat="server" Text='<%#Eval("approvedate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblamount" runat="server" Text='<%#Eval("amount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mode">
                                        <ItemTemplate>
                                            <asp:Label ID="lblmode" runat="server" Text='<%#Eval("paymentmode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Transaction Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltransactionid" runat="server" Text='<%#Eval("OnlineTransactionId") %>'></asp:Label>
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

