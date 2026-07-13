<%@ Page Title="Add Plan" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="PlanAdd.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
      <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Add Plan</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
              <div class="card">
        <div class="card-header">
            <strong>Add Plan</strong>
        </div>
        <div class="card-body">
                                  <div class="row form-group">
                            <div class="col-md-3">
                                <label for="exampleInputEmail1">Plan Type :</label>
                            </div>
                            <div class="col-md-3">

                                <asp:DropDownList ID="ddplantype" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddplantype_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Type</asp:ListItem>
                                    <asp:ListItem Value="FP">Full Payment Plan</asp:ListItem>
                                    <asp:ListItem Value="IP">Installment Plan</asp:ListItem>

                                </asp:DropDownList>

                            </div>
                            <div class="col-md-3">
                                <label for="exampleInputEmail1">Plan Name :</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtplanname" CssClass="form-control" runat="server"></asp:TextBox>

                            </div>
                        </div>

                        <div class="row form-group">
                          <%--  <div class="col-md-3">
                                <label for="exampleInputEmail1">Land Amount(per sqft) :</label>
                            </div>
                            <div class="col-md-3">

                                <asp:TextBox ID="txtlandamount" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>

                            </div>--%>
                            <div class="col-md-3">
                                <label for="exampleInputEmail1">Booking Amount(%) :</label>
                            </div>
                            <div class="col-md-3">

                                <asp:TextBox ID="txtbookingamount" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-3">
                                <label for="exampleInputEmail1">Deposit Term :</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtdepositterm" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
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

            <div class="card">
        <div class="card-header">
            <strong>Plan List</strong>
        </div>
        <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" Width="100%" AutoGenerateColumns="False" >
                                <Columns>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                        <asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("planid") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Plan Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblprojectname" runat="server" Text='<%#Eval("planname") %>'></asp:Label>

                                    </ItemTemplate>


                                </asp:TemplateField>
                               <%-- <asp:TemplateField HeaderText="Land Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblblocknae" runat="server" Text='<%#Eval("landamount") %>'></asp:Label>

                                    </ItemTemplate>


                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Booking Amount(%)">
                                    <ItemTemplate>
                                        <asp:Label ID="lblbookingamount" runat="server" Text='<%#Eval("bookingamount") %>'></asp:Label>

                                    </ItemTemplate>


                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Deposit Term">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldepositterm" runat="server" Text='<%#Eval("depositterm") %>'></asp:Label>

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

</asp:Content>

