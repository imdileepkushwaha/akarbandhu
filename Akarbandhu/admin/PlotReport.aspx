<%@ Page Title="Plot Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="PlotReport.aspx.cs" Inherits="admin_BankAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Plot Report</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Plot Report</h2>
                    <p>Search plots by project, block and status.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-filter"></i></span>
                        <div>
                            <h3>Search Criteria</h3>
                            <span>Filter plots by project, block and status</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>Select Project</label>
                                <asp:DropDownList ID="ddproject" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddproject_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Select Block</label>
                                <asp:DropDownList ID="ddblock" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Block</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Plot No</label>
                                <asp:TextBox ID="txtplotno" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Select Status</label>
                                <asp:DropDownList ID="ddstatus" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Status</asp:ListItem>
                                    <asp:ListItem>Vacant</asp:ListItem>
                                    <asp:ListItem>Hold</asp:ListItem>
                                    <asp:ListItem>Booked</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-list"></i></span>
                        <div>
                            <h3>Plot List</h3>
                            <span>Matching plot records</span>
                        </div>
                    </div>
                    <div class="ab-section-body ab-section-body--flush">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" PageSize="15" AutoGenerateColumns="false" CssClass="table ab-table table-striped" runat="server" OnRowDataBound="GridView1_RowDataBound" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" GridLines="None">

                                <Columns>
                                    <asp:TemplateField HeaderText="S.No">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                            <asp:Label ID="lblId" Visible="false" runat="server" Text='<%#Eval("PlotId") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="70px" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Project Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblprojectname" Text='<%#Eval("ProjectName") %>' runat="server"></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Block Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblblockname" Text='<%#Eval("blockName") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Plot No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblplotno" Text='<%#Eval("plotno") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Landarea">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllandarea" Text='<%#Eval("landarea") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtlandarea" Text='<%#Eval("landarea") %>' CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>

                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Dimension">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldimension" Text='<%#Eval("dimension") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtdimension" Text='<%#Eval("dimension") %>' CssClass="form-control" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" Text='<%#Eval("PlotStatus") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbEdit" CommandName="Edit" CssClass="ab-btn-edit" ToolTip="Edit" runat="server"><i class="feather icon-edit-2"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lbUpdate" CommandName="Update" CssClass="btn btn-primary btn-sm" runat="server">Update</asp:LinkButton>
                                            <asp:LinkButton ID="lbCancel" CommandName="Cancel" CssClass="btn btn-danger btn-sm" runat="server">Cancel</asp:LinkButton>
                                        </EditItemTemplate>
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

</asp:Content>
