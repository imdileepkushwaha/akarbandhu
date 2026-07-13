<%@ Page Title="Add Country" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="CountryAdd.aspx.cs" Inherits="admin_CountryAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Add Country</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Country Master</h2>
                    <p>Add or update countries used across customer and associate forms.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-globe"></i></span>
                        <div>
                            <h3><asp:Literal ID="ltFormTitle" runat="server" Text="Add Country"></asp:Literal></h3>
                            <span>Enter country details and save</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <asp:Label ID="lblcountryid" runat="server" Visible="false" Text=""></asp:Label>
                        <div id="rowid" runat="server" visible="false"></div>
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Country Name</label>
                                <asp:TextBox runat="server" ID="txtcountryname" CssClass="form-control" placeholder="e.g. India"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClientClick="return validate();" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-list"></i></span>
                        <div>
                            <h3>Country List</h3>
                            <span>All saved countries</span>
                        </div>
                    </div>
                    <div class="ab-section-body ab-section-body--flush">
                        <div class="table-responsive">
                            <asp:GridView AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" CssClass="table ab-table table-striped"
                                runat="server" ID="GridView1" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <HeaderStyle Width="70px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Country Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcountryname" runat="server" Text='<%# Eval("Countryname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnEdit" runat="server" CssClass="ab-btn-edit"
                                                ToolTip="Edit" CommandName="edt" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>">
                                                <i class="feather icon-edit-2"></i>
                                            </asp:LinkButton>
                                            <asp:Label ID="lblid" runat="server" Text='<%# Eval("CountryID") %>' Visible="False"></asp:Label>
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
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="server">
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtcountryname.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Country Name');
                document.getElementById("<%=txtcountryname.ClientID%>").focus();
                return false;
            }
        }
    </script>
</asp:Content>
