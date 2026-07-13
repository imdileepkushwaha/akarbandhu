<%@ Page Title="Add Block" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="BlockAdd.aspx.cs" Inherits="admin_StateAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="server">
  	 <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Add Block</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

              
      

   	<div class="card">
							<div class="card-header">
								<strong>Add Block </strong>
							</div>

							<div class="card-body">
                                       
                                        <div class="row form-group">
                                            <div class="col-md-3">
                                                <label class="control-label">Select Proejct </label>
                                            </div>
                                            <div class="col-md-3">
                                                <asp:DropDownList ID="ddproject" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="0">Select Project</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-3">
                                                <label for="exampleInputEmail1">Block Name</label>
                                            </div>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="txtblockname" CssClass="form-control" runat="server"></asp:TextBox>

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
                                                        <asp:Label ID="lblporjectname" runat="server" Text='<%# Eval("projectname") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Block Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblblockname" runat="server" Text='<%# Eval("Blockname") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>                                               
                                            <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                      <asp:LinkButton ID="lbEdit" CommandName="edt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server"><i class="icon fa fa-pencil-alt" aria-hidden="true"></i></asp:LinkButton>
                                                     <%--   <asp:Label ID="lblid" runat="server" Text='<%# Eval("blockid") %>' Visible="False"></asp:Label>--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
            if (document.getElementById("<%=txtblockname.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Block Name');
                document.getElementById("<%=txtblockname.ClientID%>").focus();
                return false;
            }
        }
    </script>

             </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
             
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="server">
        <asp:UpdatePanel runat="server" ID="uplMaster" UpdateMode="Always">
        <ContentTemplate>
            <div id="myModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit Project Details</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                Block Name
                            <asp:Label ID="TxtBLOCKid" Visible="false" runat="server" Text=""></asp:Label>
                                 <asp:Label ID="Label1" Visible="false" runat="server" Text=""></asp:Label>
                                <asp:TextBox runat="server" Visible="true" class="form-control" ID="txtBlockedit"></asp:TextBox>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="Button1" runat="server" Text="Update" OnClientClick="return validate2();" CssClass="btn btn-success" OnClick="btnUpdate_Click" />
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
   
     <script type="text/javascript">
         function showModal() {
             $('#myModal').modal({ backdrop: 'static', keyboard: false })
         }
         function Closepopup() {
             $('#myModal').modal('hide');
             $('body').removeClass('modal-open');
             $('body').css('padding-right', '0');
             $('.modal-backdrop').remove();
         }
    </script>
</asp:Content>


