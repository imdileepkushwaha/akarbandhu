<%@ Page Title="Closing Reverse" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="ClosingReverse.aspx.cs" Inherits="admin_UserReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
     <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Closing Reverse</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="card">
        <div class="card-header">
            <strong>Closing Reverse</strong>
        </div>
        <div class="card-body">                 
                                 <div class="row form-group">
                                    <div class="col-md-2">Closing Period</div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddclosingperiod"   CssClass="form-control " runat="server"></asp:DropDownList>
                                    </div>
                                 
                                </div>
                               
                                <hr />
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit"  CssClass="btn btn-success" runat="server" Text="Reverse" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                     </div>
                                </div>
                        </div>
                    </div>
        </ContentTemplate>       
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
      
</asp:Content>

