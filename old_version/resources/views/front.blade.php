<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home | Nado.ma</title>
    <script src="https://unpkg.com/lucide@latest"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">
    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

    <style>
        :root {
            --primary: #1459DD;
            --secondary: #FDD817;
            --slate-50: #f8fafc;
            --slate-100: #f1f5f9;
            --slate-200: #e2e8f0;
            --slate-300: #cbd5e1;
            --slate-400: #94a3b8;
            --slate-500: #64748b;
            --slate-600: #475569;
            --slate-800: #1e293b;
            --slate-900: #0f172a;
            --white: #ffffff;
            --black: #000000;
        }

        /* Global Reset & Base Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--white);
            color: var(--slate-900);
            min-height: 100vh;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        ul {
            list-style: none;
        }

        button {
            border: none;
            background: none;
            cursor: pointer;
            font-family: inherit;
        }

        img {
            max-width: 100%;
            display: block;
        }

        /* Utilities */
        .container {
            max-width: 80rem;
            /* 7xl equivalent */
            margin: 0 auto;
            padding: 0 1rem;
        }

        .flex {
            display: flex;
        }

        .flex-col {
            flex-direction: column;
        }

        .items-center {
            align-items: center;
        }

        .justify-between {
            justify-content: space-between;
        }

        .justify-center {
            justify-content: center;
        }

        .gap-2 {
            gap: 0.5rem;
        }

        .gap-4 {
            gap: 1rem;
        }

        .gap-6 {
            gap: 1.5rem;
        }

        .gap-10 {
            gap: 2.5rem;
        }

        .hidden {
            display: none;
        }

        @media (min-width: 640px) {
            .sm\:flex {
                display: flex;
            }

            .sm\:hidden {
                display: none;
            }
        }

        @media (min-width: 1024px) {
            .lg\:flex {
                display: flex;
            }

            .lg\:hidden {
                display: none;
            }

            .lg\:grid-cols-2 {
                grid-template-columns: repeat(2, 1fr);
            }

            .lg\:col-span-8 {
                grid-column: span 8;
            }

            .lg\:col-span-4 {
                grid-column: span 4;
            }
        }

        .text-primary {
            color: var(--primary);
        }

        .text-secondary {
            color: var(--secondary);
        }

        .text-white {
            color: var(--white);
        }

        .bg-white {
            background-color: var(--white);
        }

        .uppercase {
            text-transform: uppercase;
        }

        .font-black {
            font-weight: 900;
        }

        .font-bold {
            font-weight: 700;
        }

        /* Custom Scrollbar */
        .no-scrollbar::-webkit-scrollbar {
            display: none;
        }

        .no-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }

        /* Animations */
        @keyframes infinite-scroll {
            from {
                transform: translateX(0);
            }

            to {
                transform: translateX(-50%);
            }
        }

        .animate-infinite-scroll {
            animation: infinite-scroll 35s linear infinite;
        }

        .animate-pulse {
            animation: pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;
        }

        @keyframes pulse {

            0%,
            100% {
                opacity: 1;
            }

            50% {
                opacity: .5;
            }
        }



        /* HERO SECTION */
        .hero {
            position: relative;
            min-height: 80vh;
            display: flex;
            align-items: center;
            overflow: hidden;
            background-color: var(--slate-900);
        }

        .hero-bg {
            position: absolute;
            inset: 0;
            z-index: 0;
        }

        .hero-bg img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.4;
            /* transform: scale(1.05); */
        }

        /* Hero Slider Styles */
        .hero-slider {
            width: 100%;
            height: 100%;
        }

        .hero-slider .owl-stage-outer,
        .hero-slider .owl-stage,
        .hero-slider .owl-item,
        .hero-slider .item {
            height: 100%;
        }

        .hero-slider .item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.4;
        }

        .hero-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(to right, var(--slate-900), rgba(15, 23, 42, 0.6), transparent);
        }

        .hero-content {
            position: relative;
            z-index: 20;
            width: 100%;
            padding: 0 1.5rem;
        }

        .hero-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.25rem 0.75rem;
            background-color: rgba(20, 89, 221, 0.2);
            border: 1px solid rgba(20, 89, 221, 0.3);
            border-radius: 9999px;
            margin-bottom: 1.5rem;
        }

        .hero-badge span {
            color: var(--secondary);
            font-weight: 900;
            font-size: 10px;
            text-transform: uppercase;
            letter-spacing: 0.3em;
        }

        .hero-title {
            font-size: 3.75rem;
            font-weight: 900;
            color: var(--white);
            line-height: 0.85;
            letter-spacing: -0.05em;
            text-transform: uppercase;
            margin-bottom: 2.5rem;
        }

        @media (min-width: 1024px) {
            .hero-title {
                font-size: 100px;
            }
        }

        .text-gradient {
            color: transparent;
            background-clip: text;
            -webkit-background-clip: text;
            background-image: linear-gradient(to right, var(--primary), #7ea9ff);
        }

        .hero-desc {
            font-size: 1.25rem;
            color: var(--slate-300);
            max-width: 28rem;
            font-weight: 500;
            line-height: 1.625;
            margin-bottom: 3rem;
            border-left: 4px solid var(--secondary);
            padding-left: 1.5rem;
        }

        /* STORIES SECTION */
        .stories {
            padding: 5rem 0;
            background-color: #020617;
            overflow: hidden;
        }

        .story-header {
            margin-bottom: 3rem;
        }

        .story-subtitle {
            font-size: 10px;
            font-weight: 900;
            color: var(--secondary);
            text-transform: uppercase;
            letter-spacing: 0.4em;
            display: block;
            margin-bottom: 0.5rem;
        }

        .story-title {
            font-size: 2.25rem;
            font-weight: 900;
            color: var(--white);
            text-transform: uppercase;
            letter-spacing: -0.025em;
            margin: 0;
        }

        .story-scroll {
            display: flex;
            gap: 1rem;
            overflow-x: auto;
            padding-bottom: 1.5rem;
            padding-left: 0.25rem;
        }

        .story-card {
            flex-shrink: 0;
            width: 145px;
            aspect-ratio: 9/16;
            position: relative;
            border-radius: 2rem;
            overflow: hidden;
            cursor: pointer;
            border: 1px solid rgba(255, 255, 255, 0.05);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        @media (min-width: 768px) {
            .story-card {
                width: 170px;
            }
        }

        .story-card img.bg-img {
            position: absolute;
            inset: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 3s;
        }

        .story-card:hover img.bg-img {
            transform: scale(1.1);
        }

        .story-gradient {
            inset: 0;
            background: linear-gradient(to top, rgba(0, 0, 0, 0.8), transparent, rgba(0, 0, 0, 0.1));
            pointer-events: none;
            position: absolute;
            width: 100%;
            height: 100%;
        }

        .story-avatar {
            position: absolute;
            top: 1rem;
            left: 1rem;
            z-index: 20;
            width: 2.75rem;
            height: 2.75rem;
            border-radius: 50%;
            border: 3px solid var(--primary);
            padding: 0.125rem;
            background-color: var(--slate-900);
        }

        .story-avatar img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
        }

        .story-info {
            position: absolute;
            bottom: 1.25rem;
            left: 1.25rem;
            right: 1.25rem;
            z-index: 20;
            text-align: left;
        }

        .story-name {
            font-size: 11px;
            font-weight: 900;
            color: var(--white);
            display: block;
            margin-bottom: 0.25rem;
        }

        .story-time {
            font-size: 9px;
            font-weight: 700;
            color: rgba(255, 255, 255, 0.6);
            text-transform: uppercase;
            letter-spacing: 0.1em;
        }

        /* SEARCH & BRANDS */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.95);
            z-index: 99999;
            display: flex;
            align-items: center;
            justify-content: center;
            /* opacity: 0; */
            /* pointer-events: none; */
            transition: opacity 0.3s ease;
        }

        .search-section {
            padding: 3rem 1rem;
            background-color: var(--white);
            position: relative;
            overflow: hidden;
        }

        .search-bar {
            background-color: var(--white);
            border-radius: 1rem;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
            padding: 0.5rem;
            border: 1px solid var(--slate-100);
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        @media (min-width: 768px) {
            .search-bar {
                flex-direction: row;
                border-radius: 9999px;
                align-items: center;
                padding: 0.75rem;
            }
        }

        .search-item {
            flex: 1;
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 0.75rem 1.5rem;
            border-radius: 0.75rem;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .search-item:hover {
            background-color: var(--slate-50);
        }

        .search-item label {
            display: block;
            font-size: 8px;
            font-weight: 900;
            color: var(--slate-400);
            text-transform: uppercase;
            letter-spacing: 0.1em;
            margin-bottom: 0.25rem;
        }

        .search-item select {
            width: 100%;
            background: transparent;
            border: none;
            font-size: 0.875rem;
            font-weight: 900;
            color: var(--slate-900);
            outline: none;
            cursor: pointer;
            appearance: none;
        }

        .divider {
            display: none;
            width: 1px;
            height: 2rem;
            background-color: var(--slate-100);
            margin-left: 1rem;
        }

        @media (min-width: 768px) {
            .divider {
                display: block;
            }
        }

        .btn-find {
            background-color: var(--primary);
            color: var(--white);
            padding: 1rem 2rem;
            border-radius: 0.75rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
            font-weight: 900;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            transition: all 0.2s;
        }

        @media (min-width: 768px) {
            .btn-find {
                border-radius: 9999px;
                margin-left: 0.5rem;
            }
        }

        .btn-find:hover {
            background-color: #1d4ed8;
            transform: scale(1.02);
        }

        .brands-ticker {
            overflow: hidden;
            padding: 2.5rem 0;
            margin-top: 1.5rem;
            border-top: 1px solid var(--slate-50);
        }

        .ticker-track {
            display: flex;
            gap: 5rem;
            white-space: nowrap;
            animation: infinite-scroll 35s linear infinite;
        }

        .brand-logo {
            height: 2rem;
            filter: grayscale(100%);
            opacity: 0.2;
            transition: all 0.2s;
            cursor: pointer;
        }

        .brand-logo:hover {
            filter: grayscale(0);
            opacity: 1;
        }

        /* ADS SECTION */
        .ads-section {
            padding: 6rem 0;
            background-color: var(--slate-50);
        }

        .section-title {
            font-size: 2.25rem;
            font-weight: 900;
            color: var(--slate-900);
            line-height: 0.9;
            letter-spacing: -0.05em;
            text-transform: uppercase;
            margin-bottom: 4rem;
        }

        @media (min-width: 768px) {
            .section-title {
                font-size: 3.75rem;
            }
        }

        .grid-ads {
            display: grid;
            grid-template-columns: 1fr;
            gap: 2.5rem;
        }

        @media (min-width: 768px) {
            .grid-ads {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (min-width: 1024px) {
            .grid-ads {
                grid-template-columns: repeat(3, 1fr);
            }
        }


        /* REFINE AD CARD (Match Home.tsx) */
        .ad-card {
            background-color: var(--white);
            border-radius: 2.5rem;
            /* rounded-[2.5rem] */
            overflow: hidden;
            border: 1px solid var(--slate-200);
            display: flex;
            flex-direction: column;
            height: 100%;
            transition: all 0.3s;
            cursor: pointer;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            /* shadow-sm */
        }

        .ad-card:hover {
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            /* hover:shadow-2xl */
        }

        .ad-image-container {
            position: relative;
            aspect-ratio: 16/11;
            overflow: hidden;
        }

        .ad-main-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.7s;
        }

        .ad-card:hover .ad-main-img {
            transform: scale(1.1);
        }

        /* Video Preview */
        .ad-video-preview {
            position: absolute;
            bottom: 1rem;
            /* bottom-4 */
            right: 1rem;
            /* right-4 */
            width: 6rem;
            /* w-24 */
            height: 9rem;
            /* h-36 */
            border-radius: 1rem;
            /* rounded-2xl */
            overflow: hidden;
            border: 2px solid white;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            /* shadow-2xl */
            z-index: 20;
            transition: transform 0.3s;
        }

        .ad-card:hover .ad-video-preview {
            transform: scale(1.1);
        }

        .ad-video-preview img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.9;
        }

        .ad-play-btn {
            position: absolute;
            inset: 0;
            background-color: rgba(0, 0, 0, 0.3);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .ad-play-icon {
            width: 2rem;
            /* w-8 */
            height: 2rem;
            /* h-8 */
            background-color: rgba(255, 255, 255, 0.4);
            backdrop-filter: blur(4px);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        /* Status Badge */
        .ad-status-badge {
            position: absolute;
            top: 1.5rem;
            /* top-6 */
            left: 1.5rem;
            /* left-6 */
            padding: 0.5rem 1rem;
            /* px-4 py-2 */
            border-radius: 9999px;
            font-weight: 900;
            font-size: 10px;
            /* text-[10px] */
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: white;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
            /* shadow-xl */
            backdrop-filter: blur(4px);
            z-index: 20;
            background-color: #22c55e;
        }

        .status-available {
            background-color: rgba(34, 197, 94, 0.9);
            /* bg-green-500/90 */
        }

        .status-reserved {
            background-color: rgba(249, 115, 22, 0.9);
            /* bg-orange-500/90 */
        }

        /* Price Tag (Overlay on Image) */
        .ad-price-tag {
            position: absolute;
            bottom: 1.5rem;
            /* bottom-6 */
            left: 1.5rem;
            /* left-6 */
            background-color: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(4px);
            padding: 1rem 1.25rem;
            /* px-5 py-4 */
            border-radius: 1rem;
            /* rounded-2xl */
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            /* shadow-2xl */
            border: 1px solid var(--slate-100);
            z-index: 20;
            display: flex;
            align-items: center;
        }

        .ad-price-text {
            color: #1459DD;
            font-size: 1.5rem;
            /* text-2xl */
            font-weight: 900;
            letter-spacing: -0.05em;
            line-height: 1;
        }

        /* Details Section */
        .ad-content {
            padding: 2rem;
            /* p-8 */
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .ad-title-new {
            font-size: 1.5rem;
            /* text-2xl */
            font-weight: 900;
            text-transform: uppercase;
            color: var(--slate-900);
            margin-bottom: 1.5rem;
            /* mb-6 */
            letter-spacing: -0.025em;
            line-height: 1.2;
            transition: color 0.2s;
        }

        .ad-card:hover .ad-title-new {
            color: #1459DD;
        }

        /* Specs Grid */
        .ad-specs-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem 2rem;
            /* gap-x-8 gap-y-4 */
            margin-bottom: 2rem;
            /* mb-8 */
        }

        .ad-spec-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            /* gap-3 */
            color: var(--slate-400);
            font-size: 0.75rem;
            /* text-xs */
            font-weight: 700;
            text-transform: uppercase;
        }

        /* Footer (Blue Full Width) */
        .ad-footer-btn {
            background-color: var(--primary);
            /* bg-[#1459DD] */
            padding: 1.5rem;
            /* p-6 */
            border-radius: 2rem;
            /* rounded-[2rem] */
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
            /* shadow-xl */
            display: flex;
            align-items: center;
            justify-content: space-between;
            color: white;
            margin: 0;
            margin-top: auto;
            /* mt-auto */
            transition: transform 0.2s;
        }

        .ad-card:hover .ad-footer-btn {
            transform: scale(1.02);
        }

        .monthly-label {
            font-size: 9px;
            /* text-[9px] */
            font-weight: 900;
            color: rgba(255, 255, 255, 0.7);
            text-transform: uppercase;
            letter-spacing: 0.1em;
            display: block;
            margin-bottom: 0.25rem;
        }

        .monthly-price {
            display: flex;
            align-items: baseline;
            gap: 0.25rem;
        }

        .monthly-amount {
            font-size: 1.5rem;
            /* text-2xl */
            font-weight: 900;
            line-height: 1;
            color: white;
        }

        .monthly-unit {
            font-size: 0.75rem;
            /* text-xs */
            font-weight: 900;
            color: #FDD817;
        }

        .arrow-circle {
            width: 2.5rem;
            /* w-10 */
            height: 2.5rem;
            /* h-10 */
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            transition: all 0.2s;
        }

        .ad-card:hover .arrow-circle {
            background-color: var(--white);
            color: var(--primary);
            transform: translateX(5px);
        }

        .btn-view-all {
            padding: 1.25rem 2.5rem;
            background-color: var(--slate-900);
            color: var(--white);
            border-radius: 1rem;
            font-weight: 900;
            font-size: 0.75rem;
            text-transform: uppercase;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin: 4rem auto 0;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        .ad-footer {
            margin-top: auto;
            padding: 1.5rem;
            background-color: var(--primary);
            border-radius: 2rem;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: transform 0.2s;
        }

        .ad-card:hover .ad-footer {
            transform: scale(1.02);
        }

        .payment-info {
            display: flex;
            flex-direction: column;
        }

        .payment-label {
            font-size: 9px;
            font-weight: 900;
            color: rgba(255, 255, 255, 0.7);
            text-transform: uppercase;
            letter-spacing: 0.1em;
            margin-bottom: 0.25rem;
        }

        .payment-amount {
            display: flex;
            align-items: baseline;
            gap: 0.25rem;
        }

        .amount-value {
            font-size: 1.5rem;
            font-weight: 900;
            color: var(--white);
        }

        .amount-unit {
            font-size: 0.75rem;
            font-weight: 900;
            color: var(--secondary);
        }

        .btn-arrow {
            width: 2.5rem;
            height: 2.5rem;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--white);
        }


        /* FOOTER */
        footer {
            background-color: var(--slate-900);
            color: var(--white);
            padding: 6rem 0;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 3rem;
            margin-bottom: 4rem;
        }

        @media (min-width: 768px) {
            .footer-grid {
                grid-template-columns: repeat(4, 1fr);
            }
        }

        .footer-heading {
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 0.1em;
            color: var(--secondary);
        }

        .footer-links li {
            margin-bottom: 1rem;
        }

        .footer-links a {
            font-size: 0.875rem;
            font-weight: 700;
            color: var(--slate-300);
            transition: color 0.2s;
        }

        .footer-links a:hover {
            color: var(--white);
        }

        .social-btn {
            width: 2.5rem;
            height: 2.5rem;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 0.75rem;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
        }

        .social-btn:hover {
            background-color: var(--primary);
        }


        /* PUB NADO EXPERT */
        .pub-section {
            padding: 2rem 1rem;
            background-color: var(--white);
        }

        .expert-card {
            background-color: var(--slate-900);
            border-radius: 3rem;
            padding: 2.5rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
            gap: 3rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            position: relative;
            overflow: hidden;
        }

        @media (min-width: 768px) {
            .expert-card {
                flex-direction: row;
                padding: 4rem;
            }
        }

        .expert-content {
            position: relative;
            z-index: 10;
            display: flex;
            flex-direction: column;
            max-width: 42rem;
            width: 100%;
            text-align: left;
        }

        .label-trust {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        .label-trust span {
            color: var(--secondary);
            font-weight: 900;
            font-size: 10px;
            text-transform: uppercase;
            letter-spacing: 0.1em;
        }

        .expert-title {
            font-size: 2.25rem;
            font-weight: 900;
            color: var(--white);
            text-transform: uppercase;
            letter-spacing: -0.05em;
            margin-bottom: 1.5rem;
            line-height: 1;
        }

        @media (min-width: 768px) {
            .expert-title {
                font-size: 3rem;
            }
        }

        .expert-desc {
            color: var(--slate-400);
            font-weight: 500;
            margin-bottom: 2rem;
            line-height: 1.625;
            max-width: 28rem;
        }

        .btn-discover {
            width: fit-content;
            padding: 1rem 2rem;
            background-color: var(--primary);
            color: var(--white);
            border-radius: 1rem;
            font-weight: 900;
            font-size: 0.75rem;
            text-transform: uppercase;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .expert-image {
            width: 100%;
            aspect-ratio: 16/9;
            border-radius: 2.5rem;
            overflow: hidden;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            border: 4px solid var(--slate-800);
            position: relative;
            z-index: 10;
        }

        @media (min-width: 768px) {
            .expert-image {
                width: 33.333333%;
            }
        }

        .expert-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* NADO PRICE */
        .price-section {
            padding: 6rem 0;
            background-color: var(--primary);
            position: relative;
            overflow: hidden;
        }

        .price-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 4rem;
            align-items: center;
            position: relative;
            z-index: 10;
        }

        @media (min-width: 1024px) {
            .price-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        .price-title {
            font-size: 2.25rem;
            font-weight: 900;
            color: var(--white);
            line-height: 0.9;
            letter-spacing: -0.05em;
            text-transform: uppercase;
            margin-bottom: 2rem;
        }

        @media (min-width: 768px) {
            .price-title {
                font-size: 3.75rem;
            }
        }

        .price-desc {
            color: #eff6ff;
            font-size: 1.25rem;
            font-weight: 500;
            line-height: 1.625;
            margin-bottom: 3rem;
            max-width: 28rem;
        }

        .btn-estimate {
            padding: 1.5rem 2.5rem;
            background-color: var(--white);
            color: var(--primary);
            border-radius: 2rem;
            font-weight: 900;
            font-size: 0.875rem;
            text-transform: uppercase;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .price-image-container {
            position: relative;
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(24px);
            padding: 1rem;
            border-radius: 3.5rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .price-image-container img {
            border-radius: 2.5rem;
            filter: grayscale(100%);
            width: 100%;
        }

        /* IMMERSIVE EXPERIENCES */
        .immersive-section {
            padding: 6rem 0;
            background-color: #020617;
            position: relative;
            overflow: hidden;
        }

        .immersive-scroll {
            display: flex;
            gap: 1.5rem;
            overflow-x: auto;
            padding-bottom: 2.5rem;
        }

        .video-card {
            flex-shrink: 0;
            width: 320px;
            aspect-ratio: 9/16;
            position: relative;
            border-radius: 2.5rem;
            overflow: hidden;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            border: 1px solid rgba(255, 255, 255, 0.05);
            cursor: pointer;
        }

        .video-card img {
            position: absolute;
            inset: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.7s;
        }

        .video-card:hover img {
            transform: scale(1.1);
        }

        .video-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(to top, #020617, rgba(2, 6, 23, 0.2), transparent);
        }

        .video-info {
            position: absolute;
            bottom: 2rem;
            left: 2rem;
            right: 2rem;
            z-index: 20;
        }

        .video-title {
            color: var(--white);
            font-weight: 900;
            font-size: 1.25rem;
            margin-bottom: 0.5rem;
        }

        .video-meta {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            color: var(--slate-300);
        }

        .video-meta span {
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
        }

        .play-icon {
            position: absolute;
            inset: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: opacity 0.2s;
            z-index: 10;
        }

        .video-card:hover .play-icon {
            opacity: 1;
        }

        /* LIVE AUCTIONS */
        .live-section {
            padding: 6rem 0;
            background-color: var(--white);
            position: relative;
            overflow: hidden;
        }

        .auction-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 2rem;
            align-items: flex-start;
        }

        @media (min-width: 1024px) {
            .auction-grid {
                grid-template-columns: repeat(12, 1fr);
            }

            .auction-main {
                grid-column: span 8;
            }

            .auction-sidebar {
                grid-column: span 4;
            }
        }

        .main-auction-card {
            position: relative;
            background-color: var(--white);
            border: 1px solid var(--slate-100);
            border-radius: 3.5rem;
            overflow: hidden;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        .main-auction-img {
            position: relative;
            aspect-ratio: 16/9;
            overflow: hidden;
        }

        .main-auction-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .main-auction-content {
            padding: 2.5rem;
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
            justify-content: space-between;
            align-items: flex-end;
        }

        @media (min-width: 768px) {
            .main-auction-content {
                flex-direction: row;
            }
        }

        .current-bid {
            text-align: right;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }

        .bid-label {
            font-size: 10px;
            font-weight: 900;
            color: var(--slate-400);
            text-transform: uppercase;
            letter-spacing: 0.1em;
            display: block;
            margin-bottom: 0.25rem;
        }

        .bid-amount {
            font-size: 2.25rem;
            font-weight: 900;
            color: var(--primary);
        }

        .btn-bid {
            margin-top: 1.5rem;
            padding: 1rem 2.5rem;
            background-color: var(--primary);
            color: var(--white);
            border-radius: 1rem;
            font-weight: 900;
            font-size: 0.75rem;
            text-transform: uppercase;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .side-auction-card {
            background-color: var(--slate-50);
            border: 1px solid var(--slate-100);
            border-radius: 2.5rem;
            padding: 1.5rem;
            transition: all 0.2s;
            cursor: pointer;
            display: flex;
            gap: 1.5rem;
            align-items: center;
        }

        .side-auction-card:hover {
            background-color: var(--white);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .side-img {
            width: 6rem;
            height: 6rem;
            border-radius: 1rem;
            overflow: hidden;
            flex-shrink: 0;
            border: 1px solid var(--slate-200);
        }

        .side-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* TESTIMONIALS */
        .testimonials {
            padding: 6rem 0;
            background-color: var(--slate-50);
            overflow: hidden;
        }

        .testimonial-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 4rem;
            align-items: center;
        }

        @media (min-width: 1024px) {
            .testimonial-grid {
                grid-template-columns: repeat(12, 1fr);
            }

            .testimonial-left {
                grid-column: span 5;
            }

            .testimonial-right {
                grid-column: span 7;
            }
        }

        .nav-buttons {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-top: 2.5rem;
        }

        .btn-nav-prev {
            width: 3rem;
            height: 3rem;
            border-radius: 50%;
            border: 1px solid var(--slate-200);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--slate-400);
            transition: all 0.2s;
        }

        .btn-nav-prev:hover {
            background-color: var(--slate-50);
        }

        .btn-nav-next {
            width: 3rem;
            height: 3rem;
            border-radius: 50%;
            background-color: var(--secondary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--slate-900);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .testimonial-card {
            background-color: var(--white);
            border-radius: 3.5rem;
            padding: 3rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            border: 1px solid var(--slate-100);
            position: relative;
            overflow: hidden;
        }

        @media (min-width: 768px) {
            .testimonial-card {
                padding: 4rem;
            }
        }

        .quote-icon {
            position: absolute;
            top: 2.5rem;
            left: 2.5rem;
            color: var(--slate-100);
            opacity: 0.2;
            width: 5rem;
            height: 5rem;
        }

        .stars {
            display: flex;
            align-items: center;
            gap: 0.25rem;
            color: var(--secondary);
            margin-bottom: 2rem;
        }

        .quote-text {
            font-size: 1.5rem;
            font-style: italic;
            color: var(--slate-900);
            line-height: 1.625;
            margin-bottom: 3rem;
        }

        @media (min-width: 768px) {
            .quote-text {
                font-size: 1.875rem;
            }
        }

        .client-info {
            display: flex;
            align-items: center;
            gap: 1.25rem;
            padding-top: 2rem;
            border-top: 1px solid var(--slate-50);
        }

        .client-img {
            width: 4rem;
            height: 4rem;
            border-radius: 50%;
            overflow: hidden;
            border: 2px solid var(--white);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .client-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* BLOG SECTION */
        .blog-section {
            padding: 6rem 0;
            background-color: var(--white);
        }

        .blog-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 2.5rem;
        }

        @media (min-width: 768px) {
            .blog-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (min-width: 1024px) {
            .blog-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        .blog-card {
            background-color: var(--white);
            border-radius: 2rem;
            overflow: hidden;
            border: 1px solid var(--slate-100);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.05);
            transition: all 0.3s;
            cursor: pointer;
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .blog-card:hover {
            transform: translateY(-0.5rem);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.15);
        }

        .blog-img-container {
            position: relative;
            aspect-ratio: 16/10;
            overflow: hidden;
        }

        .blog-img-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }

        .blog-card:hover .blog-img-container img {
            transform: scale(1.05);
        }

        .blog-category {
            position: absolute;
            top: 1.25rem;
            left: 1.25rem;
            background-color: var(--white);
            color: var(--primary);
            padding: 0.5rem 1rem;
            border-radius: 9999px;
            font-weight: 900;
            font-size: 0.625rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .blog-content {
            padding: 2rem;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .blog-meta {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
            color: var(--slate-400);
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
        }

        .blog-title {
            font-size: 1.25rem;
            font-weight: 900;
            color: var(--slate-900);
            margin-bottom: 1rem;
            line-height: 1.4;
            transition: color 0.2s;
        }

        .blog-card:hover .blog-title {
            color: var(--primary);
        }

        .blog-excerpt {
            color: var(--slate-500);
            font-weight: 500;
            font-size: 0.875rem;
            line-height: 1.625;
            margin-bottom: 1.5rem;
            flex: 1;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .blog-link {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--primary);
            font-weight: 900;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        /* MOBILE MENU DRAWER */
        .mobile-drawer-overlay {
            position: fixed;
            inset: 0;
            background-color: rgba(15, 23, 42, 0.4);
            backdrop-filter: blur(12px);
            z-index: 100;
            opacity: 0;
            visibility: hidden;
            transition: all 0.5s;
        }

        .mobile-drawer-overlay.open {
            opacity: 1;
            visibility: visible;
        }

        .mobile-drawer {
            position: fixed;
            inset: 0;
            z-index: 1100;
            visibility: hidden;
            transition: visibility 0.3s;
            pointer-events: none;
        }

        .mobile-drawer.open {
            transform: translateX(0);
        }

        .drawer-header {
            padding: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .drawer-nav {
            flex: 1;
            overflow-y: auto;
            padding: 1rem 2rem;
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .drawer-link {
            font-size: 1.125rem;
            font-weight: 900;
            color: var(--slate-900);
            text-transform: uppercase;
            text-align: left;
            transition: color 0.2s;
        }

        .drawer-link:hover {
            color: var(--primary);
        }

        .drawer-footer {
            padding: 2.5rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            border-top: 1px solid var(--slate-100);
        }

        /* FINANCEMENT FLASH */
        .finance-section {
            padding: 2rem 1rem;
            background-color: var(--white);
        }

        .finance-card {
            background-color: var(--secondary);
            border-radius: 3rem;
            padding: 2.5rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 3rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            position: relative;
            overflow: hidden;
        }

        @media (min-width: 768px) {
            .finance-card {
                flex-direction: row;
                padding: 4rem;
            }

            .finance-image {
                width: 33.333%;
                max-width: 24rem;
            }
        }

        .finance-image {
            aspect-ratio: 1/1;
            border-radius: 50%;
            border: 8px solid var(--white);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            overflow: hidden;
            transform: rotate(12deg);
            width: 100%;
        }

        .finance-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transform: scale(1.25);
        }

        /* BANNER WHATSAPP */
        .whatsapp-section {
            padding: 6rem 0;
            background-color: var(--white);
            text-align: left;
        }

        .whatsapp-card {
            background-color: var(--primary);
            border-radius: 4rem;
            padding: 2.5rem;
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            gap: 4rem;
            align-items: center;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        @media (min-width: 768px) {
            .whatsapp-card {
                flex-direction: row;
                padding: 5rem;
            }
        }

        .whatsapp-content {
            flex: 1;
            text-align: left;
            width: 100%;
        }

        .whatsapp-title {
            font-size: 3rem;
            font-weight: 900;
            color: var(--white);
            text-transform: uppercase;
            line-height: 0.9;
            letter-spacing: -0.05em;
            margin-bottom: 3rem;
        }

        @media (min-width: 768px) {
            .whatsapp-title {
                font-size: 4.5rem;
            }
        }

        .btn-whatsapp {
            display: inline-flex;
            align-items: center;
            gap: 1rem;
            padding: 1.5rem 2.5rem;
            background-color: var(--white);
            color: var(--primary);
            border-radius: 1.5rem;
            font-weight: 900;
            font-size: 0.875rem;
            text-transform: uppercase;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            transition: transform 0.2s;
        }

        .btn-whatsapp:hover {
            transform: scale(1.05);
        }

        .whatsapp-image {
            flex: 1;
            width: 100%;
            max-width: 500px;
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(24px);
            padding: 1rem;
            border-radius: 4rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 30px 60px -12px rgba(0, 0, 0, 0.5);
        }

        .whatsapp-image img {
            border-radius: 3.5rem;
            width: 100%;
            height: auto;
            object-fit: cover;
        }


        /* BLOG UPDATE (DARK REDESIGN) */
        .blog-section {
            padding: 8rem 0;
            background-color: #020617;
            position: relative;
        }

        .blog-header {
            display: flex;
            flex-direction: column;
            margin-bottom: 6rem;
            gap: 2rem;
        }

        @media (min-width: 768px) {
            .blog-header {
                flex-direction: row;
                align-items: flex-end;
                justify-content: space-between;
            }
        }

        .blog-title-wrapper {
            max-width: 36rem;
        }

        .blog-big-title {
            font-size: 3rem;
            font-weight: 900;
            color: var(--white);
            line-height: 0.8;
            letter-spacing: -0.05em;
            text-transform: uppercase;
            margin: 0;
        }

        @media (min-width: 768px) {
            .blog-big-title {
                font-size: 6.875rem;
            }
        }

        /* ~110px */

        .btn-explore-blog {
            display: flex;
            align-items: center;
            gap: 1rem;
            background-color: var(--white);
            color: #020617;
            padding: 1rem 2rem;
            border-radius: 1rem;
            font-weight: 900;
            font-size: 11px;
            text-transform: uppercase;
            transition: transform 0.2s;
        }

        .btn-explore-blog:hover {
            transform: scale(1.05);
        }

        .blog-grid-hero {
            display: grid;
            grid-template-columns: 1fr;
            gap: 2.5rem;
        }

        @media (min-width: 1024px) {
            .blog-grid-hero {
                grid-template-columns: repeat(12, 1fr);
            }

            .blog-hero {
                grid-column: span 8;
            }

            .blog-sidebar {
                grid-column: span 4;
            }
        }

        .blog-featured {
            position: relative;
            aspect-ratio: 16/10;
            border-radius: 3rem;
            overflow: hidden;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            cursor: pointer;
        }

        .blog-featured img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 2s;
        }

        .blog-featured:hover img {
            transform: scale(1.05);
        }

        .blog-featured-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(to top, #020617, transparent, transparent);
        }

        .blog-featured-content {
            position: absolute;
            bottom: 3rem;
            left: 3rem;
            right: 3rem;
        }

        .blog-meta-tag {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 10px;
            font-weight: 900;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: rgba(255, 255, 255, 0.6);
            margin-bottom: 1.5rem;
        }

        .blog-featured-title {
            font-size: 2.25rem;
            font-weight: 900;
            color: var(--white);
            margin-bottom: 0;
            line-height: 0.9;
            text-transform: uppercase;
            letter-spacing: -0.05em;
            transition: color 0.2s;
        }

        .blog-featured:hover .blog-featured-title {
            color: var(--secondary);
        }

        .blog-sidebar-card {
            background-color: rgba(15, 23, 42, 0.4);
            backdrop-filter: blur(4px);
            border: 1px solid rgba(255, 255, 255, 0.05);
            border-radius: 2.5rem;
            overflow: hidden;
            transition: all 0.2s;
            cursor: pointer;
            display: block;
        }

        .blog-sidebar-card:hover {
            border-color: rgba(255, 255, 255, 0.2);
        }

        .blog-sidebar-title {
            font-size: 1.5rem;
            font-weight: 900;
            color: var(--white);
            text-transform: uppercase;
            line-height: 1.1;
            margin-bottom: 1rem;
            letter-spacing: -0.05em;
            transition: color 0.2s;
        }

        .blog-sidebar-card:hover .blog-sidebar-title {
            color: var(--primary);
        }

        .blog-read-more {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 10px;
            font-weight: 900;
            text-transform: uppercase;
            letter-spacing: 0.2em;
            color: var(--white);
            transition: color 0.2s;
        }

        .blog-sidebar-card:hover .blog-read-more {
            color: var(--secondary);
        }

        .blog-read-more i {
            transition: transform 0.2s;
        }

        .blog-sidebar-card:hover .blog-read-more i {
            transform: translateX(4px);
        }

        .btn-explore-blog i {
            transition: transform 0.2s;
        }

        .btn-explore-blog:hover i {
            transform: translateX(4px);
        }

        .sidebar-content {
            padding: 2.5rem;
            text-align: left;
        }


        /* STORY MODAL */
        .modal-overlay {
            position: fixed;
            inset: 0;
            z-index: 100;
            background-color: rgba(2, 6, 23, 0.95);
            backdrop-filter: blur(24px);
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.3s;
        }

        .modal-overlay.open {
            opacity: 1;
            pointer-events: auto;
        }

        .story-viewer {
            width: 100%;
            max-width: 450px;
            aspect-ratio: 9/16;
            background-color: var(--slate-900);
            border-radius: 3rem;
            overflow: hidden;
            position: relative;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            display: flex;
            flex-direction: column;
        }

        .story-progress {
            position: absolute;
            top: 1rem;
            left: 1rem;
            right: 1rem;
            height: 0.25rem;
            display: flex;
            gap: 0.25rem;
            z-index: 110;
        }

        .progress-segment {
            flex: 1;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 9999px;
            overflow: hidden;
        }

        .progress-bar {
            height: 100%;
            background-color: var(--white);
            width: 0%;
            transition: width 0.05s linear;
        }

        .close-modal {
            position: absolute;
            top: 1.5rem;
            right: 1.5rem;
            z-index: 110;
            color: var(--white);
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            width: 3rem;
            height: 3rem;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .close-modal:hover {
            transform: rotate(90deg);
        }
    </style>
</head>

<body class="no-scrollbar">

    @php
        $client = Auth::guard('client')->user();
        // Check if on Auto Enchère route
        $isAutoEnchere = request()->routeIs('nadoautoenchere.*');

        // Theme Colors
        $accentColor = $isAutoEnchere ? '#F37021' : '#FDD817';
        $buttonHoverBg = $isAutoEnchere ? '#F37021' : '#FDD817';
        $logoText = $isAutoEnchere ? 'AUTO ENCHÈRE' : 'NADO';
    @endphp


    <header class="nado-navbar sticky-top">
        <!-- Font Awesome & Lucide Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <script src="https://unpkg.com/lucide@latest"></script>

        <!-- Top Bar Info -->
        <div class="top-bar" style="background-color: #FDD817;">
            <div class="container custom-container top-bar-content">
                <div class="contact-info">
                    <div class="info-item">
                        <i data-lucide="mail"></i>
                        <a href="mailto:contact@nado.ma">contact@nado.ma</a>
                    </div>
                    <div class="info-item">
                        <i data-lucide="phone-call"></i>
                        <a href="tel:+212520070611">+212 520 070 611</a>
                    </div>
                </div>

                <div class="social-links">
                    <a href="#"><i data-lucide="facebook"></i></a>
                    <a href="#"><i data-lucide="instagram"></i></a>
                    <a href="#"><i data-lucide="linkedin"></i></a>
                </div>
            </div>
        </div>

        <!-- Main Navigation -->
        <nav class="main-nav">
            <div class="container custom-container nav-content">
                <div class="left-section">
                    <!-- Logo -->
                    <a href="{{ $isAutoEnchere ? route('nadoautoenchere.prelogin') : route('index') }}"
                        class="logo-link">
                        @if ($isAutoEnchere)
                            <span class="logo-text">
                                <span class="text-dark">AUTO </span>
                                <span style="color: #F37021;">ENCHÈRE</span>
                            </span>
                        @else
                            <span class="logo-text">
                                <span style="color: #1459DD;">NA</span>
                                <span style="color: #FDD817;">DO</span>
                            </span>
                        @endif
                    </a>

                    <!-- Desktop Menu -->
                    <div class="desktop-menu">
                        @if ($isAutoEnchere)
                            <a href="{{ route('achat.index') }}" class="nav-link">Acheter</a>
                            <div class="nav-dropdown-wrapper">
                                <button class="nav-link dropdown-trigger">
                                    Vendre <i data-lucide="chevron-right" class="icon-sm"></i>
                                </button>
                                <div class="nav-dropdown-menu">
                                    <a href="{{ route('vente.form') }}">Particulier</a>
                                    <a href="{{ route('client.login') }}">Professionnel</a>
                                </div>
                            </div>
                        @else
                            <a href="{{ route('achat.index') }}" class="nav-link">Achat</a>
                            <a href="{{ route('vente.form') }}" class="nav-link">Vente</a>
                            <a href="{{ route('nadoautoenchere.prelogin') }}"
                                class="nav-link highlight-link">Auto-enchère</a>
                            <a href="{{ route('reprise.index') }}" class="nav-link">Reprise</a>
                            <a href="{{ route('financement.index') }}" class="nav-link">Auto-financement</a>
                            <a href="{{ route('services.index') }}" class="nav-link">À propos</a>
                        @endif
                    </div>
                </div>

                <!-- Right Actions -->
                <div class="right-section">
                    @if ($client)
                        <div class="user-dropdown-wrapper">
                            <button class="cta-button outline-btn">
                                <i data-lucide="user"></i>
                                <span>{{ $client->name }}</span>
                                <i data-lucide="chevron-down" class="icon-sm"></i>
                            </button>
                            <div class="user-dropdown-menu">
                                <a href="{{ route('client.dashboard') }}"><i data-lucide="layout-dashboard"></i>
                                    Mon espace</a>
                                <form method="POST" action="{{ route('logout') }}">
                                    @csrf
                                    <button type="submit" class="logout-btn"><i data-lucide="log-out"></i>
                                        Déconnexion</button>
                                </form>
                            </div>
                        </div>
                    @else
                        <a href="{{ route('client.login') }}" class="cta-button outline-btn">
                            @if ($isAutoEnchere)
                                Créez un compte
                            @else
                                Publier une annonce
                            @endif
                        </a>
                    @endif

                    <button id="mobileMenuBtn" class="mobile-menu-btn">
                        <i data-lucide="menu"></i>
                    </button>
                </div>
            </div>
        </nav>

        <!-- Mobile Drawer -->
        <div id="mobileDrawer" class="mobile-drawer">
            <div id="drawerBackdrop" class="drawer-backdrop"></div>
            <div id="drawerContent" class="drawer-content">
                <div class="drawer-header">
                    <span class="logo-text">
                        @if ($isAutoEnchere)
                            <span class="text-dark">AUTO </span>
                            <span style="color: #F37021;">ENCHÈRE</span>
                        @else
                            <span style="color: #1459DD;">NA</span>
                            <span style="color: #FDD817;">DO</span>
                        @endif
                    </span>
                    <button id="closeDrawerBtn" class="close-btn">
                        <i data-lucide="x"></i>
                    </button>
                </div>

                <div class="drawer-links">
                    @if ($isAutoEnchere)
                        <a href="{{ route('achat.index') }}">Acheter</a>
                        <a href="{{ route('vente.form') }}">Vendre (Particulier)</a>
                        <a href="{{ route('client.login') }}">Vendre (Pro)</a>
                    @else
                        <a href="{{ route('achat.index') }}">Achat</a>
                        <a href="{{ route('vente.form') }}">Vente</a>
                        <a href="{{ route('nadoautoenchere.prelogin') }}" style="color: #1459DD;">Auto-enchère</a>
                        <a href="{{ route('reprise.index') }}">Reprise</a>
                        <a href="{{ route('financement.index') }}">Auto-financement</a>
                        <a href="{{ route('services.index') }}">À propos</a>
                    @endif
                </div>

                <div class="drawer-footer">
                    @if ($client)
                        <a href="{{ route('client.dashboard') }}" class="drawer-cta"
                            style="background-color: {{ $accentColor }};">
                            <i data-lucide="layout-dashboard"></i> Mon espace
                        </a>
                    @else
                        <a href="{{ route('client.login') }}" class="drawer-cta"
                            style="background-color: {{ $accentColor }};">
                            <i data-lucide="user"></i> Publier une annonce
                        </a>
                    @endif

                    <div class="drawer-socials">
                        <a href="#"><i data-lucide="facebook"></i></a>
                        <a href="#"><i data-lucide="instagram"></i></a>
                        <a href="#"><i data-lucide="linkedin"></i></a>
                    </div>

                    <div class="drawer-divider"></div>

                    <div class="drawer-support">
                        <p>Support NADO</p>
                        <a href="tel:+212520070611">+212 520 070 611</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Styles -->
        <style>
            :root {
                --primary-blue: #1459DD;
                --slate-900: #0f172a;
                --slate-700: #334155;
                --slate-50: #f8fafc;
                --border-color: #e2e8f0;
            }

            .nado-navbar {
                font-family: 'Inter', sans-serif;
                width: 100%;
                z-index: 1000;
                position: relative;
                direction: ltr;
            }

            .sticky-top {

                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                z-index: 1000;
            }

            /* Top Bar */
            .top-bar {
                padding: 10px 16px;
                border-bottom: 1px solid rgba(0, 0, 0, 0.05);
                color: var(--slate-900);
            }

            .custom-container {
                max-width: 1280px;
                margin: 0 auto;
                padding: 0 16px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
            }

            .contact-info {
                display: flex;
                gap: 12px;
            }

            .info-item {
                display: flex;
                align-items: center;
                gap: 8px;
                font-size: 11px;
                font-weight: 900;
                text-transform: uppercase;
                letter-spacing: 0.1em;
                opacity: 0.8;
            }

            .info-item i {
                width: 12px;
                height: 12px;
                color: var(--primary-blue);
            }

            .info-item a {
                color: inherit;
                text-decoration: none;
                transition: color 0.2s;
            }

            .info-item a:hover {
                color: var(--primary-blue);
            }

            .social-links {
                display: flex;
                gap: 20px;
            }

            .social-links a {
                color: var(--slate-900);
                opacity: 0.6;
                transition: opacity 0.2s, color 0.2s;
            }

            .social-links a:hover {
                color: var(--primary-blue);
                opacity: 1;
            }

            .social-links i {
                width: 20px;
                height: 20px;
            }

            /* Main Nav */
            .main-nav {
                background: white;
                border-bottom: 1px solid var(--border-color);
                height: 96px;
                display: flex;
                align-items: center;
            }

            .nav-content {
                height: 100%;
                width: 100%;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .left-section {
                display: flex;
                align-items: center;
                gap: 64px;
            }

            .logo-link {
                text-decoration: none;
                transition: transform 0.2s;
            }

            .logo-link:hover {
                transform: scale(1.05);
            }

            .logo-text {
                font-size: 2.25rem;
                /* 36px */
                font-weight: 900;
                text-transform: uppercase;
                line-height: 1;
                letter-spacing: -0.05em;
            }

            .text-dark {
                color: var(--slate-900);
            }

            /* Desktop Menu */
            .desktop-menu {
                display: none;
                align-items: center;
                gap: 12px;
            }

            @media (min-width: 1024px) {
                .desktop-menu {
                    display: flex;
                }
            }

            .nav-link {
                font-size: 14.4px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.025em;
                padding: 8px 12px;
                border-radius: 16px;
                color: var(--slate-700);
                text-decoration: none;
                transition: all 0.2s;
                background: transparent;
                border: none;
                cursor: pointer;
            }

            .nav-link:hover {
                background-color: #f1f5f9;
                color: var(--primary-blue);
            }

            .highlight-link {
                color: var(--primary-blue);
                background-color: #dbeafe;
            }

            .highlight-link:hover {
                background-color: #bfdbfe;
            }

            /* Dropdown */
            .nav-dropdown-wrapper {
                position: relative;
            }

            .dropdown-trigger {
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .nav-dropdown-menu {
                position: absolute;
                top: 100%;
                left: 0;
                margin-top: 8px;
                background: white;
                border-radius: 16px;
                box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
                border: 1px solid var(--border-color);
                min-width: 200px;
                overflow: hidden;
                display: none;
            }

            .nav-dropdown-wrapper:hover .nav-dropdown-menu {
                display: block;
            }

            .nav-dropdown-menu a {
                display: block;
                padding: 16px 20px;
                font-size: 14px;
                font-weight: 700;
                text-transform: uppercase;
                color: var(--slate-700);
                text-decoration: none;
                transition: background 0.2s;
            }

            .nav-dropdown-menu a:hover {
                background-color: #fff7ed;
                color: #F37021;
            }

            /* Right Section */
            .right-section {
                margin-left: auto;
                display: flex;
                align-items: center;
                gap: 12px;
            }

            .cta-button {
                display: flex;
                align-items: center;
                gap: 8px;
                padding: 10px 16px;
                border-radius: 16px;
                font-size: 15px;
                font-weight: 800;
                text-transform: uppercase;
                letter-spacing: 0.1em;
                text-decoration: none;
                cursor: pointer;
                transition: all 0.2s;
            }

            .cta-button:active {
                transform: scale(0.95);
            }

            .outline-btn {
                background-color: rgba(253, 216, 23, 0.2);
                border: 1px solid rgba(253, 216, 23, 0.5);
                color: var(--slate-900);
            }

            .outline-btn:hover {
                background-color: #FDD817;
            }

            /* Adjust hover for enchere mode via JS or specific classes if needed,
                   but inline style logic handles the main color. Here we default to Nado yellow styles. */

            .desktop-only {
                display: none;
            }

            @media (min-width: 1024px) {
                .desktop-only {
                    display: flex;
                }
            }

            .mobile-menu-btn {
                display: block;
                padding: 12px;
                background-color: var(--slate-50);
                border: none;
                border-radius: 12px;
                cursor: pointer;
                color: var(--slate-900);
            }

            @media (min-width: 1024px) {
                .mobile-menu-btn {
                    display: none;
                }
            }

            .user-dropdown-wrapper {
                position: relative;
                display: none;
            }

            @media (min-width: 1024px) {
                .user-dropdown-wrapper {
                    display: block;
                }
            }

            .user-dropdown-menu {
                position: absolute;
                right: 0;
                top: 100%;
                margin-top: 8px;
                width: 192px;
                background: white;
                border-radius: 12px;
                box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
                border: 1px solid var(--border-color);
                display: none;
                overflow: hidden;
            }

            .user-dropdown-wrapper:hover .user-dropdown-menu {
                display: block;
            }

            .user-dropdown-menu a,
            .user-dropdown-menu button {
                display: flex;
                align-items: center;
                width: 100%;
                padding: 12px 16px;
                font-size: 14px;
                font-weight: 700;
                text-align: left;
                background: none;
                border: none;
                cursor: pointer;
                text-decoration: none;
                color: var(--slate-700);
            }

            .user-dropdown-menu a:hover {
                background-color: #f8fafc;
                color: var(--primary-blue);
            }

            .user-dropdown-menu i {
                width: 16px;
                height: 16px;
                margin-right: 8px;
            }

            .logout-btn {
                color: #dc2626 !important;
            }

            .logout-btn:hover {
                background-color: #fef2f2 !important;
            }

            /* Mobile Drawer */
            .mobile-drawer {
                position: fixed;
                inset: 0;
                z-index: 1100;
                visibility: hidden;
                transition: visibility 0.5s;
            }

            .mobile-drawer.visible {
                visibility: visible;
                pointer-events: auto;
            }

            .mobile-drawer.visible .drawer-backdrop {
                opacity: 1;
            }

            .drawer-backdrop {
                position: absolute;
                inset: 0;
                background-color: rgba(15, 23, 42, 0.6);
                backdrop-filter: blur(8px);
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .visible .drawer-backdrop {
                opacity: 1;
            }

            .drawer-content {
                position: fixed;
                /* Changed from absolute */
                top: 0;
                right: 0;
                bottom: 0;
                /* Added */
                height: 100vh;
                /* Changed from 100% */
                width: 85%;
                max-width: 420px;
                background: white;
                box-shadow: -10px 0 50px rgba(0, 0, 0, 0.3);
                transform: translateX(100%);
                transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                display: flex;
                flex-direction: column;
                overflow-y: auto;
            }

            .mobile-drawer.visible .drawer-content {
                transform: translateX(0);
            }

            .visible .drawer-content {
                transform: translateX(0);
            }

            .drawer-header {
                padding: 32px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .close-btn {
                background: none;
                border: none;
                color: #94a3b8;
                cursor: pointer;
            }

            .close-btn:hover {
                color: var(--slate-900);
            }

            .drawer-links {
                flex: 1;
                overflow-y: auto;
                padding: 16px 32px;
                display: flex;
                flex-direction: column;
                gap: 24px;
            }

            .drawer-links a {
                font-size: 18px;
                font-weight: 900;
                text-transform: uppercase;
                letter-spacing: -0.025em;
                color: var(--slate-900);
                text-decoration: none;
                transition: color 0.2s;
            }

            .drawer-links a:hover {
                color: var(--primary-blue);
            }

            .drawer-footer {
                padding: 40px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .drawer-cta {
                width: 100%;
                padding: 24px;
                border-radius: 32px;
                font-size: 14px;
                font-weight: 900;
                text-transform: uppercase;
                letter-spacing: 0.2em;
                color: var(--slate-900);
                text-decoration: none;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 12px;
                margin-bottom: 48px;
                transition: transform 0.2s;
            }

            .drawer-cta:active {
                transform: scale(0.95);
            }

            .drawer-socials {
                display: flex;
                gap: 40px;
                margin-bottom: 48px;
            }

            .drawer-socials a {
                color: #94a3b8;
                transition: color 0.2s;
            }

            .drawer-socials a:hover {
                color: var(--slate-900);
            }

            .drawer-divider {
                width: 100%;
                height: 1px;
                background-color: #f1f5f9;
                margin-bottom: 40px;
            }

            .drawer-support {
                text-align: center;
            }

            .drawer-support p {
                font-size: 14px;
                font-weight: 800;
                text-transform: uppercase;
                letter-spacing: 0.025em;
                margin-bottom: 12px;
            }

            .drawer-support a {
                font-size: 20px;
                font-weight: 900;
                color: var(--slate-900);
                text-decoration: none;
                transition: color 0.2s;
            }

            .drawer-support a:hover {
                color: var(--primary-blue);
            }

            .icon-sm {
                width: 16px;
                height: 16px;
            }
        </style>
    </header>

    <!-- Navbar Scripts -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize Lucide Icons
            if (typeof lucide !== 'undefined') {
                lucide.createIcons();
            }

            // Drawer Elements
            const mobileMenuBtn = document.getElementById('mobileMenuBtn');
            const closeDrawerBtn = document.getElementById('closeDrawerBtn');
            const mobileDrawer = document.getElementById('mobileDrawer');
            const drawerBackdrop = document.getElementById('drawerBackdrop');

            // Open Drawer
            function openDrawer() {
                if (mobileDrawer) {
                    mobileDrawer.classList.add('visible');
                    document.body.style.overflow = 'hidden';
                    console.log('Drawer opened');
                }
            }

            // Close Drawer
            function closeDrawer() {
                if (mobileDrawer) {
                    mobileDrawer.classList.remove('visible');
                    document.body.style.overflow = '';
                    console.log('Drawer closed');
                }
            }

            // Event Listeners
            if (mobileMenuBtn) {
                mobileMenuBtn.addEventListener('click', function(e) {
                    e.stopPropagation();
                    openDrawer();
                });
            }

            if (closeDrawerBtn) {
                closeDrawerBtn.addEventListener('click', function(e) {
                    e.stopPropagation();
                    closeDrawer();
                });
            }

            if (drawerBackdrop) {
                drawerBackdrop.addEventListener('click', closeDrawer);
            }

            // Close drawer when clicking on a link (optional)
            const drawerLinks = document.querySelectorAll('.drawer-links a');
            drawerLinks.forEach(link => {
                link.addEventListener('click', closeDrawer);
            });

            // Close on ESC key
            document.addEventListener('keydown', function(e) {
                if (e.key === 'Escape' && mobileDrawer && mobileDrawer.classList.contains('visible')) {
                    closeDrawer();
                }
            });
        });
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize Lucide Icons
            if (typeof lucide !== 'undefined') {
                lucide.createIcons();
            }

            // Drawer Logic
            const mobileMenuBtn = document.getElementById('mobileMenuBtn');
            const closeDrawerBtn = document.getElementById('closeDrawerBtn');
            const mobileDrawer = document.getElementById('mobileDrawer');
            const drawerBackdrop = document.getElementById('drawerBackdrop');
            const drawerContent = document.getElementById('drawerContent');

            function openDrawer() {
                if (!mobileDrawer) return;
                mobileDrawer.classList.add('visible');
                document.body.style.overflow = 'hidden';
            }

            function closeDrawer() {
                if (!mobileDrawer) return;
                mobileDrawer.classList.remove('visible');
                document.body.style.overflow = 'unset';
            }

            if (mobileMenuBtn) mobileMenuBtn.addEventListener('click', openDrawer);
            if (closeDrawerBtn) closeDrawerBtn.addEventListener('click', closeDrawer);
            if (drawerBackdrop) drawerBackdrop.addEventListener('click', closeDrawer);
        });
    </script>

    <!-- CONTENT -->
    <div class="flex flex-col bg-white" style="padding-top: 140px;">

        <!-- 1. HERO -->
        <section class="hero">
            <div class="hero-bg">
                <div class="hero-slider owl-carousel">
                    @if (count($imgslider) > 0)
                        @foreach ($imgslider as $av)
                            <div class="item">
                                <a href="{{ $av->link }}">
                                    <img
                                        src="{{ $av->image ? asset('storage/imgslider/' . $av->image) : asset('images/default.jpg') }}" />
                                </a>
                            </div>
                        @endforeach
                    @else
                        <div class="item">
                            <img src="https://images.unsplash.com/photo-1614162692292-7ac56d7f7f1e?auto=format&fit=crop&q=80&w=2400"
                                alt="Hero Default" />
                        </div>
                    @endif
                </div>
                <!-- <img src="https://images.unsplash.com/photo-1614162692292-7ac56d7f7f1e?auto=format&fit=crop&q=80&w=2400"
                    alt="Hero" /> -->
                <div class="hero-overlay"></div>
            </div>
            <div class="container hero-content">
                <div class="hero-badge">
                    <span
                        style="width: 8px; height: 8px; border-radius: 50%; background-color: var(--secondary); display: inline-block;"></span>
                    <span>Expérience Premium NADO</span>
                </div>
                <h1 class="hero-title">L'Auto <br /><span class="text-gradient">Redéfinie</span></h1>
                <p class="hero-desc">Le plus grand catalogue de véhicules certifiés au Maroc. Achat, vente et enchères
                    en un seul lieu.</p>
            </div>
        </section>

        <!-- 2. STORIES -->
        <section class="stories">
            <div class="container">
                <div class="story-header">
                    <span class="story-subtitle">EN DIRECT DE NADO</span>
                    <h2 class="story-title">HISTOIRES NADO</h2>
                </div>

                <div class="story-scroll no-scrollbar">
                    @foreach ($stories as $story)
                        <div class="nado-story-item" onclick="event.stopPropagation(); launchNadoStory(this)"
                            data-src="{{ asset('storage/' . $story->media_path) }}"
                            data-type="{{ $story->media_type }}"
                            style="flex-shrink: 0; width: 145px; aspect-ratio: 9/16; position: relative; border-radius: 2rem; overflow: hidden; cursor: pointer; border: 1px solid rgba(255, 255, 255, 0.05); box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);">
                            @if ($story->media_type == 'image')
                                <img src="{{ asset('storage/' . $story->media_path) }}" class="bg-img"
                                    alt="Story" style="width: 100%; height: 100%; object-fit: cover;" />
                            @else
                                <video src="{{ asset('storage/' . $story->media_path) }}" class="bg-img" muted loop
                                    autoplay playsinline style="width: 100%; height: 100%; object-fit: cover;"></video>
                            @endif
                            <div class="story-gradient"
                                style="position: absolute; inset: 0; background: linear-gradient(to top, rgba(0,0,0,0.8), transparent);">
                            </div>

                            <div class="story-info" style="position: absolute; bottom: 1.25rem; left: 1.25rem;">
                                <span class="story-name" style="color: white; font-weight: 900; font-size: 11px;">NADO
                                    Story</span>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </section>

        <!-- STORY MODAL (Popup) - RENAMED -->

        <div id="nado-story-popup"
            style="display: none; position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; background-color: rgba(0, 0, 0, 0.85); backdrop-filter: blur(4px); z-index: 999999; align-items: center; justify-content: center;">

            <button onclick="dismissNadoStory()"
                style="position: absolute; top: 20px; right: 20px; color: white; background: rgba(255, 255, 255, 0.2); width: 44px; height: 44px; border-radius: 50%; border: none; cursor: pointer; z-index: 1000000; font-size: 2rem; display: flex; align-items: center; justify-content: center; transition: background 0.2s;">
                &times;
            </button>

            <!-- Card Container -->
            <div
                style="position: relative; background: #ffffff; padding: 12px; border-radius: 20px; box-shadow: 0 20px 60px rgba(0,0,0,0.5); display: flex; flex-direction: column; width: auto; max-width: 90vw;">

                <!-- Card Header -->
                <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 12px; padding: 0 4px;">
                    <div
                        style="width: 32px; height: 32px; border-radius: 50%; background: #1459DD; display: flex; align-items: center; justify-content: center; color: white; font-weight: bold; font-size: 10px;">
                        N</div>
                    <div style="display: flex; flex-direction: column;">
                        <span style="font-weight: 700; color: #1e293b; font-size: 14px; line-height: 1;">NADO
                            Officiel</span>
                        <span style="font-size: 11px; color: #64748b;">En direct</span>
                    </div>
                </div>

                <!-- Media Content -->
                <div style="position: relative; border-radius: 12px; overflow: hidden; background: #000;">
                    <img id="nado-story-img" src=""
                        style="max-height: 75vh; height: auto; max-width: 100%; object-fit: contain; display: none;" />
                    <video id="nado-story-video" src=""
                        style="max-height: 75vh; height: auto; max-width: 100%; object-fit: contain; display: none;"
                        controls autoplay></video>
                </div>
            </div>
        </div>

        <!-- 3. SEARCH & BRANDS -->
        <section class="search-section">
            <div class="container" style="max-width: 64rem;">
                <div class="search-bar">
                    <!-- Marque -->
                    <div class="search-item">
                        <i data-lucide="car-front" style="color: var(--primary); width: 18px; height: 18px;"></i>
                        <div style="flex: 1;">
                            <label>Marque</label>
                            <select>
                                <option>Toutes marques</option>
                                <option>Porsche</option>
                                <option>BMW</option>
                                <option>Mercedes</option>
                            </select>
                        </div>
                        <div class="divider"></div>
                    </div>

                    <!-- Modele -->
                    <div class="search-item">
                        <i data-lucide="settings-2" style="color: var(--primary); width: 18px; height: 18px;"></i>
                        <div style="flex: 1;">
                            <label>Modèle</label>
                            <select>
                                @foreach ($brands as $brand)
                                    <option value="{{ $brand->name }}" data-id="{{ $brand->id }}">
                                        {{ $brand->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="divider"></div>
                    </div>

                    <!-- Budget -->
                    <div class="search-item">
                        <i data-lucide="tags" style="color: var(--primary); width: 18px; height: 18px;"></i>
                        <div style="flex: 1;">
                            <label>Budget Max</label>
                            <select>
                                <option>Indifférent</option>
                                <option>+ 500 000 MAD</option>
                                <option>+ 1 000 000 MAD</option>
                            </select>
                        </div>
                    </div>

                    <button class="btn-find">
                        <i data-lucide="search" style="width: 18px; height: 18px; stroke-width: 3;"></i>
                        <span>Trouver</span>
                    </button>
                </div>
            </div>

            <!-- Logos -->
            <div class="brands-ticker">

                <div class="ticker-track">
                    @foreach ($brands as $brand)
                        <img src="{{ asset('storage/brands/' . $brand->logo) }}" class="brand-logo"
                            alt="{{ $brand->name }}" />
                    @endforeach
                    <!-- Duplicate for infinite scroll -->
                    @foreach ($brands as $brand)
                        <img src="{{ asset('storage/brands/' . $brand->logo) }}" class="brand-logo"
                            alt="{{ $brand->name }}" />
                    @endforeach
                </div>
            </div>
        </section>

        <!-- 4. ANNONCES CERTIFIÉES -->
        <section class="ads-section">
            <div class="container">
                <h2 class="section-title">Dernières <br /><span class="text-primary">ANNONCES</span> <span
                        class="text-secondary">CERTIFIÉES</span></h2>

                <div class="grid-ads">
                    @foreach ($similar_ads->take(3) as $ad)
                        <a href="{{ route('achat.detail', ['marque' => str_replace(' ', '', $ad->mark), 'modele' => str_replace(' ', '', $ad->modele), 'id' => $ad['id']]) }}"
                            class="ad-card" style="text-decoration: none; color: inherit; display: block;">
                            <div class="ad-image-container">
                                <img src="{{ asset('storage/ads/' . $ad->pathImageAds()) }}" class="ad-main-img"
                                    alt="Annonce" style="width: 100%; height: 100%; object-fit: cover;" />
                                <div class="ad-status-badge status-available">DISPONIBLE</div>
                                <div class="ad-price-tag">
                                    <span class="ad-price-text">{{ number_format($ad->price, 0, ',', ' ') }}
                                        MAD</span>
                                </div>
                                <div class="ad-video-preview">
                                    <img src="{{ asset('storage/ads/' . $ad->pathImageAds()) }}"
                                        style="width: 100%; height: 100%; object-fit: cover;" />
                                    <div class="ad-play-btn">
                                        <div class="ad-play-icon">
                                            <i data-lucide="play"
                                                style="width: 12px; height: 12px; fill: white; margin-left: 2px;"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ad-content">
                                <h3 class="ad-title-new">
                                    {{ $ad->brand ? $ad->brand->name : 'Marque' }}
                                    {{ $ad->modeleRelation ? $ad->modeleRelation->name : 'Modèle' }}
                                </h3>
                                <div class="ad-specs-grid">
                                    <div class="ad-spec-item"><i data-lucide="calendar"
                                            style="width: 14px; height: 14px; color: #1459DD;"></i><span
                                            class="ad-spec-label">{{ $ad->year }}</span></div>
                                    <div class="ad-spec-item"><i data-lucide="gauge"
                                            style="width: 14px; height: 14px; color: #1459DD;"></i><span
                                            class="ad-spec-label">{{ $ad->km }} km</span></div>
                                    <div class="ad-spec-item"><i data-lucide="settings-2"
                                            style="width: 14px; height: 14px; color: #1459DD;"></i><span
                                            class="ad-spec-label">{{ $ad->boite_vitesse ?? 'Auto' }}</span></div>
                                    <div class="ad-spec-item"><i data-lucide="fuel"
                                            style="width: 14px; height: 14px; color: #1459DD;"></i><span
                                            class="ad-spec-label">{{ $ad->carburant }}</span></div>
                                </div>
                                <div class="ad-footer-btn">
                                    <div class="flex flex-col">
                                        <span class="monthly-label">VOTRE MENSUALITÉ À PARTIR DE</span>
                                        <div class="monthly-price">
                                            <span
                                                class="monthly-amount">{{ number_format($ad->price / 72, 0, ',', ' ') }}</span>
                                            <span class="monthly-unit">MAD / MOIS</span>
                                        </div>
                                    </div>
                                    <div class="arrow-circle"><i data-lucide="arrow-right"
                                            style="width: 18px; height: 18px;"></i></div>
                                </div>
                            </div>
                        </a>
                    @endforeach
                </div>

                <button class="btn-view-all"><span>Voir tout le catalogue</span><i data-lucide="arrow-right"
                        style="width: 20px; height: 20px;"></i></button>
            </div>
        </section>


        <!-- 6. PUB NADO EXPERT -->
        <section class="pub-section">
            <div class="container">
                <div class="expert-card">
                    <div class="expert-content">
                        <div class="label-trust"><i data-lucide="shield-check"
                                style="color: var(--secondary); width: 24px; height: 24px;"></i><span>Label
                                Confiance</span></div>
                        <h2 class="expert-title">Expertise <span class="text-primary">110 Points</span></h2>
                        <p class="expert-desc">Chaque véhicule certifié passe une inspection chirurgicale avant sa mise
                            en ligne.</p>
                        <button class="btn-discover">Découvrir le rapport <i data-lucide="arrow-right"
                                style="width: 16px; height: 16px;"></i></button>
                    </div>
                    <div class="expert-image"><img
                            src="https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?auto=format&fit=crop&q=80&w=800"
                            alt="Expertise" /></div>
                </div>
            </div>
        </section>

        <!-- 7. ANNONCES PARTICULIERS -->
        <section class="ads-section" style="background-color: var(--white);">
            <div class="container">
                <h2 class="section-title">Dernières <br /><span class="text-primary">ANNONCES</span> <span
                        class="text-secondary">PARTICULIERS</span></h2>

                <div class="grid-ads">
                    @foreach ($similar_adsp->take(3) as $ad)
                        <a href="{{ route('achat.detail', ['marque' => str_replace(' ', '', $ad->mark), 'modele' => str_replace(' ', '', $ad->modele), 'id' => $ad['id']]) }}"
                            class="ad-card" style="text-decoration: none; color: inherit; display: block;">
                            <div class="ad-image-container">
                                <img src="{{ isset($ad->images[0]) ? asset('storage/ads/' . $ad->images[0]) : asset('images/default.jpg') }}"
                                    class="ad-main-img" alt="Annonce"
                                    style="width: 100%; height: 100%; object-fit: cover;" />
                                <div class="ad-status-badge status-available">DISPONIBLE</div>
                                <div class="ad-price-tag">
                                    <span class="ad-price-text">{{ number_format($ad->price, 0, ',', ' ') }}
                                        MAD</span>
                                </div>
                                <div class="ad-video-preview">
                                    <img src="{{ isset($ad->images[0]) ? asset('storage/ads/' . $ad->images[0]) : asset('images/default.jpg') }}"
                                        style="width: 100%; height: 100%; object-fit: cover;" />
                                    <div class="ad-play-btn">
                                        <div class="ad-play-icon">
                                            <i data-lucide="play"
                                                style="width: 12px; height: 12px; fill: white; margin-left: 2px;"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ad-content">
                                <h3 class="ad-title-new">
                                    {{ $ad->brand ? $ad->brand->name : 'Marque' }}
                                    {{ $ad->modeleRelation ? $ad->modeleRelation->name : 'Modèle' }}
                                </h3>
                                <div class="ad-specs-grid">
                                    <div class="ad-spec-item"><i data-lucide="calendar"
                                            style="width: 14px; height: 14px; color: #1459DD;"></i><span
                                            class="ad-spec-label">{{ $ad->year }}</span></div>
                                    <div class="ad-spec-item"><i data-lucide="gauge"
                                            style="width: 14px; height: 14px; color: #1459DD;"></i><span
                                            class="ad-spec-label">{{ $ad->km }} km</span></div>
                                    <div class="ad-spec-item"><i data-lucide="settings-2"
                                            style="width: 14px; height: 14px; color: #1459DD;"></i><span
                                            class="ad-spec-label">{{ $ad->boite_vitesse ?? 'Auto' }}</span></div>
                                    <div class="ad-spec-item"><i data-lucide="fuel"
                                            style="width: 14px; height: 14px; color: #1459DD;"></i><span
                                            class="ad-spec-label">{{ $ad->carburant }}</span></div>
                                </div>
                                <div class="ad-footer-btn">
                                    <div class="flex flex-col">
                                        <span class="monthly-label">VOTRE MENSUALITÉ À PARTIR DE</span>
                                        <div class="monthly-price">
                                            <span
                                                class="monthly-amount">{{ number_format($ad->price / 72, 0, ',', ' ') }}</span>
                                            <span class="monthly-unit">MAD / MOIS</span>
                                        </div>
                                    </div>
                                    <div class="arrow-circle"><i data-lucide="arrow-right"
                                            style="width: 18px; height: 18px;"></i></div>
                                </div>
                            </div>
                        </a>
                    @endforeach
                </div>
            </div>
        </section>

        <!-- 8. FINANCEMENT FLASH -->
        <section class="finance-section">
            <div class="container">
                <div class="finance-card">
                    <div class="expert-content">
                        <div class="label-trust"><i data-lucide="hand-coins"
                                style="color: var(--slate-900); width: 24px; height: 24px;"></i><span
                                style="color: var(--slate-900);">Solutions Finance</span></div>
                        <h2 class="expert-title" style="color: var(--slate-900);">Financement <br /><span
                                class="text-primary">Accordé en 24H</span></h2>
                        <p class="expert-desc" style="color: rgba(15, 23, 42, 0.7); font-weight: 700;">Réponse de
                            principe immédiate. Taux préférentiels pour nos clients Premium.</p>
                        <button class="btn-discover"
                            style="background-color: var(--slate-900); color: var(--white);">Simuler mon crédit <i
                                data-lucide="trending-up" style="width: 16px; height: 16px;"></i></button>
                    </div>
                    <div class="finance-image"><img
                            src="https://images.unsplash.com/photo-1554224155-169641357599?auto=format&fit=crop&q=80&w=800"
                            alt="Finance" /></div>
                </div>
            </div>
        </section>

        <!-- 9. ANNONCES PROS -->
        <section class="ads-section">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Dernières <br /><span class="text-primary">ANNONCES</span> <span
                            class="text-secondary">PROS</span></h2>
                </div>
                <div class="grid-ads">
                    <!-- Audi RS6 -->
                    <div class="ad-card">
                        <div class="ad-image-container">
                            <img src="https://images.unsplash.com/photo-1606152424101-ad4e8a4d9ee4?auto=format&fit=crop&q=80&w=800"
                                class="ad-main-img" />
                            <div class="ad-status-badge status-available">Disponible</div>
                            <div class="ad-price-tag">
                                <span class="ad-price-text">1,850,000 MAD</span>
                            </div>
                            <div class="ad-video-preview">
                                <img
                                    src="https://images.unsplash.com/photo-1606152424101-ad4e8a4d9ee4?auto=format&fit=crop&q=80&w=200" />
                                <div class="ad-play-btn">
                                    <div class="ad-play-icon"><i data-lucide="play"
                                            style="width: 14px; height: 14px; fill: white; margin-left: 2px;"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ad-content">
                            <h3 class="ad-title-new">Audi RS6 Avant</h3>
                            <div class="ad-specs-grid">
                                <div class="ad-spec-item"><i data-lucide="calendar"
                                        style="width: 16px; height: 16px; color: #1459DD;"></i><span
                                        class="ad-spec-label">2023</span></div>
                                <div class="ad-spec-item"><i data-lucide="gauge"
                                        style="width: 16px; height: 16px; color: #1459DD;"></i><span
                                        class="ad-spec-label">8,200 km</span></div>
                                <div class="ad-spec-item"><i data-lucide="settings-2"
                                        style="width: 16px; height: 16px; color: #1459DD;"></i><span
                                        class="ad-spec-label">Auto</span></div>
                                <div class="ad-spec-item"><i data-lucide="fuel"
                                        style="width: 16px; height: 16px; color: #1459DD;"></i><span
                                        class="ad-spec-label">Essence</span></div>
                            </div>
                            <div class="ad-footer-btn">
                                <div class="flex flex-col">
                                    <span class="monthly-label">VOTRE MENSUALITÉ À PARTIR DE</span>
                                    <div class="monthly-price"><span class="monthly-amount">22,000</span> <span
                                            class="monthly-unit">MAD / MOIS</span></div>
                                </div>
                                <div class="arrow-circle"><i data-lucide="arrow-right"
                                        style="width: 20px; height: 20px;"></i></div>
                            </div>
                        </div>
                    </div>
                    <!-- Bentley -->
                    <div class="ad-card">
                        <div class="ad-image-container">
                            <img src="https://images.unsplash.com/photo-1621135802920-133df287f89c?auto=format&fit=crop&q=80&w=800"
                                class="ad-main-img" />
                            <div class="ad-status-badge status-available">Disponible</div>
                            <div class="ad-price-tag">
                                <span class="ad-price-text">3,200,000 MAD</span>
                            </div>
                            <div class="ad-video-preview">
                                <img
                                    src="https://images.unsplash.com/photo-1621135802920-133df287f89c?auto=format&fit=crop&q=80&w=200" />
                                <div class="ad-play-btn">
                                    <div class="ad-play-icon"><i data-lucide="play"
                                            style="width: 14px; height: 14px; fill: white; margin-left: 2px;"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ad-content">
                            <h3 class="ad-title-new">Bentley Continental GT</h3>
                            <div class="ad-specs-grid">
                                <div class="ad-spec-item"><i data-lucide="calendar"
                                        style="width: 16px; height: 16px; color: #1459DD;"></i><span
                                        class="ad-spec-label">2021</span></div>
                                <div class="ad-spec-item"><i data-lucide="gauge"
                                        style="width: 16px; height: 16px; color: #1459DD;"></i><span
                                        class="ad-spec-label">14,500 km</span></div>
                                <div class="ad-spec-item"><i data-lucide="settings-2"
                                        style="width: 16px; height: 16px; color: #1459DD;"></i><span
                                        class="ad-spec-label">Auto</span></div>
                                <div class="ad-spec-item"><i data-lucide="fuel"
                                        style="width: 16px; height: 16px; color: #1459DD;"></i><span
                                        class="ad-spec-label">Essence</span></div>
                            </div>
                            <div class="ad-footer-btn">
                                <div class="flex flex-col">
                                    <span class="monthly-label">VOTRE MENSUALITÉ À PARTIR DE</span>
                                    <div class="monthly-price"><span class="monthly-amount">38,000</span> <span
                                            class="monthly-unit">MAD / MOIS</span></div>
                                </div>
                                <div class="arrow-circle"><i data-lucide="arrow-right"
                                        style="width: 20px; height: 20px;"></i></div>
                            </div>
                        </div>
                    </div>
                    <!-- Lamborghini -->
                    <div class="ad-card">
                        <div class="ad-image-container">
                            <img src="https://images.unsplash.com/photo-1544636331-e26879cd4d9b?auto=format&fit=crop&q=80&w=800"
                                class="ad-main-img" />
                            <div class="ad-status-badge status-reserved">Réservé</div>
                            <div class="ad-price-tag">
                                <span class="ad-price-text">3,950,000 MAD</span>
                            </div>
                            <div class="ad-video-preview">
                                <img
                                    src="https://images.unsplash.com/photo-1544636331-e26879cd4d9b?auto=format&fit=crop&q=80&w=200" />
                                <div class="ad-play-btn">
                                    <div class="ad-play-icon"><i data-lucide="play"
                                            style="width: 14px; height: 14px; fill: white; margin-left: 2px;"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ad-content">
                            <h3 class="ad-title-new">Lamborghini Urus</h3>
                            <div class="ad-specs-grid">
                                <div class="ad-spec-item"><i data-lucide="calendar"
                                        style="width: 16px; height: 16px; color: #1459DD;"></i><span
                                        class="ad-spec-label">2022</span></div>
                                <div class="ad-spec-item"><i data-lucide="gauge"
                                        style="width: 16px; height: 16px; color: #1459DD;"></i><span
                                        class="ad-spec-label">9,800 km</span></div>
                                <div class="ad-spec-item"><i data-lucide="settings-2"
                                        style="width: 16px; height: 16px; color: #1459DD;"></i><span
                                        class="ad-spec-label">Auto</span></div>
                                <div class="ad-spec-item"><i data-lucide="fuel"
                                        style="width: 16px; height: 16px; color: #1459DD;"></i><span
                                        class="ad-spec-label">Essence</span></div>
                            </div>
                            <div class="ad-footer-btn">
                                <div class="flex flex-col">
                                    <span class="monthly-label">VOTRE MENSUALITÉ À PARTIR DE</span>
                                    <div class="monthly-price"><span class="monthly-amount">47,000</span> <span
                                            class="monthly-unit">MAD / MOIS</span></div>
                                </div>
                                <div class="arrow-circle"><i data-lucide="arrow-right"
                                        style="width: 20px; height: 20px;"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 5. NADO PRICE -->
        <section class="price-section">
            <div class="container relative z-10">
                <div class="price-grid">
                    <div>
                        <h2 class="price-title">Combien vaut <br /><span class="text-secondary">VOTRE VOITURE ?</span>
                        </h2>
                        <p class="price-desc">Obtenez une estimation précise en 2 minutes basée sur l'IA.</p>
                        <button class="btn-estimate"><span>Estimer ma voiture</span><i data-lucide="arrow-right"
                                style="width: 20px; height: 20px;"></i></button>
                    </div>
                    <div class="price-image-container"><img
                            src="https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&q=80&w=1200"
                            alt="Estimation" /></div>
                </div>
            </div>
        </section>

        <!-- 10. EXPÉRIENCES IMMERSIVES -->
        <section class="immersive-section">
            <div class="container">
                <div style="margin-bottom: 4rem;">
                    <h2 class="section-title " style="color: white">Expériences <span
                            class="text-primary">Immersives</span></h2>
                </div>
                <div class="immersive-scroll no-scrollbar">
                    <div class="video-card">
                        <img
                            src="https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&q=80&w=600" />
                        <div class="video-overlay"></div>
                        <div class="video-info">
                            <h4 class="video-title">Essai : Porsche 911 GT3 RS</h4>
                            <div class="video-meta"><i data-lucide="timer"
                                    style="width: 14px; height: 14px; color: #3b82f6;"></i><span>12:45</span></div>
                        </div>
                        <div class="play-icon"><i data-lucide="play"
                                style="width: 24px; height: 24px; color: white; fill: white; margin-left: 4px;"></i>
                        </div>
                    </div>
                    <div class="video-card">
                        <img
                            src="https://images.unsplash.com/photo-1520031441872-265e4ff70366?auto=format&fit=crop&q=80&w=600" />
                        <div class="video-overlay"></div>
                        <div class="video-info">
                            <h4 class="video-title">Arrivage : Mercedes Classe G 63</h4>
                            <div class="video-meta"><i data-lucide="timer"
                                    style="width: 14px; height: 14px; color: #3b82f6;"></i><span>08:20</span></div>
                        </div>
                        <div class="play-icon"><i data-lucide="play"
                                style="width: 24px; height: 24px; color: white; fill: white; margin-left: 4px;"></i>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 11. ENCHÈRES LIVE -->
        <section class="live-section">
            <div class="container">
                <div style="margin-bottom: 4rem;">
                    <h2 class="section-title">L'Arène des <br /><span class="text-primary">Enchères Live</span></h2>
                </div>
                <div class="auction-grid">
                    <div class="auction-main group main-auction-card">
                        <div class="main-auction-img"><img
                                src="https://images.unsplash.com/photo-1614162692292-7ac56d7f7f1e?auto=format&fit=crop&q=80&w=1200" />
                        </div>
                        <div class="main-auction-content">
                            <div>
                                <h3
                                    style="font-size: 1.875rem; font-weight: 900; color: var(--slate-900); text-transform: uppercase; margin-bottom: 0.5rem;">
                                    Porsche GT3 RS (992)</h3>
                                <p
                                    style="color: var(--slate-500); font-weight: 700; text-transform: uppercase; font-size: 0.75rem; letter-spacing: 0.1em;">
                                    2024</p>
                            </div>
                            <div class="current-bid"><span class="bid-label">Offre actuelle</span><span
                                    class="bid-amount">3,250,000 MAD</span><button class="btn-bid">Placer une enchère
                                    <i data-lucide="gavel"
                                        style="width: 16px; height: 16px; margin-left: 0.5rem;"></i></button></div>
                        </div>
                    </div>
                    <div class="auction-sidebar flex flex-col gap-6">
                        <div class="side-auction-card">
                            <div class="side-img"><img
                                    src="https://images.unsplash.com/photo-1544636331-e26879cd4d9b?auto=format&fit=crop&q=80&w=800" />
                            </div>
                            <div style="flex: 1;">
                                <h4
                                    style="font-weight: 900; color: var(--slate-900); text-transform: uppercase; font-size: 1.125rem; margin-bottom: 0.25rem;">
                                    Lamborghini Urus S</h4>
                                <div class="flex flex-col"><span
                                        style="font-size: 9px; font-weight: 700; color: var(--slate-400); text-transform: uppercase;">Dernier
                                        prix</span><span
                                        style="font-size: 1.125rem; font-weight: 900; color: var(--primary);">3,850,000
                                        MAD</span></div>
                            </div>
                        </div>
                        <div class="side-auction-card">
                            <div class="side-img"><img
                                    src="https://images.unsplash.com/photo-1592198084033-aade902d1aae?auto=format&fit=crop&q=80&w=800" />
                            </div>
                            <div style="flex: 1;">
                                <h4
                                    style="font-weight: 900; color: var(--slate-900); text-transform: uppercase; font-size: 1.125rem; margin-bottom: 0.25rem;">
                                    Ferrari Roma</h4>
                                <div class="flex flex-col"><span
                                        style="font-size: 9px; font-weight: 700; color: var(--slate-400); text-transform: uppercase;">Dernier
                                        prix</span><span
                                        style="font-size: 1.125rem; font-weight: 900; color: var(--primary);">2,450,000
                                        MAD</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 12. BANNER WHATSAPP -->
        <section class="whatsapp-section">
            <div class="container">
                <div class="whatsapp-card">
                    <div class="whatsapp-content">
                        <h2 class="whatsapp-title">BESOIN D'UN <br /><span class="text-secondary">EXPERT <br />NADO
                                ?</span></h2>
                        <a href="https://wa.me/212520070611" target="_blank" class="btn-whatsapp">
                            <i data-lucide="message-circle" style="width: 24px; height: 24px; stroke-width: 3;"></i>
                            CHATTER SUR WHATSAPP
                        </a>
                    </div>
                    <div class="whatsapp-image">
                        <img src="https://images.unsplash.com/photo-1544636331-e26879cd4d9b?auto=format&fit=crop&q=80&w=1200"
                            alt="Expert NADO" />
                    </div>
                </div>
            </div>
        </section>

        <!-- 13. TÉMOIGNAGES -->
        <section class="testimonials">
            <div class="container">
                <div class="testimonial-grid">
                    <div class="testimonial-left text-left">
                        <h2 class="section-title">Ce que disent <br /><span class="text-primary">NOS</span> <span
                                class="text-secondary">CLIENTS</span></h2>
                        <p
                            style="color: var(--slate-500); font-weight: 500; font-size: 1.125rem; margin-bottom: 2.5rem; max-width: 24rem;">
                            La satisfaction de nos client est notre priorité absolue.</p>
                        <div class="nav-buttons"><button class="btn-nav-prev"><i data-lucide="chevron-left"
                                    style="width: 20px; height: 20px;"></i></button><button class="btn-nav-next"><i
                                    data-lucide="chevron-right"
                                    style="width: 20px; height: 20px; stroke-width: 3;"></i></button></div>
                    </div>
                    <div class="testimonial-right relative">
                        <div class="owl-carousel owl-theme">
                            @foreach ($avistext as $atext)
                                <div class="item">
                                    <div class="testimonial-card">
                                        <div class="quote-icon"><i data-lucide="quote"
                                                style="width: 100%; height: 100%; fill: currentColor;"></i></div>
                                        <div style="position: relative; z-index: 10;">

                                            <div class="stars">
                                                <i data-lucide="star"
                                                    style="width: 20px; height: 20px; fill: currentColor;"></i>
                                                <i data-lucide="star"
                                                    style="width: 20px; height: 20px; fill: currentColor;"></i>
                                                <i data-lucide="star"
                                                    style="width: 20px; height: 20px; fill: currentColor;"></i>
                                                <i data-lucide="star"
                                                    style="width: 20px; height: 20px; fill: currentColor;"></i>
                                                <i data-lucide="star"
                                                    style="width: 20px; height: 20px; fill: currentColor;"></i>
                                            </div>
                                            <blockquote class="quote-text">"{{ $atext->text }}"</blockquote>
                                            <div class="client-info">
                                                <div class="client-img"><img
                                                        src="{{ asset('storage/avistext/' . $atext->image) }}"
                                                        alt="{{ $atext->name }}" /></div>
                                                <div class="text-left">
                                                    <h4
                                                        style="font-weight: 900; color: var(--slate-900); font-size: 1.125rem; text-transform: uppercase; margin-bottom: 0.25rem;">
                                                        {{ $atext->name }}</h4>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-- 14. NADO BLOG -->
        <section class="blog-section">
            <div class="container">
                <div class="blog-header">
                    <div class="blog-title-wrapper">
                        <h2 class="blog-big-title">BLOG <br /><span class="text-primary">NADO</span></h2>
                    </div>
                    <button class="btn-explore-blog">Explorer le blog <i data-lucide="arrow-right"
                            style="width: 18px; height: 18px;"></i></button>
                </div>

                <div class="blog-grid-hero">
                    <!-- Featured Article -->
                    <div class="blog-hero">
                        <div class="blog-featured">
                            <img src="https://images.unsplash.com/photo-1550355291-bbee04a92027?auto=format&fit=crop&q=80&w=1200"
                                alt="Featured" />
                            <div class="blog-featured-overlay"></div>
                            <div class="blog-featured-content">
                                <div class="blog-meta-tag"><i data-lucide="calendar"
                                        style="width: 12px; height: 12px; color: var(--primary);"></i> 28 JAN 2024
                                </div>
                                <h3 class="blog-featured-title">L'art de collectionner : <br />Pourquoi la Porsche 911
                                    (992) est déjà un classique indémodable</h3>
                            </div>
                        </div>
                    </div>

                    <!-- Sidebar Articles -->
                    <div class="blog-sidebar" style="display: flex; flex-direction: column; gap: 2.5rem;">
                        <!-- Sidebar 1 -->
                        <div class="blog-sidebar-card">
                            <div style="aspect-ratio: 16/9; position: relative;">
                                <img src="https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&q=80&w=400"
                                    style="width: 100%; height: 100%; object-fit: cover;" />
                            </div>
                            <div style="padding: 2.5rem; text-align: left;">
                                <h4 class="blog-sidebar-title">Top 5 des routes les plus spectaculaires du Maroc pour
                                    un Road Trip Premium</h4>
                                <div class="blog-read-more">Lire l'histoire <i data-lucide="arrow-right"
                                        style="width: 14px; height: 14px;"></i></div>
                            </div>
                        </div>

                        <!-- Sidebar 2 -->
                        <div class="blog-sidebar-card">
                            <div style="aspect-ratio: 16/9; position: relative;">
                                <img src="https://images.unsplash.com/photo-1563720223185-11003d516935?auto=format&fit=crop&q=80&w=400"
                                    style="width: 100%; height: 100%; object-fit: cover;" />
                            </div>
                            <div style="padding: 2.5rem; text-align: left;">
                                <h4 class="blog-sidebar-title">Maintenance : 3 secrets pour préserver la valeur de
                                    votre SUV de Luxe</h4>
                                <div class="blog-read-more">Lire l'histoire <i data-lucide="arrow-right"
                                        style="width: 14px; height: 14px;"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <!-- FOOTER -->
    <footer>
        <div class="container">
            <div class="footer-grid">
                <div>
                    <div class="logo"
                        style="font-size: 1.875rem; font-weight: 900; margin-bottom: 1.5rem; text-transform: uppercase;">
                        <span class="text-primary">NA</span>
                        <span class="text-secondary">DO</span>
                    </div>
                    <p style="color: var(--slate-400); font-weight: 500; line-height: 1.625;">
                        Le premier portail automobile premium au Maroc. Expertise, confiance et innovation.
                    </p>
                </div>
                <div>
                    <h4 class="footer-heading">Navigation</h4>
                    <ul class="footer-links">
                        <li><a href="#">Accueil</a></li>
                        <li><a href="#">Acheter une voiture</a></li>
                        <li><a href="#">Vendre ma voiture</a></li>
                        <li><a href="#">À propos de NADO</a></li>
                    </ul>
                </div>
                <div>
                    <h4 class="footer-heading">Services</h4>
                    <ul class="footer-links">
                        <li><a href="#" class="text-secondary">NADO Connect</a></li>
                        <li><a href="#">Auto Enchère</a></li>
                        <li><a href="#">Vente cash</a></li>
                    </ul>
                </div>
                <div>
                    <h4 class="footer-heading">Réseaux Sociaux</h4>
                    <p style="font-size: 0.75rem; color: var(--slate-400); margin-bottom: 1.5rem;">Suivez nos
                        livraisons en direct sur les réseaux.</p>
                    <div class="flex gap-4">
                        <button class="social-btn"><i data-lucide="instagram"
                                style="width: 16px; height: 16px; color: var(--white);"></i></button>
                        <button class="social-btn"><i data-lucide="facebook"
                                style="width: 16px; height: 16px; color: var(--white);"></i></button>
                        <button class="social-btn"><i data-lucide="linkedin"
                                style="width: 16px; height: 16px; color: var(--white);"></i></button>
                    </div>
                </div>
            </div>
            <div
                style="padding-top: 2rem; border-top: 1px solid var(--slate-600); text-align: center; font-size: 10px; font-weight: 700; color: var(--slate-500); text-transform: uppercase; letter-spacing: 0.1em;">
                © 2025 NADO PREMIUM AUTOMOTIVE • TOUS DROITS RÉSERVÉS
            </div>
        </div>
    </footer>

    <!-- MODAL HISTOIRE -->
    <!-- Story Modal -->
    <div class="modal-overlay" id="story-modal" style="display: none;">
        <div class="close-modal"><i data-lucide="x" style="width: 24px; height: 24px;"></i></div>
        <div class="story-viewer">
            <div class="story-progress">
                <div class="progress-segment">
                    <div class="progress-bar" style="width: 100%;"></div>
                </div>
            </div>

            <!-- Dynamic Content Container -->
            <img id="story-image-viewer" src=""
                style="width: 100%; height: 100%; object-fit: cover; display: none;" />
            <video id="story-video-viewer" src=""
                style="width: 100%; height: 100%; object-fit: cover; display: none;" playsinline loop></video>

            <div
                style="position: absolute; bottom: 0; left: 0; right: 0; padding: 2rem; background: linear-gradient(to top, rgba(0,0,0,0.8), transparent);">
                <div style="display: flex; align-items: center; gap: 1rem;">
                    <img src="{{ asset('images/logoValidator.png') }}"
                        style="width: 3rem; height: 3rem; border-radius: 50%; border: 2px solid var(--primary);"
                        onerror="this.src='https://ui-avatars.com/api/?name=NADO&background=1459DD&color=fff'" />
                    <div>
                        <h4 style="color: var(--white); font-weight: 900; text-transform: uppercase;">NADO Officiel
                        </h4>
                        <span style="color: var(--slate-400); font-size: 0.75rem; font-weight: 700;">En direct</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        lucide.createIcons();
    </script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Owl Carousel JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script>
        if (typeof lucide !== 'undefined') {
            lucide.createIcons();
        }

        // Initialize Owl Carousel for Testimonials
        $(document).ready(function() {
            console.log('Document ready - initializing scripts');

            // --- PRIORITY: Story Modal Logic (Vanilla JS) ---
            // (Removed redundant listener - using global openStory instead)
            // ----------------------------------

            // Testimonials Slider
            var testimonialOwl = $('.testimonial-right .owl-carousel');
            if (testimonialOwl.length > 0) {
                testimonialOwl.owlCarousel({
                    items: 1,
                    loop: true,
                    margin: 10,
                    nav: false,
                    dots: true
                });
            }

            // Hero Slider
            var heroSlider = $('.hero-slider');
            console.log('Hero slider count:', heroSlider.length);

            if (heroSlider.length > 0) {
                try {
                    heroSlider.owlCarousel({
                        items: 1,
                        loop: true,
                        margin: 0,
                        nav: false,
                        dots: false,
                        autoplay: true,
                        autoplayTimeout: 5000,
                        animateOut: 'fadeOut',
                        onInitialized: function() {
                            console.log('Hero Slider Initialized');
                        }
                    });
                } catch (err) {
                    console.error('Hero Slider Init Error:', err);
                }
            }

            // Custom Navigation Events (Testimonials)
            $('.btn-nav-next').click(function() {
                testimonialOwl.trigger('next.owl.carousel');
            });
            $('.btn-nav-prev').click(function() {
                testimonialOwl.trigger('prev.owl.carousel');
            });

        });

        // --- NADO STORY FUNCTIONS (RENAMED) ---
        function launchNadoStory(element) {
            console.log('launchNadoStory called');
            var src = element.getAttribute('data-src');
            var type = element.getAttribute('data-type');

            var popup = document.getElementById('nado-story-popup');
            var img = document.getElementById('nado-story-img');
            var vid = document.getElementById('nado-story-video');

            if (popup && img && vid) {
                console.log('Popup elements found. Opening...');

                // Reset
                img.style.display = 'none';
                vid.style.display = 'none';
                vid.src = '';

                if (type === 'image') {
                    img.src = src;
                    img.style.display = 'block';
                } else {
                    vid.src = src;
                    vid.style.display = 'block';
                    var playPromise = vid.play();
                    if (playPromise !== undefined) {
                        playPromise.catch(error => {
                            console.log("Video autoplay failed: ", error);
                        });
                    }
                }

                // Force Show
                popup.style.display = 'flex';
            } else {
                console.error('Popup elements NOT found!');
            }
        }

        function dismissNadoStory() {
            var popup = document.getElementById('nado-story-popup');
            var vid = document.getElementById('nado-story-video');

            if (popup) {
                popup.style.display = 'none';
            }
            if (vid) {
                vid.pause();
                vid.src = '';
            }
        }

        // Global click listener to close if clicked outside
        document.addEventListener('click', function(e) {
            var popup = document.getElementById('nado-story-popup');
            if (e.target === popup) {
                dismissNadoStory();
            }
        });
    </script>
</body>

</html>
