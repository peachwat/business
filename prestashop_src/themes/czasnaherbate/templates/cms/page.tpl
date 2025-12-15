{extends file='page.tpl'}

{block name='page_content_container'}
  <section id="content" class="page-content page-cms page-cms-{$cms.id}">

    {if $cms.id == 4} 
        {literal}
        <style>
            #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
            .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }
            .cms-custom-page {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: #555;
                background: #fff;
            }
            .about-parallax-banner {
                background-image: url('../themes/czasnaherbate/assets/img/o-marce-czas-na-herbate-1.jpg'); 
                background-attachment: fixed;
                background-position: center top;
                background-repeat: no-repeat;
                background-size: cover;
                height: 450px; 
                display: flex;
                align-items: center;
                justify-content: center;
                position: relative;
                margin-bottom: 60px;
            }
            .about-parallax-banner::before {
                content: ''; position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0,0,0,0.2); 
            }
            .about-parallax-banner h1 {
                position: relative; color: #fff; font-size: 52px; font-family: 'Garamond', 'Georgia', serif; font-weight: 700; text-shadow: 0 2px 5px rgba(0,0,0,0.3); z-index: 2; margin: 0;
            }
            .about-content-width {
                max-width: 1140px; margin: 0 auto; padding: 0 15px;
            }
            h2.gold-title {
                color: #f9a918; font-size: 36px; font-family: 'Garamond', 'Georgia', serif; margin-bottom: 30px; font-weight: normal; margin-top: 0; text-align: left; padding-bottom: 20px; border-bottom: 1px solid #f9a918; width: 100%; display: block;
            }
            p.text-block {
                font-size: 13px; line-height: 2; color: #4a4a4a; margin-bottom: 60px; text-align: left; padding: 0 0 60px 0; border-bottom: 1px solid #eaeaea;
            }
            .stats-grid {
                display: flex; justify-content: space-around; flex-wrap: wrap; margin-bottom: 80px; gap: 30px;
            }
            .stat-item {
                flex: 1; min-width: 200px; display: flex; flex-direction: column; align-items: center;
            }
            .circle-icon {
                width: 160px; height: 160px; border: 1px solid #f9a918; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-bottom: 25px; box-shadow: 0 0 0 5px #fff, 0 0 0 6px #f9a918, 0 0 15px 5px rgba(249, 169, 24, 0.4); transition: transform 0.3s; background: #fff; padding: 30px;
            }
            .circle-icon:hover { transform: scale(1.02); }
            .circle-icon img { max-width: 100%; max-height: 100%; object-fit: contain; }
            .stat-number {
                font-size: 32px; color: #381b15; font-family: 'Garamond', 'Georgia', serif; margin-bottom: 10px; display: block;
            }
            .stat-label {
                font-size: 11px; color: #777; line-height: 1.4; text-align: center;
            }
            .timeline-container {
                position: relative; margin-top: 60px; margin-bottom: 100px; text-align: center;
            }
            .timeline-logo-wrapper { margin-bottom: 50px; position: relative; }
            .timeline-logo-wrapper img {
                width: 180px; height: 180px; border-radius: 50%; border: 1px solid #ddd; padding: 5px; background: #fff; box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            }
            .timeline-line-wrapper {
                position: relative; margin-top: 20px; padding: 0 40px; display: flex; align-items: center; justify-content: center;
            }
            .timeline-bar-bg {
                position: relative; flex-grow: 1; height: 2px; background-color: #eee; margin: 0 15px; max-width: 600px;
            }
            .timeline-bar-progress {
                position: absolute; top: 0; left: 0; width: 25%; height: 2px; background-color: #f9a918;
            }
            .timeline-years {
                position: absolute; top: -6px; left: 0; width: 100%; display: flex; justify-content: space-between;
            }
            .year-dot {
                width: 14px; height: 14px; background: #fff; border: 2px solid #eee; border-radius: 50%; cursor: pointer; position: relative;
            }
            .year-dot.active { border-color: #f9a918; background: #f9a918; }
            .year-label {
                position: absolute; top: -30px; left: 50%; transform: translateX(-50%); font-size: 11px; color: #999; font-weight: 600;
            }
            .year-dot.active .year-label { color: #444; }
            .arrow-btn {
                width: 30px; height: 30px; border-radius: 50%; border: 1px solid #eee; display: flex; align-items: center; justify-content: center; color: #ddd; cursor: pointer; font-size: 18px; background: #fff; transition: all 0.2s;
            }
            .arrow-btn:hover, .arrow-btn.active { border-color: #f9a918; color: #f9a918; }
            .brand-founding { margin-top: 40px; }
            .brand-founding h3 {
                font-family: 'Garamond', serif; font-size: 32px; color: #381b15; margin-bottom: 5px; font-weight: normal;
            }
            .brand-founding p { font-size: 13px; color: #777; font-style: italic; }

            @media (max-width: 768px) {
                .stats-grid { flex-direction: column; }
                .about-parallax-banner h1 { font-size: 36px; }
                .text-block { text-align: left; }
                .timeline-logo-wrapper img { width: 120px; height: 120px; }
            }
        </style>
        {/literal}

        <div class="cms-custom-page">
            <div class="about-parallax-banner">
                <h1>O Marce</h1>
            </div>
            <div class="about-content-width">
                <h2 class="gold-title">Na herbatę zawsze jest dobry czas</h2>
                <p class="text-block">
                    Bywają momenty ciche, zadumane, refleksyjne, komponujące się z wygodnym fotelem, znakomitą lekturą i dźwiękami kojącej muzyki. Chwile roześmiane, kipiące energią. Urodziny, rocznice, święta... Życie jest pełne przyjemności. Czas na Herbatę to zachęta do ich smakowania. Podróż po zakątkach niezwykłych smaków rozpoczęła się w 1997 roku we Wrocławiu. Wtedy to dwoje ludzi pełnych pasji i marzeń, Agata i Jakub Szurlej, zapragnęło zmienić herbacianą rzeczywistość. Wiele lat odkrywania i eksperymentowania, pozwoliło marce Czas na Herbatę stworzyć bogatą ofertę herbat z najdalszych zakątków świata, wyróżniających się głębią smaku i aromatu, które w magiczny sposób zamieniają zwykłe momenty dnia codziennego w niezwykłe i wyjątkowe. Herbacianą paletę barw, od białych przez zielone, żółte, czarne i czerwone, a nawet turkusowe i kwitnące, uzupełniają unikalne, tworzone przez nas receptury kompozycji herbacianych. Bogactwo natury pozwoliło dopełnić asortyment o wysokogatunkowe kawy, wiele rodzajów Yerba Mate, zdrowotne zioła, całą gamę przepysznych czekoladowych łakoci, konfitur czy owocowych syropów. Ofertę domykają niezbędne akcesoria: zaparzacze, filiżanki czy dzbanki, które w połączeniu z pozostałymi produktami mogą stanowić doskonały prezent na każdą okazję. <strong>Zapraszamy Cię do świata wypełnionego smakami. Znajdź swój Czas na Herbatę.</strong>
                </p>
                <div class="stats-grid">
                    <div class="stat-item">
                        <div class="circle-icon"><img src="{$urls.theme_assets}img/ikona-herbata.png" alt="Herbaty"></div>
                        <span class="stat-number">250</span><span class="stat-label">Herbat klasycznych<br>i kompozycji w ofercie</span>
                    </div>
                    <div class="stat-item">
                        <div class="circle-icon"><img src="{$urls.theme_assets}img/iko3.png" alt="Filiżanki"></div>
                        <span class="stat-number">220 mln</span><span class="stat-label">Wypitych filiżanek herbat<br>przez naszych Klientów</span>
                    </div>
                    <div class="stat-item">
                        <div class="circle-icon"><img src="{$urls.theme_assets}img/iko2.png" alt="Salony"></div>
                        <span class="stat-number">72</span><span class="stat-label">Salony<br>Czas na Herbatę</span>
                    </div>
                    <div class="stat-item">
                        <div class="circle-icon"><img src="{$urls.theme_assets}img/iko1.png" alt="Klienci"></div>
                        <span class="stat-number">725 tys.</span><span class="stat-label">Zadowolonych<br>Klientów rocznie</span>
                    </div>
                </div>
                <h2 class="gold-title">Nasza historia</h2>
                <p class="text-block" style="border-bottom:none;">
                    Czas mija niesamowicie szybko. Wydaje się jakby to było wczoraj, jak w 1998 roku otwieraliśmy pierwszy salon, a obecnie jesteśmy największą siecią herbacianą w kraju. Zobacz jak krok po kroku do tego dążyliśmy i jak wciąż się dla Ciebie rozwijamy.
                </p>
                <div class="timeline-container">
                    <div class="timeline-logo-wrapper"><img src="{$urls.theme_assets}img/CnH-pierwsze-logo.png" alt="Pierwsze logo"></div>
                    <div class="timeline-line-wrapper">
                        <div class="arrow-btn">&lt;</div>
                        <div class="timeline-bar-bg">
                             <div class="timeline-bar-progress"></div>
                             <div class="timeline-years">
                                <div class="year-dot active"><span class="year-label">1997</span></div>
                                <div class="year-dot"><span class="year-label">1998</span></div>
                                <div class="year-dot"><span class="year-label">1999</span></div>
                                <div class="year-dot"><span class="year-label">2003</span></div>
                                <div class="year-dot"><span class="year-label">2004</span></div>
                             </div>
                        </div>
                        <div class="arrow-btn active">&gt;</div>
                    </div>
                    <div class="brand-founding"><h3>Założenie marki</h3><p>wejście na rynek z ofertą 36 herbat</p></div>
                </div>
            </div>
        </div>

    {elseif $cms.id == 5}
        
        {literal}
        <style>
            #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
            .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }
            .payment-custom-page {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: #555;
                background: #fff;
                padding-bottom: 80px;
                width: 100%;
            }
            .payment-content-width {
                max-width: 1140px;
                margin: 0 auto;
                padding: 40px 15px;
            }
            .payment-header-title {
                font-family: 'Garamond', serif;
                font-size: 42px;
                color: #555;
                margin-bottom: 30px;
                border-bottom: 1px solid #f9a918;
                padding-bottom: 20px;
                font-weight: normal;
            }
            .sub-header {
                font-size: 12px;
                font-weight: bold;
                text-transform: uppercase;
                color: #555;
                margin-bottom: 10px;
                display: block;
                letter-spacing: 1px;
            }
            .intro-text {
                font-size: 14px;
                color: #666;
                margin-bottom: 50px;
            }
            .payment-list {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }
            .payment-row {
                display: flex;
                align-items: center;
                padding-bottom: 30px;
                border-bottom: none;
            }
            .payment-icon-wrapper {
                width: 150px; 
                flex-shrink: 0;
                margin-right: 40px;
                display: flex;
                align-items: center;
                justify-content: flex-start;
            }
            .payment-icon-wrapper img {
                max-width: 100%;
                height: auto;
                max-height: 50px;
                object-fit: contain;
            }
            .payment-description {
                font-size: 13px;
                color: #555;
                line-height: 1.6;
            }
            @media (max-width: 768px) {
                .payment-row { flex-direction: column; align-items: flex-start; }
                .payment-icon-wrapper { margin-bottom: 15px; margin-right: 0; }
            }
        </style>
        {/literal}

        <div class="payment-custom-page">
            <div class="payment-content-width">
                <h2 class="payment-header-title">Metody płatności</h2>
                <span class="sub-header">METODY PŁATNOŚCI</span>
                <p class="intro-text">
                    W naszym sklepie internetowym udostępniamy następujące metody płatności:
                </p>
                <div class="payment-list">
                    <div class="payment-row">
                        <div class="payment-icon-wrapper">
                            <img src="{$urls.theme_assets}img/przelew.png" alt="Przelew tradycyjny">
                        </div>
                        <div class="payment-description">
                            <strong>Przelew tradycyjny</strong> - po wybraniu tej opcji otrzymasz dane do wykonania przelewu na nasze konto bankowe. Zamówienie zostanie zrealizowane po zaksięgowaniu wpłaty.
                        </div>
                    </div>
                    <div class="payment-row">
                        <div class="payment-icon-wrapper">
                            <img src="{$urls.theme_assets}img/images (1).png" alt="Visa Mastercard">
                        </div>
                        <div class="payment-description">
                            <strong>Karty płatnicze</strong> - bezpieczna płatność kartą debetową lub kredytową (Visa, Mastercard). Środki są księgowane natychmiastowo.
                        </div>
                    </div>
                    <div class="payment-row">
                        <div class="payment-icon-wrapper">
                            <img src="{$urls.theme_assets}img/blik.jpg" alt="Płatność BLIK">
                        </div>
                        <div class="payment-description">
                            <strong>Płatność BLIK</strong> - szybka i wygodna płatność kodem generowanym w aplikacji Twojego banku.
                        </div>
                    </div>
                    <div class="payment-row">
                        <div class="payment-icon-wrapper">
                            <img src="{$urls.theme_assets}img/images (2).png" alt="PayU">
                        </div>
                        <div class="payment-description">
                            <strong>Szybkie płatności PayU</strong> - wybierz swój bank i dokonaj błyskawicznego przelewu online.
                        </div>
                    </div>
                </div>
            </div>
        </div>

    {else}
        {$cms.content nofilter}
    {/if}
    
  </section>
{/block}