<%@ Page Title="Wallet Transfer" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="WalletTransfer2.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
     <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Wallet Transfer</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" Runat="Server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
      <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Wallet Transfer</h5>
             <div class="ibox-tools">
                        <a href="#"></a>
                        Balance : <i class="fa fa-inr"></i>
                        <asp:Label ID="lbluserbalance" runat="server" Text="Label"></asp:Label>
                      </div>
        </div>
        <div class="ibox-content collapse in">
            <div class="widgets-container">
                <div class="form-horizontal">
                    <fieldset>
                        <div class="row">                               
                            <div class="col-sm-3">
                                <label for="exampleInputEmail1">User Id :</label>
                            </div>
                            <div class="col-sm-3">                                  
                          <asp:TextBox ID="txtuserid" Enabled="false"  runat="server" CssClass="form-control"  />
                            </div>
                          <div class="col-sm-3">
                                <label for="exampleInputEmail1">User Name :</label>
                            </div>
                            <div class="col-sm-3">                                  
                          <asp:TextBox ID="txtusername" Enabled="false" runat="server"  CssClass="form-control" />
                            </div>                       
                        </div>
                      <div class="row">                               
                            <div class="col-sm-3">
                                <label for="exampleInputEmail1">Transfer User Id :</label>
                            </div>
                            <div class="col-sm-3">                                  
                          <asp:TextBox ID="txttransferuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txttransferuserid_TextChanged" />
                            </div>
                          <div class="col-sm-3">
                                <label for="exampleInputEmail1">Transfer User Name :</label>
                            </div>
                            <div class="col-sm-3">                                  
                          <asp:TextBox ID="txttransferusername" Enabled="false" runat="server"  CssClass="form-control" />
                            </div>                       
                        </div>
                         <div class="row">                               
                            <div class="col-sm-3">
                                <label for="exampleInputEmail1">Amount :</label>
                            </div>
                            <div class="col-sm-3">                                  
                          <asp:TextBox ID="txtamount"  onchange="gettotal();"  onkeypress="return isNumber(event)"   runat="server" CssClass="form-control"  />
                            </div>
                              <div class="col-sm-3">
                                <label for="exampleInputEmail1">Admin & Transaction Charge(5%) :</label>
                            </div>
                            <div class="col-sm-3">                                  
                           <asp:TextBox ID="txtadmincharge" ReadOnly="true"  onkeypress="return isNumber(event)"   runat="server" CssClass="form-control"  />
                            </div>
                             </div>
                         <div class="row">                               
                            <div class="col-sm-3">
                                <label for="exampleInputEmail1"> Total Amount :</label>
                            </div>
                            <div class="col-sm-3">                                  
                          <asp:TextBox ID="txttotalamount"  ReadOnly="true"  onkeypress="return isNumber(event)"   runat="server" CssClass="form-control"  />
                            </div>
                              <div class="col-sm-3">
                                <label for="exampleInputEmail1">Remark :</label>
                            </div>
                            <div class="col-sm-3">                                  
                         <asp:TextBox ID="txtremark"  runat="server" TextMode="MultiLine" CssClass="form-control"  />
                            </div>
                             </div>
                          <hr />

                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" OnClick="btnCancel_Click1" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                                    </div>
                                </div>


                    </fieldset>
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

               if (document.getElementById("<%=txttransferuserid.ClientID%>").value == "") {
                   toastr.warning('Warning', 'Enter User Id');
                   document.getElementById("<%=txttransferusername.Text%>").focus();
                   return false;
               }
               if (document.getElementById("<%=txttransferusername.ClientID%>").value == "") {
                   toastr.warning('Warning', 'Enter User Name');
                   document.getElementById("<%=txttransferusername.ClientID%>").focus();
                   return false;
               }
               if (document.getElementById("<%=txtamount.ClientID%>").value == "") {
                   toastr.warning('Warning', 'Enter Amount');
                   document.getElementById("<%=txtamount.ClientID%>").focus();
                   return false;
               }              
           }
           function gettotal() {

               var amount = 0, admincharge = 0, totalamount = 0;
               if (document.getElementById("<%=txtamount.ClientID%>").value != "") {
                   amount = document.getElementById("<%=txtamount.ClientID%>").value;
               }
               admincharge = (parseFloat(amount) * parseFloat(5)) / 100;
               document.getElementById("<%=txtadmincharge.ClientID%>").value = admincharge;

             
                totalamount = parseFloat(amount) + parseFloat(admincharge);
                document.getElementById("<%=txttotalamount.ClientID%>").value = totalamount;
           }
    </script>
</asp:Content>

