<%@ Page Title="Level Income Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="LevelIncomesummery.aspx.cs" Inherits="admin_levelReport" ValidateRequest="false" EnableEventValidation="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
      <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Level Income Report</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
              <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modal2">
                <div class="center2">
                    <img alt="" src="loader.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
             <div class="card">
        <div class="card-header">
            <strong>Search Criteria</strong>
        </div>
        <div class="card-body">
                            
                                  <div class="row form-group">
                                
                         

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>From date</label>
                                        <asp:TextBox runat="server" CssClass="form-control form_date" ID="txtfromdate"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>To date</label>
                                        <asp:TextBox runat="server" CssClass="form-control form_date" ID="txttodate"></asp:TextBox>
                                    </div>
                                </div>

                          
                                   <div class="col-md-1"></div>
                                        <div class="col-md-2">Associate Id</div>
                                    <div class="col-md-3">
                                      <asp:TextBox ID="txtuserid"  CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                               
                               
                                <hr />
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit"  CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                         <asp:Button ID="btnExcel" CssClass="btn info" runat="server" Text="Excel" OnClick="btnExcel_Click" />
                                    </div>
                                </div>
                </div>
            </div>

            <div class="card">
        <div class="card-header">
            <strong>Level Income Report</strong>
        </div>
        <div class="card-body">

                        <div class="table-responsive">

                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" OnRowDataBound="GridView1_RowDataBound" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                               <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                          
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Closing Period">
                                        <ItemTemplate>
                                           <asp:Label ID="lblfromdate" runat="server" Text='<%#Eval("fromdate","{0:dd/MM/yyyy}") %>'></asp:Label>-
                                            <asp:Label ID="lbltodate" runat="server" Text='<%#Eval("todate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Associate Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("associateid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Associate Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusenamegf" runat="server" Text='<%#Eval("associatename") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                           
                                   
                                     <asp:TemplateField HeaderText="Comm%">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllevel" runat="server" Text='<%#Eval("commissionpercent") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Inst Amt">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllevel" runat="server" Text='<%#Eval("instamt") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Income">
                                        <ItemTemplate>
                                            <asp:Label ID="lblamount" runat="server" Text='<%#Eval("commissionamount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>   
                                    <asp:TemplateField HeaderText="TDS">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltds" runat="server" Text='<%#Eval("tds") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                     <asp:TemplateField HeaderText="Admin">
                                        <ItemTemplate>
                                            <asp:Label ID="lbladmincharge" runat="server" Text='<%#Eval("admincharge") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                     <asp:TemplateField HeaderText="Final Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfinalamount" runat="server" Text='<%#Eval("finalamount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Comm Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcommtype" runat="server" Text='<%#Eval("commissiontype") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>    
                                    <%--<asp:TemplateField HeaderText="Comm Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfinalamt" runat="server" Text='<%#Eval("commtype") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>   --%> 
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldate" runat="server" Text='<%#Eval("mentiondate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>    
                                                             
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
        </ContentTemplate>
          <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
        <asp:UpdatePanel runat="server" ID="uplMaster" UpdateMode="Always">
        <ContentTemplate>
            <div id="myModal" class="modal fade">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit User Details (User Id: <asp:Label runat="server" ID="lbluseridedit"></asp:Label>)</h4>
                        </div>
                        <div class="modal-body">
                        <div class="row">
                                    <div class="col-md-2">User Id</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtuseridedit" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-1"></div>
                                    <div class="col-md-2">User Name</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtusernameedit" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                             <div class="row">
                                    <div class="col-md-2">A/c Holder Name</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtaccountholdername" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-1"></div>
                                     <div class="col-md-2">A/c No</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtaccountno" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">IFSC Code</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtifsccode" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-1"></div>
                                     <div class="col-md-2">PAN number</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtpan" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                   
                                </div>
                                 <div class="row">
                                     <div class="col-md-2">Bank</div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddbank" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="col-md-1"></div>
                                       <div class="col-md-2">Branch</div>
                                    <div class="col-md-3">
                                         <asp:TextBox ID="txtbranchname" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    
                                </div>
                                 <div class="row">
                                 
                                       <div class="col-md-2">Paytm Mobile No</div>
                                    <div class="col-md-3">
                                         <asp:TextBox ID="txtpaytmmobileno" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    
                                </div>
                               
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
              
    </asp:UpdatePanel>
     <script type="text/javascript">
         Sys.Application.add_load(LoadHandler);
         function LoadHandler() {
             $('.form_date').datepicker({
                 format: 'dd/mm/yyyy',
             }).on('changeDate', function (ev) {
                 $(this).datepicker('hide');
             });
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

