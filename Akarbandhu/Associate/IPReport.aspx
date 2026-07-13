<%@ Page Title="Isntallment Plan Booking Report" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="IPReport.aspx.cs" Inherits="admin_UserReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
     <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Installment Booking Report</a></li>
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
                        <div class="col-md-2">
                            <label for="exampleInputEmail1">From Booking Date</label>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>

                        </div>
                        <div class="col-md-2">
                            <label for="exampleInputEmail1">To Booking Date</label>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txttodate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>

                        </div>
                        <div class="col-md-2">
                            <label for="exampleInputEmail1">Booking Id :</label>
                        </div>
                        <div class="col-md-2">

                            <asp:TextBox ID="txtbookingid" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-2">
                            <label for="exampleInputEmail1">Customer Id :</label>
                        </div>
                        <div class="col-md-2">

                            <asp:TextBox ID="txtcustomerid" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <label for="exampleInputEmail1">Customer Name :</label>
                        </div>
                        <div class="col-md-2">

                            <asp:TextBox ID="txtcustomername" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <label for="exampleInputEmail1">Sponser Id :</label>
                        </div>
                        <div class="col-md-2">

                            <asp:TextBox ID="txtassociateid" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
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

                            <asp:DropDownList ID="ddplot" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0">Select Plot</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                    </div>


                    <hr />
                    <div class="row form-group">
                        <div class="col-md-12">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <strong>Installment Plan Booking Income Report</strong>
                </div>
                <div class="card-body">

                    <div class="table-responsive">

                        <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"
                            CssClass="table table-bordered table-hover" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Booking Id">
                                    <ItemTemplate>
                                        <asp:Label ID="lblbookingid" runat="server" Text='<%#Eval("accountno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Customer Id">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcustomerid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Sponser Id">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAssociaterid" runat="server" Text='<%#Eval("SponserId") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <a href='BookingReceipt.aspx?BookingId=<%#Eval("accountno") %>' class="btn btn-info btn-sm" target="_blank">Receipt</a> &nbsp;
                                         <%--<asp:LinkButton ID="btnInst" runat="server" CommandName="Inst" CssClass="btn btn-success btn-xs"  CommandArgument="<%# ((GridViewRow) Container).RowIndex %>">Inst</asp:LinkButton>--%>
                                        <%--    
                                             <asp:LinkButton ID="btnPay" runat="server" CommandName="mypay" CssClass="btn btn-warning btn-xs"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>">Pay DP</asp:LinkButton>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            
         <asp:Panel ID="pnlInstallment" runat="server" Visible="false">
            <div class="row">
                <div class="col-md-12">
                    <!-- general form elements -->
                 <div class="card">
                <div class="card-header">
                    <strong>Prev Paid Installment</strong>
                </div>
                <div class="card-body">
                <div class="table-responsive">


                            <asp:GridView ID="grdInstallment" PageSize="15" AutoGenerateColumns="false" CssClass="table table-bordered table-striped table-hover" runat="server" OnRowDataBound="grdInstallment_RowDataBound" >

                               
                                     <Columns>
                                        <asp:TemplateField HeaderText="Inst. No.">
                                            <ItemTemplate>
                                             <asp:Label ID="lblinstno" runat="server" Text='<%# Eval("InstNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Booking ID">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBookingid" runat="server" Text='<%# Eval("accountno") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Inst. Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblinstdate" runat="server" Text='<%# Eval("InstDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Inst. Amount">

                                            <ItemTemplate>
                                                <asp:Label ID="lblinstamount" runat="server" Text='<%# Eval("instamt") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblinststatus" runat="server" Text="Paid"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payment Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblpaiddate" runat="server" Text='<%# Eval("paymentdate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate><a href='InstallmentReceipt.aspx?BookingId=<%#Eval("accountno") %>&instno=<%# Eval("InstNo") %>' class="btn btn-info btn-xs" target="_blank">Receipt</a> &nbsp;
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>
                            </asp:GridView>

                        </div>
                        </div>
                        <!-- /.box-body -->



                    </div>
                    <!-- /.box -->


                </div>
                <!--/.col (left) -->


            </div>
       
        <!-- Small boxes (Stat box) -->
        <div class="row">
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="card">
                <div class="card-header">
                    <strong>Pay Installment</strong>
                </div>
                <div class="card-body">

                        <div class="row form-group">
                            <div class="col-md-3">
                                <label class="control-label">Booking Id</label>
                            </div>

                            <div class="col-md-3">
                                <asp:Label ID="lblBookingid" runat="server" CssClass="control-label" Font-Bold="true" Text=""></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <label class="control-label">Customer Id</label>
                            </div>
                            <div class="col-md-3">
                                <asp:Label ID="lblcustomerid" runat="server" CssClass="control-label" Font-Bold="true" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-3">
                                <label class="control-label">Customer Name</label>
                            </div>

                            <div class="col-md-3">
                                <asp:Label ID="lblcustomername" runat="server" CssClass="control-label" Font-Bold="true" Text=""></asp:Label>
                            </div>

                            <div class="col-md-3">
                                <label class="control-label">Plan Name</label>


                            </div>
                            <div class="col-md-3">
                                <asp:Label ID="lblplanname" runat="server" CssClass="control-label" Font-Bold="true" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-3">
                                <label class="control-label">Booking Date</label>


                            </div>

                            <div class="col-md-3">
                                <asp:Label ID="lblbookingdate" runat="server" CssClass="control-label" Font-Bold="true" Text=""></asp:Label>
                            </div>

                            <div class="col-md-3">
                                <label class="control-label">Booking Amount</label>


                            </div>

                            <div class="col-md-3">
                                <asp:Label ID="lblbookingamount" runat="server" CssClass="control-label" Font-Bold="true" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-3">
                                <label class="control-label">Installment No</label>


                            </div>

                            <div class="col-md-3">
                                <asp:Label ID="lblinstno" runat="server" CssClass="control-label" Font-Bold="true" Text=""></asp:Label>
                            </div>

                            <div class="col-md-3">
                                <label class="control-label">Installment Due Date</label>


                            </div>

                            <div class="col-md-3">
                                <asp:Label ID="lblinstduedate" runat="server" CssClass="control-label" Font-Bold="true" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-3">
                                <label class="control-label">Installment Amount</label>


                            </div>

                            <div class="col-md-3">
                                <asp:Label ID="lblinstamount" runat="server" CssClass="control-label" Font-Bold="true" Text=""></asp:Label>
                            </div>

                            <div class="col-md-3">
                            </div>

                            <div class="col-md-3">
                            </div>
                        </div>



                        <div class="row form-group">
                            <div class="col-md-3">
                                <label class="control-label">Payment Date</label>


                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtpaymentdate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                               
                            </div>
                            <div class="col-md-3">


                                <label class="control-label">Payment Mode</label>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddpaymentmode" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddpaymentmode_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem>Cash</asp:ListItem>
                                    <asp:ListItem Value="Cheque">Cheque/DD</asp:ListItem>
                                    <asp:ListItem Value="Online">Online Transaction</asp:ListItem>
                                       <asp:ListItem Value="CP Credit">CP Credit</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                        </div>


                     <div id="ChequeDetail" runat="server" visible="false">

                                    <div class="row form-group">
                                        <div class="col-md-3">
                                            <label class="control-label">Cheque No</label>

                                        </div>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="txtchequeno" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="control-label">Cheque Date</label>

                                        </div>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="txtchequedate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                           
                                        </div>

                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-3">
                                            <label class="control-label">Bank Name</label>

                                        </div>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="txtbankname" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="control-label">Branch Name</label>

                                        </div>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>



                                <div class="row form-group" >

                                    <div class="col-md-3">
                                        <label class="control-label">Transaction ID</label>

                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtonlinetransactionid" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                </div>

                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <asp:Button ID="btnPay" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnPay_Click" />

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

         </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <asp:UpdatePanel runat="server" ID="uplMaster" UpdateMode="Always">
        <ContentTemplate>
            <div id="myModal" class="modal fade">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit User Details (User Id:
                                <asp:Label runat="server" ID="lbluseridedit"></asp:Label>)</h4>
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

