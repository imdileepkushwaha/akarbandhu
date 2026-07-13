<%@ Page Title="Add Plan" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="PlanAdd.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Add Plan</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Plan Master</h2>
                    <p>Create full payment or installment plans for plot bookings.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-layers"></i></span>
                        <div>
                            <h3>Add Plan</h3>
                            <span>Set plan type, booking percent and deposit term</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Plan Type</label>
                                <asp:DropDownList ID="ddplantype" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddplantype_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Type</asp:ListItem>
                                    <asp:ListItem Value="FP">Full Payment Plan</asp:ListItem>
                                    <asp:ListItem Value="IP">Installment Plan</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Plan Name</label>
                                <asp:TextBox ID="txtplanname" CssClass="form-control" runat="server" placeholder="e.g. Easy EMI Plan"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Booking Amount (%)</label>
                                <asp:TextBox ID="txtbookingamount" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server" placeholder="e.g. 20"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Deposit Term</label>
                                <asp:TextBox ID="txtdepositterm" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server" placeholder="Number of terms"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-list"></i></span>
                        <div>
                            <h3>Plan List</h3>
                            <span>All saved plans</span>
                        </div>
                    </div>
                    <div class="ab-section-body ab-section-body--flush">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table ab-table table-striped" Width="100%" AutoGenerateColumns="False" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("planid") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="70px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Plan Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblprojectname" runat="server" Text='<%# Eval("planname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Booking Amount (%)">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbookingamount" runat="server" Text='<%# Eval("bookingamount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Deposit Term">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldepositterm" runat="server" Text='<%# Eval("depositterm") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=ddplantype.ClientID%>").value == "0") {
                toastr.warning('Warning', 'Select Plan Type');
                document.getElementById("<%=ddplantype.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtplanname.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Plan Name');
                document.getElementById("<%=txtplanname.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtbookingamount.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Booking Amount (%)');
                document.getElementById("<%=txtbookingamount.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtdepositterm.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Deposit Term');
                document.getElementById("<%=txtdepositterm.ClientID%>").focus();
                return false;
            }
        }
    </script>
</asp:Content>
