<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfirmRegistration.aspx.cs" Inherits="user_ConfirmRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Akar Bandhu — Registration Confirmed</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Outfit:wght@700;800&display=swap" rel="stylesheet" />
    <style>
        :root {
            --ab-navy: #0b1c33;
            --ab-orange: #e67e22;
            --ab-orange-deep: #d35400;
        }
        body {
            font-family: "DM Sans", sans-serif;
            background: linear-gradient(165deg, #0b1c33 0%, #122847 50%, #0a1628 100%);
            min-height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1.5rem;
        }
        .ab-confirm {
            width: 100%;
            max-width: 560px;
            background: #fff;
            border-radius: 16px;
            padding: 2.25rem 1.75rem;
            text-align: center;
            box-shadow: 0 24px 60px rgba(0, 0, 0, 0.35);
        }
        .ab-confirm svg {
            width: 48px;
            height: 48px;
            color: var(--ab-orange);
            margin-bottom: 0.75rem;
        }
        .ab-confirm .brand {
            font-family: "Outfit", sans-serif;
            font-weight: 800;
            font-size: 1.5rem;
            color: var(--ab-orange);
            margin: 0 0 1.25rem;
        }
        .ab-confirm h1 {
            font-family: "Outfit", sans-serif;
            font-size: 1.45rem;
            font-weight: 700;
            color: var(--ab-navy);
            margin: 0 0 1rem;
        }
        .ab-confirm p {
            color: #5c6f80;
            font-size: 1rem;
            line-height: 1.6;
            margin-bottom: 0.75rem;
        }
        .ab-confirm .hl {
            color: var(--ab-orange);
            font-weight: 700;
            font-size: 1.15em;
        }
        .ab-confirm .btn-login {
            display: inline-block;
            margin-top: 1.25rem;
            padding: 0.7rem 1.75rem;
            border-radius: 8px;
            background: linear-gradient(135deg, var(--ab-orange), var(--ab-orange-deep));
            color: #fff !important;
            font-weight: 600;
            text-decoration: none;
            box-shadow: 0 10px 24px rgba(211, 84, 0, 0.28);
        }
        .ab-confirm .btn-login:hover {
            filter: brightness(1.05);
            color: #fff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="ab-confirm">
            <svg viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
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
            <p class="brand">Akar Bandhu</p>
            <h1>Registration Successful</h1>
            <p>
                Welcome to <%= clsUtility.ProjectName %>, Dear
                <span class="hl"><asp:Label ID="lblName" runat="server"></asp:Label></span>.
            </p>
            <p>
                Your User Id is
                <span class="hl"><asp:Label ID="LblLoginId" runat="server"></asp:Label></span>
                and Password is
                <span class="hl"><asp:Label ID="LblPassword" runat="server"></asp:Label></span>.
            </p>
            <a href="index.aspx" class="btn-login">Login</a>

            <asp:Label ID="LblSponsorName" runat="server" style="display:none"></asp:Label>
            <asp:Label ID="LblSponsorId" runat="server" style="display:none"></asp:Label>
        </div>
    </form>
</body>
</html>
