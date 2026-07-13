<%@ Page Title="Sponser Edit" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="SponserEdit.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
     <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Edit Sponser</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" Runat="Server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

      
        <div class="card">
        <div class="card-header">
            <strong>Sponser Edit</strong>
        </div>
        <div class="card-body">
                                <div class="row form-group">
                          
                            <div class="col-sm-3">
                                <label for="exampleInputEmail1">User Id :</label>
                            </div>
                            <div class="col-sm-3">                                  
                          <asp:TextBox ID="txtuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txtuserid_TextChanged"  />
                            </div>
                            <div class="col-sm-3">
                                <label for="exampleInputEmail1">User Name :</label>
                            </div>
                            <div class="col-sm-3">                                  
                                   <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                     <div class="row form-group">
                          
                            <div class="col-sm-3">
                                <label for="exampleInputEmail1">Sponser Id :</label>
                            </div>
                            <div class="col-sm-3">                                  
                          <asp:TextBox ID="txtsponserid" runat="server" CssClass="form-control" Enabled="false"  />
                            </div>
                            <div class="col-sm-3">
                                <label for="exampleInputEmail1">Sponser Name :</label>
                            </div>
                            <div class="col-sm-3">                                  
                                   <asp:TextBox ID="txtsponsername" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                      <div class="row form-group">                               
                            <div class="col-sm-3">
                                <label for="exampleInputEmail1">New Sponser  Id :</label>
                            </div>
                            <div class="col-sm-3">                                  
                          <asp:TextBox ID="txttransferuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txttransferuserid_TextChanged" />
                            </div>
                          <div class="col-sm-3">
                                <label for="exampleInputEmail1">New Sponser Name :</label>
                            </div>
                            <div class="col-sm-3">                                  
                          <asp:TextBox ID="txttransferusername" runat="server"  CssClass="form-control" />
                            </div>                       
                        </div>
                          <hr />

                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" OnClick="btnCancel_Click1" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                                    </div>
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
               if (document.getElementById("<%=txtusername.ClientID%>").value == "") {
                   toastr.warning('Warning', 'Enter User Name');
                   document.getElementById("<%=txtusername.ClientID%>").focus();
                   return false;
               }
           }
    </script>
</asp:Content>

