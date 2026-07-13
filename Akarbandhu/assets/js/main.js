document.addEventListener('DOMContentLoaded', () => {
    initLoader();
    initNavbar();
    initParticles();
    initCursorGlow();
    initRevealAnimations();
    initCounters();
    initProgressBars();
    initSmoothScroll();
    initHeroSlider();
    initProjectSlider();
    initDocumentViewer();
    initPlansTabs();
});

function initLoader() {
    const loader = document.getElementById('pageLoader');
    const progress = document.getElementById('loaderProgress');
    const percent = document.getElementById('loaderPercent');
    if (!loader) return;

    let value = 0;
    const tick = setInterval(() => {
        if (value < 88) {
            value += Math.random() * 12 + 4;
            value = Math.min(value, 88);
            if (progress) progress.style.width = value + '%';
            if (percent) percent.textContent = Math.floor(value) + '%';
        }
    }, 120);

    const finish = () => {
        clearInterval(tick);
        if (progress) progress.style.width = '100%';
        if (percent) percent.textContent = '100%';
        loader.classList.add('exiting');
        setTimeout(() => loader.classList.add('hidden'), 450);
    };

    if (document.readyState === 'complete') {
        setTimeout(finish, 600);
    } else {
        window.addEventListener('load', () => setTimeout(finish, 400));
    }
}

function initNavbar() {
    const navbar = document.getElementById('navbar');
    const toggle = document.getElementById('navToggle');
    const closeBtn = document.getElementById('navClose');
    const navCenter = document.getElementById('navLinks');
    const overlay = document.getElementById('navOverlay');
    const navLinks = document.querySelectorAll('.nav-link');
    const sections = document.querySelectorAll('section[id]');

    window.addEventListener('scroll', () => {
        navbar.classList.toggle('scrolled', window.scrollY > 50);
        updateActiveNav();
    });

    function closeMenu() {
        toggle.classList.remove('active');
        navCenter.classList.remove('active');
        overlay.classList.remove('active');
        document.body.style.overflow = '';
    }

    function openMenu() {
        const active = document.activeElement;
        if (active && (active.tagName === 'INPUT' || active.tagName === 'TEXTAREA' || active.tagName === 'SELECT')) {
            active.blur();
        }
        navCenter.classList.add('active');
        toggle.classList.add('active');
        overlay.classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    toggle.addEventListener('click', (e) => {
        e.preventDefault();
        e.stopPropagation();
        if (navCenter.classList.contains('active')) {
            closeMenu();
        } else {
            openMenu();
        }
    });

    if (closeBtn) closeBtn.addEventListener('click', closeMenu);
    overlay.addEventListener('click', closeMenu);

    const loginWrap = document.getElementById('navLogin');
    const loginBtn = document.getElementById('navLoginBtn');
    if (loginWrap && loginBtn) {
        loginBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            const open = loginWrap.classList.toggle('open');
            loginBtn.setAttribute('aria-expanded', open ? 'true' : 'false');
        });
        document.addEventListener('click', (e) => {
            if (!loginWrap.contains(e.target)) {
                loginWrap.classList.remove('open');
                loginBtn.setAttribute('aria-expanded', 'false');
            }
        });
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                loginWrap.classList.remove('open');
                loginBtn.setAttribute('aria-expanded', 'false');
            }
        });
    }

    navCenter.querySelectorAll('a').forEach(link => {
        link.addEventListener('click', closeMenu);
    });

    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && navCenter.classList.contains('active')) {
            closeMenu();
        }
    });

    function updateActiveNav() {
        if (!sections.length) return;

        const scrollPos = window.scrollY + 150;
        let current = 'home';

        sections.forEach(section => {
            if (scrollPos >= section.offsetTop) {
                current = section.id;
            }
        });

        navLinks.forEach(link => {
            link.classList.toggle('active', link.dataset.section === current);
        });
    }

    updateActiveNav();
}

function initParticles() {
    const container = document.getElementById('particles');
    if (!container) return;

    for (let i = 0; i < 40; i++) {
        const p = document.createElement('div');
        p.className = 'particle';
        p.style.left = Math.random() * 100 + '%';
        p.style.animationDuration = (Math.random() * 15 + 10) + 's';
        p.style.animationDelay = Math.random() * 10 + 's';
        p.style.width = p.style.height = (Math.random() * 3 + 2) + 'px';
        container.appendChild(p);
    }
}

function initCursorGlow() {
    const glow = document.getElementById('cursorGlow');
    if (!glow || window.matchMedia('(max-width: 768px)').matches) return;

    let raf;
    document.addEventListener('mousemove', (e) => {
        cancelAnimationFrame(raf);
        raf = requestAnimationFrame(() => {
            glow.style.left = e.clientX + 'px';
            glow.style.top = e.clientY + 'px';
        });
    });
}

