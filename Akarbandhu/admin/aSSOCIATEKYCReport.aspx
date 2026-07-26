<%@ Page Title="Associate KYC Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="AssociateKYCReport.aspx.cs" Inherits="admin_UserReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
     <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">AssociateKYC Report</a></li>
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
        <ContentTemplate>

                 <div class="card">
        <div class="card-header">
            <strong>Search Citeria</strong>
        </div>
        <div class="card-body">
                            <fieldset>
                                <div class="row">
                                    <div class="col-md-2">Name</div>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">Mobile</div>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">Email</div>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-md-2">From Date</div>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">To Date</div>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txttodate"  CssClass="form-control form_date" runat="server"></asp:TextBox>
                                    </div>
                                       <div class="col-md-2">Associate Id</div>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                               
                                 <div class="row">
                                   
                                      <div class="col-md-2">Pancard Status </div>
                                    <div class="col-md-2">
                                        <asp:DropDownList ID="ddpancardstatus" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0"> Select Status</asp:ListItem>
                                            <asp:ListItem>Approved</asp:ListItem>
                                            <asp:ListItem>Pending</asp:ListItem>
                                            <asp:ListItem>Rejected</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                     </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit"  CssClass="btn green" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn red" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
               <div class="card">
        <div class="card-header">
            <strong>Associate KYC List</strong>
        </div>
        <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" AllowPaging="true"
    OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="100">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                          
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="User ID" ItemStyle-VerticalAlign="Middle">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name" ItemStyle-VerticalAlign="Middle">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusername" runat="server" Text='<%#Eval("associatename") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pan Card" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                           <asp:Label ID="lblpanno" Font-Bold="true" runat="server" Text='<%#Eval("PanCardNo") %>'></asp:Label>
                                             <asp:Label ID="lblpancardstatus"  runat="server" Text='<%#Eval("PanCardStatus") %>'></asp:Label>
                                            <br />
                                        <a href='userimage/<%#Eval("pancardimagename") %>' target="_blank">    <img src="userimage/<%#Eval("pancardimagename") %>" style="height:80px;margin-top:5px;margin-bottom:5px;" /></a>
                                            <br />
                                             <asp:LinkButton ID="btnApprovePan" CssClass="btn btn-xs btn-success" CommandName="approve" OnClick="btnApprovePan_Click" runat="server"> Approve</asp:LinkButton> 
                                             <asp:LinkButton ID="btnRejectPan" CssClass="btn btn-xs btn-danger" CommandName="reject" OnClick="btnRejectPan_Click" runat="server">Reject</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Aadhar Card"  ItemStyle-HorizontalAlign="Center">
                                          <ItemTemplate>
                                           <asp:Label ID="lblaadharno" Font-Bold="true" runat="server" Text='<%#Eval("AadharCardNo") %>'></asp:Label>
                                             <asp:Label ID="lbladharcardstatus"  runat="server" Text='<%#Eval("AadharCardStatus") %>'></asp:Label>
                                            <br />
                                             <a href='userimage/<%#Eval("aadharcardimagename") %>' target="_blank">   <img src="userimage/<%#Eval("Aadharcardimagename") %>" style="height:80px;margin-top:5px;margin-bottom:5px;" /></a>
                                               <a href='userimage/<%#Eval("AadharCardImageNameBack") %>' target="_blank">   <img src="userimage/<%#Eval("Aadharcardimagename") %>" style="height:80px;margin-top:5px;margin-bottom:5px;" /></a>

                                              
                                            <br />
                                             <asp:LinkButton ID="btnApproveAadhar" CssClass="btn btn-xs btn-success" CommandName="approve" OnClick="btnApproveAadhar_Click" runat="server"> Approve</asp:LinkButton> 
                                             <asp:LinkButton ID="btnRejectAadhar" CssClass="btn btn-xs btn-danger" CommandName="reject" OnClick="btnRejectAadhar_Click" runat="server">Reject</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bank Proof"  ItemStyle-HorizontalAlign="Center">
                                           <ItemTemplate>
                                           <asp:Label ID="lbladdressproof" Font-Bold="true" runat="server" Text='<%#Eval("bankproofNo") %>'></asp:Label>
                                             <asp:Label ID="lbladdressproofstatus"  runat="server" Text='<%#Eval("bankproofStatus") %>'></asp:Label>
                                            <br />
                                             <a href='userimage/<%#Eval("bankproofimagename") %>' target="_blank">   <img src="userimage/<%#Eval("bankproofimagename") %>" style="height:80px;margin-top:5px;margin-bottom:5px;" /></a>
                                            <br />
                                             <asp:LinkButton ID="btnApproveAddress" CssClass="btn btn-xs btn-success" CommandName="approve" OnClick="btnApproveAddress_Click" runat="server"> Approve</asp:LinkButton> 
                                             <asp:LinkButton ID="btnRejectAddress" CssClass="btn btn-xs btn-danger" CommandName="reject" OnClick="btnRejectAddress_Click" runat="server">Reject</asp:LinkButton>
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

