<%@ Page Title="Installment Plan Reverse Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="IPReverseReport.aspx.cs" Inherits="admin_DPReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentHeader" runat="Server">
  <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Installment Booking Reverse Report</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentData" runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card">
                <div class="card-header">
                    <strong>Search Criteria</strong>
                </div>
                <div class="card-body">
                       <div class="row form-group">
                                  <div class="col-md-2">
                                <label for="exampleInputEmail1">From Booking Date</label>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                 
                            </div>
                            <div class="col-md-2">
                                <label for="exampleInputEmail1">To Booking Date</label>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox ID="txttodate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                               
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
                                <label for="exampleInputEmail1">Customer Name :</label>
                            </div>
                            <div class="col-md-2">

                                 <asp:TextBox ID="txtcustomername" CssClass="form-control"  runat="server"></asp:TextBox>
                            </div>
                                <div class="col-md-2">
                                <label for="exampleInputEmail1">Assocaite Id :</label>
                            </div>
                            <div class="col-md-2">

                                 <asp:TextBox ID="txtassociateid" CssClass="form-control"  runat="server"></asp:TextBox>
                            </div>
                         
                        </div>
                           <div class="row form-group">
                            <div class="col-md-2">
                                <label for="exampleInputEmail1">Select Project :</label>
                            </div>
                            <div class="col-md-2">

                                <asp:DropDownList ID="ddproject" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddproject_SelectedIndexChanged"></asp:DropDownList>

                            </div>
                             <div class="col-md-2">
                                <label for="exampleInputEmail1">Select Block :</label>
                            </div>
                            <div class="col-md-2">
                                  <asp:DropDownList ID="ddblock" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddblock_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Block</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                                <div class="col-md-2">
                                <label for="exampleInputEmail1">Select Plot :</label>
                            </div>
                            <div class="col-md-2">

                              <asp:DropDownList ID="ddplot" CssClass="form-control"  runat="server" >
                                    <asp:ListItem Value="0">Select Plot</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                         
                        </div> <div class="row form-group">
                        <div class="col-md-12">
                        <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                     </div>
                    </div>
                    </div>
                    <!-- /.box-body -->

                   

                </div>
                <!-- /.box -->

           
        <asp:Panel ID="pnllist" runat="server" Visible="false">
           <div class="card">
                <div class="card-header">
                    <strong>IP Reverse List</strong>
                </div>
                <div class="card-body">
                        <div class=" table-responsive " >


                            <asp:GridView ID="GridView1" PageSize="15" AutoGenerateColumns="false" ShowFooter="true" CssClass="table table-bordered table-striped table-hover" runat="server" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" >

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
                                    <asp:TemplateField HeaderText="Customer Id">
                                        <ItemTemplate>
                                          <asp:Label ID="lblcustomerid"  runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Customer Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcustomername" Text='<%#Eval("username") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Booking Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbookingdate" Text='<%#Eval("bookingdate","{0:dd/MM/yyyy}") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Reverse Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblreversedate" Text='<%#Eval("deletedate","{0:dd/MM/yyyy}") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Associate Id">
                                        <ItemTemplate>
                                          <asp:Label ID="lblAssociaterid"  runat="server" Text='<%#Eval("sponserid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Plan Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblplanname" Text='<%#Eval("planname") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Project Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblprojectname" Text='<%#Eval("projectname") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Plot No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblplotno" Text='<%#Eval("plotname") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Plot Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblplotamount" Text='<%#Eval("plotamount") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DP Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbookingamount" Text='<%#Eval("bookingamount") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Paid DP Amt">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpaidamount" Text='<%#Eval("totalpaid") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%-- <asp:TemplateField HeaderText="CP Credit">
                                        <ItemTemplate>
                                            <asp:Label ID="lblassociatecredit" Text='<%#Eval("associatecredit") %>' runat="server"></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>--%>
                                             <asp:TemplateField HeaderText="Remark">
                                        <ItemTemplate>
                                            <asp:Label ID="lblremark" Text='<%#Eval("remark") %>' runat="server"></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                     <%-- <asp:TemplateField HeaderText="Reverse Payment Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblreversestatus" Text='<%#Eval("ReversePaymentStatus2") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <%--  <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate> <asp:LinkButton ID="btnPay" runat="server" CommandName="mypay" CssClass="btn btn-warning btn-xs"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>">Pay DP</asp:LinkButton>

                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                  
                                </Columns>


                            </asp:GridView>




                        </div>
                        <!-- /.box-body -->



                    </div>
                    <!-- /.box -->


                </div>
                <!--/.col (left) -->


          
            
        </asp:Panel>

       

            <asp:Panel ID="pnlDPPayment" runat="server" Visible="false">
            
             <section class="content">

        <!-- Small boxes (Stat box) -->
        <div class="row">
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header">
                        <h3>Reverse Payment Details</h3>
                    </div>
                    <div class="box-body">

                        <div class="row">
                            <div class="col-md-3">
                                <label class="control-label">Booking Id</label>


                            </div>

                            <div class="col-md-3">
                                <asp:Label ID="lblbookingidedit" runat="server" CssClass="control-label" Font-Bold="true" Text=""></asp:Label>
                            </div>
                                <div class="col-md-3">
                                <label class="control-label">Paid Amount</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="lblpaidamountedit" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                          
                        </div>
                        
                     
                        <div class="row">
                            <div class="col-md-3">
                                <label class="control-label">Payment Date</label>


                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtpaymentdateedit" CssClass="form-control form_date" runat="server"></asp:TextBox>
                               
                            </div>
                            <div class="col-md-3">


                                <label class="control-label">Payment Mode</label>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddpaymentmodeedit" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddpaymentmodedp_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem>Cash</asp:ListItem>
                                    <asp:ListItem Value="Cheque">Cheque/DD</asp:ListItem>
                                    <asp:ListItem Value="Online">Online Transaction</asp:ListItem>
                                       <asp:ListItem Value="CP Credit">CP Credit</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                        </div>


                     <div id="Div1DP" runat="server" visible="false">

                                    <div class="row">
                                        <div class="col-md-3">
                                            <label class="control-label">Cheque No</label>

                                        </div>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="txtchequenoedit" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="control-label">Cheque Date</label>

                                        </div>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="txtchequedateedit" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                           
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label class="control-label">Bank Name</label>

                                        </div>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="txtbanknameedit" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="control-label">Branch Name</label>

                                        </div>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="txtbranchnameedit" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>



                                <div class="row" >

                                    <div class="col-md-3">
                                        <label class="control-label">Transaction ID</label>

                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txttransactionidedit" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                </div>

                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <asp:Button ID="btnPayDP" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnPayDP_Click" />

                    </div>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                  
                </div>
                <!-- /.box -->

            </div>
            <!--/.col (left) -->
        </div>
        <!-- /.row -->

    </section>
        </asp:Panel>

    </section>
    <!-- /.content -->
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>



