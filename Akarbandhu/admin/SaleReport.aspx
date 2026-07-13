<%@ Page Title="Product Sale Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="SaleReport.aspx.cs" Inherits="admin_UserReport"  ValidateRequest="false" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
     <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Product Sale Report</a></li>
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
                            <label for="exampleInputEmail1">From Sale Date</label>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>

                        </div>
                        <div class="col-md-2">
                            <label for="exampleInputEmail1">To Sale Date</label>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txttodate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>

                        </div>
                        <div class="col-md-2">
                            <label for="exampleInputEmail1">Invoice No :</label>
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
                            <label for="exampleInputEmail1">User Name :</label>
                        </div>
                        <div class="col-md-2">

                            <asp:TextBox ID="txtcustomername" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <label for="exampleInputEmail1">Sponser Id :</label>
                        </div>
                        <div class="col-md-2">

                            <asp:TextBox ID="txtassociateid" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>

                    </div>
                    <div class="row form-group">
                        <div class="col-md-2">
                            <label for="exampleInputEmail1">Select Category :</label>
                        </div>
                        <div class="col-md-2">

                            <asp:DropDownList ID="ddcategory"  CssClass="form-control" runat="server" ></asp:DropDownList>

                        </div>
                        
                       

                    </div>


                    <hr />
                    <div class="row form-group">
                        <div class="col-md-12">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                         <asp:Button ID="btnExcel" CssClass="btn info" runat="server" Text="Excel" OnClick="btnExcel_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <strong>Product Sale Report</strong>
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
                                <asp:TemplateField HeaderText="Invoice No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblbookingid" runat="server" Text='<%#Eval("invoiceno") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Sale Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblbookingdate" Text='<%#Eval("saledate","{0:dd/MM/yyyy}") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sponser Id">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAssociaterid" runat="server" Text='<%#Eval("SponserId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblplanname" Text='<%#Eval("categoryname") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product">
                                    <ItemTemplate>
                                        <asp:Label ID="lblproductname" Text='<%#Eval("productname") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amt">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpaidamount" Text='<%#Eval("paidamount") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Remark">
                                    <ItemTemplate>
                                        <asp:Label ID="lblremark" Text='<%#Eval("remark") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                              <%--  <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <a href='BookingReceipt.aspx?BookingId=<%#Eval("accountno") %>' class="btn btn-info btn-sm" target="_blank">Receipt</a> &nbsp;
                                          </ItemTemplate>
                                </asp:TemplateField>--%>

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
                            <h4 class="modal-title">Edit Customer Details (User Id:
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

