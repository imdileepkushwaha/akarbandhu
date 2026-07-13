<%@ Page Title="" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="AssociateLedgerReport.aspx.cs" Inherits="admin_DownlineReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
      <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Associate Ledger Report</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" Runat="Server">
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
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtuserid" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                  
                                </div>
                              
                                <hr />
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit"  CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                          
                        </div>
                    </div>

             <div class="card">
        <div class="card-header">
            <strong>Associate Ledger List</strong>
        </div>
        <div class="card-body">

                        <div class="table-responsive">

                            <asp:GridView ID="GridView1" PageSize="15" AutoGenerateColumns="false" CssClass="table table-bordered table-striped table-hover"  runat="server">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Payment Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbookingdate" Text='<%#Eval("paymentdate","{0:dd/MM/yyyy}") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pay Mode">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcustomerid" runat="server" Text='<%#Eval("paymentmode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Chq/Neft No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcustomername" Text='<%#Eval("chequeno") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remark">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAssociaterid" runat="server" Text='<%#Eval("remark") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Particular">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcategory" runat="server" Text='<%#Eval("transactiontype") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Payout">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldramount" Text='<%#Eval("dramount") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Advance">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcramount" Text='<%#Eval("cramount") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                    
                                    <asp:TemplateField HeaderText="Balance">
                                        <ItemTemplate>
                                            <%--<asp:Label ID="lblbalance2" Visible="false" Text='<%#Eval("balance") %>' runat="server"></asp:Label>--%>
                                            <asp:Label ID="lblbalance" Text="" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--   <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate><a href='BookingReceipt.aspx?BookingId=<%#Eval("accountno") %>'>Receipt</a>
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
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>

