<%@ Page Title="" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="EPinReport.aspx.cs" Inherits="admin_EPinReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
       <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">E-Pin Report</a></li>
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
                                    <div class="col-md-2">Generate User ID</div>
                                    <div class="col-md-2">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtgenerateuserid"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">Used User ID</div>
                                    <div class="col-md-2">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtuseduserid"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">Select Status</div>
                                    <div class="col-md-2">
                                        <asp:DropDownList ID="ddstatus" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select E-Pin Status</asp:ListItem>
                                            <asp:ListItem>Active</asp:ListItem>
                                            <asp:ListItem>Used</asp:ListItem>
                                            <asp:ListItem>Cancelled</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-2">From Date</div>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">To Date</div>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txttodate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">Select Plan</div>
                                    <div class="col-md-2">
                                        <asp:DropDownList ID="ddplan" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Plan</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
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
            <strong>E-Pin List</strong>
        </div>
        <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" Width="100%" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                            <asp:Label ID="lblId" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="E-Pin No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepinno" runat="server" Text='<%#Eval("EPinNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Generate User Id ">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGenerateUserId" runat="server" Text='<%#Eval("GenerateUserId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Plan ">
                                        <ItemTemplate>
                                            <asp:Label ID="lblplanname" runat="server" Text='<%#Eval("planname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount ">
                                        <ItemTemplate>
                                            <asp:Label ID="lblamo" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Used User Id ">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUsedUserId" runat="server" Text='<%#Eval("UsedUserId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="E-Pin Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEPinStatus" runat="server" Text='<%#Eval("EPinStatus") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMentionDate" runat="server" Text='<%#Eval("MentionDate","{0:dd/MM/yyyy}") %>'></asp:Label>
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

