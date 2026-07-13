<%@ Page Title="Documents | AKAR BANDHU PVT. LTD." Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="documents.aspx.cs" Inherits="documents" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <section class="docs-hero">
        <div class="docs-hero-bg" aria-hidden="true">
            <div class="docs-hero-grid"></div>
            <div class="docs-hero-glow docs-hero-glow--1"></div>
            <div class="docs-hero-glow docs-hero-glow--2"></div>
        </div>
        <div class="container docs-hero-inner">
            <nav class="docs-breadcrumb reveal-up">
                <a href="<%= ResolveUrl("~/index.aspx") %>">Home</a>
                <span>/</span>
                <span>Documents</span>
            </nav>
            <div class="docs-hero-content reveal-up">
                <span class="section-tag">Official Records</span>
                <h1>Company <span class="gradient-text">Documents</span></h1>
                <p>Certificates, registrations, and official documents of AKAR BANDHU PVT. LTD.</p>
            </div>
            <div class="docs-hero-stats reveal-up">
                <div class="docs-stat-pill">
                    <strong><asp:Literal ID="ltDocCount" runat="server" Text="0"></asp:Literal></strong>
                    <span>Total Documents</span>
                </div>
                <div class="docs-stat-pill">
                    <strong>PDF &amp; Image</strong>
                    <span>Supported Formats</span>
                </div>
            </div>
        </div>
    </section>

    <section class="docs-section section">
        <div class="container">
            <asp:PlaceHolder ID="phEmpty" runat="server" Visible="false">
                <div class="docs-empty reveal-up">
                    <div class="docs-empty-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                            <path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/>
                            <polyline points="14 2 14 8 20 8"/>
                            <line x1="12" y1="18" x2="12" y2="12"/>
                            <line x1="9" y1="15" x2="15" y2="15"/>
                        </svg>
                    </div>
                    <h3>No Documents Found</h3>
                    <p>Please add PDF or image files to the <code>assets/documents</code> folder.</p>
                </div>
            </asp:PlaceHolder>

            <asp:Repeater ID="rptDocuments" runat="server">
                <HeaderTemplate>
                    <div class="docs-grid">
                </HeaderTemplate>
                <ItemTemplate>
                    <article class="doc-card reveal-up" style="transition-delay: <%# Eval("Delay") %>s">
                        <div class="doc-card-top">
                            <span class="doc-type-icon doc-type-<%# Eval("Type") %>">
                                <%# (string)Eval("Type") == "pdf"
                                    ? @"<svg viewBox=""0 0 24 24"" fill=""none"" stroke=""currentColor"" stroke-width=""1.5""><path d=""M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z""/><polyline points=""14 2 14 8 20 8""/><path d=""M9 13h6M9 17h4""/></svg>"
                                    : @"<svg viewBox=""0 0 24 24"" fill=""none"" stroke=""currentColor"" stroke-width=""1.5""><rect x=""3"" y=""3"" width=""18"" height=""18"" rx=""2""/><circle cx=""8.5"" cy=""8.5"" r=""1.5""/><path d=""M21 15l-5-5L5 21""/></svg>" %>
                            </span>
                            <span class="doc-ext-badge"><%# Eval("Ext") %></span>
                        </div>
                        <h3 class="doc-card-title"><%# Eval("Title") %></h3>
                        <p class="doc-card-meta"><%# Eval("SizeLabel") %> · <%# (string)Eval("Type") == "pdf" ? "PDF Document" : "Image File" %></p>
                        <div class="doc-card-actions">
                            <button type="button"
                                    class="btn btn-primary doc-view-btn"
                                    data-url="<%# Eval("Url") %>"
                                    data-title="<%# Eval("Title") %>"
                                    data-type="<%# Eval("Type") %>">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
                                View
                            </button>
                            <a href="<%# Eval("Url") %>" class="btn btn-outline doc-download-btn" download>
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 01-2 2H5a2 2 0 01-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
                                Download
                            </a>
                        </div>
                    </article>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </section>

    <div class="doc-modal" id="docModal" aria-hidden="true">
        <div class="doc-modal-backdrop" id="docModalBackdrop"></div>
        <div class="doc-modal-dialog" role="dialog" aria-modal="true" aria-labelledby="docModalTitle">
            <div class="doc-modal-header">
                <div class="doc-modal-title-wrap">
                    <span class="doc-modal-type" id="docModalType">PDF</span>
                    <h2 id="docModalTitle">Document</h2>
                </div>
                <div class="doc-modal-tools">
                    <a href="#" class="doc-modal-download" id="docModalDownload" download title="Download">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 01-2 2H5a2 2 0 01-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
                    </a>
                    <button type="button" class="doc-modal-close" id="docModalClose" aria-label="Close">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
                    </button>
                </div>
            </div>
            <div class="doc-modal-body">
                <div class="doc-modal-loader" id="docModalLoader">
                    <div class="doc-modal-spinner"></div>
                    <span>Loading document...</span>
                </div>
                <iframe class="doc-modal-frame" id="docModalFrame" title="Document viewer" hidden="hidden"></iframe>
                <img class="doc-modal-image" id="docModalImage" alt="" hidden="hidden" />
            </div>
        </div>
    </div>

</asp:Content>
