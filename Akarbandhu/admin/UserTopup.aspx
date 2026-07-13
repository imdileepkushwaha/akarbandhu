<%@ Page Title="User Upgrade" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="UserTopup.aspx.cs" Inherits="user_UserTopup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    	 <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">User Report</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" Runat="Server">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modal2">
                <div class="center2 ab-ajax-loader">
                    <div class="ab-spinner" aria-hidden="true"></div>
                    <span class="ab-ajax-loader-text">Please wait…</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
         <div class="card">
        <div class="card-header">
            <strong>Upgrade User</strong>
        </div>
        <div class="card-body">
                                  <div class="row form-group">
                                    <div class="col-md-2">Sponser Id</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtsponserid" AutoPostBack="true" OnTextChanged="txtsponserid_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-1"></div>
                                    <div class="col-md-2">Sponser Name</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtsponsername" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-2">Upgrade User Id</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtuserid" AutoPostBack="true" OnTextChanged="txtuserid_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-1"></div>
                                    <div class="col-md-2">User Name</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtusername" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                       
                              
                          <div class="row form-group">
                            <div class="col-md-2">Plan</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddplan" AutoPostBack="true" OnSelectedIndexChanged="ddplan_SelectedIndexChanged" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Plan</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-2">Select E-Pin</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddepin"  CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddepin_SelectedIndexChanged" runat="server">
                                    <asp:ListItem Value="0">Select E-Pin</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                             <div class="col-md-1"></div>
                               <div class="col-md-2">E-Pin Amount</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtamount" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                         <hr />
                        <div class="row form-group">
                            <div class="col-md-12">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
                            </div>
                        </div>
                        </div>
                   
            
                </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
     <script type="text/javascript">
         function validate() {
             if (document.getElementById("<%=txtuserid.ClientID%>").value == "") {
                 toastr.warning('Warning', 'Enter User Id');
                 document.getElementById("<%=txtuserid.ClientID%>").focus();
                 return false;
             }
             if (document.getElementById("<%=ddepin.ClientID%>").value == "0") {

                 toastr.warning('Warning', 'Select E Pin ');
                 document.getElementById("<%=ddepin.ClientID%>").focus();
                 return false;
             }
         }
         </script>
</asp:Content>

