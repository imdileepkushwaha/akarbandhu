<%@ Page Title="Add Plot" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="PlotAdd.aspx.cs" Inherits="admin_StateAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="server">
   <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Add Plot</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        </ContentTemplate>
    </asp:UpdatePanel>

   	<div class="card">
							<div class="card-header">
								<strong>Add Plot </strong>
							</div>

							<div class="card-body">
                                       
                                        <div class="row form-group">
                                            <div class="col-md-3">
                                                <label class="control-label">Select Proejct </label>
                                            </div>
                                            <div class="col-md-3">
                                                <asp:DropDownList ID="ddproject" AutoPostBack="true" OnSelectedIndexChanged="ddproject_SelectedIndexChanged" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="0">Select Project</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-3">
                                                <label for="exampleInputEmail1">Block Name</label>
                                            </div>
                                            <div class="col-md-3">
                                              <asp:DropDownList ID="ddblock" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="0">Select Block</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                 <div class="row form-group">
                            <div class="col-md-3">
                                <label for="exampleInputEmail1">Plot No From :</label>
                            </div>
                            <div class="col-md-3">

                              <asp:TextBox ID="txtplotnofrom"  onkeypress="return isNumberKey(event);"  CssClass="form-control" runat="server"></asp:TextBox>

                            </div>
                            <div class="col-md-3">
                                <label for="exampleInputEmail1">Plot No To :</label>
                            </div>
                            <div class="col-md-3">
                                 <asp:TextBox ID="txtplotnoto"  onkeypress="return isNumberKey(event);"  CssClass="form-control" runat="server"></asp:TextBox>
                                
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-3">
                                <label for="exampleInputEmail1">Landarea(Sqft) :</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtlandarea" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label for="exampleInputEmail1">Dimension :</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtdimension" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                                        <div class="row form-group">
                                            <div class="col-md-3">
                                                <label class="control-label"></label>
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary" Text="Submit" OnClientClick="return validate();" OnClick="btnSubmit_Click" />
                                              
                                                <asp:Button ID="btnCancel" runat="server" class="btn btn-danger" Text="Cancel" OnClick="btnCancel_Click" />
                                            </div>
                                        </div>
                                    </div>
           </div>
    
   	<div class="card">
							<div class="card-header">
								<strong>Block List </strong>
							</div>

							<div class="card-body">
                                    <div class="form-horizontal">
                                        <asp:GridView AutoGenerateColumns="False" CssClass="table table-striped table-bordered bootstrap-datatable datatable"
                                            runat="server" OnRowCommand="GridView1_RowCommand" ID="GridView1" AllowSorting="True">
                                            <Columns>
                                                <asp:TemplateField HeaderText="#">
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex+1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Proejct Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblblockid" Visible="false" runat="server" Text='<%# Eval("blockid") %>'></asp:Label>
                                                        <asp:Label ID="lblporjectname" runat="server" Text='<%# Eval("proejctname") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Block Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblblockname" runat="server" Text='<%# Eval("Blockname") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>                                               
                                               <%-- <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnEdit" CssClass="fa fa-pencil-alt btn btn-warning btn-xs" runat="server"
                                                            title="Edit Profile"  />
                                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("blockid") %>' Visible="False"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                            </div>
                        </div>
    <script type="text/javascript">
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 45 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function validate() {
            if (document.getElementById("<%=ddproject.ClientID%>").value == "0") {
                toastr.warning('Warning', 'Select Project ');
                document.getElementById("<%=ddproject.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddblock.ClientID%>").value == "0") {
                toastr.warning('Warning', 'Select Block ');
                document.getElementById("<%=ddblock.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtplotnofrom.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Plot No From');
                document.getElementById("<%=txtplotnofrom.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtplotnoto.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Plot No To');
                document.getElementById("<%=txtplotnoto.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtlandarea.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Landarea');
                document.getElementById("<%=txtlandarea.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtdimension.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Dimension');
                document.getElementById("<%=txtdimension.ClientID%>").focus();
                return false;
             }
        }
    </script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="server">
</asp:Content>