function initRevealAnimations() {
    const elements = document.querySelectorAll('.reveal-up, .reveal-left, .reveal-right');

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const delay = entry.target.dataset.delay || 0;
                setTimeout(() => entry.target.classList.add('revealed'), parseInt(delay));
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.15, rootMargin: '0px 0px -40px 0px' });

    elements.forEach(el => observer.observe(el));
}

function initCounters() {
    const counters = document.querySelectorAll('[data-count], .counter');

    const animateCounter = (el, target, duration = 2000) => {
        const isDecimal = String(target).includes('.');
        const start = performance.now();

        const step = (now) => {
            const progress = Math.min((now - start) / duration, 1);
            const eased = 1 - Math.pow(1 - progress, 3);
            const current = eased * parseFloat(target);

            el.textContent = isDecimal ? current.toFixed(1) : Math.floor(current);
            if (progress < 1) requestAnimationFrame(step);
            else el.textContent = isDecimal ? parseFloat(target).toFixed(1) : target;
        };
        requestAnimationFrame(step);
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const el = entry.target;
                const target = el.dataset.count || el.dataset.target;
                if (target) animateCounter(el, target);
                observer.unobserve(el);
            }
        });
    }, { threshold: 0.5 });

    counters.forEach(c => observer.observe(c));
}

function initProgressBars() {
    const bars = document.querySelectorAll('.progress-fill');

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const bar = entry.target;
                const progress = bar.dataset.progress;
                setTimeout(() => { bar.style.width = progress + '%'; }, 300);
                observer.unobserve(bar);
            }
        });
    }, { threshold: 0.3 });

    bars.forEach(bar => observer.observe(bar));
}

function initHeroSlider() {
    const slides = document.querySelectorAll('.hero-slide');
    const dots = document.querySelectorAll('.hero-dot');
    if (!slides.length) return;

    let current = 0;
    const total = slides.length;
    const interval = 5000;
    let timer;

    function goTo(index) {
        slides[current].classList.remove('active');
        dots[current]?.classList.remove('active');
        current = (index + total) % total;
        slides[current].classList.add('active');
        dots[current]?.classList.add('active');
    }

    function next() { goTo(current + 1); }

    function start() {
        clearInterval(timer);
        timer = setInterval(next, interval);
    }

    dots.forEach(dot => {
        dot.addEventListener('click', () => {
            goTo(parseInt(dot.dataset.slide, 10));
            start();
        });
    });

    start();
}

function initProjectSlider() {
    const track = document.getElementById('projectSliderTrack');
    const prevBtn = document.getElementById('projectPrev');
    const nextBtn = document.getElementById('projectNext');
    const countEl = document.getElementById('projectSliderCount');
    const tagEl = document.getElementById('projectSectionTag');
    const titleEl = document.getElementById('projectSectionTitle');
    const descEl = document.getElementById('projectSectionDesc');
    const bento = document.getElementById('projectsBento');

    if (!track || !prevBtn || !nextBtn) return;

    const viewport = track.parentElement;
    const slides = track.querySelectorAll('.project-slide');
    const total = slides.length;
    let current = 0;

    function updateSliderHeight() {
        const slide = slides[current];
        if (!slide || !viewport) return;
        requestAnimationFrame(() => {
            viewport.style.height = slide.offsetHeight + 'px';
        });
    }

    function animateCounters(container) {
        container.querySelectorAll('.counter').forEach(el => {
            const target = el.dataset.target;
            if (!target || el.dataset.animated === '1') return;
            el.dataset.animated = '1';
            const isDecimal = String(target).includes('.');
            const duration = 2000;
            const start = performance.now();
            const step = (now) => {
                const progress = Math.min((now - start) / duration, 1);
                const eased = 1 - Math.pow(1 - progress, 3);
                const val = eased * parseFloat(target);
                el.textContent = isDecimal ? val.toFixed(1) : Math.floor(val);
                if (progress < 1) requestAnimationFrame(step);
            };
            requestAnimationFrame(step);
        });
    }

    function resetCounters() {
        track.querySelectorAll('.counter').forEach(el => {
            el.dataset.animated = '';
            el.textContent = '0';
        });
    }

    function bindGallery(gallery) {
        if (!gallery || gallery.dataset.bound === '1') return;
        gallery.dataset.bound = '1';
        const gTrack = gallery.querySelector('.project-gallery-track');
        const dots = gallery.querySelectorAll('.gallery-dot');
        const prev = gallery.querySelector('.gallery-prev');
        const next = gallery.querySelector('.gallery-next');
        let gi = 0;
        const gTotal = dots.length;

        const go = (n) => {
            gi = (n + gTotal) % gTotal;
            gTrack.style.transform = `translateX(-${gi * 100}%)`;
            dots.forEach((d, di) => d.classList.toggle('active', di === gi));
        };

        prev?.addEventListener('click', () => go(gi - 1));
        next?.addEventListener('click', () => go(gi + 1));
        dots.forEach(d => d.addEventListener('click', () => go(parseInt(d.dataset.slide, 10))));
    }

    function updateUI() {
        track.style.transform = `translateX(-${current * 100}%)`;
        countEl.textContent = `${current + 1} / ${total}`;
        prevBtn.disabled = current === 0;
        nextBtn.disabled = current === total - 1;

        const slide = slides[current];
        if (tagEl) tagEl.textContent = slide.dataset.tag || '';
        if (titleEl) titleEl.textContent = slide.dataset.title || '';
        if (descEl) descEl.textContent = slide.dataset.desc || '';
        if (bento) bento.style.display = current === 0 ? '' : 'none';

        resetCounters();
        animateCounters(slide);

        slide.querySelectorAll('.project-gallery').forEach(bindGallery);
        updateSliderHeight();
    }

    window.addEventListener('resize', updateSliderHeight);
    track.querySelectorAll('img').forEach(img => {
        if (!img.complete) img.addEventListener('load', updateSliderHeight);
    });

    prevBtn.addEventListener('click', () => {
        if (current > 0) {
            current--;
            updateUI();
        }
    });

    nextBtn.addEventListener('click', () => {
        if (current < total - 1) {
            current++;
            updateUI();
        }
    });

    updateUI();
}

function initSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', (e) => {
            const target = document.querySelector(anchor.getAttribute('href'));
            if (target) {
                e.preventDefault();
                target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });
}

function initDocumentViewer() {
    const modal = document.getElementById('docModal');
    if (!modal) return;

    const backdrop = document.getElementById('docModalBackdrop');
    const closeBtn = document.getElementById('docModalClose');
    const frame = document.getElementById('docModalFrame');
    const image = document.getElementById('docModalImage');
    const loader = document.getElementById('docModalLoader');
    const titleEl = document.getElementById('docModalTitle');
    const typeEl = document.getElementById('docModalType');
    const downloadEl = document.getElementById('docModalDownload');
    const viewBtns = document.querySelectorAll('.doc-view-btn');

    const resetViewer = () => {
        frame.hidden = true;
        image.hidden = true;
        frame.src = 'about:blank';
        image.removeAttribute('src');
        image.alt = '';
        loader.classList.remove('hidden');
        if (loader.querySelector('span')) {
            loader.querySelector('span').textContent = 'Loading document...';
        }
    };

    const showViewer = (type) => {
        frame.hidden = type !== 'pdf';
        image.hidden = type !== 'image';
    };

    const closeModal = () => {
        modal.classList.remove('open');
        modal.setAttribute('aria-hidden', 'true');
        document.body.style.overflow = '';
        resetViewer();
    };

    const openModal = (url, title, type) => {
        resetViewer();
        titleEl.textContent = title;
        typeEl.textContent = type === 'pdf' ? 'PDF' : 'Image';
        downloadEl.href = url;

        if (type === 'pdf') {
            showViewer('pdf');
            frame.onload = () => loader.classList.add('hidden');
            frame.src = url;
        } else {
            showViewer('image');
            image.alt = title;
            image.onload = () => loader.classList.add('hidden');
            image.onerror = () => {
                loader.querySelector('span').textContent = 'Unable to load document';
            };
            image.src = url;
        }

        modal.classList.add('open');
        modal.setAttribute('aria-hidden', 'false');
        document.body.style.overflow = 'hidden';
    };

    viewBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            openModal(btn.dataset.url, btn.dataset.title, btn.dataset.type);
        });
    });

    closeBtn.addEventListener('click', closeModal);
    backdrop.addEventListener('click', closeModal);

    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && modal.classList.contains('open')) {
            closeModal();
        }
    });
}

function initPlansTabs() {
    const tabs = document.querySelectorAll('.plans-tab');
    const panels = document.querySelectorAll('.plans-panel');
    if (!tabs.length || !panels.length) return;

    const activate = (id) => {
        tabs.forEach(tab => {
            const on = tab.dataset.tab === id;
            tab.classList.toggle('active', on);
            tab.setAttribute('aria-selected', on ? 'true' : 'false');
        });
        panels.forEach(panel => {
            const on = panel.id === 'plan-' + id;
            panel.classList.toggle('active', on);
            panel.hidden = !on;
        });
    };

    tabs.forEach(tab => {
        tab.addEventListener('click', () => activate(tab.dataset.tab));
    });

    const hash = location.hash.replace('#', '');
    if (hash && document.getElementById('plan-' + hash)) {
        activate(hash);
    }
}
