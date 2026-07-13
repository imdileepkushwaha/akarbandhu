<%@ Page Title="Installment Plan Reverse Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="IPReverseReport.aspx.cs" Inherits="admin_DPReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Installment Booking Reverse Report</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Installment Booking Reverse Report</h2>
                    <p>Search reversed installment plan bookings.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-filter"></i></span>
                        <div>
                            <h3>Search Criteria</h3>
                            <span>Filter by date, customer and project</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>From Booking Date</label>
                                <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>To Booking Date</label>
                                <asp:TextBox ID="txttodate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Booking Id</label>
                                <asp:TextBox ID="txtbookingid" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Customer Id</label>
                                <asp:TextBox ID="txtcustomerid" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Customer Name</label>
                                <asp:TextBox ID="txtcustomername" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Associate Id</label>
                                <asp:TextBox ID="txtassociateid" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Select Project</label>
                                <asp:DropDownList ID="ddproject" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddproject_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Select Block</label>
                                <asp:DropDownList ID="ddblock" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddblock_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Block</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Select Plot</label>
                                <asp:DropDownList ID="ddplot" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Plot</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                    </div>
                </div>

                <asp:Panel ID="pnllist" runat="server" Visible="false">
                    <div class="ab-section">
                        <div class="ab-section-head">
                            <span class="ab-section-icon"><i class="feather icon-list"></i></span>
                            <div>
                                <h3>IP Reverse List</h3>
                                <span>Reversed installment bookings</span>
                            </div>
                        </div>
                        <div class="ab-section-body ab-section-body--flush">
                            <div class="table-responsive">
                                <asp:GridView ID="GridView1" PageSize="15" AutoGenerateColumns="false" ShowFooter="true" CssClass="table ab-table table-striped" runat="server" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" GridLines="None">
                                    <Columns>
                                        <asp:TemplateField HeaderText="#">
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex+1 %>
                                            </ItemTemplate>
                                            <HeaderStyle Width="60px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Booking Id">
                                            <ItemTemplate>
                                                <asp:Label ID="lblbookingid" runat="server" Text='<%#Eval("accountno") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Customer Id">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcustomerid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Customer Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcustomername" Text='<%#Eval("username") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Booking Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblbookingdate" Text='<%#Eval("bookingdate","{0:dd/MM/yyyy}") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Reverse Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblreversedate" Text='<%#Eval("deletedate","{0:dd/MM/yyyy}") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Associate Id">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAssociaterid" runat="server" Text='<%#Eval("sponserid") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Plan Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblplanname" Text='<%#Eval("planname") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Project Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblprojectname" Text='<%#Eval("projectname") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Plot No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblplotno" Text='<%#Eval("plotname") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Plot Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblplotamount" Text='<%#Eval("plotamount") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DP Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblbookingamount" Text='<%#Eval("bookingamount") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Paid DP Amt">
                                            <ItemTemplate>
                                                <asp:Label ID="lblpaidamount" Text='<%#Eval("totalpaid") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remark">
                                            <ItemTemplate>
                                                <asp:Label ID="lblremark" Text='<%#Eval("remark") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlDPPayment" runat="server" Visible="false">
                    <div class="ab-section">
                        <div class="ab-section-head">
                            <span class="ab-section-icon"><i class="feather icon-credit-card"></i></span>
                            <div>
                                <h3>Reverse Payment Details</h3>
                                <span>Record reverse payment information</span>
                            </div>
                        </div>
                        <div class="ab-section-body">
                            <div class="row">
                                <div class="col-md-4 ab-field">
                                    <label>Booking Id</label>
                                    <asp:Label ID="lblbookingidedit" runat="server" CssClass="form-control-plaintext font-weight-bold" Text=""></asp:Label>
                                </div>
                                <div class="col-md-4 ab-field">
                                    <label>Paid Amount</label>
                                    <asp:TextBox ID="lblpaidamountedit" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4 ab-field">
                                    <label>Payment Date</label>
                                    <asp:TextBox ID="txtpaymentdateedit" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4 ab-field">
                                    <label>Payment Mode</label>
                                    <asp:DropDownList ID="ddpaymentmodeedit" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddpaymentmodedp_SelectedIndexChanged">
                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                        <asp:ListItem>Cash</asp:ListItem>
                                        <asp:ListItem Value="Cheque">Cheque/DD</asp:ListItem>
                                        <asp:ListItem Value="Online">Online Transaction</asp:ListItem>
                                        <asp:ListItem Value="CP Credit">CP Credit</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div id="Div1DP" runat="server" visible="false">
                                <div class="row">
                                    <div class="col-md-4 ab-field">
                                        <label>Cheque No</label>
                                        <asp:TextBox ID="txtchequenoedit" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4 ab-field">
                                        <label>Cheque Date</label>
                                        <asp:TextBox ID="txtchequedateedit" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4 ab-field">
                                        <label>Bank Name</label>
                                        <asp:TextBox ID="txtbanknameedit" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4 ab-field">
                                        <label>Branch Name</label>
                                        <asp:TextBox ID="txtbranchnameedit" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 ab-field">
                                    <label>Transaction ID</label>
                                    <asp:TextBox ID="txttransactionidedit" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="ab-actions">
                            <asp:Button ID="btnPayDP" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnPayDP_Click" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
