<%@ Page Title="Upgrade Plan" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="UpgradePlan.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
     <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Upgrade Plan</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" Runat="Server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

      
     <div class="card">
        <div class="card-header">
            <strong>Upgrade Plan</strong>
        </div>
        <div class="card-body">
                        <div class="row form-group">
                            <div class="col-md-2">Enter User Id</div>
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
                              <div class="col-md-2">Package Name</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtpackagename" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbloldpackageid" Visible="false" runat="server" Text="0"></asp:Label>
                            </div>
                              <div class="col-md-1"></div>
                            <div class="col-md-2">Select New Package</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddpackage"  CssClass="form-control"  runat="server">
                                    <asp:ListItem Value="0">Select Package</asp:ListItem>
                                </asp:DropDownList>
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
    </div>

    
      </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
       <script type="text/javascript">

           function validate() {

               if (document.getElementById("<%=txtuserid.ClientID%>").value == "") {

                   toastr.warning('Warning', 'Enter User Id');
                   // alert("Enter Rank No"); 
                   document.getElementById("<%=txtuserid.Text%>").focus();
                   return false;
               }
               if (document.getElementById("<%=txtusername.ClientID%>").value == "") {

                   toastr.warning('Warning', 'Enter User Name');
                   // alert("Enter Rank No"); 
                   document.getElementById("<%=txtusername.ClientID%>").focus();
                   return false;
               }
           }
          
    </script>
</asp:Content>

