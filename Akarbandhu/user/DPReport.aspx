<%@ Page Title="Full Payment Plan Booking Report" Language="C#" MasterPageFile="usermaster.master" AutoEventWireup="true" CodeFile="DPReport.aspx.cs" Inherits="admin_UserReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
     <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Full Payment Report</a></li>
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

                            <asp:TextBox ID="txtcustomerid" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
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
                    <strong>Full Payment Plan Booking Income Report</strong>
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
                                        <%--     <asp:LinkButton ID="btnInst" runat="server" CommandName="Inst" CssClass="btn btn-success btn-xs"  CommandArgument="<%# ((GridViewRow) Container).RowIndex %>">Inst</asp:LinkButton>
                                             <asp:LinkButton ID="btnPay" runat="server" CommandName="mypay" CssClass="btn btn-warning btn-xs"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>">Pay DP</asp:LinkButton>--%>
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

