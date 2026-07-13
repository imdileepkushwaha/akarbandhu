<%@ Page Title="Add Project" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="ProjectAdd.aspx.cs" Inherits="admin_BankAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="assets/css/ab-forms.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Add Project</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Project Master</h2>
                    <p>Add and manage project names for blocks and plots.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-layers"></i></span>
                        <div>
                            <h3>Add Project</h3>
                            <span>Enter project name and save</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Project Name</label>
                                <asp:TextBox ID="txtprojectname" CssClass="form-control" runat="server" placeholder="e.g. Green Valley"></asp:TextBox>
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
                            <h3>Project List</h3>
                            <span>All saved projects</span>
                        </div>
                    </div>
                    <div class="ab-section-body ab-section-body--flush">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table ab-table table-striped" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("ProjectId") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="70px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Project Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblprojectname" runat="server" Text='<%# Eval("projectname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbEdit" CssClass="ab-btn-edit" ToolTip="Edit" CommandName="edt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server">
                                                <i class="feather icon-edit-2"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="lbDelete" CssClass="ab-btn-delete" ToolTip="Delete" CommandName="mydel" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server" OnClientClick="return confirm('Delete this project?');">
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

            <div id="myModal" class="modal fade ab-modal">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="ab-modal-head">
                                <span class="ab-modal-head-icon"><i class="feather icon-edit-2"></i></span>
                                <div>
                                    <h4 class="modal-title">Edit Project</h4>
                                    <span class="ab-modal-sub">Update project name</span>
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
                                        <label>Project Name</label>
                                        <asp:Label ID="lblprojectid" Visible="false" runat="server" Text=""></asp:Label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtprojectnameedit"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update Project" OnClientClick="return validate2();" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
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
            if (document.getElementById("<%=txtprojectname.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Project Name');
                document.getElementById("<%=txtprojectname.ClientID%>").focus();
                return false;
            }
        }
        function validate2() {
            if (document.getElementById("<%=txtprojectnameedit.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Project Name');
                document.getElementById("<%=txtprojectnameedit.ClientID%>").focus();
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
