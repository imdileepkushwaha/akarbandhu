<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="admin_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <title>Akar Bandhu Pvt Ltd — User Login</title>
	<!--[if lt IE 11]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="description" content="Akar Bandhu Pvt Ltd User Portal" />
	<link rel="icon" type="image/png" href="../preloader.jpg">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Outfit:wght@600;700;800&display=swap" rel="stylesheet">
	<style>
		:root {
			--ab-navy: #0b1c33;
			--ab-navy-mid: #122847;
			--ab-orange: #e67e22;
			--ab-orange-deep: #d35400;
			--ab-sky: #7eb8e8;
			--ab-muted: #6b7c8f;
			--ab-ink: #0f1a28;
		}

		html, body {
			height: 100%;
			margin: 0;
		}

		body.ab-login {
			font-family: "DM Sans", sans-serif;
			background: var(--ab-navy);
			overflow-x: hidden;
		}

		.ab-shell {
			min-height: 100vh;
			display: grid;
			grid-template-columns: 1.1fr 0.9fr;
			position: relative;
		}

		.ab-hero {
			position: relative;
			display: flex;
			flex-direction: column;
			justify-content: flex-end;
			padding: clamp(2rem, 5vw, 4.5rem);
			color: #fff;
			background:
				radial-gradient(ellipse 70% 50% at 15% 20%, rgba(230, 126, 34, 0.18), transparent 55%),
				radial-gradient(ellipse 50% 40% at 85% 70%, rgba(126, 184, 232, 0.12), transparent 50%),
				linear-gradient(165deg, #0b1c33 0%, #122847 48%, #0a1628 100%);
			overflow: hidden;
			animation: ab-fade-in 0.9s ease both;
		}

		.ab-hero::before {
			content: "";
			position: absolute;
			inset: -20% -10%;
			background:
				repeating-linear-gradient(
					-18deg,
					transparent,
					transparent 48px,
					rgba(255, 255, 255, 0.03) 48px,
					rgba(255, 255, 255, 0.03) 49px
				);
			pointer-events: none;
			animation: ab-drift 18s linear infinite;
		}

		.ab-hero::after {
			content: "";
			position: absolute;
			width: 42vw;
			height: 42vw;
			max-width: 520px;
			max-height: 520px;
			right: -8%;
			top: -12%;
			border-radius: 50%;
			border: 1px solid rgba(230, 126, 34, 0.25);
			box-shadow: 0 0 0 40px rgba(230, 126, 34, 0.05);
			pointer-events: none;
			animation: ab-pulse 6s ease-in-out infinite;
		}

		.ab-hero-inner {
			position: relative;
			z-index: 1;
			max-width: 36rem;
		}

		.ab-logo-mark {
			display: inline-flex;
			align-items: center;
			gap: 0.85rem;
			margin-bottom: 1.5rem;
			animation: ab-rise 0.85s ease both;
		}

		.ab-logo-mark svg {
			width: 52px;
			height: 52px;
			color: var(--ab-orange);
			flex-shrink: 0;
			filter: drop-shadow(0 4px 12px rgba(230, 126, 34, 0.35));
		}

		.ab-brand {
			font-family: "Outfit", sans-serif;
			font-weight: 800;
			font-size: clamp(2.2rem, 4.8vw, 3.5rem);
			line-height: 1.05;
			letter-spacing: -0.02em;
			margin: 0;
			color: var(--ab-orange);
			text-shadow: 0 2px 24px rgba(0, 0, 0, 0.25);
			animation: ab-rise 0.85s 0.12s ease both;
		}

		.ab-brand span {
			display: block;
			color: rgba(255, 255, 255, 0.88);
			font-size: 0.42em;
			font-weight: 600;
			letter-spacing: 0.14em;
			text-transform: uppercase;
			margin-top: 0.45rem;
		}

		.ab-badge {
			display: inline-flex;
			align-items: center;
			gap: 0.55rem;
			margin: 1.1rem 0 1rem;
			padding: 0.4rem 0.9rem;
			border-radius: 999px;
			background: rgba(255, 255, 255, 0.08);
			border: 1px solid rgba(255, 255, 255, 0.12);
			font-size: 0.78rem;
			color: rgba(255, 255, 255, 0.85);
			animation: ab-rise 0.85s 0.2s ease both;
		}

		.ab-badge-dot {
			width: 7px;
			height: 7px;
			border-radius: 50%;
			background: #2ecc71;
			box-shadow: 0 0 0 3px rgba(46, 204, 113, 0.25);
		}

		.ab-badge-pill {
			padding: 0.15rem 0.5rem;
			border-radius: 999px;
			background: rgba(126, 184, 232, 0.2);
			color: var(--ab-sky);
			font-weight: 600;
			font-size: 0.72rem;
		}

		.ab-tagline {
			margin: 0;
			font-size: 1.05rem;
			line-height: 1.55;
			color: rgba(255, 255, 255, 0.78);
			max-width: 28rem;
			animation: ab-rise 0.85s 0.3s ease both;
		}

		.ab-panel {
			display: flex;
			align-items: center;
			justify-content: center;
			padding: clamp(1.5rem, 4vw, 3rem);
			background: linear-gradient(180deg, #f8fafc 0%, #eef2f6 100%);
			animation: ab-fade-in 0.7s 0.1s ease both;
		}

		.ab-form-wrap {
			width: 100%;
			max-width: 380px;
		}

		.ab-form-logo {
			display: none;
			align-items: center;
			justify-content: center;
			gap: 0.65rem;
			margin-bottom: 1.5rem;
		}

		.ab-form-logo svg {
			width: 36px;
			height: 36px;
			color: var(--ab-orange);
		}

		.ab-form-logo strong {
			font-family: "Outfit", sans-serif;
			font-size: 1.25rem;
			font-weight: 700;
			color: var(--ab-orange);
		}

		.ab-form-label {
			font-size: 0.72rem;
			font-weight: 600;
			letter-spacing: 0.14em;
			text-transform: uppercase;
			color: var(--ab-orange);
			margin: 0 0 0.35rem;
		}

		.ab-form-title {
			font-family: "Outfit", sans-serif;
			font-size: 1.85rem;
			font-weight: 700;
			color: var(--ab-ink);
			margin: 0 0 0.35rem;
			line-height: 1.15;
		}

		.ab-form-sub {
			margin: 0 0 1.75rem;
			color: var(--ab-muted);
			font-size: 0.95rem;
		}

		.ab-field {
			margin-bottom: 1.1rem;
		}

		.ab-field label {
			display: block;
			font-size: 0.82rem;
			font-weight: 600;
			color: var(--ab-ink);
			margin-bottom: 0.4rem;
		}

		.ab-login .form-control {
			height: 48px;
			border: 1px solid #d5dde6;
			border-radius: 8px;
			background: #fff;
			padding: 0.65rem 0.95rem;
			font-size: 0.95rem;
			color: var(--ab-ink);
			box-shadow: none;
			transition: border-color 0.2s ease, box-shadow 0.2s ease;
		}

		.ab-login .form-control:focus {
			border-color: var(--ab-orange);
			box-shadow: 0 0 0 3px rgba(230, 126, 34, 0.18);
			outline: none;
		}

		.ab-login .btn-login {
			display: block;
			width: 100%;
			height: 50px;
			margin-top: 0.35rem;
			margin-bottom: 1.1rem;
			border: none;
			border-radius: 8px;
			background: linear-gradient(135deg, var(--ab-orange) 0%, var(--ab-orange-deep) 100%);
			color: #fff;
			font-family: "DM Sans", sans-serif;
			font-size: 1rem;
			font-weight: 600;
			letter-spacing: 0.04em;
			cursor: pointer;
			transition: transform 0.2s ease, box-shadow 0.2s ease, filter 0.2s ease;
			box-shadow: 0 10px 24px rgba(211, 84, 0, 0.28);
		}

		.ab-login .btn-login:hover {
			filter: brightness(1.05);
			transform: translateY(-1px);
			box-shadow: 0 14px 28px rgba(211, 84, 0, 0.34);
			color: #fff;
		}

		.ab-forgot {
			margin: 0 0 1.25rem;
			text-align: center;
			font-size: 0.9rem;
			color: var(--ab-muted);
		}

		.ab-forgot a {
			color: var(--ab-navy-mid);
			font-weight: 600;
			text-decoration: none;
			border-bottom: 1px solid transparent;
			transition: border-color 0.2s ease, color 0.2s ease;
			cursor: pointer;
		}

		.ab-forgot a:hover {
			color: var(--ab-orange);
			border-bottom-color: var(--ab-orange);
		}

		.ab-forgot-hint {
			display: block;
			margin-top: 0.45rem;
			font-size: 0.78rem;
			color: var(--ab-muted);
		}

		.ab-forgot-steps {
			display: flex;
			gap: 0.5rem;
			margin-bottom: 1rem;
		}

		.ab-forgot-steps span {
			flex: 1;
			text-align: center;
			font-size: 0.72rem;
			font-weight: 700;
			letter-spacing: 0.04em;
			text-transform: uppercase;
			padding: 0.4rem 0.35rem;
			border-radius: 999px;
			background: #f1f5f9;
			color: #94a3b8;
		}

		.ab-forgot-steps span.is-active {
			background: rgba(230, 126, 34, 0.14);
			color: var(--ab-orange-deep);
		}

		.ab-password {
			position: relative;
		}

		.ab-password .form-control {
			padding-right: 2.75rem !important;
		}

		.ab-password-toggle {
			position: absolute;
			top: 50%;
			right: 0.45rem;
			transform: translateY(-50%);
			width: 34px;
			height: 34px;
			border: none;
			background: transparent;
			color: var(--ab-muted);
			border-radius: 8px;
			display: inline-flex;
			align-items: center;
			justify-content: center;
			cursor: pointer;
			padding: 0;
		}

		.ab-password-toggle:hover {
			color: var(--ab-orange);
			background: rgba(230, 126, 34, 0.1);
		}

		.ab-home-link {
			display: inline-flex;
			align-items: center;
			gap: 0.4rem;
			font-size: 0.88rem;
			font-weight: 600;
			color: var(--ab-muted);
			text-decoration: none;
			transition: color 0.2s ease;
		}

		.ab-home-link:hover {
			color: var(--ab-orange);
		}

		.ab-home-link svg {
			width: 16px;
			height: 16px;
		}

		.ab-modal .modal-content {
			border: none;
			border-radius: 14px;
			overflow: hidden;
			box-shadow: 0 24px 60px rgba(15, 23, 42, 0.2);
		}

		.ab-modal .modal-header {
			border-bottom: 1px solid #eef2f6;
			padding: 1.1rem 1.35rem;
		}

		.ab-modal .modal-title {
			font-family: "Outfit", sans-serif;
			font-weight: 700;
			color: var(--ab-ink);
			margin: 0;
		}

		.ab-modal .modal-body {
			padding: 1.35rem;
		}

		.ab-modal .modal-footer {
			border-top: 1px solid #eef2f6;
			padding: 1rem 1.35rem;
		}

		@keyframes ab-fade-in {
			from { opacity: 0; }
			to { opacity: 1; }
		}

		@keyframes ab-rise {
			from { opacity: 0; transform: translateY(18px); }
			to { opacity: 1; transform: translateY(0); }
		}

		@keyframes ab-drift {
			from { transform: translateX(0); }
			to { transform: translateX(48px); }
		}

		@keyframes ab-pulse {
			0%, 100% { transform: scale(1); opacity: 0.7; }
			50% { transform: scale(1.04); opacity: 1; }
		}

		@media (max-width: 900px) {
			.ab-shell {
				grid-template-columns: 1fr;
			}

			.ab-hero {
				min-height: 36vh;
				justify-content: flex-end;
				padding: 2rem 1.5rem 1.75rem;
			}

			.ab-logo-mark svg {
				width: 40px;
				height: 40px;
			}

			.ab-brand {
				font-size: clamp(1.9rem, 7vw, 2.5rem);
			}

			.ab-tagline {
				font-size: 0.95rem;
			}

			.ab-panel {
				align-items: flex-start;
				padding-top: 1.75rem;
			}

			.ab-form-logo {
				display: flex;
			}
		}

		@media (max-width: 480px) {
			.ab-hero {
				min-height: 30vh;
			}

			.ab-form-title {
				font-size: 1.55rem;
			}
		}
	</style>
</head>
<body class="ab-login">
    <form id="form1" runat="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <asp:UpdatePanel runat="server" ID="uplMaster" >
        <ContentTemplate>

  <div class="ab-shell">
	<section class="ab-hero" aria-label="Brand">
		<div class="ab-hero-inner">
			<div class="ab-logo-mark" aria-hidden="true">
				<svg viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path d="M2 27h28" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
					<path d="M2 27c0-1 2.5-2 6-2M30 27c0-1-2.5-2-6-2" stroke="currentColor" stroke-width="1.25" stroke-linecap="round" opacity="0.5"/>
					<rect x="4" y="13" width="10" height="14" rx="1.25" fill="currentColor"/>
					<rect x="6.5" y="15.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="9.75" y="15.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="6.5" y="19.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="9.75" y="19.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="7.5" y="23" width="3" height="4" rx="0.35" fill="white" opacity="0.75"/>
					<rect x="18" y="8" width="10" height="19" rx="1.25" fill="currentColor"/>
					<rect x="20.25" y="10.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="23.5" y="10.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="20.25" y="14.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="23.5" y="14.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="20.25" y="18.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="23.5" y="18.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<path d="M5 13V9l4.5-4 4.5 4v4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
					<path d="M23 8V5l2.5-2.5L28 5v3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
					<path d="M25.5 5.5h4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"/>
					<path d="M27.5 5.5v5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
				</svg>
			</div>
			<h1 class="ab-brand">Akar Bandhu<span>Pvt Ltd</span></h1>
			<div class="ab-badge">
				<span class="ab-badge-dot"></span>
				ESTD 2022 — Patna, Bihar
				<span class="ab-badge-pill">Govt. Registered</span>
			</div>
			<p class="ab-tagline">User portal — sign in to view your bookings, payments, and account details.</p>
		</div>
	</section>

	<section class="ab-panel">
		<div class="ab-form-wrap">
			<div class="ab-form-logo" aria-hidden="true">
				<svg viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path d="M2 27h28" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
					<path d="M2 27c0-1 2.5-2 6-2M30 27c0-1-2.5-2-6-2" stroke="currentColor" stroke-width="1.25" stroke-linecap="round" opacity="0.5"/>
					<rect x="4" y="13" width="10" height="14" rx="1.25" fill="currentColor"/>
					<rect x="6.5" y="15.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="9.75" y="15.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="6.5" y="19.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="9.75" y="19.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="7.5" y="23" width="3" height="4" rx="0.35" fill="white" opacity="0.75"/>
					<rect x="18" y="8" width="10" height="19" rx="1.25" fill="currentColor"/>
					<rect x="20.25" y="10.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="23.5" y="10.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="20.25" y="14.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="23.5" y="14.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="20.25" y="18.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<rect x="23.5" y="18.5" width="2.25" height="2.25" rx="0.35" fill="white" opacity="0.92"/>
					<path d="M5 13V9l4.5-4 4.5 4v4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
					<path d="M23 8V5l2.5-2.5L28 5v3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
					<path d="M25.5 5.5h4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"/>
					<path d="M27.5 5.5v5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
				</svg>
				<strong>Akar Bandhu</strong>
			</div>
			<p class="ab-form-label">User access</p>
			<h2 class="ab-form-title">Welcome back</h2>
			<p class="ab-form-sub">Enter your credentials to continue to your dashboard.</p>

			<div class="ab-field">
				<label for="<%= txtusername.ClientID %>">Username</label>
				<asp:TextBox ID="txtusername" runat="server" CssClass="form-control" placeholder="Enter username" autocomplete="username" required></asp:TextBox>
			</div>
			<div class="ab-field">
				<label for="<%= txtpassword.ClientID %>">Password</label>
				<asp:TextBox ID="txtpassword" autocomplete="current-password" CssClass="form-control" placeholder="Enter password" runat="server" TextMode="Password" required></asp:TextBox>
			</div>

			<asp:Button ID="btnLogin" OnClick="btnLogin_Click" runat="server" CssClass="btn-login" Text="Login" />

			<p class="ab-forgot">Forgot password? <a href="javascript:void(0);" onclick="showForgotModal(); return false;" data-toggle="modal" data-target="#myModal">Reset</a></p>
			<a class="ab-home-link" href="../index.aspx">
				<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
				Back to website
			</a>
		</div>
	</section>
</div>
            
                <div id="myModal" class="modal fade ab-modal">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Forgot Password</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="opacity:0.6;"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="ab-forgot-steps">
                                <asp:Label ID="lblStep1" runat="server" CssClass="is-active" Text="1. Verify ID"></asp:Label>
                                <asp:Label ID="lblStep2" runat="server" Text="2. Reset"></asp:Label>
                            </div>

                            <asp:Panel ID="pnlForgotStep1" runat="server">
                                <div class="ab-field" style="margin-bottom:0;">
                                    <label for="<%= txtuserid.ClientID %>">User Id</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtuserid" placeholder="Enter your user id" autocomplete="username"></asp:TextBox>
                                    <span class="ab-forgot-hint">We will send an OTP to your registered mobile number.</span>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="pnlForgotStep2" runat="server" Visible="false">
                                <p class="ab-forgot-hint" style="margin:0 0 0.85rem;">OTP sent to <asp:Label ID="lblMaskedMobile" runat="server" Text=""></asp:Label></p>
                                <div class="ab-field">
                                    <label for="<%= txtotp.ClientID %>">OTP</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtotp" placeholder="Enter 4-digit OTP" MaxLength="6" autocomplete="one-time-code"></asp:TextBox>
                                </div>
                                <div class="ab-field">
                                    <label for="<%= txtnewpassword.ClientID %>">New Password</label>
                                    <div class="ab-password">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtnewpassword" TextMode="Password" placeholder="Enter new password" autocomplete="new-password"></asp:TextBox>
                                        <button type="button" class="ab-password-toggle" data-target="<%= txtnewpassword.ClientID %>" aria-label="Show password" title="Show / hide"><i class="feather icon-eye"></i></button>
                                    </div>
                                </div>
                                <div class="ab-field" style="margin-bottom:0;">
                                    <label for="<%= txtconfirmpassword.ClientID %>">Confirm Password</label>
                                    <div class="ab-password">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtconfirmpassword" TextMode="Password" placeholder="Confirm new password" autocomplete="new-password"></asp:TextBox>
                                        <button type="button" class="ab-password-toggle" data-target="<%= txtconfirmpassword.ClientID %>" aria-label="Show password" title="Show / hide"><i class="feather icon-eye"></i></button>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSendOtp" runat="server" formnovalidate Text="Send OTP" OnClientClick="return validateForgotStep1();" CssClass="btn btn-primary" OnClick="btnSendOtp_Click" />
                            <asp:Button ID="btnResetPassword" runat="server" formnovalidate Text="Reset Password" Visible="false" OnClientClick="return validateForgotStep2();" CssClass="btn btn-primary" OnClick="btnResetPassword_Click" />
                            <asp:Button ID="btnForgotBack" runat="server" formnovalidate Text="Back" Visible="false" CssClass="btn btn-secondary" OnClick="btnForgotBack_Click" CausesValidation="false" />
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
	  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/plugins/bootstrap.min.js"></script>
             </ContentTemplate>
              <Triggers>
                  <asp:PostBackTrigger ControlID="btnSendOtp" />
                  <asp:PostBackTrigger ControlID="btnResetPassword" />
                  <asp:PostBackTrigger ControlID="btnForgotBack" />
              </Triggers>
    </asp:UpdatePanel>
          <script type="text/javascript">
              function validateForgotStep1() {
                  if (document.getElementById("<%=txtuserid.ClientID%>").value.trim() == "") {
                      alert("Enter User Id");
                      document.getElementById("<%=txtuserid.ClientID%>").focus();
                      return false;
                  }
                  return true;
              }
              function validateForgotStep2() {
                  if (document.getElementById("<%=txtotp.ClientID%>").value.trim() == "") {
                      alert("Enter OTP");
                      document.getElementById("<%=txtotp.ClientID%>").focus();
                      return false;
                  }
                  if (document.getElementById("<%=txtnewpassword.ClientID%>").value == "") {
                      alert("Enter New Password");
                      document.getElementById("<%=txtnewpassword.ClientID%>").focus();
                      return false;
                  }
                  if (document.getElementById("<%=txtconfirmpassword.ClientID%>").value == "") {
                      alert("Enter Confirm Password");
                      document.getElementById("<%=txtconfirmpassword.ClientID%>").focus();
                      return false;
                  }
                  if (document.getElementById("<%=txtnewpassword.ClientID%>").value != document.getElementById("<%=txtconfirmpassword.ClientID%>").value) {
                      alert("Passwords do not match");
                      document.getElementById("<%=txtconfirmpassword.ClientID%>").focus();
                      return false;
                  }
                  return true;
              }
        </script>

    <script type="text/javascript">
        function ensureForgotBackdrop() {
            if (!document.querySelector('.modal-backdrop')) {
                var backdrop = document.createElement('div');
                backdrop.className = 'modal-backdrop fade show';
                document.body.appendChild(backdrop);
            }
            document.body.classList.add('modal-open');
        }
        function showForgotModal() {
            var el = document.getElementById('myModal');
            if (!el) return false;
            try {
                if (window.jQuery && jQuery.fn && jQuery.fn.modal) {
                    jQuery('#myModal').modal({ backdrop: 'static', keyboard: false });
                    return false;
                }
            } catch (e) { }
            el.classList.add('show');
            el.style.display = 'block';
            el.removeAttribute('aria-hidden');
            el.setAttribute('aria-modal', 'true');
            ensureForgotBackdrop();
            return false;
        }
        function Closepopup() {
            try {
                if (window.jQuery && jQuery.fn && jQuery.fn.modal) {
                    jQuery('#myModal').modal('hide');
                }
            } catch (e) { }
            var el = document.getElementById('myModal');
            if (el) {
                el.classList.remove('show');
                el.style.display = 'none';
                el.setAttribute('aria-hidden', 'true');
            }
            document.body.classList.remove('modal-open');
            document.body.style.paddingRight = '0';
            var backs = document.querySelectorAll('.modal-backdrop');
            for (var i = 0; i < backs.length; i++) backs[i].parentNode.removeChild(backs[i]);
        }
        function bindPasswordToggles(root) {
            var scope = root || document;
            scope.querySelectorAll('.ab-password-toggle').forEach(function (btn) {
                if (btn._abPwBound) return;
                btn._abPwBound = true;
                btn.addEventListener('click', function () {
                    var id = btn.getAttribute('data-target');
                    var input = id ? document.getElementById(id) : null;
                    if (!input) return;
                    var show = input.type === 'password';
                    input.type = show ? 'text' : 'password';
                    var icon = btn.querySelector('i');
                    if (icon) {
                        icon.className = show ? 'feather icon-eye-off' : 'feather icon-eye';
                    }
                    btn.setAttribute('aria-label', show ? 'Hide password' : 'Show password');
                });
            });
        }
        document.addEventListener('DOMContentLoaded', function () { bindPasswordToggles(document); });
        if (typeof Sys !== 'undefined' && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                bindPasswordToggles(document);
            });
        }
    </script>
    </form>
</body>
</html>
