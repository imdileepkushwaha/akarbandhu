<%@ Page Title="Add News" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="NewsAdd.aspx.cs" Inherits="admin_NewsAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
  <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Add News</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


             <div class="card">
        <div class="card-header">
            <strong>Add News</strong>
        </div>
        <div class="card-body">
                                <div class="row form-group">
                                    <div class="col-md-2">News</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtnews" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
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

              <div class="card">
        <div class="card-header">
            <strong>News List</strong>
        </div>
        <div class="card-body">
                        <div class="table-responsive">

                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                            <asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("newsid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="News">
                                        <ItemTemplate>
                                            <asp:Label ID="lblnews" runat="server" Text='<%#Eval("newsdetail") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbEdit" CommandName="edt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server"><i class="icon fa fa-pencil-alt" aria-hidden="true"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbDelete" CommandName="mydel" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server"><i class="icon fa fa-remove" aria-hidden="true"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <asp:UpdatePanel runat="server" ID="uplMaster" UpdateMode="Always">
        <ContentTemplate>
            <div id="myModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit News Details</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                News
                            <asp:Label ID="lblnewsid" Visible="false" runat="server" Text=""></asp:Label>

                                <asp:TextBox runat="server" class="form-control" ID="txtnewsedit" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClientClick="return validate2();" CssClass="btn btn-success" OnClick="btnUpdate_Click" />
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">

        function validate() {
            // alert('sd');
            if (document.getElementById("<%=txtnews.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter News');
                // alert("Enter Rank No"); 
                document.getElementById("<%=txtnews.ClientID%>").focus();
                return false;
            }
        }
        function validate2() {
            // alert('sd');
            if (document.getElementById("<%=txtnewsedit.ClientID%>").value == "") {

                   toastr.warning('Warning', 'Enter News');
                   // alert("Enter Rank No"); 
                   document.getElementById("<%=txtnewsedit.ClientID%>").focus();
                   return false;
               }
           }
    </script>

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



