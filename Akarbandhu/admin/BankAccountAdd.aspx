<%@ Page Title="Add Bank Account" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="BankAccountAdd.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Add Bank Account</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Bank Account</h2>
                    <p>Manage deposit bank accounts shown for payments.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-credit-card"></i></span>
                        <div>
                            <h3><asp:Literal ID="ltFormTitle" runat="server" Text="Add Bank Account"></asp:Literal></h3>
                            <span>Enter account and bank details</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <asp:Label ID="lblbankaccountid" runat="server" Visible="false" Text=""></asp:Label>
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Deposit Account No</label>
                                <asp:TextBox ID="txtdepositaccountno" onkeypress="return isNumber(event)" runat="server" CssClass="form-control" placeholder="Account number" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Account Holder Name</label>
                                <asp:TextBox ID="txtaccountholdername" runat="server" CssClass="form-control" placeholder="Full name" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Deposit Bank</label>
                                <asp:TextBox ID="txtdepositbank" runat="server" CssClass="form-control" placeholder="Bank name" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>IFSC Code</label>
                                <asp:TextBox ID="txtifsccode" runat="server" CssClass="form-control" placeholder="e.g. SBIN0001234" />
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Branch Name</label>
                                <asp:TextBox ID="txtbranchname" runat="server" CssClass="form-control" placeholder="Branch" />
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" OnClick="btnCancel_Click" Text="Cancel" CausesValidation="false" />
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-list"></i></span>
                        <div>
                            <h3>Bank Account List</h3>
                            <span>Saved deposit accounts</span>
                        </div>
                    </div>
                    <div class="ab-section-body ab-section-body--flush">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table ab-table table-striped" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="70px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Acc Holder Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblaccountholdername" runat="server" Text='<%# Eval("accountholdername") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Account No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblaccountno" runat="server" Text='<%# Eval("accountno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bank Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbankname" runat="server" Text='<%# Eval("BankName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="IFSC Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblifsccode" runat="server" Text='<%# Eval("ifsccode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Branch Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbranchname" runat="server" Text='<%# Eval("branchname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbEdit" CssClass="ab-btn-edit" ToolTip="Edit" CommandName="edt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server">
                                                <i class="feather icon-edit-2"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="lbDelete" CssClass="ab-btn-delete" ToolTip="Delete" CommandName="mydel" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server" OnClientClick="return confirm('Delete this bank account?');">
                                                <i class="feather icon-trash-2"></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle Width="120px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtaccountholdername.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Acc Holder Name');
                document.getElementById("<%=txtaccountholdername.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtdepositaccountno.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Account No');
                document.getElementById("<%=txtdepositaccountno.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtdepositbank.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Bank Name');
                document.getElementById("<%=txtdepositbank.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtifsccode.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter IFSC Code ');
                document.getElementById("<%=txtifsccode.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtbranchname.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Branch Name');
                document.getElementById("<%=txtbranchname.ClientID%>").focus();
                return false;
            }
        }
    </script>
</asp:Content>
