<%@ Page Title="" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="AssociateAdd.aspx.cs" Inherits="admin_UserAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            if (document.getElementById("<%=ddlevel.ClientID%>").value == "0") {

                 toastr.warning('Warning', 'Select level');
                 document.getElementById("<%=ddlevel.ClientID%>").focus();
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
            if (document.getElementById("<%=txtadhar.ClientID%>").value == "") {
                 toastr.warning('Warning', 'Enter Adhaar Number');
                 document.getElementById("<%=txtadhar.ClientID%>").focus();
                return false;
            }

            if (validatephonenumber(document.getElementById("<%=txtadhar.ClientID%>").value) == false) {
                 alert('Invalid Adhaar No');
                 document.getElementById("<%=txtadhar.ClientID%>").focus();
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

            function validatephonenumber(inputtxt) {
                var phoneno = /[1-9]{1}[0-9]{9}/;
                if (inputtxt.match(phoneno)) {
                    return true;
                }
                else {
                    return false;
                }
            }
            



        }
    </script>

   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
   <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Add Associate</a></li>
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
			<strong>Add Associate</strong>
        </div>
        <div class="card-body">
                              
                      
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
                          <%--    <div class="row form-group">
                            <div class="col-md-2">Standing Position</div>
                            <div class="col-md-3">
                                <asp:RadioButtonList ID="rbstandingposition" RepeatDirection="Horizontal" runat="server">
                                    <asp:ListItem Selected="True">Left</asp:ListItem>
                                    <asp:ListItem>Right</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                              </div>--%>
                        <div class="row form-group">
                            <div class="col-md-2">Name</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtname" oninput="this.value = this.value.toUpperCase()" CssClass="form-control" runat="server"></asp:TextBox>
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
                            <div class="col-md-2"> Level</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlevel"  CssClass="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlevel_SelectedIndexChanged" >
                                
                                </asp:DropDownList>
                            </div>
                             <div class="col-md-2">Rank </div>
                            <div class="col-md-3"><asp:TextBox ID="txtIncome" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox></div>
                        </div>
              <div class="row form-group">
                            <div class="col-md-2">S/o, D/o, W/o<br><p>(use capital letters as per bak account)<p></div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtfathername" oninput="this.value = this.value.toUpperCase()" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-1"></div>
                            
                        </div>
                        <div class="row form-group" style="display: none;">
                            <div class="col-md-2">Email</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="lable2" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            
                        </div>
			
			             <div class="row form-group">
                            <div class="col-md-2"> Date Of Birth</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtdateofbirth" CssClass="form-control form_date" runat="server"></asp:TextBox>
                            </div>
                          

              

                            <div class="col-md-1"></div>
                            <div class="col-md-2">Age</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                        </div>
			<div class="row form-group">
                            <div class="col-md-2">Occupation</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtlandmark" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                        </div>
			
			                        <div class="row form-group">
                                    <div class="col-md-2">Nominee Name</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtnomineename" oninput="this.value = this.value.toUpperCase()" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
										
							<div class="col-md-1"></div>
                            <div class="col-md-2">Nominee Age</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtnomineenameAge" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
			</div>
                                 <div class="row form-group">
                                     <div class="col-md-2">Relationship</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtnomineerelation" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
			</div>
                             
			
                        <div class="row form-group">
                            <div class="col-md-2">Address</div>
                            <div class="col-md-9">
                                <asp:TextBox ID="txtaddress" oninput="this.value = this.value.toUpperCase()" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

     
			
			<div class="row form-group">
                            <div class="col-md-2">Mobile No.</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtmobile" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            
                        </div>
			
			<div class="row form-group">
                            <div class="col-md-2">Email</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            
                        </div>
			
			<div class="row form-group" >
                            <div class="col-md-2">Pan card No.</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtpanno"  CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
				<div class="col-md-1"></div>
                            <div class="col-md-2">Adhaar card No.</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtadhar"  CssClass="form-control" runat="server" maxlength="12"></asp:TextBox>
                            </div>
                              </div>
			
			  <div class="row form-group">
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
			
			
                        <div class="row"  style="display: none;">
                            <div class="col-md-2"> Country</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                    <asp:ListItem Value="0"> Select Country</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-2"> State</div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddstate" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0"> Select State</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
            
                             
                        <div class="row form-group">
                            <div class="col-md-2">Team Name</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtteamname"  autocomplete="off"  CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
			</div>
			                <div class="row form-group">
                            <div class="col-md-2">Sr. President Name</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtsrpresident" CssClass="form-control " autocomplete="off" runat="server"></asp:TextBox>
                            </div>
                        </div>
                          <br><br>
               
                                 
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
                        <div class="row form-group">
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

   

</asp:Content>