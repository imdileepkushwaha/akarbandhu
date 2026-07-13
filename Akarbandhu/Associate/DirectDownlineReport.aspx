<%@ Page Title="" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="DirectDownlineReport.aspx.cs" Inherits="admin_DownlineReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Direct Report</a></li>
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
                                <div class="row">
                                    <div class="col-md-2">User Id</div>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>                                  
                                </div>                              
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit"  CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                </div>
            </div>
               <div class="card">
        <div class="card-header">
            <strong>Downline List</strong>
        </div>
        <div class="card-body">
                                <div class="row">
                                   <div class="col-md-4">
                                       </div>
                                 <div class="col-md-4">
                                       </div>
                                 <div class="col-md-4">
                                        <asp:DropDownList ID="ddlRecordFilter" runat="server" CssClass="form-control pull-right margin-left-10" AutoPostBack="true" 
                        OnSelectedIndexChanged="ddlRecordFilter_SelectedIndexChanged" Width="80px">
                                       
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>100</asp:ListItem>
                                             <asp:ListItem>500</asp:ListItem>
                                             <asp:ListItem>All</asp:ListItem>      
                    </asp:DropDownList>
                                       </div>
                            </div>
                            <div class="row" style="color:white">
                                <div class="col-md-12">
                                    <div class="form-group table-responsive">
                                        <asp:GridView ID="grdBank" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="false" EmptyDataText="No Data Found">                                            <Columns>
                                                <%--<asp:BoundField DataField="UserId" HeaderText="User ID" />
                                                <asp:BoundField DataField="UserName" HeaderText="User Name" />                                              
                                                <asp:BoundField DataField="Gender" HeaderText="Gender" />                                            
                                                <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                                                <asp:BoundField DataField="Address" HeaderText="Address" />
                                                <asp:BoundField DataField="RegDate" HeaderText="D. O. J." />
                                             <asp:BoundField DataField="ParentUserID" HeaderText="Parent ID" />
                                             <asp:BoundField DataField="parentname" HeaderText="Parent Name" />
                                             
                                                <asp:BoundField DataField="Status" HeaderText="Status" />--%>
                                                
                                                <asp:TemplateField HeaderText="#">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="SponserId" HeaderText="Sponsor ID" />
                                               <asp:BoundField DataField="AssociateId" HeaderText="User ID" />
                                                <asp:BoundField DataField="AssociateName" HeaderText="User Name" />
                                                  
                                              <asp:BoundField DataField="Mobile" HeaderText="Mobile" />                                           
                                                <asp:BoundField DataField="Email" HeaderText="Email" /> 
                                                <asp:BoundField DataField="RegDate" HeaderText="D. O. J." />                                             
                                          
                                            <%--   <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>' CssClass='<%#Eval("Status") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>                                --%>

                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>

