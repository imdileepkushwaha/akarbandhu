<%@ Page Title="AKAR BANDHU PVT. LTD. | Infrastructure & Construction" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Hero -->
    <section class="hero" id="home">
        <div class="hero-bg">
            <div class="hero-slider" id="heroSlider" aria-hidden="true">
                                <div class="hero-slide active"
                     style="background-image: url('assets/images/home2-slide1.jpg')"
                     data-index="0"></div>
                                <div class="hero-slide"
                     style="background-image: url('assets/images/home2-slide2.jpg')"
                     data-index="1"></div>
                            </div>
            <div class="hero-overlay"></div>
            <div class="hero-grid"></div>
            <div class="hero-orb hero-orb-1"></div>
            <div class="hero-orb hero-orb-2"></div>
            <div class="hero-particles" id="particles"></div>
            <div class="hero-slider-dots" id="heroSliderDots">
                                <button type="button" class="hero-dot active" data-slide="0" aria-label="Slide 1"></button>
                                <button type="button" class="hero-dot" data-slide="1" aria-label="Slide 2"></button>
                            </div>
        </div>

        <div class="container hero-layout">
            <div class="hero-content">
                <div class="hero-badge reveal-up">
                    <span class="pulse-dot"></span>
                    <span>ESTD 2022 - Patna, Bihar</span>
                    <span class="badge-divider"></span>
                    <span class="badge-tag">Govt. Registered</span>
                </div>

                <h1 class="hero-title reveal-up" data-delay="100">
                    Building Bihar's
                    <span class="hero-title-accent">
                        <span class="gradient-text">Infrastructure</span>
                        <svg class="title-underline" viewBox="0 0 300 12" fill="none"><path d="M2 8C50 2 100 2 150 6C200 10 250 4 298 8" stroke="url(#lineGrad)" stroke-width="3" stroke-linecap="round"/><defs><linearGradient id="lineGrad" x1="0" y1="0" x2="300" y2="0"><stop stop-color="#3b82f6"/><stop offset="1" stop-color="#d4a853"/></linearGradient></defs></svg>
                    </span>
                    Future
                </h1>

                <p class="hero-hindi reveal-up" data-delay="150">निर्माण · विकास · समर्पण</p>

                <p class="hero-subtitle reveal-up" data-delay="200">
                    Building Bihar's Future - Infrastructure, Construction & Beyond - Government construction, material supply,
                    railway contracts & real estate across Bihar.
                </p>

                <div class="hero-chips reveal-up" data-delay="250">
                    <span class="hero-chip">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                        Govt. Projects
                    </span>
                    <span class="hero-chip">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="6" width="20" height="12" rx="2"/><path d="M6 12h.01M10 12h.01M14 12h.01M18 12h.01"/></svg>
                        Infrastructure
                    </span>
                    <span class="hero-chip">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M12 6v6l4 2"/></svg>
                        Since 2022                    </span>
                </div>

                <div class="hero-actions reveal-up" data-delay="300">
                    <a href="#projects" class="btn btn-primary">
                        Explore Projects
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
                    </a>
                    <a href="#about" class="btn btn-glass">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><polygon points="10 8 16 12 10 16 10 8"/></svg>
                        About Us
                    </a>
                </div>
            </div>

            <div class="hero-visual reveal-right" data-delay="200">
                <div class="hero-card hero-card-main">
                    <div class="hero-card-header">
                        <span class="hero-card-dot"></span>
                        <span>Live Project</span>
                    </div>
                    <h3>Sherpur-Dighwara Ganga Bridge</h3>
                    <p>6-Lane Cable-Stayed Bridge · NH-131G</p>
                    <div class="hero-progress">
                        <div class="hero-progress-info">
                            <span>Construction Progress</span>
                            <strong>60%</strong>
                        </div>
                        <div class="hero-progress-bar">
                            <div class="hero-progress-fill"></div>
                        </div>
                    </div>
                </div>

                <div class="hero-stats-grid">
                    <div class="hero-stat-card reveal-up" data-delay="350">
                        <span class="stat-num" data-count="4">0</span>
                        <span class="stat-label">Core Services</span>
                    </div>
                    <div class="hero-stat-card reveal-up" data-delay="400">
                        <span class="stat-num" data-count="3200">0</span>
                        <span class="stat-label">Cr+ Investment</span>
                    </div>
                    <div class="hero-stat-card reveal-up" data-delay="450">
                        <span class="stat-num" data-count="14.52">0</span>
                        <span class="stat-label">km Bridge</span>
                    </div>
                    <div class="hero-stat-card accent reveal-up" data-delay="500">
                        <div class="stat-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/><circle cx="12" cy="10" r="3"/></svg>
                        </div>
                        <span class="stat-label">Patna, Bihar</span>
                    </div>
                </div>

                <div class="hero-float-badge">
                    <span class="logo-a">A</span><span class="logo-b">B</span>
                    <div>
                        <strong>AKAR BANDHU PVT. LTD.</strong>
                        <small>CIN: <%= Server.HtmlEncode(((SiteMaster)Master).Settings.Cin) %></small>
                    </div>
                </div>
            </div>
        </div>

        <div class="hero-scroll">
            <div class="scroll-indicator">
                <div class="scroll-mouse">
                    <div class="scroll-wheel"></div>
                </div>
                <span>Scroll to explore</span>
            </div>
        </div>
    </section>

    <!-- Leadership -->
    <section class="section about" id="about">
        <div class="about-deco"></div>
        <div class="container">
            <div class="about-header reveal-up">
                <span class="section-tag">About Us</span>
                <h2>Our <span class="gradient-text">Leadership</span></h2>
                <p>Guiding excellence in construction, infrastructure and real estate</p>
            </div>

            <div class="about-layout">
                <div class="about-leaders-col reveal-up" data-delay="80">
                    <article class="leader-block">
                        <div class="leader-block-photo">
                            <img src="assets/images/md-photo.png"
                                 alt="Mr. ALOK KUMAR SINHA - Founder &amp; CMD">
                            <span class="leader-block-ribbon">CMD &amp; Founder</span>
                        </div>
                        <div class="leader-block-copy">
                            <span class="leader-eyebrow">Founder &amp; Chairman</span>
                            <h3>Mr. ALOK KUMAR SINHA</h3>
                            <p class="leader-subtitle">ALOK KUMAR · ESTD 2022 · Patna, Bihar</p>
                            <p class="leader-para">
                                As Founder &amp; CMD of AKAR BANDHU PVT. LTD., Mr. Alok Kumar Sinha leads with a clear vision for quality infrastructure and transparent growth across Bihar.
                            </p>
                        </div>
                    </article>

                    <article class="leader-block">
                        <div class="leader-block-photo">
                            <img src="assets/images/barjesh-kumar-singh.png"
                                 alt="Barjesh Kumar Singh - Managing Director, Akar Bandhu">
                            <span class="leader-block-ribbon">MD</span>
                        </div>
                        <div class="leader-block-copy">
                            <span class="leader-eyebrow">Managing Director</span>
                            <h3>Barjesh Kumar Singh</h3>
                            <p class="leader-subtitle">MD · Since 2003 · Patna, Bihar</p>
                            <p class="leader-para">
                                <strong>Barjesh Kumar Singh</strong>, Managing Director of AKAR BANDHU PVT. LTD., is a trusted name in the construction and real estate sector.
                                With over two decades of excellence (since 2003), we specialize in delivering high-quality construction,
                                government infrastructure projects, and reliable material supply services.
                                Our work is defined by precision, durability, and a commitment to building long-term value.
                            </p>
                        </div>
                    </article>
                </div>

                <aside class="about-highlights-col reveal-up" data-delay="160">
                    <div class="about-highlights about-highlights--row">
                        <div class="about-highlight">
                            <span class="highlight-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 21h18M5 21V7l8-4v18M19 21V11l-6-4"/></svg>
                            </span>
                            <div>
                                <strong>High-Quality Construction</strong>
                                <span>Precision-built residential &amp; commercial work</span>
                            </div>
                        </div>
                        <div class="about-highlight">
                            <span class="highlight-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                            </span>
                            <div>
                                <strong>Government Infrastructure</strong>
                                <span>Projects delivered to standard specs &amp; timelines</span>
                            </div>
                        </div>
                        <div class="about-highlight">
                            <span class="highlight-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="1" y="3" width="15" height="13"/><polygon points="16 8 20 8 23 11 23 16 16 16 16 8"/><circle cx="5.5" cy="18.5" r="2.5"/><circle cx="18.5" cy="18.5" r="2.5"/></svg>
                            </span>
                            <div>
                                <strong>Material Supply</strong>
                                <span>Reliable, timely supply of high-grade materials</span>
                            </div>
                        </div>
                    </div>
                    <a href="#contact" class="about-cta">
                        Work With Us
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
                    </a>
                </aside>
            </div>
        </div>
    </section>

    <!-- Vision -->
    <section class="section vision" id="vision">
        <div class="vision-glow vision-glow--left" aria-hidden="true"></div>
        <div class="vision-glow vision-glow--right" aria-hidden="true"></div>
        <div class="container">
            <div class="vision-panel reveal-up">
                <div class="vision-panel-top">
                    <span class="section-tag section-tag--light">Our Vision</span>
                    <h2 class="vision-headline">
                        We do not just build structures;<br />
                        <span class="gradient-text">we build trust.</span>
                    </h2>
                </div>

                <p class="vision-lead">
                    Our blend of experience in government-regulated projects and modern private-sector development
                    has established us as a market leader. We remain dedicated to achieving excellence in every
                    project we undertake.
                </p>

                <div class="vision-pillars">
                    <div class="vision-pillar">
                        <span class="vision-pillar-num">01</span>
                        <h3>Trust</h3>
                        <p>Every project is built on transparency, accountability and lasting relationships.</p>
                    </div>
                    <div class="vision-pillar">
                        <span class="vision-pillar-num">02</span>
                        <h3>Experience</h3>
                        <p>Proven strength across government-regulated and private-sector development.</p>
                    </div>
                    <div class="vision-pillar">
                        <span class="vision-pillar-num">03</span>
                        <h3>Excellence</h3>
                        <p>Dedicated to delivering quality outcomes in every project we undertake.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Why Partner -->
    <section class="section why-partner" id="why-partner">
        <div class="container">
            <div class="about-header reveal-up">
                <span class="section-tag">Partnership</span>
                <h2>Why Partner <span class="gradient-text">With Us?</span></h2>
                <p>Four reasons clients choose AKAR BANDHU for lasting construction partnerships</p>
            </div>

            <div class="why-partner-grid">
                <article class="why-card reveal-up" data-delay="0">
                    <div class="why-card-top">
                        <span class="why-card-num">01</span>
                        <div class="why-card-icon" aria-hidden="true">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/>
                            </svg>
                        </div>
                    </div>
                    <h3>Extensive Experience <span>(2003–2026)</span></h3>
                    <p>Over 23 years of proven expertise and industry knowledge.</p>
                </article>

                <article class="why-card reveal-up" data-delay="70">
                    <div class="why-card-top">
                        <span class="why-card-num">02</span>
                        <div class="why-card-icon" aria-hidden="true">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                            </svg>
                        </div>
                    </div>
                    <h3>Quality Assurance</h3>
                    <p>We use only premium-quality materials and employ skilled labor to ensure superior results.</p>
                </article>

                <article class="why-card reveal-up" data-delay="140">
                    <div class="why-card-top">
                        <span class="why-card-num">03</span>
                        <div class="why-card-icon" aria-hidden="true">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M5 12h14M12 5l7 7-7 7"/>
                            </svg>
                        </div>
                    </div>
                    <h3>Timely Execution</h3>
                    <p>Meeting project deadlines is our priority, ensuring cost-effectiveness and efficiency for our clients.</p>
                </article>

                <article class="why-card reveal-up" data-delay="210">
                    <div class="why-card-top">
                        <span class="why-card-num">04</span>
                        <div class="why-card-icon" aria-hidden="true">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87M16 3.13a4 4 0 010 7.75"/>
                            </svg>
                        </div>
                    </div>
                    <h3>Integrity &amp; Trust</h3>
                    <p>We believe in complete transparency, maintaining honest and professional relationships with all our clients and stakeholders.</p>
                </article>
            </div>
        </div>
    </section>

    <!-- Services -->
    <section class="section services" id="services">
        <div class="services-deco"></div>
        <div class="container">
            <div class="services-top reveal-up">
                <div class="services-intro">
                    <span class="section-tag">What We Do</span>
                    <h2>Core <span class="gradient-text">Services</span></h2>
                    <p>We provide comprehensive, end-to-end solutions for all construction needs.</p>
                </div>
                <div class="services-highlight">
                    <div class="services-highlight-num">
                        <span class="gradient-text">04</span>
                    </div>
                    <span>Core Services</span>
                    <small>Govt. · Real Estate · Construction · Materials</small>
                </div>
            </div>

            <div class="services-bento">
                <div class="service-card featured reveal-up" data-delay="0" style="--accent: #2563eb">
                    <div class="service-card-bg"></div>
                    <div class="service-card-top">
                        <span class="service-num">01</span>
                        <div class="service-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M3 21h18M5 21V7l8-4v18M19 21V11l-6-4"/><path d="M9 9v.01M9 12v.01M9 15v.01M9 18v.01"/>
                            </svg>
                        </div>
                    </div>
                    <h3>Government Infrastructure</h3>
                    <p>Expertise in the construction of government buildings and public infrastructure, strictly adhering to standard specifications and timelines.</p>
                    <div class="service-card-foot">
                        <span class="service-tag">AKAR BANDHU</span>
                        <span class="service-arrow">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
                        </span>
                    </div>
                </div>
                <div class="service-card reveal-up" data-delay="70" style="--accent: #c9952e">
                    <div class="service-card-bg"></div>
                    <div class="service-card-top">
                        <span class="service-num">02</span>
                        <div class="service-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="4" y="2" width="16" height="20" rx="2"/><path d="M9 22v-4h6v4M8 6h.01M16 6h.01M12 6h.01M8 10h.01M16 10h.01M12 10h.01M8 14h.01M16 14h.01M12 14h.01"/>
                            </svg>
                        </div>
                    </div>
                    <h3>Real Estate Development</h3>
                    <p>Professional planning and development of residential and commercial properties.</p>
                    <div class="service-card-foot">
                        <span class="service-tag">AKAR BANDHU</span>
                        <span class="service-arrow">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
                        </span>
                    </div>
                </div>
                <div class="service-card reveal-up" data-delay="140" style="--accent: #16a34a">
                    <div class="service-card-bg"></div>
                    <div class="service-card-top">
                        <span class="service-num">03</span>
                        <div class="service-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M3 21h18"/><path d="M5 21V10l7-5 7 5v11"/><path d="M9 21v-6h6v6"/><path d="M9 10h.01M15 10h.01"/>
                            </svg>
                        </div>
                    </div>
                    <h3>Building Construction</h3>
                    <p>Delivering modern, robust residential and commercial structures with a focus on structural integrity.</p>
                    <div class="service-card-foot">
                        <span class="service-tag">AKAR BANDHU</span>
                        <span class="service-arrow">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
                        </span>
                    </div>
                </div>
                <div class="service-card featured reveal-up" data-delay="210" style="--accent: #0891b2">
                    <div class="service-card-bg"></div>
                    <div class="service-card-top">
                        <span class="service-num">04</span>
                        <div class="service-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="1" y="3" width="15" height="13"/><polygon points="16 8 20 8 23 11 23 16 16 16 16 8"/><circle cx="5.5" cy="18.5" r="2.5"/><circle cx="18.5" cy="18.5" r="2.5"/>
                            </svg>
                        </div>
                    </div>
                    <h3>Material Supply</h3>
                    <p>Reliable and timely supply of high-grade construction materials (cement, steel, aggregates, etc.) to ensure seamless project execution.</p>
                    <div class="service-card-foot">
                        <span class="service-tag">AKAR BANDHU</span>
                        <span class="service-arrow">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Projects -->
    <section class="section projects" id="projects">
        <div class="projects-deco"></div>
        <div class="container">
            <div class="section-header reveal-up">
                <span class="section-tag" id="projectSectionTag">Infrastructure</span>
                <h2 class="hindi-title" id="projectSectionTitle">शेरपुर-दिघवारा गंगा ब्रिज प्रोजेक्ट</h2>
                <p id="projectSectionDesc">Sherpur-Dighwara Ganga Bridge & Major Infrastructure Projects - Patna, Bihar</p>
            </div>

            <div class="project-slider-wrap reveal-up">
                <div class="project-slider-controls">
                    <button type="button" class="project-nav-btn" id="projectPrev" aria-label="Previous project">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M15 18l-6-6 6-6"/></svg>
                    </button>
                    <span class="project-slider-count" id="projectSliderCount">1 / 2</span>
                    <button type="button" class="project-nav-btn" id="projectNext" aria-label="Next project">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 18l6-6-6-6"/></svg>
                    </button>
                </div>

                <div class="project-slider-viewport">
                    <div class="project-slider-track" id="projectSliderTrack">
                                                <article class="project-slide" data-index="0"
                                 data-tag="Infrastructure"
                                 data-title="शेरपुर-दिघवारा गंगा ब्रिज प्रोजेक्ट"
                                 data-desc="Sherpur-Dighwara Ganga Bridge &amp; Major Infrastructure Projects - Patna, Bihar">
                            <div class="project-feature">
                                <div class="project-feature-top">
                                                                        <div class="project-feature-info">
                                        <div class="status-badge status-ongoing">
                                            <span class="pulse-dot"></span> निर्माणाधीन - Under Construction                                        </div>
                                        <h3>Sherpur-Dighwara 6-Lane Ganga Bridge</h3>
                                        <p class="project-nh">Patna Ring Road · NH-131G · Cable-Stayed Design</p>
                                        <p class="project-desc">A landmark bridge spanning the Ganges River, connecting AIIMS Patna to Dighwara via Sherpur - transforming connectivity across the Patna region.</p>
                                    </div>
                                    <div class="project-route-card">
                                        <span class="route-label">Route Connectivity</span>
                                        <div class="route-timeline">
                                                                                                                                    <div class="route-stop">
                                                <span class="route-dot start"></span>
                                                <div>
                                                    <strong>AIIMS Patna</strong>
                                                    <small>Starting Point</small>
                                                </div>
                                            </div>
                                                                                                                                    <div class="route-line"></div>
                                                                                        <div class="route-stop">
                                                <span class="route-dot "></span>
                                                <div>
                                                    <strong>Digha</strong>
                                                    <small>River Bank</small>
                                                </div>
                                            </div>
                                                                                                                                    <div class="route-line bridge"></div>
                                                                                        <div class="route-stop">
                                                <span class="route-dot end"></span>
                                                <div>
                                                    <strong>Dighwara</strong>
                                                    <small>~43.3 km Total</small>
                                                </div>
                                            </div>
                                                                                    </div>
                                    </div>
                                                                    </div>

                                <div class="bridge-stats-row">
                                                                        <div class="bridge-stat-pill">
                                        <span class="bridge-stat-value">
                                                                                        <span class="counter" data-target="14.52">0</span>
                                                                                        <small>km</small>
                                        </span>
                                        <span class="bridge-stat-label">Bridge Length</span>
                                    </div>
                                                                        <div class="bridge-stat-pill">
                                        <span class="bridge-stat-value">
                                                                                        <span class="counter" data-target="3200">0</span>
                                                                                        <small>Cr</small>
                                        </span>
                                        <span class="bridge-stat-label">Project Cost (₹)</span>
                                    </div>
                                                                        <div class="bridge-stat-pill">
                                        <span class="bridge-stat-value">
                                                                                        <span class="counter" data-target="43.3">0</span>
                                                                                        <small>km</small>
                                        </span>
                                        <span class="bridge-stat-label">AIIMS Patna → Dighwara</span>
                                    </div>
                                                                        <div class="bridge-stat-pill">
                                        <span class="bridge-stat-value">
                                                                                        <span class="counter" data-target="6">0</span>
                                                                                        <small>Lane</small>
                                        </span>
                                        <span class="bridge-stat-label">Ganga Bridge</span>
                                    </div>
                                                                    </div>
                            </div>
                        </article>
                                                <article class="project-slide" data-index="1"
                                 data-tag="Real Estate"
                                 data-title="कल्याणपुर पैपुरा - मुख्य विकास"
                                 data-desc="Kalyanpur Paipura Main Development · Local Growth Corridor - Patna, Bihar">
                            <div class="project-feature">
                                <div class="project-feature-top project-feature-top--gallery">
                                                                        <div class="project-gallery-card">
                                        <span class="route-label">Project Gallery</span>
                                        <div class="project-gallery" data-gallery="1">
                                            <div class="project-gallery-viewport">
                                                <div class="project-gallery-track">
                                                                                                        <div class="project-gallery-slide">
                                                        <img src="assets/images/kalyanpur-routes.png"
                                                             alt="All Routes to Kalyanpur Paipura">
                                                    </div>
                                                                                                        <div class="project-gallery-slide">
                                                        <img src="assets/images/kalyanpur-development.png"
                                                             alt="Kalyanpur Paipura Nearby Development">
                                                    </div>
                                                                                                        <div class="project-gallery-slide">
                                                        <img src="assets/images/kalyanpur-route-map.png"
                                                             alt="Kalyanpur Paipura Route Map from AIIMS Patna">
                                                    </div>
                                                                                                    </div>
                                            </div>
                                            <div class="project-gallery-ui">
                                                <button type="button" class="gallery-btn gallery-prev" aria-label="Previous image">
                                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M15 18l-6-6 6-6"/></svg>
                                                </button>
                                                <div class="project-gallery-dots">
                                                                                                        <button type="button" class="gallery-dot active" data-slide="0" aria-label="Image 1"></button>
                                                                                                        <button type="button" class="gallery-dot" data-slide="1" aria-label="Image 2"></button>
                                                                                                        <button type="button" class="gallery-dot" data-slide="2" aria-label="Image 3"></button>
                                                                                                    </div>
                                                <button type="button" class="gallery-btn gallery-next" aria-label="Next image">
                                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 18l6-6-6-6"/></svg>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="project-feature-side">
                                        <div class="project-feature-info">
                                            <div class="status-badge status-development">
                                                <span class="pulse-dot"></span> विकासाधीन - Under Development                                            </div>
                                            <h3>Kalyanpur Paipura Main Development</h3>
                                            <p class="project-nh">SH 2 Corridor · NH 139 Link · Near Kanhauli Bus Stand</p>
                                            <p class="project-desc">Strategic real estate development near Kalyanpur Paipura with 20–30 ft roads, drainage, parks, and excellent connectivity from AIIMS Patna via SH 2 and NH 139 - a high-growth corridor in Patna region.</p>
                                        </div>
                                        <div class="project-route-card project-route-card--inline">
                                            <span class="route-label">Route Connectivity</span>
                                            <div class="route-timeline">
                                                                                                                                                <div class="route-stop">
                                                    <span class="route-dot start"></span>
                                                    <div>
                                                        <strong>AIIMS Patna</strong>
                                                        <small>Starting Point</small>
                                                    </div>
                                                </div>
                                                                                                                                                <div class="route-line"></div>
                                                                                                <div class="route-stop">
                                                    <span class="route-dot "></span>
                                                    <div>
                                                        <strong>Naubatpur</strong>
                                                        <small>Via SH 2</small>
                                                    </div>
                                                </div>
                                                                                                                                                <div class="route-line bridge"></div>
                                                                                                <div class="route-stop">
                                                    <span class="route-dot end"></span>
                                                    <div>
                                                        <strong>Kalyanpur Paipura</strong>
                                                        <small>38.9 km · 1h 12m</small>
                                                    </div>
                                                </div>
                                                                                            </div>
                                        </div>
                                    </div>
                                                                    </div>

                                <div class="bridge-stats-row">
                                                                        <div class="bridge-stat-pill">
                                        <span class="bridge-stat-value">
                                                                                        <span class="counter" data-target="38.9">0</span>
                                                                                        <small>km</small>
                                        </span>
                                        <span class="bridge-stat-label">Total Distance</span>
                                    </div>
                                                                        <div class="bridge-stat-pill">
                                        <span class="bridge-stat-value">
                                                                                        <span class="counter" data-target="72">0</span>
                                                                                        <small>min</small>
                                        </span>
                                        <span class="bridge-stat-label">Est. Travel Time</span>
                                    </div>
                                                                        <div class="bridge-stat-pill">
                                        <span class="bridge-stat-value">
                                                                                        <span>SH 2</span>
                                                                                        <small>NH 139</small>
                                        </span>
                                        <span class="bridge-stat-label">Growth Corridor</span>
                                    </div>
                                                                        <div class="bridge-stat-pill">
                                        <span class="bridge-stat-value">
                                                                                        <span>20-30</span>
                                                                                        <small>ft</small>
                                        </span>
                                        <span class="bridge-stat-label">Road Width</span>
                                    </div>
                                                                    </div>
                            </div>
                        </article>
                                            </div>
                </div>
            </div>

            <div class="projects-bento" id="projectsBento">
                <div class="bento-map reveal-left">
                    <div class="map-frame">
                        <div class="map-badge">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/><circle cx="12" cy="10" r="3"/></svg>
                            Ganges River Crossing
                        </div>
                        <img src="assets/images/infrastructure-map.png"
                             alt="Sherpur-Dighwara Ganga Bridge Infrastructure Map">
                        <div class="map-overlay">
                            <div class="map-pin pin-aiims">
                                <span class="pin-pulse"></span>
                                <span class="pin-dot"></span>
                                <span class="pin-label">AIIMS Patna</span>
                            </div>
                            <div class="map-pin pin-digha">
                                <span class="pin-pulse"></span>
                                <span class="pin-dot"></span>
                                <span class="pin-label">Digha</span>
                            </div>
                            <div class="map-pin pin-sherpur">
                                <span class="pin-pulse"></span>
                                <span class="pin-dot"></span>
                                <span class="pin-label">Sherpur</span>
                            </div>
                            <div class="map-pin pin-dighwara">
                                <span class="pin-pulse"></span>
                                <span class="pin-dot"></span>
                                <span class="pin-label">Dighwara</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="bento-progress reveal-right">
                    <div class="progress-card">
                        <div class="progress-card-head">
                            <div>
                                <h4>प्रमुख सरकारी प्रोजेक्ट की प्रगति</h4>
                                <p class="progress-note">Progress of Major Government Projects</p>
                            </div>
                            <div class="progress-legend">
                                <span><i class="dot green"></i> Complete</span>
                                <span><i class="dot blue"></i> Ongoing</span>
                            </div>
                        </div>
                        <div class="progress-list">
                                                        <div class="progress-row reveal-up">
                                <div class="progress-row-top">
                                    <div class="progress-name">
                                        <span class="progress-icon" style="--icon-color: #22c55e"></span>
                                        AIIMS-Digha                                    </div>
                                    <span class="progress-pct">100%</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-fill"
                                         data-progress="100"
                                         style="--bar-color: #22c55e"></div>
                                </div>
                            </div>
                                                        <div class="progress-row reveal-up">
                                <div class="progress-row-top">
                                    <div class="progress-name">
                                        <span class="progress-icon" style="--icon-color: #3b82f6"></span>
                                        Sherpur-Dighwara Bridge                                    </div>
                                    <span class="progress-pct">60%</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-fill"
                                         data-progress="60"
                                         style="--bar-color: #3b82f6"></div>
                                </div>
                            </div>
                                                        <div class="progress-row reveal-up">
                                <div class="progress-row-top">
                                    <div class="progress-name">
                                        <span class="progress-icon" style="--icon-color: #f59e0b"></span>
                                        Patna Ring Road                                    </div>
                                    <span class="progress-pct">35%</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-fill"
                                         data-progress="35"
                                         style="--bar-color: #f59e0b"></div>
                                </div>
                            </div>
                                                        <div class="progress-row reveal-up">
                                <div class="progress-row-top">
                                    <div class="progress-name">
                                        <span class="progress-icon" style="--icon-color: #8b5cf6"></span>
                                        Metro Project                                    </div>
                                    <span class="progress-pct">30%</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-fill"
                                         data-progress="30"
                                         style="--bar-color: #8b5cf6"></div>
                                </div>
                            </div>
                                                    </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact -->
    <section class="section contact" id="contact">
        <div class="contact-deco"></div>
        <div class="container">
            <div class="section-header reveal-up">
                <span class="section-tag">Reach Us</span>
                <h2>Get in <span class="gradient-text">Touch</span></h2>
                <p>Contact Information — Real Estate &amp; Building Construction</p>
            </div>

            <div class="contact-layout">
                <div class="contact-panel reveal-left">
                    <div class="contact-panel-inner">
                        <div class="contact-panel-head">
                            <span class="contact-person-label">Contact Information</span>
                            <h3>Barjesh Kumar Singh</h3>
                            <p class="contact-person-role">Real Estate &amp; Building Construction Specialist</p>
                            <p class="contact-person-tagline">Building the foundation of the future with reliability and excellence.</p>
                        </div>

                        <div class="contact-methods">
                            <div class="contact-method">
                                <div class="contact-method-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/><circle cx="12" cy="10" r="3"/></svg>
                                </div>
                                <div>
                                    <span class="method-label">Address</span>
                                    <strong><%= Server.HtmlEncode(((SiteMaster)Master).Settings.Address) %></strong>
                                </div>
                            </div>
                            <a href="<%= ((SiteMaster)Master).Settings.MobileHref %>" class="contact-method">
                                <div class="contact-method-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07 19.5 19.5 0 01-6-6 19.79 19.79 0 01-3.07-8.67A2 2 0 014.11 2h3a2 2 0 012 1.72c.127.96.361 1.903.7 2.81a2 2 0 01-.45 2.11L8.09 9.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0122 16.92z"/></svg>
                                </div>
                                <div>
                                    <span class="method-label">Phone</span>
                                    <strong><%= Server.HtmlEncode(((SiteMaster)Master).Settings.Mobile) %></strong>
                                </div>
                            </a>
                            <a href="<%= ((SiteMaster)Master).Settings.EmailHref %>" class="contact-method">
                                <div class="contact-method-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
                                </div>
                                <div>
                                    <span class="method-label">Email</span>
                                    <strong><%= Server.HtmlEncode(((SiteMaster)Master).Settings.Email) %></strong>
                                </div>
                            </a>
                            <% if (!string.IsNullOrWhiteSpace(((SiteMaster)Master).Settings.WhatsApp)) { %>
                            <a href="<%= ((SiteMaster)Master).Settings.WhatsAppHref %>" class="contact-method" target="_blank" rel="noopener">
                                <div class="contact-method-icon">
                                    <svg viewBox="0 0 24 24" fill="currentColor"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.435 9.884-9.85 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z"/></svg>
                                </div>
                                <div>
                                    <span class="method-label">WhatsApp</span>
                                    <strong><%= Server.HtmlEncode(((SiteMaster)Master).Settings.WhatsApp) %></strong>
                                </div>
                            </a>
                            <% } %>
                        </div>

                        <div class="contact-meta">
                            <div class="contact-meta-item">
                                <span>CIN</span>
                                <strong><%= Server.HtmlEncode(((SiteMaster)Master).Settings.Cin) %></strong>
                            </div>
                            <div class="contact-meta-item">
                                <span>Established</span>
                                <strong>2022</strong>
                            </div>
                            <div class="contact-meta-item">
                                <span>Hours</span>
                                <strong><%= Server.HtmlEncode(((SiteMaster)Master).Settings.OfficeHours) %></strong>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contact-form-card reveal-right">
                                        <div class="form-card-head">
                        <h3>Send a Message</h3>
                        <p>Fill out the form and our team will respond within 24 hours.</p>
                    </div>
                                        <div class="contact-form">
                                                <div class="form-row">
                            <div class="form-group">
                                <input type="text" name="name" id="name" placeholder=" " required>
                                <label for="name">Your Name</label>
                            </div>
                            <div class="form-group">
                                <input type="email" name="email" id="email" placeholder=" " required>
                                <label for="email">Email Address</label>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <input type="tel" name="mobile" id="mobile" placeholder=" " required pattern="[0-9+\-\s]{10,15}" maxlength="15">
                                <label for="mobile">Mobile Number</label>
                            </div>
                            <div class="form-group">
                                <input type="text" name="subject" id="subject" placeholder=" " required>
                                <label for="subject">Subject</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <textarea name="message" id="message" rows="5" placeholder=" " required></textarea>
                            <label for="message">Your Message</label>
                        </div>
                        <asp:Button ID="btnContact" runat="server" CssClass="btn btn-primary btn-full" Text="Send Message" OnClick="btnContact_Click" />
                    </div>
                                    </div>
            </div>
        </div>
    </section>

    <asp:Panel ID="pnlSitePopup" runat="server" CssClass="ab-site-popup" Visible="false" role="dialog" aria-modal="true" aria-labelledby="abSitePopupTitle">
        <div class="ab-site-popup-backdrop" data-ab-popup-close="1"></div>
        <div class="ab-site-popup-dialog">
            <button type="button" class="ab-site-popup-close" data-ab-popup-close="1" aria-label="Close">&times;</button>
            <asp:Panel ID="pnlPopupMedia" runat="server" CssClass="ab-site-popup-media" Visible="false">
                <asp:HyperLink ID="lnkPopupImage" runat="server" Visible="false" Target="_blank" rel="noopener">
                    <asp:Image ID="imgPopup" runat="server" CssClass="ab-site-popup-image" AlternateText="Announcement" />
                </asp:HyperLink>
                <asp:Image ID="imgPopupPlain" runat="server" CssClass="ab-site-popup-image" Visible="false" AlternateText="Announcement" />
            </asp:Panel>
            <div class="ab-site-popup-body" id="abSitePopupBody" runat="server">
                <h3 class="ab-site-popup-title" id="abSitePopupTitle"><asp:Literal ID="litPopupTitle" runat="server"></asp:Literal></h3>
                <div class="ab-site-popup-content"><asp:Literal ID="litPopupContent" runat="server"></asp:Literal></div>
            </div>
        </div>
    </asp:Panel>

    <script type="text/javascript">
        (function () {
            var popup = document.getElementById('<%= pnlSitePopup.ClientID %>');
            if (!popup) return;

            function openPopup() {
                popup.classList.add('is-open');
                document.documentElement.style.overflow = 'hidden';
            }
            function closePopup() {
                popup.classList.remove('is-open');
                document.documentElement.style.overflow = '';
            }

            popup.querySelectorAll('[data-ab-popup-close]').forEach(function (el) {
                el.addEventListener('click', closePopup);
            });
            document.addEventListener('keydown', function (e) {
                if (e.key === 'Escape') closePopup();
            });

            // Show on every page load / reload
            window.setTimeout(openPopup, 450);
        })();
    </script>
</asp:Content>