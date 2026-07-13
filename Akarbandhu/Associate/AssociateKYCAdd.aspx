<%@ Page Title="Add User KYC Detail" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="AssociateKYCAdd.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Add KYC Detail</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modal2">
                <div class="center2 ab-ajax-loader">
                    <div class="ab-spinner"></div>
                    <span class="ab-ajax-loader-text">Please wait…</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>KYC Details</h2>
                    <p>Upload and manage your PAN, Aadhaar and bank proof documents.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-credit-card"></i></span>
                        <div>
                            <h3>PAN Card</h3>
                            <span>PAN number and scanned image</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>PAN Card No</label>
                                <asp:TextBox ID="txtpancardno" runat="server" CssClass="form-control" placeholder="Enter PAN number" />
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Upload Scan Image</label>
                                <div class="ab-file">
                                    <div class="ab-file-preview"><i class="feather icon-image"></i></div>
                                    <div class="ab-file-main">
                                        <span class="ab-file-title">PAN scan</span>
                                        <span class="ab-file-hint">JPG or PNG recommended</span>
                                        <label class="ab-file-pick">
                                            <asp:FileUpload ID="FileUploadPan" runat="server" CssClass="ab-file-input" />
                                            <span class="ab-file-btn"><i class="feather icon-upload"></i> Choose file</span>
                                            <span class="ab-file-name">No file selected</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Status / Preview</label>
                                <asp:Literal ID="ltpancardimage" runat="server"></asp:Literal>
                                <asp:Label ID="lblpancardimage" Visible="false" runat="server" Text=""></asp:Label>
                                <asp:Label ID="lblpancardstatus" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-user-check"></i></span>
                        <div>
                            <h3>Aadhaar Card</h3>
                            <span>Aadhaar number with front and back scans</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>Aadhaar Card No</label>
                                <asp:TextBox ID="txtaadharcardno" runat="server" CssClass="form-control" placeholder="Enter Aadhaar number" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>Upload Aadhaar Front</label>
                                <div class="ab-file">
                                    <div class="ab-file-preview"><i class="feather icon-image"></i></div>
                                    <div class="ab-file-main">
                                        <span class="ab-file-title">Aadhaar front</span>
                                        <span class="ab-file-hint">JPG or PNG recommended</span>
                                        <label class="ab-file-pick">
                                            <asp:FileUpload ID="FileUploadaadhar" runat="server" CssClass="ab-file-input" />
                                            <span class="ab-file-btn"><i class="feather icon-upload"></i> Choose file</span>
                                            <span class="ab-file-name">No file selected</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Status / Preview</label>
                                <asp:Literal ID="ltaadharimage" runat="server"></asp:Literal>
                                <asp:Label ID="lblaadharimage" Visible="false" runat="server" Text=""></asp:Label>
                                <asp:Label ID="lblaadharstatus" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>Upload Aadhaar Back</label>
                                <div class="ab-file">
                                    <div class="ab-file-preview"><i class="feather icon-image"></i></div>
                                    <div class="ab-file-main">
                                        <span class="ab-file-title">Aadhaar back</span>
                                        <span class="ab-file-hint">JPG or PNG recommended</span>
                                        <label class="ab-file-pick">
                                            <asp:FileUpload ID="FileUploadaadharback" runat="server" CssClass="ab-file-input" />
                                            <span class="ab-file-btn"><i class="feather icon-upload"></i> Choose file</span>
                                            <span class="ab-file-name">No file selected</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Status / Preview</label>
                                <asp:Literal ID="ltaadharimageback" runat="server"></asp:Literal>
                                <asp:Label ID="lblaadharimageback" Visible="false" runat="server" Text=""></asp:Label>
                                <asp:Label ID="lblaadharstatusback" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ab-section" style="margin-bottom:0;">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-home"></i></span>
                        <div>
                            <h3>Bank / Address Proof</h3>
                            <span>Bank proof document and scan</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <div class="row">
                            <div class="col-md-4 ab-field">
                                <label>Bank Proof</label>
                                <asp:TextBox ID="txtaddressproof" runat="server" CssClass="form-control" placeholder="Enter bank proof reference" />
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Upload Scan Image</label>
                                <div class="ab-file">
                                    <div class="ab-file-preview"><i class="feather icon-image"></i></div>
                                    <div class="ab-file-main">
                                        <span class="ab-file-title">Bank proof scan</span>
                                        <span class="ab-file-hint">JPG or PNG recommended</span>
                                        <label class="ab-file-pick">
                                            <asp:FileUpload ID="FileUploadaddress" runat="server" CssClass="ab-file-input" />
                                            <span class="ab-file-btn"><i class="feather icon-upload"></i> Choose file</span>
                                            <span class="ab-file-name">No file selected</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Status / Preview</label>
                                <asp:Literal ID="ltaddressimage" runat="server"></asp:Literal>
                                <asp:Label ID="lbladdressimage" Visible="false" runat="server" Text=""></asp:Label>
                                <asp:Label ID="lbladdressstatus" runat="server" Text=""></asp:Label>
                                <asp:Label ID="lblbankproofremark" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" OnClick="btnCancel_Click1" CssClass="btn btn-danger" runat="server" Text="Cancel" />
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
