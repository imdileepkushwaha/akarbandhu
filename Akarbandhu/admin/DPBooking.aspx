<%@ Page Title="Full Payment Plan Booking" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="DPBooking.aspx.cs" Inherits="admin_UserAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Full Payment Booking</a></li>
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
                    <strong>Full Payment Plan Booking</strong>
                </div>
                <div class="card-body">
                    <div class="row form-group">

                        <div class="col-md-2">Booking Date</div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtbookingdate" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-2">Customer Id</div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtuserid" AutoPostBack="true" OnTextChanged="txtuserid_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-2">Customer Name</div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtusername" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                     <div class="row form-group">
                        <div class="col-md-2">
                            <label class="">Sponser Id</label>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtsponserid" Enabled="false" CssClass="form-control" runat="server" AutoPostBack="True" OnTextChanged="txtsponserid_TextChanged"></asp:TextBox>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-2">
                            <label class="">Sponser Name</label>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtsponsername" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-2">Mobile</div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-2">Email</div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-2">
                            <label class="exampleInputEmail1">Select Project </label>
                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddproject" AutoPostBack="true" OnSelectedIndexChanged="ddproject_SelectedIndexChanged" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0">Select Project</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-2">
                            <label for="exampleInputEmail1">Block Name</label>
                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddblock" AutoPostBack="true" OnTextChanged="ddblock_TextChanged" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0">Select Block</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-2">
                            <label for="exampleInputEmail1">Selct Plot :</label>
                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddplot" AutoPostBack="true" OnSelectedIndexChanged="ddplot_SelectedIndexChanged" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0">Select Plot</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-2">
                            <label for="exampleInputEmail1">Select Plan :</label>
                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddplan" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddplan_SelectedIndexChanged">
                                <asp:ListItem Value="0">Select Plan</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="lblbookingamount" Visible="false" runat="server" Text="0"></asp:Label>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-2">
                            <label class="">Landarea(sqft)</label>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtlandarea" CssClass="form-control" Enabled="false" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-2">
                            <label class="">Amount( per sqft)</label>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtlandamount" AutoPostBack="true" OnTextChanged="txtlandamount_TextChanged" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-2">
                            <label class="">Plot Amount</label>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtplotamount" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtplotamount_TextChanged" Enabled="false" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-1"></div>
                    </div>


                    <div class="row form-group">

                        <div class="col-md-2">
                            <label class="">Booking Amount</label>
                        </div>

                        <div class="col-md-3">
                            <asp:TextBox ID="txtbookingamount" Enabled="false" CssClass="form-control" onkeypress="return isNumberKey(event);" AutoPostBack="true" OnTextChanged="txtbookingamount_TextChanged" runat="server"></asp:TextBox>
                            <asp:Label ID="lblterms" runat="server" Visible="false" Text="0"></asp:Label>
                                                               <asp:TextBox ID="txtinstamount" Visible="false" Enabled="false" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            <asp:TextBox ID="txtttoalinst" Visible="false" Enabled="false" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-1"></div>
               
                        <div class="col-md-1"></div>
                    </div>
                           <div class="row form-group">
                          <div class="col-md-2">
                            <label class="">PLC Name</label>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtplcname"  CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                         <div class="col-md-1"></div>
                        <div class="col-md-2">
                            <label class="">PLC Charges</label>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtothercharge" AutoPostBack="true" OnTextChanged="txtothercharge_TextChanged" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                        </div>
                        </div>
                    <div class="row form-group">
                        <div class="col-md-2">
                            <label class="">Total Amount</label>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txttotalamount" Enabled="false" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    
                    <div class="row form-group">
                        <div class="col-md-2">
                            <label class="">Paid Amount</label>
                        </div>

                        <div class="col-md-3">
                            <asp:TextBox ID="txtpaidamount" Enabled="false" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                   
                    <div class="row form-group">
                        <div class="col-md-2">
                            <label class="">Nominee Name</label>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtnomineename" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-2">
                            <label class="">Relationship</label>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtnomineerelation" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <h4>Payment Details</h4>
                    <div class="row form-group">
                        <div class="col-md-2">
                            <label class="">Payment Mode</label>

                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddpaymentmode" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddpaymentmode_SelectedIndexChanged">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem>Cash</asp:ListItem>
                                <asp:ListItem Value="Cheque">Cheque/DD</asp:ListItem>
                                <asp:ListItem Value="Online">Online Transaction</asp:ListItem>
                            </asp:DropDownList>
                        </div>


                    </div>
                    <div id="ChequeDetail" runat="server" visible="false">

                        <div class="row form-group">
                            <div class="col-md-2">
                                <label class="">Cheque No</label>

                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtchequeno" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-2">
                                <label class="">Cheque Date</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtchequedate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-2">
                                <label class="">Bank Name</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtbankname" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-2">
                                <label class="">Branch Name</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtbranchname" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-2">
                            <label class="">Transaction ID</label>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtonlinetransactionid" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <hr />
                    <div class="row form-group">
                        <div class="col-md-12">
                            <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtbookingdate.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Booking Date');
                document.getElementById("<%=txtbookingdate.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtuserid.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Customer Id');
                document.getElementById("<%=txtuserid.ClientID%>").focus();
                return false;
            }

            if (document.getElementById("<%=txtusername.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Name');
                document.getElementById("<%=txtusername.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtmobile.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Mobile');
                document.getElementById("<%=txtmobile.ClientID%>").focus();
                return false;
            }
        }
    </script>
</asp:Content>

