<%@ Page Title="Add Block" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="BlockAdd.aspx.cs" Inherits="admin_StateAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Add Block</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Block Master</h2>
                    <p>Add and manage blocks within projects.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-grid"></i></span>
                        <div>
                            <h3>Add Block</h3>
                            <span>Select project and enter block name</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Select Proejct</label>
                                <asp:DropDownList ID="ddproject" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Project</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Block Name</label>
                                <asp:TextBox ID="txtblockname" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClientClick="return validate();" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btnCancel_Click" />
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-list"></i></span>
                        <div>
                            <h3>Block List</h3>
                            <span>All saved blocks</span>
                        </div>
                    </div>
                    <div class="ab-section-body ab-section-body--flush">
                        <div class="table-responsive">
                            <asp:GridView AutoGenerateColumns="False" CssClass="table ab-table table-striped"
                                runat="server" OnRowCommand="GridView1_RowCommand" ID="GridView1" AllowSorting="True" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                        <HeaderStyle Width="70px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Proejct Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblblockid" Visible="false" runat="server" Text='<%# Eval("blockid") %>'></asp:Label>
                                            <asp:Label ID="lblporjectname" runat="server" Text='<%# Eval("projectname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Block Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblblockname" runat="server" Text='<%# Eval("Blockname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbEdit" CssClass="ab-btn-edit" ToolTip="Edit" CommandName="edt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server"><i class="feather icon-edit-2"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbDelete" CssClass="ab-btn-delete" ToolTip="Delete" CommandName="mydel" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server" OnClientClick="return confirm('Delete this block?');"><i class="feather icon-trash-2"></i></asp:LinkButton>
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

            <div id="myModal" class="modal fade ab-modal">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="ab-modal-head">
                                <span class="ab-modal-head-icon"><i class="feather icon-edit-2"></i></span>
                                <div>
                                    <h4 class="modal-title">Edit Block</h4>
                                    <span class="ab-modal-sub">Update block name</span>
                                </div>
                            </div>
                            <button type="button" class="ab-modal-close" data-dismiss="modal" aria-label="Close">
                                <i class="feather icon-x"></i>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="ab-modal-section">
                                <div class="row">
                                    <div class="col-md-12 ab-field">
                                        <label>Block Name</label>
                                        <asp:Label ID="TxtBLOCKid" Visible="false" runat="server" Text=""></asp:Label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBlockedit"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            <asp:Button ID="Button1" runat="server" Text="Update Block" OnClientClick="return validate2();" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="server">
    <script type="text/javascript">
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 45 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function validate() {
            if (document.getElementById("<%=ddproject.ClientID%>").value == "0") {
                toastr.warning('Warning', 'Select Project ');
                document.getElementById("<%=ddproject.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtblockname.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Block Name');
                document.getElementById("<%=txtblockname.ClientID%>").focus();
                return false;
            }
        }

        function validate2() {
            if (document.getElementById("<%=txtBlockedit.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Block Name');
                document.getElementById("<%=txtBlockedit.ClientID%>").focus();
                return false;
            }
        }

        function showModal() {
            $('#myModal').modal({ backdrop: 'static', keyboard: false });
        }
        function Closepopup() {
            $('#myModal').modal('hide');
            $('body').removeClass('modal-open');
            $('body').css('padding-right', '0');
            $('.modal-backdrop').remove();
        }
    </script>
</asp:Content>
