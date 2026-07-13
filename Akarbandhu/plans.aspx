<%@ Page Title="Plans | AKAR BANDHU PVT. LTD." Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="plans.aspx.cs" Inherits="plans" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<section class="plans-hero">
        <div class="plans-hero-bg" aria-hidden="true">
            <div class="plans-hero-grid"></div>
            <div class="plans-hero-glow plans-hero-glow--1"></div>
            <div class="plans-hero-glow plans-hero-glow--2"></div>
        </div>
        <div class="container plans-hero-inner">
            <nav class="plans-breadcrumb reveal-up">
                <a href="index.aspx#home">Home</a>
                <span>/</span>
                <span>Plans</span>
            </nav>
            <div class="plans-hero-content reveal-up">
                <span class="section-tag">Official Plans</span>
                <h1>Business & <span class="gradient-text">Pricing Plans</span></h1>
                <p>11-level reward chart and plot pricing for Dighwara &amp; Greater Patna (Kalyanpur)</p>
            </div>
            <div class="plans-hero-meta reveal-up">
                <span>PAN: AAYCA1383R</span>
                <span>CIN: U45202BR2022PTC059892</span>
                <span>TAN: PTNA09766B</span>
            </div>
        </div>
    </section>

    <section class="plans-section section">
        <div class="container">
            <div class="plans-tabs reveal-up" role="tablist">
                <button type="button" class="plans-tab active" data-tab="rank" role="tab" aria-selected="true">
                    <span class="plans-tab-num">01</span>
                    Rank Chart
                </button>
                <button type="button" class="plans-tab" data-tab="dighwara" role="tab" aria-selected="false">
                    <span class="plans-tab-num">02</span>
                    Dighwara
                </button>
                <button type="button" class="plans-tab" data-tab="kalyanpur" role="tab" aria-selected="false">
                    <span class="plans-tab-num">03</span>
                    Kalyanpur
                </button>
            </div>

            <!-- Rank Chart -->
            <div class="plans-panel active" id="plan-rank" role="tabpanel">
                <div class="plan-card reveal-up">
                    <div class="plan-card-head">
                        <div>
                            <span class="plan-eyebrow">Reward &amp; Rank Promotion</span>
                            <h2>Official Plan Chart — 11 Levels</h2>
                            <p>Cumulative business target model with level-wise rewards</p>
                        </div>
                        <div class="plan-head-badge">11 Levels</div>
                    </div>

                    <div class="plan-rules">
                        <h3>Eligibility Rules for Reward &amp; Rank Promotion</h3>
                        <ul>
                                                        <li>Rank Promotion is based on consecutive business levels.</li>
                                                        <li>To be eligible for Reward at each level, a New Self Sale of a 1200 Sq. Ft Plot is compulsory (Self Sale = plot purchase by rank holder or their direct family).</li>
                                                        <li>This is a cumulative business target model.</li>
                                                    </ul>
                    </div>

                    <div class="plan-table-wrap">
                        <table class="plan-table">
                            <thead>
                                <tr>
                                    <th>Level</th>
                                    <th>Rank Title</th>
                                    <th>Target Business (Cumulative)</th>
                                    <th>Business %</th>
                                    <th>Self Sale</th>
                                    <th>Reward Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                                                <tr>
                                    <td><span class="plan-level-pill">1</span></td>
                                    <td><strong>Trainee</strong></td>
                                    <td>0 to 10 Lakh</td>
                                    <td><span class="plan-pct">6%</span></td>
                                    <td>New 1200 SqFt</td>
                                    <td class="plan-reward">₹10,000</td>
                                </tr>
                                                                <tr>
                                    <td><span class="plan-level-pill">2</span></td>
                                    <td><strong>Associate</strong></td>
                                    <td>10 to 25 Lakh</td>
                                    <td><span class="plan-pct">7%</span></td>
                                    <td>New 1200 SqFt</td>
                                    <td class="plan-reward">₹25,000</td>
                                </tr>
                                                                <tr>
                                    <td><span class="plan-level-pill">3</span></td>
                                    <td><strong>Senior Associate</strong></td>
                                    <td>25 Lakh to 1 Crore</td>
                                    <td><span class="plan-pct">8%</span></td>
                                    <td>New 1200 SqFt</td>
                                    <td class="plan-reward">₹50,000</td>
                                </tr>
                                                                <tr>
                                    <td><span class="plan-level-pill">4</span></td>
                                    <td><strong>Team Leader</strong></td>
                                    <td>1 Crore to 5 Crore</td>
                                    <td><span class="plan-pct">9%</span></td>
                                    <td>New 1200 SqFt</td>
                                    <td class="plan-reward">₹1,00,000</td>
                                </tr>
                                                                <tr>
                                    <td><span class="plan-level-pill">5</span></td>
                                    <td><strong>Manager</strong></td>
                                    <td>5 Cr to 10 Crore</td>
                                    <td><span class="plan-pct">10%</span></td>
                                    <td>New 1200 SqFt</td>
                                    <td class="plan-reward">₹3,00,000</td>
                                </tr>
                                                                <tr>
                                    <td><span class="plan-level-pill">6</span></td>
                                    <td><strong>Senior Manager</strong></td>
                                    <td>10 Crore to 25 Crore</td>
                                    <td><span class="plan-pct">11%</span></td>
                                    <td>New 1200 SqFt</td>
                                    <td class="plan-reward">₹5,00,000</td>
                                </tr>
                                                                <tr>
                                    <td><span class="plan-level-pill">7</span></td>
                                    <td><strong>Zonal Manager</strong></td>
                                    <td>25 Crore to 75 Crore</td>
                                    <td><span class="plan-pct">12%</span></td>
                                    <td>New 1200 SqFt</td>
                                    <td class="plan-reward">₹10,00,000</td>
                                </tr>
                                                                <tr>
                                    <td><span class="plan-level-pill">8</span></td>
                                    <td><strong>Director</strong></td>
                                    <td>75 Crore to 150 Crore</td>
                                    <td><span class="plan-pct">13%</span></td>
                                    <td>New 1200 SqFt</td>
                                    <td class="plan-reward">₹25,00,000</td>
                                </tr>
                                                                <tr>
                                    <td><span class="plan-level-pill">9</span></td>
                                    <td><strong>Regional Director</strong></td>
                                    <td>150 Crore to 300 Crore</td>
                                    <td><span class="plan-pct">14%</span></td>
                                    <td>New 1200 SqFt</td>
                                    <td class="plan-reward">₹50,00,000</td>
                                </tr>
                                                                <tr>
                                    <td><span class="plan-level-pill">10</span></td>
                                    <td><strong>National Director</strong></td>
                                    <td>300 Crore to 700 Crore</td>
                                    <td><span class="plan-pct">15%</span></td>
                                    <td>New 1200 SqFt</td>
                                    <td class="plan-reward">₹1,00,00,000</td>
                                </tr>
                                                                <tr>
                                    <td><span class="plan-level-pill">11</span></td>
                                    <td><strong>International Director</strong></td>
                                    <td>700 Crore to 1500 Crore</td>
                                    <td><span class="plan-pct">16%</span></td>
                                    <td>New 1200 SqFt</td>
                                    <td class="plan-reward">₹2,00,00,000</td>
                                </tr>
                                                            </tbody>
                        </table>
                    </div>
                    <div class="plan-table-foot">End of 11 Levels for Rewards</div>
                </div>
            </div>

            <!-- Pricing projects -->
                        <div class="plans-panel" id="plan-dighwara" role="tabpanel" hidden>
                <div class="plan-card reveal-up">
                    <div class="plan-card-head">
                        <div>
                            <span class="plan-eyebrow">Price &amp; Calculations</span>
                            <h2>Dighwara</h2>
                            <p>PROJECT: DIGHWARA — Price &amp; Calculations</p>
                        </div>
                        <div class="plan-head-badge plan-head-badge--alt">Dighwara</div>
                    </div>

                    <!-- Plan A -->
                    <div class="plan-block">
                        <div class="plan-block-bar">
                            <strong>Plan A: One-Time Registry Plan</strong>
                            <span>₹1,000 / Sq. Ft.</span>
                        </div>
                        <div class="plan-table-wrap">
                            <table class="plan-table plan-table--price">
                                <thead>
                                    <tr>
                                        <th>Plot Size</th>
                                        <th>Rate / Sq.Ft.</th>
                                        <th>Total Plot Cost</th>
                                        <th>Booking Amount</th>
                                        <th>Agreement</th>
                                        <th>Registry Status</th>
                                        <th>Remarks</th>
                                    </tr>
                                </thead>
                                <tbody>
                                                                        <tr>
                                        <td><strong>600 Sq.Ft.</strong></td>
                                        <td>₹1,000</td>
                                        <td class="plan-reward">₹6,00,000</td>
                                        <td>Immediate full payment</td>
                                        <td>Included</td>
                                        <td><span class="plan-status-ok">Eligible for Registry</span></td>
                                        <td>Best Discounted Price</td>
                                    </tr>
                                                                        <tr>
                                        <td><strong>1200 Sq.Ft.</strong></td>
                                        <td>₹1,000</td>
                                        <td class="plan-reward">₹12,00,000</td>
                                        <td>Immediate full payment</td>
                                        <td>Included</td>
                                        <td><span class="plan-status-ok">Eligible for Registry</span></td>
                                        <td>Best Discounted Price</td>
                                    </tr>
                                                                        <tr>
                                        <td><strong>1800 Sq.Ft.</strong></td>
                                        <td>₹1,000</td>
                                        <td class="plan-reward">₹18,00,000</td>
                                        <td>Immediate full payment</td>
                                        <td>Included</td>
                                        <td><span class="plan-status-ok">Eligible for Registry</span></td>
                                        <td>Best Discounted Price</td>
                                    </tr>
                                                                    </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Plan B -->
                    <div class="plan-block">
                        <div class="plan-block-bar plan-block-bar--emi">
                            <strong>Plan B: EMI Plan</strong>
                            <span>₹1,100 / Sq. Ft. · 50 Months EMI</span>
                        </div>
                        <div class="plan-table-wrap">
                            <table class="plan-table plan-table--price">
                                <thead>
                                    <tr>
                                        <th>Plot Size</th>
                                        <th>Rate / Sq.Ft.</th>
                                        <th>Total Cost</th>
                                        <th>Booking (20%)</th>
                                        <th>Agreement (20%)</th>
                                        <th>Down Payment (40%)</th>
                                        <th>Monthly EMI (50 Mos)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                                                        <tr>
                                        <td><strong>600 Sq.Ft.</strong></td>
                                        <td>₹1,100</td>
                                        <td class="plan-reward">₹6,60,000</td>
                                        <td>₹1,32,000</td>
                                        <td>₹1,32,000</td>
                                        <td><strong>₹2,64,000</strong></td>
                                        <td class="plan-emi">₹7,920</td>
                                    </tr>
                                                                        <tr>
                                        <td><strong>1200 Sq.Ft.</strong></td>
                                        <td>₹1,100</td>
                                        <td class="plan-reward">₹13,20,000</td>
                                        <td>₹2,64,000</td>
                                        <td>₹2,64,000</td>
                                        <td><strong>₹5,28,000</strong></td>
                                        <td class="plan-emi">₹15,840</td>
                                    </tr>
                                                                        <tr>
                                        <td><strong>1800 Sq.Ft.</strong></td>
                                        <td>₹1,100</td>
                                        <td class="plan-reward">₹19,80,000</td>
                                        <td>₹3,96,000</td>
                                        <td>₹3,96,000</td>
                                        <td><strong>₹7,92,000</strong></td>
                                        <td class="plan-emi">₹23,760</td>
                                    </tr>
                                                                    </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="plan-notes">
                        <h3>Important Notes</h3>
                        <ul>
                                                        <li>Registration eligibility for Plan A is immediate. For Plan B, registration follows the 50-month EMI period.</li>
                                                        <li>Prices are subject to change without prior notice.</li>
                                                    </ul>
                    </div>

                    <div class="plan-company-strip">
                        <span>AKAR BANDHU PVT. LTD.</span>
                        <span>PAN: AAYCA1383R</span>
                        <span>CIN: U45202BR2022PTC059892</span>
                        <span>TAN: PTNA09766B</span>
                    </div>
                </div>
            </div>
                        <div class="plans-panel" id="plan-kalyanpur" role="tabpanel" hidden>
                <div class="plan-card reveal-up">
                    <div class="plan-card-head">
                        <div>
                            <span class="plan-eyebrow">Price &amp; Calculations</span>
                            <h2>Greater Patna (Kalyanpur)</h2>
                            <p>PROJECT: GREATER PATNA (KALYANPUR) — Price &amp; Calculations</p>
                        </div>
                        <div class="plan-head-badge plan-head-badge--alt">Greater Patna (Kalyanpur)</div>
                    </div>

                    <!-- Plan A -->
                    <div class="plan-block">
                        <div class="plan-block-bar">
                            <strong>Plan A: One-Time Registry Plan</strong>
                            <span>₹900 / Sq. Ft.</span>
                        </div>
                        <div class="plan-table-wrap">
                            <table class="plan-table plan-table--price">
                                <thead>
                                    <tr>
                                        <th>Plot Size</th>
                                        <th>Rate / Sq.Ft.</th>
                                        <th>Total Plot Cost</th>
                                        <th>Booking Amount</th>
                                        <th>Agreement</th>
                                        <th>Registry Status</th>
                                        <th>Remarks</th>
                                    </tr>
                                </thead>
                                <tbody>
                                                                        <tr>
                                        <td><strong>600 Sq.Ft.</strong></td>
                                        <td>₹900</td>
                                        <td class="plan-reward">₹5,40,000</td>
                                        <td>Immediate full payment</td>
                                        <td>Included</td>
                                        <td><span class="plan-status-ok">Eligible for Registry</span></td>
                                        <td>Best Discounted Price</td>
                                    </tr>
                                                                        <tr>
                                        <td><strong>1200 Sq.Ft.</strong></td>
                                        <td>₹900</td>
                                        <td class="plan-reward">₹10,80,000</td>
                                        <td>Immediate full payment</td>
                                        <td>Included</td>
                                        <td><span class="plan-status-ok">Eligible for Registry</span></td>
                                        <td>Best Discounted Price</td>
                                    </tr>
                                                                        <tr>
                                        <td><strong>1800 Sq.Ft.</strong></td>
                                        <td>₹900</td>
                                        <td class="plan-reward">₹16,20,000</td>
                                        <td>Immediate full payment</td>
                                        <td>Included</td>
                                        <td><span class="plan-status-ok">Eligible for Registry</span></td>
                                        <td>Best Discounted Price</td>
                                    </tr>
                                                                    </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Plan B -->
                    <div class="plan-block">
                        <div class="plan-block-bar plan-block-bar--emi">
                            <strong>Plan B: EMI Plan</strong>
                            <span>₹1,000 / Sq. Ft. · 50 Months EMI</span>
                        </div>
                        <div class="plan-table-wrap">
                            <table class="plan-table plan-table--price">
                                <thead>
                                    <tr>
                                        <th>Plot Size</th>
                                        <th>Rate / Sq.Ft.</th>
                                        <th>Total Cost</th>
                                        <th>Booking (20%)</th>
                                        <th>Agreement (20%)</th>
                                        <th>Down Payment (40%)</th>
                                        <th>Monthly EMI (50 Mos)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                                                        <tr>
                                        <td><strong>600 Sq.Ft.</strong></td>
                                        <td>₹1,000</td>
                                        <td class="plan-reward">₹6,00,000</td>
                                        <td>₹1,20,000</td>
                                        <td>₹1,20,000</td>
                                        <td><strong>₹2,40,000</strong></td>
                                        <td class="plan-emi">₹7,200</td>
                                    </tr>
                                                                        <tr>
                                        <td><strong>1200 Sq.Ft.</strong></td>
                                        <td>₹1,000</td>
                                        <td class="plan-reward">₹12,00,000</td>
                                        <td>₹2,40,000</td>
                                        <td>₹2,40,000</td>
                                        <td><strong>₹4,80,000</strong></td>
                                        <td class="plan-emi">₹14,400</td>
                                    </tr>
                                                                        <tr>
                                        <td><strong>1800 Sq.Ft.</strong></td>
                                        <td>₹1,000</td>
                                        <td class="plan-reward">₹18,00,000</td>
                                        <td>₹3,60,000</td>
                                        <td>₹3,60,000</td>
                                        <td><strong>₹7,20,000</strong></td>
                                        <td class="plan-emi">₹21,600</td>
                                    </tr>
                                                                    </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="plan-notes">
                        <h3>Important Notes</h3>
                        <ul>
                                                        <li>Registration eligibility for Plan A is immediate. For Plan B, registration follows the 50-month EMI period.</li>
                                                        <li>Prices are subject to change without prior notice.</li>
                                                    </ul>
                    </div>

                    <div class="plan-company-strip">
                        <span>AKAR BANDHU PVT. LTD.</span>
                        <span>PAN: AAYCA1383R</span>
                        <span>CIN: U45202BR2022PTC059892</span>
                        <span>TAN: PTNA09766B</span>
                    </div>
                </div>
            </div>
            
            <div class="plans-cta reveal-up">
                <div class="plans-cta-inner">
                    <div>
                        <h3>Interested in a plot or partnership?</h3>
                        <p>Talk to our team for booking, EMI options, or rank plan guidance.</p>
                    </div>
                    <a href="index.aspx#contact" class="btn btn-primary">
                        Contact Us
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
                    </a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>