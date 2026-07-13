<%@ Page Title="" Language="C#" MasterPageFile="usermaster.master" AutoEventWireup="true" CodeFile="UserAdd.aspx.cs" Inherits="admin_UserAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
  <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Add User</a></li>
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
            <strong>Add User</strong>
        </div>
        <div class="card-body">
                                <div class="row">
                                    <div class="col-md-2">Sponser Id</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtsponserid"  AutoPostBack="true" OnTextChanged="txtsponserid_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-1"></div>
                                    <div class="col-md-2">Sponser Name</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtsponsername" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                      
                    <%--      <div class="row">
                            <div class="col-md-2">Select Plan</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddplan" OnSelectedIndexChanged="ddplan_SelectedIndexChanged1" AutoPostBack="true" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Plan</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                         <div class="row">
                            <div class="col-md-2">Select E-Pin</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddepin"  CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddepin_SelectedIndexChanged" runat="server">
                                    <asp:ListItem Value="0">Select E-Pin</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                             <div class="col-md-1"></div>
                               <div class="col-md-2">E-Pin Amount</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtamount" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>--%>
                              <div class="row">
                            <div class="col-md-2">Standing Position</div>
                            <div class="col-md-3">
                                <asp:RadioButtonList ID="rbstandingposition" RepeatDirection="Horizontal" runat="server">
                                    <asp:ListItem Selected="True">Left</asp:ListItem>
                                    <asp:ListItem>Right</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                              </div>
                        <div class="row">
                            <div class="col-md-2">Name</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-2">Mobile</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtmobile" MaxLength="10" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">Email</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-2">Gender</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddgender" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">Address</div>
                            <div class="col-md-9">
                                <asp:TextBox ID="txtaddress" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">Select Country</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                    <asp:ListItem Value="0"> Select Country</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-2">Select State</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddstate" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0"> Select State</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">Select City</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtcityname" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-2">Area Name</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                        </div>
                             <div class="row">
                            <div class="col-md-2">Landmark</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtlandmark" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-2">Pincode</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtpincode" MaxLength="6" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-2">Date of Birth</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtdateofbirth" CssClass="form-control form_date" autocomplete="off" runat="server"></asp:TextBox>
                            </div>
                        </div>
                          <div class="row">
                            <div class="col-md-2">Pan No</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtpanno"  CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                              </div>
                        <div class="row">
                            <div class="col-md-2">Password</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtuserpassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-2">Confirm Password</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtconfirmpassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">Upload Image</div>
                            <div class="col-md-3">
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </div>
                            <div class="col-md-1"></div>

                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" />
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
            if (document.getElementById("<%=txtsponserid.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Sponser Id');
                document.getElementById("<%=txtsponserid.ClientID%>").focus();
                return false;
            }
           if (document.getElementById("<%=txtname.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Name');
                document.getElementById("<%=txtname.ClientID%>").focus();
                return false;
           }
           <%-- if (document.getElementById("<%=ddepin.ClientID%>").value == "0") {
                toastr.warning('Warning', 'Select E Pin');
                document.getElementById("<%=ddepin.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddplan.ClientID%>").value == "0") {
                toastr.warning('Warning', 'Select Plan');
                document.getElementById("<%=ddplan.ClientID%>").focus();
                return false;
            }--%>
            if (document.getElementById("<%=txtmobile.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Mobile');
                document.getElementById("<%=txtmobile.ClientID%>").focus();
                return false;
            }
           
           
            if (document.getElementById("<%=txtuserpassword.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Password');
                document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtconfirmpassword.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Confirm Password');
                document.getElementById("<%=txtconfirmpassword.ClientID%>").focus();
                return false;
            }
            
            if (document.getElementById("<%=FileUpload1.ClientID%>").value != "") {

                if (document.getElementById("<%=FileUpload1.ClientID%>").value.endsWith(".jpg") || document.getElementById("<%=FileUpload1.ClientID%>").value.endsWith(".png") || document.getElementById("<%=FileUpload1.ClientID%>").value.endsWith(".jpeg")) {
                }
                else {
                    toastr.warning('Warning', 'Image  should be in .jpg or .jpeg or .png format');
                    document.getElementById("<%=FileUpload1.ClientID%>").focus();
                    return false;
                }
            }
            if (document.getElementById("<%=txtuserpassword.ClientID%>").value != document.getElementById("<%=txtconfirmpassword.ClientID%>").value) {
                toastr.warning('Warning', 'Password Not Match');
                document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                return false;
            }
        }
    </script>
</asp:Content>

