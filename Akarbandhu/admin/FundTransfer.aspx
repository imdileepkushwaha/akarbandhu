<%@ Page Title="Credit Fund" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="FundTransfer.aspx.cs" Inherits="admin_FundTransfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
      <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Credit Fund</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
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
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
        <ContentTemplate>
             <div class="card">
        <div class="card-header">
            <strong>Credit Fund</strong>
        </div>
        <div class="card-body">
                                <div class="row form-group">
                                    <div class="col-md-2">User Id</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtuserid" AutoPostBack="true" OnTextChanged="txtuserid_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-1"></div>
                                    <div class="col-md-2">User Name</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtpersonname" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="row form-group">
                                    <div class="col-md-2">User Mobile</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtpersonmobile" Enabled="false" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-1"></div>
                                    <div class="col-md-2">User Email</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtpersonemail" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group">
                                  <%--  <div class="col-md-2">Wallet Type</div>
                                    <div class="col-md-3">
                                        <asp:RadioButtonList ID="rbWalletType" RepeatDirection="Horizontal" style="width:100%;" runat="server">
                                            <asp:ListItem Value="EWallet" Selected="True">E-Wallet</asp:ListItem>
                                            <asp:ListItem Value="RWallet">R-Wallet</asp:ListItem>

                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-md-1"></div>--%>
                                    <div class="col-md-2">Transfer Amount</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtamount" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <hr />
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                                    </div>
                                </div>
                        </div>
                    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtuserid.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter User Id');
                document.getElementById("<%=txtuserid.ClientID%>").focus();
                   return false;
               }
               if (document.getElementById("<%=txtpersonmobile.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Person Mobile');
                document.getElementById("<%=txtpersonmobile.ClientID%>").focus();
                   return false;
               }
               if (document.getElementById("<%=txtamount.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Amount');
                document.getElementById("<%=txtamount.ClientID%>").focus();
                   return false;
               }
           }
    </script>
</asp:Content>

