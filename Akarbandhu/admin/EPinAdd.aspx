<%@ Page Title="Generate E-Pin" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="EPinAdd.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
      <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Generate E-Pin</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" Runat="Server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

      
        <div class="card">
        <div class="card-header">
            <strong>Generate E-Pin</strong>
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
                            <div class="col-md-2">Select Plan</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddplan" AutoPostBack="true" OnSelectedIndexChanged="ddplan_SelectedIndexChanged"  CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Plan</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                             <div class="col-md-1"></div>
                             
                        </div>
                         <div class="row">
                            <div class="col-md-2">No of E-Pin</div>
                            <div class="col-md-3">
                                 <asp:TextBox ID="txtnoofepin" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                             <div class="col-md-1"></div>
                               <div class="col-md-2">E-Pin Amount</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtamount" onkeypress="return isNumber(event)" Text="0" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
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

