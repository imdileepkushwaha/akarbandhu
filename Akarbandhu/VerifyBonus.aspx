<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VerifyBonus.aspx.cs" Inherits="VerifyBonus" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Verify Coupon / Voucher - AKAR BANDHU PVT LTD</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style type="text/css">
        body { font-family: Georgia, 'Times New Roman', serif; background: linear-gradient(180deg, #e8f2ef, #f7f4ec); margin: 0; padding: 24px; color: #1d2a24; }
        .card { max-width: 520px; margin: 40px auto; background: #fff; border-radius: 12px; padding: 28px; box-shadow: 0 8px 24px rgba(0,0,0,.08); }
        .brand { color: #0d5c4d; font-size: 22px; font-weight: bold; }
        .ok { margin-top: 12px; padding: 10px 12px; background: #e7f6ef; color: #0d5c4d; border-radius: 8px; font-weight: bold; }
        .bad { margin-top: 12px; padding: 10px 12px; background: #fdecea; color: #b42318; border-radius: 8px; font-weight: bold; }
        .row { margin-top: 12px; border-top: 1px solid #eee; padding-top: 12px; }
        .row label { display: block; font-size: 11px; color: #777; text-transform: uppercase; }
        .row span { font-size: 16px; font-weight: bold; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
            <div class="brand">AKAR BANDHU PVT LTD.</div>
            <div>Jeevan Bhumi Bonus Plan – Authenticity Check</div>
            <asp:Panel ID="pnlOk" runat="server" Visible="false">
                <div class="ok">✓ This is a GENUINE document issued by Akar Bandhu Pvt Ltd.</div>
                <div class="row"><label>Type</label><span><asp:Label ID="lblType" runat="server"></asp:Label></span></div>
                <div class="row"><label>Document No</label><span><asp:Label ID="lblDocNo" runat="server"></asp:Label></span></div>
                <div class="row"><label>Associate Id</label><span><asp:Label ID="lblAssociateId" runat="server"></asp:Label></span></div>
                <div class="row"><label>Associate Name</label><span><asp:Label ID="lblAssociateName" runat="server"></asp:Label></span></div>
                <div class="row"><label>Mobile Number</label><span><asp:Label ID="lblMobile" runat="server"></asp:Label></span></div>
                <div class="row"><label>Plot Area</label><span><asp:Label ID="lblPlotArea" runat="server"></asp:Label> SqFt</span></div>
                <div class="row"><label>Plot Amount</label><span>₹ <asp:Label ID="lblPlotAmount" runat="server"></asp:Label></span></div>
                <asp:Panel ID="pnlVoucherExtra" runat="server" Visible="false">
                    <div class="row"><label>Commission</label><span><asp:Label ID="lblCommission" runat="server"></asp:Label>%</span></div>
                    <div class="row"><label>Cashback Amount</label><span>₹ <asp:Label ID="lblCashback" runat="server"></asp:Label></span></div>
                    <div class="row"><label>Voucher Date</label><span><asp:Label ID="lblVoucherDate" runat="server"></asp:Label></span></div>
                </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="pnlBad" runat="server" Visible="false">
                <div class="bad">✗ Document not found. This coupon/voucher is NOT genuine or code is invalid.</div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
