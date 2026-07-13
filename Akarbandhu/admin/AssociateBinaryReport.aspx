<%@ Page Title="Associate Binary Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="AssociateBinaryReport.aspx.cs" Inherits="admin_BinaryReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
      <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Associate Binary Report</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" Runat="Server">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnldata" runat="server">
             <div class="card">
        <div class="card-header">
            <strong>Search Criteria</strong>
        </div>

        <div class="card-body">
                                <div class="row form-group">
                                    <div class="col-md-2">Associate  Id</div>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                  
                                </div>
                              
                                <hr />
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit"  CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                        </div>
                    </div>

           <div class="card">
        <div class="card-header">
            <strong>Associate  Binary Report</strong>
        </div>

        <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                        <div class="table-responsive">

                          <iframe id="f1" runat="server" style="height:850px;width:100%;border:0px;"></iframe>
                        </div>
                                </div>
                        </div>
                    </div>
                </div>
                </asp:Panel>
           
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>


