<%@ Page Title="Business Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="BusinessReport.aspx.cs" Inherits="admin_DPReport"  ValidateRequest="false" EnableEventValidation="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Business Report</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="card">
                <div class="card-header">
                    <strong>Search Criteria</strong>
                </div>
                <div class="card-body">
                       <div class="row form-group">
                                  <div class="col-md-2">
                                <label for="exampleInputEmail1">From  Date</label>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" autocomplete="off"  runat="server"></asp:TextBox>
                               
                            </div>
                            <div class="col-md-2">
                                <label for="exampleInputEmail1">To  Date</label>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox ID="txttodate" CssClass="form-control form_date" autocomplete="off"  runat="server"></asp:TextBox>
                                 
                            </div>
                            <div class="col-md-2">
                                <label for="exampleInputEmail1">Booking Id :</label>
                            </div>
                            <div class="col-md-2">

                                 <asp:TextBox ID="txtbookingid" CssClass="form-control"  runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-2">
                                <label for="exampleInputEmail1">Customer Id :</label>
                            </div>
                            <div class="col-md-2">

                                 <asp:TextBox ID="txtcustomerid" CssClass="form-control"  runat="server"></asp:TextBox>
                            </div>
                            
                                <div class="col-md-2">
                                <label for="exampleInputEmail1">Business Type :</label>
                            </div>
                            <div class="col-md-2">
                                  <asp:DropDownList ID="ddbusinesstype" CssClass="form-control"  runat="server" >
                                    <asp:ListItem Value="0">Select Type</asp:ListItem>
                                      <asp:ListItem>Self</asp:ListItem>
                                      <asp:ListItem>Team</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                               <div class="col-md-2">
                                <label for="exampleInputEmail1">Associate Id :</label>
                            </div>
                            <div class="col-md-2">

                                 <asp:TextBox ID="txtassociateid" CssClass="form-control"  runat="server"></asp:TextBox>
                            </div>
                        </div>
                          <div class="row  form-group">
                        <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                         <asp:Button ID="btnExcel" CssClass="btn info" runat="server" Text="Excel" OnClick="btnExcel_Click" />
                     
                    </div>
                    </div>
                    <!-- /.box-body -->

                   

                </div>
               
        <asp:Panel ID="pnllist" runat="server" Visible="false">
            <div class="card">
                <div class="card-header">
                    <strong>Search Criteria</strong>
                </div>
                <div class="card-body">
                        <div class="box-body" style="width: 100%;">


                            <asp:GridView ID="GridView1" PageSize="15" ShowFooter="true" AutoGenerateColumns="false" CssClass="table table-bordered table-striped table-hover" runat="server" >

                                <Columns>
                                    <asp:TemplateField HeaderText="S.No">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                           
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Booking Id">
                                        <ItemTemplate>
                                          <asp:Label ID="lblbookingid"  runat="server" Text='<%#Eval("accountno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                          <asp:Label ID="lblcustomerid"  runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcustomername" Text='<%#Eval("username") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Payment Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbookingdate" Text='<%#Eval("paymentdate","{0:dd/MM/yyyy}") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Associate Id">
                                        <ItemTemplate>
                                          <asp:Label ID="lblAssociaterid"  runat="server" Text='<%#Eval("sponserid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Paid Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblplotno" Text='<%#Eval("InstAmt") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Payment Mode">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpaymentmode" Text='<%#Eval("paymentmode") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Online Trans Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblonlinetranid" Text='<%#Eval("OnlineTransactionId") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Bank">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbank" Text='<%#Eval("bankname") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Branch">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbranch" Text='<%#Eval("branchname") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <%--  <asp:TemplateField HeaderText="Cheque Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblchequestatus" Text='<%#Eval("chequestatus") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                     <asp:TemplateField HeaderText="Plot No">
                                        <ItemTemplate>
                                          <asp:Label ID="lblplotno"  runat="server" Text='<%#Eval("plotno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <%--   <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate><a href='BookingReceipt.aspx?BookingId=<%#Eval("accountno") %>'>Receipt</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                  
                                </Columns>


                            </asp:GridView>




                        </div>
                    </div>
                </div>
        </asp:Panel>
</ContentTemplate>
          <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
        </asp:UpdatePanel>
    <!-- /.content -->
</asp:Content>



