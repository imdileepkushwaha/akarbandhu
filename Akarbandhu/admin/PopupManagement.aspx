<%@ Page Title="Popup Management" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="PopupManagement.aspx.cs" Inherits="admin_PopupManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="assets/css/ab-forms.css" />
    <style type="text/css">
        .ab-popup-type-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 0.85rem;
            margin-bottom: 1.15rem;
        }
        .ab-popup-type-card {
            display: flex;
            align-items: flex-start;
            gap: 0.85rem;
            padding: 1rem 1.05rem;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            background: #fff;
            cursor: pointer;
            transition: border-color 0.18s ease, box-shadow 0.18s ease, transform 0.18s ease;
            text-align: left;
            width: 100%;
        }
        .ab-popup-type-card:hover {
            border-color: rgba(230, 126, 34, 0.4);
            box-shadow: 0 10px 22px rgba(11, 28, 51, 0.06);
            transform: translateY(-1px);
        }
        .ab-popup-type-card.is-active {
            border-color: rgba(230, 126, 34, 0.55);
            background: linear-gradient(145deg, #fff8f1 0%, #fff 70%);
            box-shadow: 0 10px 24px rgba(230, 126, 34, 0.12);
        }
        .ab-popup-type-card .ab-popup-type-icon {
            width: 42px;
            height: 42px;
            border-radius: 12px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: rgba(230, 126, 34, 0.12);
            color: #e67e22;
            flex-shrink: 0;
            font-size: 1.05rem;
        }
        .ab-popup-type-card strong {
            display: block;
            font-family: "Outfit", sans-serif;
            font-size: 0.98rem;
            color: #0b1c33;
            margin-bottom: 0.15rem;
        }
        .ab-popup-type-card span {
            display: block;
            font-size: 0.78rem;
            color: #6b7c8f;
            line-height: 1.4;
        }
        .ab-popup-thumb {
            width: 72px;
            height: 48px;
            object-fit: cover;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            background: #f8fafc;
        }
        .ab-popup-thumb--empty {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: #94a3b8;
            font-size: 0.85rem;
        }
        .ab-status-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
            padding: 0.28rem 0.65rem;
            border-radius: 999px;
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 0.02em;
        }
        .ab-status-badge--on {
            background: rgba(34, 197, 94, 0.12);
            color: #15803d;
        }
        .ab-status-badge--off {
            background: rgba(100, 116, 139, 0.12);
            color: #475569;
        }
        .ab-type-badge {
            display: inline-flex;
            padding: 0.28rem 0.65rem;
            border-radius: 999px;
            font-size: 0.72rem;
            font-weight: 700;
            background: rgba(11, 28, 51, 0.08);
            color: #0b1c33;
        }
        .ab-type-badge--image {
            background: rgba(230, 126, 34, 0.12);
            color: #c45f12;
        }
        .ab-btn-toggle {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 34px;
            height: 34px;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            color: #0b1c33;
            background: #fff;
            margin-right: 0.25rem;
        }
        .ab-btn-toggle:hover { border-color: #e67e22; color: #e67e22; text-decoration: none; }
        @media (max-width: 575px) {
            .ab-popup-type-grid { grid-template-columns: 1fr; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" runat="Server">
    <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
    <li class="breadcrumb-item"><a href="#">Website Management</a></li>
    <li class="breadcrumb-item"><a href="#">Popup Management</a></li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="ab-wm">
                <div class="ab-page-head">
                    <h2>Popup Management</h2>
                    <p>Add a <strong>Content popup</strong> or an <strong>Image popup</strong> separately. Active popup shows on the public index page on every reload.</p>
                </div>

                <div class="ab-section">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-layout"></i></span>
                        <div>
                            <h3><asp:Literal ID="ltFormTitle" runat="server" Text="Add Popup"></asp:Literal></h3>
                            <span>Choose popup type, then fill only the related fields</span>
                        </div>
                    </div>
                    <div class="ab-section-body">
                        <asp:HiddenField ID="hfPopupId" runat="server" />
                        <asp:HiddenField ID="hfImagePath" runat="server" />
                        <asp:HiddenField ID="hfPopupType" runat="server" Value="content" />

                        <div class="ab-popup-type-grid">
                            <asp:LinkButton ID="btnTypeContent" runat="server" CssClass="ab-popup-type-card is-active" OnClick="btnTypeContent_Click" CausesValidation="false">
                                <span class="ab-popup-type-icon"><i class="feather icon-file-text"></i></span>
                                <span>
                                    <strong>Content Popup</strong>
                                    <span>Title + message text only (no image)</span>
                                </span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnTypeImage" runat="server" CssClass="ab-popup-type-card" OnClick="btnTypeImage_Click" CausesValidation="false">
                                <span class="ab-popup-type-icon"><i class="feather icon-image"></i></span>
                                <span>
                                    <strong>Image Popup</strong>
                                    <span>Banner / poster image only (optional link)</span>
                                </span>
                            </asp:LinkButton>
                        </div>

                        <div class="row">
                            <div class="col-md-8 ab-field">
                                <label><asp:Literal ID="ltTitleLabel" runat="server" Text="Title"></asp:Literal></label>
                                <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" placeholder="Popup title"></asp:TextBox>
                            </div>
                            <div class="col-md-4 ab-field">
                                <label>Status</label>
                                <asp:DropDownList ID="ddlStatus" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="Active" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <asp:Panel ID="pnlContentFields" runat="server">
                            <div class="row">
                                <div class="col-md-12 ab-field">
                                    <label>Content</label>
                                    <asp:TextBox ID="txtContent" CssClass="form-control" TextMode="MultiLine" Rows="5" runat="server" placeholder="Write the popup message shown on the website..."></asp:TextBox>
                                </div>
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="pnlImageFields" runat="server" Visible="false">
                            <div class="row">
                                <div class="col-md-12 ab-field">
                                    <label>Link URL (optional)</label>
                                    <asp:TextBox ID="txtLinkUrl" CssClass="form-control" runat="server" placeholder="https://... (opens when image is clicked)"></asp:TextBox>
                                </div>
                                <div class="col-md-12 ab-field">
                                    <label>Popup Image</label>
                                    <div class="ab-file">
                                        <div class="ab-file-preview">
                                            <asp:Image ID="imgPreview" runat="server" CssClass="ab-logo-preview" Visible="false" />
                                            <span runat="server" id="lblNoImage" class="ab-file-empty"><i class="feather icon-image"></i></span>
                                        </div>
                                        <div class="ab-file-main">
                                            <span class="ab-file-title">Popup banner / poster</span>
                                            <span class="ab-file-hint">PNG, JPG, WEBP or GIF · max 5 MB · recommended width 600–900px</span>
                                            <label class="ab-file-pick">
                                                <asp:FileUpload ID="fuImage" runat="server" CssClass="ab-file-input" />
                                                <span class="ab-file-btn"><i class="feather icon-upload"></i> Choose file</span>
                                                <span class="ab-file-name">No file selected</span>
                                            </label>
                                            <asp:LinkButton ID="btnClearImage" runat="server" CssClass="btn btn-sm btn-outline-danger mt-2" OnClick="btnClearImage_Click" CausesValidation="false" Visible="false">
                                                Remove image
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                    <div class="ab-actions">
                        <asp:Button ID="btnSubmit" OnClientClick="return validatePopup();" CssClass="btn btn-primary" runat="server" Text="Save Popup" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-danger" runat="server" Text="Cancel" CausesValidation="false" />
                    </div>
                </div>

                <div class="ab-section" style="margin-bottom:0;">
                    <div class="ab-section-head">
                        <span class="ab-section-icon"><i class="feather icon-list"></i></span>
                        <div>
                            <h3>Popup List</h3>
                            <span>Edit, activate/deactivate, or delete</span>
                        </div>
                    </div>
                    <div class="ab-section-body ab-section-body--flush">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table ab-table table-striped" Width="100%"
                                AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" GridLines="None" EmptyDataText="No popups yet. Add one above.">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("Id") %>'></asp:Label>
                                            <asp:Label ID="lblactive" runat="server" Visible="false" Text='<%# Eval("IsActive") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type">
                                        <ItemTemplate>
                                            <span class='<%# (bool)Eval("IsImagePopup") ? "ab-type-badge ab-type-badge--image" : "ab-type-badge" %>'>
                                                <%# Eval("TypeText") %>
                                            </span>
                                        </ItemTemplate>
                                        <HeaderStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Preview">
                                        <ItemTemplate>
                                            <asp:PlaceHolder ID="phImg" runat="server" Visible='<%# (bool)Eval("IsImagePopup") && (bool)Eval("HasImage") %>'>
                                                <img class="ab-popup-thumb" src='<%# Eval("ImageUrl") %>' alt="" />
                                            </asp:PlaceHolder>
                                            <asp:PlaceHolder ID="phText" runat="server" Visible='<%# (bool)Eval("IsContentPopup") %>'>
                                                <span class="ab-popup-thumb ab-popup-thumb--empty"><i class="feather icon-file-text"></i></span>
                                            </asp:PlaceHolder>
                                        </ItemTemplate>
                                        <HeaderStyle Width="90px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Title">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Details">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcontent" runat="server" Text='<%# DetailPreview(Container.DataItem) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <span class='<%# (bool)Eval("IsActive") ? "ab-status-badge ab-status-badge--on" : "ab-status-badge ab-status-badge--off" %>'>
                                                <%# Eval("StatusText") %>
                                            </span>
                                        </ItemTemplate>
                                        <HeaderStyle Width="110px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Updated">
                                        <ItemTemplate>
                                            <%# Eval("UpdatedOn") %>
                                        </ItemTemplate>
                                        <HeaderStyle Width="150px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbToggle" CssClass="ab-btn-toggle" ToolTip='<%# (bool)Eval("IsActive") ? "Deactivate" : "Activate" %>'
                                                CommandName="togglestatus" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server">
                                                <i class='<%# (bool)Eval("IsActive") ? "feather icon-pause-circle" : "feather icon-play-circle" %>'></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="lbEdit" CssClass="ab-btn-edit" ToolTip="Edit" CommandName="edt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server">
                                                <i class="feather icon-edit-2"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="lbDelete" CssClass="ab-btn-delete" ToolTip="Delete" CommandName="mydel" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server" OnClientClick="return confirm('Delete this popup?');">
                                                <i class="feather icon-trash-2"></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle Width="150px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
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
        function validatePopup() {
            var type = (document.getElementById('<%= hfPopupType.ClientID %>').value || 'content').toLowerCase();
            var title = document.getElementById('<%= txtTitle.ClientID %>').value.trim();

            if (type === 'content') {
                if (!title) {
                    toastr.warning('Warning', 'Enter popup title');
                    document.getElementById('<%= txtTitle.ClientID %>').focus();
                    return false;
                }
                var content = document.getElementById('<%= txtContent.ClientID %>').value.trim();
                if (!content) {
                    toastr.warning('Warning', 'Enter popup content');
                    document.getElementById('<%= txtContent.ClientID %>').focus();
                    return false;
                }
                return true;
            }

            // Image popup — title optional
            var fileInput = document.getElementById('<%= fuImage.ClientID %>');
            var hasExisting = document.getElementById('<%= hfImagePath.ClientID %>').value.trim() !== '';
            var hasFile = fileInput && fileInput.value !== '';
            if (!hasExisting && !hasFile) {
                toastr.warning('Warning', 'Upload a popup image');
                return false;
            }
            if (hasFile) {
                var name = fileInput.value.toLowerCase();
                if (!(name.endsWith('.png') || name.endsWith('.jpg') || name.endsWith('.jpeg') || name.endsWith('.webp') || name.endsWith('.gif'))) {
                    toastr.error('Error', 'Please upload PNG, JPG, WEBP or GIF');
                    return false;
                }
                if (fileInput.files && fileInput.files[0] && fileInput.files[0].size > 5 * 1024 * 1024) {
                    toastr.error('Error', 'Image must be 5 MB or less');
                    return false;
                }
            }
            return true;
        }

        function bindPopupFileName() {
            var input = document.getElementById('<%= fuImage.ClientID %>');
            if (!input || input.getAttribute('data-bound') === '1') return;
            input.setAttribute('data-bound', '1');
            input.addEventListener('change', function () {
                var nameEl = input.parentElement && input.parentElement.querySelector('.ab-file-name');
                if (nameEl) nameEl.textContent = input.files && input.files.length ? input.files[0].name : 'No file selected';
            });
        }
        bindPopupFileName();
        if (typeof Sys !== 'undefined' && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () { bindPopupFileName(); });
        }
    </script>
</asp:Content>
