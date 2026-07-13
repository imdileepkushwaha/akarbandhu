<%@ Page Title="Withdrawl Request Report" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="WithdrawlRequestReport.aspx.cs" Inherits="admin_UserReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Withdrawal Request Report</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modal2">
                <div class="center2">
                    <img alt="" src="loader.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="card">
                <div class="card-header">
                    <strong>Search Criteria</strong>
                </div>
                <div class="card-body">
                    <div class="row form-group">
                        <div class="col-sm-3">
                            <label for="exampleInputEmail1">From Date</label>
                        </div>
                        <div class="col-sm-3">
                            <asp:TextBox runat="server" CssClass="form-control form_date" autocomplete="off" ID="txtfromdate"></asp:TextBox>

                        </div>
                        <div class="col-sm-3">
                            <label for="exampleInputEmail1">To Date</label>
                        </div>
                        <div class="col-sm-3">
                            <asp:TextBox runat="server" CssClass="form-control form_date" autocomplete="off" ID="txttodate"></asp:TextBox>

                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-3">
                            <label for="exampleInputEmail1">Associate Id</label>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label for="exampleInputEmail1">Status</label>
                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddstatus" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0">Select Status</asp:ListItem>
                                <asp:ListItem>Pending</asp:ListItem>
                                <asp:ListItem>Approved</asp:ListItem>

                            </asp:DropDownList>
                        </div>
                    </div>
                    <hr />
                    <div class="row form-group">
                        <div class="col-md-12">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btncancel_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <strong>Withdrawl Request List</strong>
                </div>
                <div class="card-body">

                    <div class="table-responsive">

                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" Width="100%" AutoGenerateColumns="False" OnRowDataBound="grdGetHelp_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                        <asp:Label ID="lblId" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Date of Request">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcreatingdate" runat="server" Text='<%#Eval("mentiondate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Associate Id">
                                    <ItemTemplate>
                                        <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("Associateid") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Associate Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblusername" runat="server" Text='<%#Eval("associatename") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%-- <asp:TemplateField HeaderText="Sponser Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsponserid" runat="server" Text='<%#Eval("sponserid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sponser Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsponsername" runat="server" Text='<%#Eval("sponsername") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Approve Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblreleasedate" runat="server" Text='<%#Eval("approvedate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblamount" runat="server" Text='<%#Eval("amount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                              <%--  <asp:TemplateField HeaderText="Admin & Transaction charge">
                                    <ItemTemplate>
                                        <asp:Label ID="lbladmintranamount" runat="server" Text='<%#Eval("admincharge") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Final Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblfinalanamount" runat="server" Text='<%#Eval("finalamount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mode">
                                    <ItemTemplate>
                                        <asp:Label ID="lblmode" runat="server" Text='<%#Eval("paymentmode") %>'></asp:Label>
                                        <asp:DropDownList ID="ddmode" runat="server">
                                            <asp:ListItem Value="0">Select </asp:ListItem>
                                            <asp:ListItem>Cheque</asp:ListItem>
                                            <asp:ListItem>RTGS</asp:ListItem>
                                            <asp:ListItem>NEFT</asp:ListItem>
                                            <asp:ListItem>IMPS</asp:ListItem>
                                            <asp:ListItem>Paytm</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Transaction Id">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltransactionid" runat="server" Text='<%#Eval("OnlineTransactionId") %>'></asp:Label>
                                        <asp:TextBox ID="txttransactionid" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbView" CommandName="myview" OnClick="lbView_Click" runat="server"> View |</asp:LinkButton>
                                        <asp:LinkButton ID="btnApprove" CommandName="approve" OnClick="btnApprove_click" runat="server"> Approve |</asp:LinkButton>
                                        <asp:LinkButton ID="btnReject" CommandName="reject" OnClick="btnReject_click" runat="server">Reject</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
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
                            <h4 class="modal-title">User Details (User Id:
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

