<%@ Page Title="Add Plot" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="PlotAdd.aspx.cs" Inherits="admin_StateAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Add Plot</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Plot Master</h2>
                    <p>Add plots in bulk for a project block.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-map"></i></span>
                        <div>
                            <h3>Add Plot</h3>
                            <span>Select project, block and plot details</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-6 ab-field">
                                <label>Select Proejct</label>
                                <asp:DropDownList ID="ddproject" AutoPostBack="true" OnSelectedIndexChanged="ddproject_SelectedIndexChanged" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Project</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Block Name</label>
                                <asp:DropDownList ID="ddblock" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Block</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Plot No From</label>
                                <asp:TextBox ID="txtplotnofrom" onkeypress="return isNumberKey(event);" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Plot No To</label>
                                <asp:TextBox ID="txtplotnoto" onkeypress="return isNumberKey(event);" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Landarea (Sqft)</label>
                                <asp:TextBox ID="txtlandarea" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 ab-field">
                                <label>Dimension</label>
                                <asp:TextBox ID="txtdimension" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClientClick="return validate();" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btnCancel_Click" />
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-list"></i></span>
                        <div>
                            <h3>Block List</h3>
                            <span>Plots grouped by project and block</span>
                        </div>
                    </div>
                    <div class="ab-section-body ab-section-body--flush">
                        <div class="table-responsive">
                            <asp:GridView AutoGenerateColumns="False" CssClass="table ab-table table-striped"
                                runat="server" OnRowCommand="GridView1_RowCommand" ID="GridView1" AllowSorting="True" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                        <HeaderStyle Width="70px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Proejct Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblblockid" Visible="false" runat="server" Text='<%# Eval("blockid") %>'></asp:Label>
                                            <asp:Label ID="lblporjectname" runat="server" Text='<%# Eval("proejctname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Block Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblblockname" runat="server" Text='<%# Eval("Blockname") %>'></asp:Label>
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

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="server">
    <script type="text/javascript">
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 45 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function validate() {
            if (document.getElementById("<%=ddproject.ClientID%>").value == "0") {
                toastr.warning('Warning', 'Select Project ');
                document.getElementById("<%=ddproject.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddblock.ClientID%>").value == "0") {
                toastr.warning('Warning', 'Select Block ');
                document.getElementById("<%=ddblock.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtplotnofrom.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Plot No From');
                document.getElementById("<%=txtplotnofrom.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtplotnoto.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Plot No To');
                document.getElementById("<%=txtplotnoto.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtlandarea.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Landarea');
                document.getElementById("<%=txtlandarea.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtdimension.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Dimension');
                document.getElementById("<%=txtdimension.ClientID%>").focus();
                return false;
            }
        }
    </script>
</asp:Content>
