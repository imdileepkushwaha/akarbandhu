<%@ Page Title="Withdrawl Request" Language="C#" MasterPageFile="usermaster.master" AutoEventWireup="true" CodeFile="WithdrawlRequstAdd.aspx.cs" Inherits="user_WithdrawlRequstAdd" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
  <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Add Withdrawal Request</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modal2">
                <div class="center2">
                    <img alt="" src="loader.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                <asp:Panel ID="Panel1" Visible="false"  runat="server">
              <div class="card">
        <div class="card-header">
            <strong>Withdrawl Request</strong>
        </div>
        <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12"><h3>Due to maintenance, withdrawl request can not be processed right now</h3></div>
                                   
                                </div>
                           
                </div>
            </div>
        </asp:Panel>
           
            <asp:Panel ID="pnlwithdrawl" runat="server">
               <div class="card">
        <div class="card-header">
            <strong>Withdrawl Request</strong>
        </div>
        <div class="card-body">
                                <div class="row">
                                 <div class="col-sm-3">
                                <label for="exampleInputEmail1">User Id :</label>
                            </div>
                            <div class="col-sm-3">
                               <asp:TextBox ID="txtuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txtuserid_TextChanged" />

                            </div>
                                <div class="col-sm-3">
                                  <label for="exampleInputEmail1">  User Name :</label>
                                </div>
                                <div class="col-sm-3">
                                   <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />

                                </div>
                               
                            </div>
                            <div class="row">
                                 <div class="col-sm-3">
                              <label for="exampleInputEmail1">     Available Balance :</label>
                                </div>
                                <div class="col-sm-3">
                                   <asp:TextBox ID="txtbalance" Enabled="false" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" />                          
                                </div>
                                <div class="col-sm-3">
                                <label for="exampleInputEmail1">Enter Amount :</label>
                            </div>
                            <div class="col-sm-3">                                  
                              <asp:TextBox ID="txtamount"    runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" />
                            </div>        
                            </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                                  <div class="row">
                                    <div class="col-md-12" style="color:red;"><h3>Note : 15 % admin & transaction charge will deduct from your withdrawl amount</h3></div>
                                   
                                </div>
                                 <div class="row">
                                    <div class="col-md-12" style="color:red;"><h3>Note : Withdrawl amount will be credited in your bank account within 1 to 6 days.</h3></div>
                                   
                                </div>
                </div>
            </div>
                </asp:Panel>
               <asp:Panel ID="pnlnotelegible" Visible="false" runat="server">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Withdrawl Request</h5>
                </div>
                <div class="ibox-content collapse in">
                    <div class="widgets-container">
                        <div class="form-horizontal">
                            <fieldset>
                                <div class="row">
                                    <div class="col-md-12"><h3>
                                        <asp:Label ID="lblerrormsg" runat="server" Text="You are not elegible. Please sponser new id or topup any old id"></asp:Label></h3></div>
                                   
                                </div>
                           
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
                      <asp:Panel ID="pnlpool" Visible="false" runat="server">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Withdrawl Request</h5>
                </div>
                <div class="ibox-content collapse in">
                    <div class="widgets-container">
                        <div class="form-horizontal">
                            <fieldset>
                                <div class="row">
                                    <div class="col-md-12"><h3>You can add withdrawl request only after reaching Pool 2</h3></div>
                                   
                                </div>
                           
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
              
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">   
 
    <script type="text/javascript">
        function validate() {
        <%--    if (document.getElementById("<%=txtoldpassword.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Old Password');
                document.getElementById("<%=txtoldpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtuserpassword.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter New Password');
                document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtconfirmpassword.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Confirm Password');
                document.getElementById("<%=txtconfirmpassword.ClientID%>").focus();
                return false;
            }--%>
          
        }
    </script>
</asp:Content>



