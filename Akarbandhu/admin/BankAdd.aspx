<%@ Page Title="Add Bank" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="BankAdd.aspx.cs" Inherits="admin_BankAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Add Bank</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Bank Master</h2>
                    <p>Add or update bank names used in account forms.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-briefcase"></i></span>
                        <div>
                            <h3><asp:Literal ID="ltFormTitle" runat="server" Text="Add Bank"></asp:Literal></h3>
                            <span>Enter bank name and save</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <asp:Label ID="lblbankid" runat="server" Visible="false" Text=""></asp:Label>
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Bank Name</label>
                                <asp:TextBox ID="txtbankname" CssClass="form-control" runat="server" placeholder="e.g. State Bank of India"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-list"></i></span>
                        <div>
                            <h3>Bank List</h3>
                            <span>All saved banks</span>
                        </div>
                    </div>
                    <div class="ab-section-body ab-section-body--flush">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table ab-table table-striped" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("Bankid") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="70px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bank Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbankname" runat="server" Text='<%# Eval("BankName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbEdit" CssClass="ab-btn-edit" ToolTip="Edit" CommandName="edt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server">
                                                <i class="feather icon-edit-2"></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle Width="90px" />
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
            if (document.getElementById("<%=txtbankname.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Bank Name');
                document.getElementById("<%=txtbankname.ClientID%>").focus();
                return false;
            }
        }
    </script>
</asp:Content>
