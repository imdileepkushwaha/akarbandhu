<%@ Page Title="Transfer E-Pin" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="EPinTransfer.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Transfer E-Pin</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


             <div class="card">
        <div class="card-header">
            <strong>Transfer E-Pin</strong>
        </div>
        <div class="card-body">
                                <div class="row form-group">
                                    <div class="col-sm-3">
                                        <label for="exampleInputEmail1">User Id :</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txtuserid_TextChanged" />
                                    </div>
                                    <div class="col-sm-3">
                                        <label for="exampleInputEmail1">User Name :</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />
                                    </div>
                                </div>
                                   <div class="row form-group">
                            <div class="col-md-3">Select Plan</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddplan" AutoPostBack="true" OnSelectedIndexChanged="ddplan_SelectedIndexChanged"  CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Plan</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                             
                        </div>
                                <div class="row form-group">
                                    <div class="col-sm-3">
                                        <label for="exampleInputEmail1">Available E-Pin :</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtavailablepins" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" Enabled="False" />
                                    </div>
                                    <div class="col-sm-3">
                                        <label for="exampleInputEmail1">No Of E-Pin :</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtnoofepin" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" />

                                    </div>
                                </div>
                                <div class="row form-group">
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
                                        <asp:TextBox ID="txttransferusername" runat="server" CssClass="form-control" />
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
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">

        function validate() {

            if (document.getElementById("<%=txtuserid.ClientID%>").value == "") {
                   toastr.warning('Warning', 'Enter User Id');
                   document.getElementById("<%=txtuserid.Text%>").focus();
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

