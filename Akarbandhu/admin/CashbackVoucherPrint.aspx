<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CashbackVoucherPrint.aspx.cs" Inherits="admin_CashbackVoucherPrint" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Jeevan Bhumi Cashback Vouchers - AKAR BANDHU PVT LTD</title>
    <style type="text/css">
        body { font-family: Georgia, 'Times New Roman', serif; background: #f4f1ea; margin: 0; padding: 20px; color: #222; }
        h1 { text-align: center; font-size: 22px; margin-bottom: 4px; }
        h2 { text-align: center; font-size: 14px; font-weight: normal; margin-top: 0; color: #555; }
        .voucher {
            max-width: 780px; margin: 0 auto 18px; background: #fff;
            border: 2px solid #0d5c4d; border-radius: 10px; padding: 18px 20px;
            page-break-inside: avoid; position: relative;
        }
        .voucher .head { display: flex; justify-content: space-between; align-items: flex-start; gap: 16px; }
        .brand { color: #0d5c4d; font-weight: bold; font-size: 18px; }
        .plan { font-size: 12px; color: #666; }
        .badge { background: #c45c26; color: #fff; padding: 4px 10px; border-radius: 4px; font-size: 12px; }
        .grid { display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 10px; margin-top: 14px; }
        .grid div label { display: block; font-size: 11px; color: #777; text-transform: uppercase; }
        .grid div span { font-size: 14px; font-weight: bold; }
        .amount { margin-top: 12px; font-size: 20px; color: #0d5c4d; font-weight: bold; }
        .qr { text-align: center; }
        .qr img { width: 100px; height: 100px; }
        .qr small { display: block; font-size: 10px; color: #666; }
        .actions { text-align: center; margin-bottom: 16px; }
        .actions button { padding: 8px 18px; margin: 0 6px; cursor: pointer; }
        @media print {
            body { background: #fff; padding: 0; }
            .actions { display: none; }
            .voucher { box-shadow: none; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="actions">
            <button type="button" onclick="window.print();">Print All</button>
            <button type="button" onclick="window.close();">Close</button>
        </div>
        <h1>AKAR BANDHU PVT LTD.</h1>
        <h2>Jeevan Bhumi Bonus Plan · Cashback Vouchers (8)</h2>
        <asp:Repeater ID="rptVouchers" runat="server">
            <ItemTemplate>
                <div class="voucher">
                    <div class="head">
                        <div>
                            <div class="brand">Genuine Cashback Voucher</div>
                            <div class="plan">Voucher No: <%# Eval("VoucherNo") %> · Seq <%# Eval("VoucherNo_Seq") %>/8</div>
                        </div>
                        <div class="badge"><%# Eval("CommissionPercent") %>% Cashback</div>
                        <div class="qr">
                            <img src='<%# QRHelper.GetQrImageUrl(Convert.ToString(Eval("QRText")), 100) %>' alt="QR" />
                            <small>Scan to verify</small>
                        </div>
                    </div>
                    <div class="grid">
                        <div><label>Associate Id</label><span><%# Eval("AssociateId") %></span></div>
                        <div><label>Associate Name</label><span><%# Eval("AssociateName") %></span></div>
                        <div><label>Mobile</label><span><%# Eval("AssociateMobile") %></span></div>
                        <div><label>User Id</label><span><%# Eval("UserId") %></span></div>
                        <div><label>User Name</label><span><%# Eval("UserName") %></span></div>
                        <div><label>Booking Date</label><span><%# Eval("BookingDateText") %></span></div>
                        <div><label>Plot Area</label><span><%# Eval("PlotArea") %> SqFt</span></div>
                        <div><label>Plot Amount</label><span>₹ <%# Eval("PlotAmount") %></span></div>
                        <div><label>Voucher Date</label><span><%# Eval("VoucherDateText") %></span></div>
                    </div>
                    <div class="amount">Cashback Commission: ₹ <%# Eval("CashbackAmount") %></div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
