<%@ Page Title="Add User KYC Detail" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="AssociateKYCAdd.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
 <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Add KYC Detail</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

        </ContentTemplate>
    </asp:UpdatePanel>

   



                                  <div class="card">
        <div class="card-header">
            <strong>KYC Details</strong> 
        </div>
        <div class="card-body">

                            <fieldset>
                                <div class="row form-group">
                                    <div class="col-md-4">
                                        
                                            Pan Card No
                                                <asp:TextBox ID="txtpancardno" runat="server" CssClass="form-control" />
                                    </div>
                                    <div class="col-md-4">
                                            Upload Scan Image
                                                <asp:FileUpload ID="FileUploadPan" runat="server" />
                                        </div>
                                    <div class="col-md-4">
                                            <asp:Literal ID="ltpancardimage" runat="server"></asp:Literal>
                                            <asp:Label ID="lblpancardimage" Visible="false" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="lblpancardstatus" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-4">
                                            Aadhar Card No
                              <asp:TextBox ID="txtaadharcardno" runat="server" CssClass="form-control" />
                                    </div>
                               
                                    </div>

                                   <div class="row form-group">
                                          <div class="col-md-4">  Upload Aadhar Front</div>
                                     <div class="col-md-4">
                                            Upload Scan Image
                             <asp:FileUpload ID="FileUploadaadhar" runat="server" />
                                    </div>
                                    <div class="col-md-4">
                                            <asp:Literal ID="ltaadharimage" runat="server"></asp:Literal>
                                            <asp:Label ID="lblaadharimage" Visible="false" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="lblaadharstatus" runat="server" Text=""></asp:Label>
                                    </div>

                                       </div>
                                    <div class="row form-group">

                                        <div class="col-md-4">  Upload Aadhar Back</div>
                                     <div class="col-md-4">
                                            Upload Scan Image
                             <asp:FileUpload ID="FileUploadaadharback" runat="server" />
                                    </div>
                                    <div class="col-md-4">
                                            <asp:Literal ID="ltaadharimageback" runat="server"></asp:Literal>
                                            <asp:Label ID="lblaadharimageback" Visible="false" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="lblaadharstatusback" runat="server" Text=""></asp:Label>
                                    </div>

                                </div>
                                <div class="row form-group">
                                    <div class="col-md-4">
                                            Bank Proof
                              <asp:TextBox ID="txtaddressproof" runat="server" CssClass="form-control" />
                                    </div>
                                    <div class="col-md-4">
                                            Upload Scan Image
                             <asp:FileUpload ID="FileUploadaddress" runat="server" />
                                    </div>
                                    <div class="col-md-4">
                                            <asp:Literal ID="ltaddressimage" runat="server"></asp:Literal>
                                        <asp:Label ID="lbladdressimage" Visible="false" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="lbladdressstatus" runat="server" Text=""></asp:Label>
                                         <asp:Label ID="lblbankproofremark" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                                <hr />

                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" OnClick="btnCancel_Click1" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                                    </div>
                                </div>


                            </fieldset>
                        </div>
                    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">

        function validate() {

            if (document.getElementById("<%=FileUploadPan.ClientID%>").value != "") {

                if (document.getElementById("<%=FileUploadPan.ClientID%>").value.endsWith(".jpg") || document.getElementById("<%=FileUploadPan.ClientID%>").value.endsWith(".png") || document.getElementById("<%=FileUploadPan.ClientID%>").value.endsWith(".jpeg")) {
                }
                else {
                    toastr.warning('Warning', 'Pancard Image  should be in .jpg or .jpeg or .png format');
                    document.getElementById("<%=FileUploadPan.ClientID%>").focus();
                   return false;
               }

           }
           if (document.getElementById("<%=FileUploadaddress.ClientID%>").value != "") {

                if (document.getElementById("<%=FileUploadaddress.ClientID%>").value.endsWith(".jpg") || document.getElementById("<%=FileUploadaddress.ClientID%>").value.endsWith(".png") || document.getElementById("<%=FileUploadaddress.ClientID%>").value.endsWith(".jpeg")) {
                }
                else {
                    toastr.warning('Warning', 'Bank Proof Image  should be in .jpg or .jpeg or .png format');
                    document.getElementById("<%=FileUploadaddress.ClientID%>").focus();
                     return false;
                 }

             }
             if (document.getElementById("<%=FileUploadaadhar.ClientID%>").value != "") {

                if (document.getElementById("<%=FileUploadaadhar.ClientID%>").value.endsWith(".jpg") || document.getElementById("<%=FileUploadaadhar.ClientID%>").value.endsWith(".png") || document.getElementById("<%=FileUploadaadhar.ClientID%>").value.endsWith(".jpeg")) {
                }
                else {
                    toastr.warning('Warning', 'Aadhar Card Image  should be in .jpg or .jpeg or .png format');
                    document.getElementById("<%=FileUploadaadhar.ClientID%>").focus();
                     return false;
                 }

             }
         }

    </script>
</asp:Content>

