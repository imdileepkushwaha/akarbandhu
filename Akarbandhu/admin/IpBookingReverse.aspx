<%@ Page Title="IP Booking Reverse" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="IPBookingReverse.aspx.cs" Inherits="admin_ProjectAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Installment Booking Reverse</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentData" runat="Server">
   <div class="card">
                <div class="card-header">
                    <strong>IP Booking Reverse</strong>
                </div>
                <div class="card-body">
                        <div class="row">
                            <div class="col-md-3">
                                <label for="exampleInputEmail1">Booking No :</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtbookingid" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />

                    </div>

                </div>
               
        <asp:Panel ID="pnldetail" runat="server" Visible="false">
              <div class="card">
                <div class="card-header">
                    <strong>Booking Detail</strong>
                </div>
                <div class="card-body">
                        <div class="row">
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
                        <div class="row">
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
                        <div class="row">
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
                          <div class="row">
                            <div class="col-md-3">
                                <label class="control-label">Remark</label>


                            </div>

                            <div class="col-md-9">
                              <asp:TextBox ID="txtremark" TextMode="MultiLine" runat="server" CssClass="form-control" />
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <asp:Button ID="btnReverse" CssClass="btn btn-warning" runat="server" Text="Reverse" OnClick="btnReverse_Click" />
                            </div>
                        </div>
                    </div>
                   
        </asp:Panel>
     
</asp:Content>



