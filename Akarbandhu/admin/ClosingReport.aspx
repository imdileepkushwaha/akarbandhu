<%@ Page Title="Closing Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="ClosingReport.aspx.cs" Inherits="admin_UserReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
   <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Closing Report</a></li>
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
                                    <div class="col-md-2">Closing Period</div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddclosingperiod"   CssClass="form-control " runat="server"></asp:DropDownList>
                                    </div>
                                   <div class="col-md-1"></div>
                                        <div class="col-md-2">Associate Id</div>
                                    <div class="col-md-3">
                                      <asp:TextBox ID="txtuserid"  CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                               
                                <hr />
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit"  CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                         <asp:Button ID="btnExcel" CssClass="btn info" runat="server" Text="Excel" OnClick="btnExcel_Click" />
                                    </div>
                                </div>
                        </div>
            </div>

            <div class="card">
        <div class="card-header">
            <strong>Closing List</strong>
        </div>

        <div class="card-body">

                        <div class="table-responsive">

                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Associate ID">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Associate Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusername" runat="server" Text='<%#Eval("associatename") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="From Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusername" runat="server" Text='<%#Eval("fromdate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Rank">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrank" runat="server" Text='<%#Eval("todate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Business Amt">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbusamy" runat="server" Text='<%#Eval("TotalBusiness") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Rank No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbusamy" runat="server" Text='<%#Eval("downlineuserrank") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Comm %">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbusamy" runat="server" Text='<%#Eval("commissionpercent") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                   
                                    <asp:TemplateField HeaderText="Comm Amt">
                                        <ItemTemplate>
                                            <asp:Label ID="lblmobile" runat="server" Text='<%#Eval("CommissionAmount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                      <asp:TemplateField HeaderText="TDS(5%)">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltds" runat="server" Text='<%#Eval("tds") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                  
                                    <asp:TemplateField HeaderText="Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%#Eval("CommissionType") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Ac Holder Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%#Eval("AccountHolderName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Account No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%#Eval("AccountNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="BankName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%#Eval("BankName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="IFSC Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%#Eval("IFSCCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Branch Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%#Eval("BranchName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Pan No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%#Eval("PanNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
        </ContentTemplate>
         <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
      
</asp:Content>

