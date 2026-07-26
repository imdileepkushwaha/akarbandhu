<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CouponPrint.aspx.cs" Inherits="admin_CouponPrint" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Jeevan Bhumi Coupon - AKAR BANDHU PVT LTD</title>
    <style type="text/css">
        body { font-family: Georgia, 'Times New Roman', serif; background: #f3f0e8; margin: 0; padding: 24px; color: #1f2a24; }
        .coupon {
            max-width: 720px; margin: 0 auto; background: linear-gradient(135deg, #0d5c4d 0%, #147a66 45%, #1f8f78 100%);
            color: #fff; border-radius: 12px; padding: 28px; box-shadow: 0 10px 30px rgba(0,0,0,.18);
            position: relative; overflow: hidden;
        }
        .coupon:before {
            content: ''; position: absolute; right: -40px; top: -40px; width: 180px; height: 180px;
            background: rgba(255,255,255,.08); border-radius: 50%;
        }
        .brand { font-size: 22px; letter-spacing: 1px; font-weight: bold; }
        .plan { font-size: 14px; opacity: .9; margin-top: 4px; }
        .title { font-size: 28px; margin: 18px 0 8px; }
        .meta { display: flex; gap: 20px; flex-wrap: wrap; margin-top: 18px; }
        .meta div { background: rgba(0,0,0,.15); padding: 10px 14px; border-radius: 8px; min-width: 180px; }
        .meta label { display: block; font-size: 11px; opacity: .8; text-transform: uppercase; }
        .meta span { font-size: 16px; font-weight: bold; }
        .qr-wrap { position: absolute; right: 24px; bottom: 24px; background: #fff; padding: 8px; border-radius: 8px; text-align: center; }
        .qr-wrap img { display: block; width: 120px; height: 120px; }
        .qr-wrap small { display: block; color: #333; font-size: 10px; margin-top: 4px; }
        .actions { max-width: 720px; margin: 16px auto 0; text-align: center; }
        .actions button { padding: 8px 18px; margin: 0 6px; cursor: pointer; }
        @media print {
            body { background: #fff; padding: 0; }
            .actions { display: none; }
            .coupon { box-shadow: none; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="pnlCoupon" runat="server" Visible="false">
            <div class="coupon">
                <div class="brand">AKAR BANDHU PVT LTD.</div>
                <div class="plan">JEEVAN BHUMI BONUS PLAN · IMMEDIATE COUPON RELEASE</div>
                <div class="title">Genuine Purchase Coupon</div>
                <div>Coupon No: <asp:Label ID="lblCouponNo" runat="server" Font-Bold="true"></asp:Label></div>
                <div class="meta">
                    <div><label>Associate Id</label><span><asp:Label ID="lblAssociateId" runat="server"></asp:Label></span></div>
                    <div><label>Associate Name</label><span><asp:Label ID="lblAssociateName" runat="server"></asp:Label></span></div>
                    <div><label>Mobile Number</label><span><asp:Label ID="lblMobile" runat="server"></asp:Label></span></div>
                    <div><label>User Id / Name</label><span><asp:Label ID="lblUser" runat="server"></asp:Label></span></div>
                    <div><label>Plot Area</label><span><asp:Label ID="lblPlotArea" runat="server"></asp:Label> SqFt</span></div>
                    <div><label>Plot Amount</label><span>₹ <asp:Label ID="lblPlotAmount" runat="server"></asp:Label></span></div>
                    <div><label>Booking Date</label><span><asp:Label ID="lblBookingDate" runat="server"></asp:Label></span></div>
                    <div><label>Coupon Amount</label><span>₹ <asp:Label ID="lblCouponAmount" runat="server"></asp:Label></span></div>
                </div>
                <div class="qr-wrap">
                    <asp:Image ID="imgQR" runat="server" />
                    <small>Scan to verify genuineness</small>
                </div>
            </div>
            <div class="actions">
                <button type="button" onclick="window.print();">Print</button>
                <button type="button" onclick="window.close();">Close</button>
            </div>
        </asp:Panel>
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
