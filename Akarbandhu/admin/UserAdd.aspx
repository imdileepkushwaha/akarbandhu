<%@ Page Title="" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="UserAdd.aspx.cs" Inherits="admin_UserAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
      <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Add Customer</a></li>
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
            <strong>Add Customer</strong>
        </div>
        <div class="card-body">
                                <div class="row form-group">
                                    <div class="col-md-2">Sponser Id</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtsponserid" AutoPostBack="true" OnTextChanged="txtsponserid_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-1"></div>
                                    <div class="col-md-2">Sponser Name</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtsponsername" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                  <%-- <div class="row">
                            <div class="col-md-2">Select Plan</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddplan" AutoPostBack="true" OnSelectedIndexChanged="ddplan_SelectedIndexChanged" CssClass="form-control" runat="server">
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
                        </div>
                        </div>--%>
                        <%--  <div class="row form-group">
                            <div class="col-md-2">Standing Position</div>
                            <div class="col-md-3">
                                <asp:RadioButtonList ID="rbstandingposition" RepeatDirection="Horizontal" runat="server" style="width:100%;">
                                    <asp:ListItem Selected="True">Left</asp:ListItem>
                                    <asp:ListItem>Right</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                              </div>--%>
                        <div class="row form-group">
                            <div class="col-md-2">Name</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-2">Mobile</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
             <div class="row form-group">
                            <div class="col-md-2">Father/Husband Name</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtfathername" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-1"></div>
                            
                        </div>
                        <div class="row form-group">
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
                        <div class="row form-group">
                            <div class="col-md-2">Address</div>
                            <div class="col-md-9">
                                <asp:TextBox ID="txtaddress" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-2"> Country</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                    <asp:ListItem Value="0"> Select Country</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-2"> State</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddstate"  CssClass="form-control" runat="server" >
                                    <asp:ListItem Value="0"> Select State</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-2">City</div>
                            <div class="col-md-3">
                               <asp:TextBox ID="txtcityname" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-1"></div>
                           <%-- <div class="col-md-2">Area Name</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>--%>
                             <div class="col-md-2">Landmark</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtlandmark" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                         <div class="row form-group">
                            <div class="col-md-2">Pan No</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtpanno" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                        </div>

              <div class="row form-group">
                            <div class="col-md-2">Adhar No</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtadhar"  CssClass="form-control" runat="server" maxlength="12"></asp:TextBox>
                            </div>
                              </div>

                        <div class="row form-group">
                            <div class="col-md-2">Pincode</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtpincode" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-2">Date of Birth</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtdateofbirth" CssClass="form-control form_date" autocomplete="off"  runat="server"></asp:TextBox>
                            </div>
                        </div>
             <h3>Nominee Details</h3>
                                  <div class="row">
                                    <div class="col-md-2">Nominee Name</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtnomineename" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-1"></div>
                                     <div class="col-md-2">Nominee Relation</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtnomineerelation" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                        <div class="row form-group">
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
                        <div class="row form-group">
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
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
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
            if (document.getElementById("<%=txtadhar.ClientID%>").value == "") {
                toastr.warning('Warning', 'Enter Adhar Number');
                document.getElementById("<%=txtadhar.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtmobile.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Mobile');
                document.getElementById("<%=txtmobile.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtemail.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Email');
                document.getElementById("<%=txtemail.ClientID%>").focus();
                return false;
            }
         <%--   if (document.getElementById("<%=txtaddress.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Address');
                document.getElementById("<%=txtaddress.ClientID%>").focus();
                return false;
            }--%>
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
           <%-- if (document.getElementById("<%=ddcountry.ClientID%>").value == "0") {

                toastr.warning('Warning', 'Select Country');
                document.getElementById("<%=ddcountry.ClientID%>").focus();
                return false;
            }--%>
           <%-- if (document.getElementById("<%=ddplan.ClientID%>").value == "0") {

                toastr.warning('Warning', 'Select Plan');
                document.getElementById("<%=ddplan.ClientID%>").focus();
                return false;
            }
           if (document.getElementById("<%=ddepin.ClientID%>").value == "0") {

                toastr.warning('Warning', 'Select E-Pin');
                document.getElementById("<%=ddepin.ClientID%>").focus();
                return false;
            }--%>
            <%--if (document.getElementById("<%=ddstate.ClientID%>").value == "0") {

                toastr.warning('Warning', 'Select State');
                document.getElementById("<%=ddstate.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtcityname.ClientID%>").value == "") {

                toastr.warning('Warning', 'City');
                document.getElementById("<%=txtcityname.ClientID%>").focus();
                return false;
            }--%>
            if (document.getElementById("<%=FileUpload1.ClientID%>").value != "") {

                if (document.getElementById("<%=FileUpload1.ClientID%>").value.endsWith(".jpg") || document.getElementById("<%=FileUpload1.ClientID%>").value.endsWith(".png") || document.getElementById("<%=FileUpload1.ClientID%>").value.endsWith(".jpeg")) {
                }
                else {
                    toastr.warning('Warning', 'Image  should be in .jpg or .jpeg or .png format');
                    document.getElementById("<%=FileUpload1.ClientID%>").focus();
              return false;
          }

      }
            <%--    if (document.getElementById("<%=txtpanno.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Pan No');
                document.getElementById("<%=txtpanno.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtuserpassword.ClientID%>").value != document.getElementById("<%=txtconfirmpassword.ClientID%>").value) {

                toastr.warning('Warning', 'Password Not Match');
                document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                return false;
            }--%>

            function AadharValidate() {
                var aadhar = document.getElementById("txtAadhar").value;
                var adharcardTwelveDigit = /^\d{12}$/;
                var adharSixteenDigit = /^\d{16}$/;
                if (aadhar != '') {
                    if (aadhar.match(adharcardTwelveDigit)) {
                        return true;
                    }
                    else if (aadhar.match(adharSixteenDigit)) {
                        return true;
                    }
                    else {
                        alert("Enter valid Aadhar Number");
                        return false;
                    }
                }
            }

        }
    </script>
</asp:Content>

