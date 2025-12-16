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

    {elseif $cms.id == 1}

        {literal}
        <style>
            #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
            .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }
            .delivery-custom-page {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: #555;
                background: #fff;
                padding-bottom: 80px;
                width: 100%;
            }
            .delivery-content-width {
                max-width: 1140px;
                margin: 0 auto;
                padding: 40px 15px;
            }
            .delivery-header-title {
                font-family: 'Garamond', serif;
                font-size: 42px;
                color: #555;
                margin-bottom: 30px;
                border-bottom: 1px solid #f9a918;
                padding-bottom: 20px;
                font-weight: normal;
            }
            .delivery-sub-header {
                font-size: 12px;
                font-weight: bold;
                text-transform: uppercase;
                color: #333;
                margin-bottom: 15px;
                display: block;
                letter-spacing: 1px;
            }
            .delivery-text {
                font-size: 13px;
                line-height: 1.8;
                color: #444;
                margin-bottom: 30px;
            }
            .price-list {
                margin-bottom: 30px;
            }
            .price-row {
                font-size: 13px;
                color: #444;
                margin-bottom: 8px;
            }
            .bold-note {
                font-weight: bold;
                font-size: 13px;
                color: #000;
                margin-top: 20px;
                margin-bottom: 20px;
            }
            .limit-note {
                font-size: 13px;
                color: #444;
                margin-top: 30px;
                padding-top: 20px;
                border-top: 1px solid #eee;
            }
        </style>
        {/literal}

        <div class="delivery-custom-page">
            <div class="delivery-content-width">
                <h2 class="delivery-header-title">Warunki dostawy</h2>
                <span class="delivery-sub-header">WARUNKI DOSTAWY</span>
                <div class="delivery-text">
                    <p>Zamówienia dostarczamy za pośrednictwem renomowanych przewoźników, gwarantujących bezpieczną i szybką dostawę pod wskazany adres.</p>
                    <p>Czas transportu zamówienia w przeważającej większości wynosi poniżej 72-96 godzin.</p>
                </div>
                <div class="price-list">
                    <div class="price-row">Koszt dostawy do Paczkomatu Inpost - 19 zł</div>
                    <div class="price-row">Koszt dostawy ORLEN Paczką - 14 zł</div>
                </div>
                <div class="bold-note">
                    Zamówienia na kwotę powyżej 2000 zł dostarczane są bezpłatnie.
                </div>
                <div class="limit-note">
                    <strong>Uwaga:</strong> Jeśli zamówienie waży więcej niż 50 kg, dostawa nie jest możliwa. Prosimy o kontakt w celu ustalenia indywidualnych warunków transportu.
                </div>
            </div>
        </div>

        {elseif $cms.id == 2}

        {literal}
        <style>
            #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
            .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }

            .terms-custom-page {
                font-family: 'Garamond', 'Georgia', serif;
                color: #333;
                background: #fff;
                padding-bottom: 80px;
                width: 100%;
                font-size: 15px;
                line-height: 1.5;
            }

            .terms-header-wrapper {
                max-width: 1140px;
                margin: 0 auto;
                padding: 40px 15px 20px 15px;
                border-bottom: 1px solid #f9a918;
                margin-bottom: 40px;
            }

            .terms-header-wrapper h1 {
                font-family: 'Garamond', serif;
                font-size: 42px;
                color: #555;
                margin: 0;
                font-weight: normal;
                text-align: left;
            }

            .terms-content {
                max-width: 1140px; 
                margin: 0 auto;
                padding: 0 15px;
            }

            .terms-title-center {
                text-align: center;
                font-weight: bold;
                text-transform: uppercase;
                display: block;
                color: #000;
            }

            .terms-intro p {
                text-align: center;
                margin-top: 20px;
                margin-bottom: 30px;
                font-size: 14px;
            }

            .section-header {
                text-align: center;
                font-weight: bold;
                margin-top: 40px;
                margin-bottom: 15px;
                color: #333;
            }

            .section-header span {
                display: block;
                margin-bottom: 5px;
            }

            ol.terms-list, ul.terms-bullet-list {
                text-align: justify;
                margin-bottom: 20px;
                padding-left: 25px;
            }

            ol.terms-list li, ul.terms-bullet-list li {
                margin-bottom: 10px;
            }

            ul.terms-bullet-list {
                list-style-type: square;
            }
            
            .terms-paragraph {
                 text-align: justify;
                 margin-bottom: 15px;
            }

            .link-style {
                color: #333;
                text-decoration: underline;
            }
            
            .red-text {
                color: red;
            }
        </style>
        {/literal}

        <div class="terms-custom-page">
            <div class="terms-header-wrapper">
                <h1>Regulamin sklepu</h1>
            </div>

            <div class="terms-content">
                
                <div class="terms-intro">
                    <span class="terms-title-center">REGULAMIN</span>
                    <span class="terms-title-center">Sklepu Internetowego www.czasnaherbate.net</span>
                    <span class="terms-title-center">PROGRESSIVE sp. z o.o.</span>

                    <span class="terms-title-center" style="margin-top: 30px; margin-bottom: 20px;">REGULAMIN SKLEPU INTERNETOWEGO</span>
                    
                    <p>
                        Niniejszy regulamin określa zasady dokonywania zakupów w sklepie internetowym prowadzonym przez Sprzedającego pod adresem www.czasnaherbate.net.<br>
                        Sprzedającym jest PROGRESSIVE Sp. z o.o. z siedzibą we Wrocławiu, ul. Sosnowiecka 5, NIP 8992984184, REGON 527610437 zwana „Sklepem”.<br>
                        Kontakt ze Sklepem można uzyskać pod numerami telefonów Infolinii Konsumenckiej: 661 886 969, koszt połączenia wg taryfy operatora lub korzystając z adresu poczty elektronicznej: biuro@czasnaherbate.net
                    </p>
                </div>

                <div class="section-header"><span>§ 1</span>Definicje</div>
                <ol class="terms-list">
                    <li>Regulamin – niniejszy regulamin. W zakresie usług świadczonych drogą elektroniczną Regulamin jest regulaminem, o którym mowa w art. 8 ustawy z dnia 18 lipca 2002 r. o świadczeniu usług drogą elektroniczną (Dz.U. z 2002 r. Nr 144, poz. 1204 ze zm.).</li>
                    <li>Klient – osoba fizyczna, osoba prawna lub jednostka organizacyjna nie posiadająca osobowości prawnej, a posiadająca zdolność do czynności prawnych, która na zasadach określonych w niniejszym regulaminie dokonuje Zamówienia w Sklepie Internetowym.</li>
                    <li>Konsument – Klient będący osobą fizyczną, korzystającą ze Sklepu Internetowego w celu niezwiązanym bezpośrednio z jej działalnością gospodarczą lub zawodową.</li>
                    <li>Przedmiot transakcji - Towary wymienione i opisane na stronie internetowej Sklepu Internetowego.</li>
                    <li>Towar – rzecz ruchoma, będąca w ofercie Sklepu Internetowego, której dotyczy Umowa Sprzedaży.</li>
                    <li>Umowa Sprzedaży – umowa sprzedaży Towarów w rozumieniu ustawy Kodeks cywilny, zawarta pomiędzy Sklepem a Klientem, z wykorzystaniem serwisu internetowego Sklepu.</li>
                    <li>Sklep Internetowy (Sklep) – serwis internetowy dostępny pod adresem www.czasnaherbate.net za pośrednictwem którego Klient może złożyć Zamówienie.</li>
                    <li>Zamówienie – oświadczenie woli Klienta określające jednoznacznie rodzaj i ilość Towarów, zmierzające bezpośrednio do zawarcia Umowy Sprzedaży.</li>
                    <li>System teleinformatyczny – zespół współpracujących ze sobą urządzeń informatycznych i oprogramowania, zapewniający przetwarzanie i przechowywanie, a także wysyłanie i odbieranie danych poprzez sieci telekomunikacyjne za pomocą właściwego dla danego rodzaju sieci urządzenia końcowego.</li>
                    <li>Dyrektywa Omnibus - Dyrektywa Parlamentu Europejskiego i Rady (UE) 2019/2161 z dnia 27 listopada 2019 r. zmieniająca dyrektywę Rady 93/13/EWG i dyrektywy Parlamentu Europejskiego i Rady 98/6/WE, 2005/29/WE oraz 2011/83/UE w odniesieniu do lepszego egzekwowania i unowocześnienia unijnych przepisów dotyczących ochrony konsumenta.</li>
                </ol>

                <div class="section-header"><span>§ 2</span>Zasady ogólne</div>
                <ol class="terms-list">
                    <li>Niniejszy Regulamin określa zasady korzystania ze sklepu internetowego dostępnego pod adresem www.czasnaherbate.net</li>
                    <li>Warunkiem złożenia Zamówienia w Sklepie Internetowym przez Klienta jest zapoznanie się z niniejszym Regulaminem i akceptacja jego postanowień w czasie realizacji Zamówienia.</li>
                    <li>Sklep Internetowy prowadzi sprzedaż detaliczną za pośrednictwem sieci Internet.</li>
                    <li>Wszystkie Towary oferowane w Sklepie Internetowym są fabrycznie nowe, oryginalnie zapakowane, wolne od wad fizycznych i prawnych, oraz zostały legalnie wprowadzone na rynek polski.</li>
                    <li>W ramach wymagań technicznych niezbędnych do współpracy z systemem teleinformatycznym, którym posługuje się Sklep w celu realizacji zakupów, Klient powinien dysponować aktywnym kontem poczty elektronicznej(e-mail) oraz urządzeniem podłączonym do sieci Internet.</li>
                    <li>Klient zobowiązany jest do niedostarczania treści zabronionych przez przepisy prawa, np. treści propagujące przemoc, zniesławiających lub naruszających dobra osobiste i inne prawa osób trzecich.</li>
                </ol>

                <div class="section-header"><span>§ 3</span>Składanie zamówień</div>
                <ol class="terms-list">
                    <li>Wszystkie ceny podane na stronach internetowych Sklepu są cenami brutto podanymi w złotych polskich. Podane ceny nie obejmują kosztów wysyłki.</li>
                    <li>Ceny produktów są podane z uwzględnienie zasad określonych w Dyrektywie Omnibus.</li>
                    <li>Zamówienia są przyjmowane przez stronę internetową.</li>
                    <li>Zamówienia można składać 24 godziny na dobę, 7 dni w tygodniu przez cały rok.</li>
                    <li>Zamówienie jest skuteczne, jeśli Klient prawidłowo wypełni formularz zamówienia i prawidłowo poda dane kontaktowe w tym dokładny adres, na który Towar ma być wysłany oraz numer telefonu i adres e-mail.</li>
                    <li>W wypadku gdy podane dane nie są kompletne, Sprzedający skontaktuje się z Klientem. Jeśli kontakt z Klientem nie będzie możliwy, Sprzedający ma prawo do anulowania Zamówienia.</li>
                    <li>Klient w procesie składania zamówienia może wyrazić wolę otrzymania paragonu fiskalnego lub faktury VAT, która może zostać załączona do wysyłanej przesyłki lub przesłana drogą elektroniczną, na wskazany adres e-mail w postaci elektronicznego obrazu dokumentów rozliczeniowych, w szczególności takich jak: faktury VAT z załącznikami, faktury VAT korygujące z załącznikami i formularze. Niniejsza zgoda uprawnia Sprzedającego również do wystawiania i przesyłania faktur VAT w formie elektronicznej, zgodnie z rozporządzeniem Ministra Finansów z dnia 20 grudnia 2012 r. w sprawie przesyłania faktur w formie elektronicznej, zasad ich przechowywania oraz trybu udostępniania organowi podatkowemu lub organowi kontroli skarbowej.</li>
                    <li>W trakcie składania Zamówienia, Klient może wyrazić zgodę na umieszczenie danych osobowych w bazie danych Sklepu Internetowego Sprzedającego w celu ich przetwarzania w związku z realizacją Zamówienia. W przypadku udzielenia zgody, Klient ma prawo do wglądu w swoje dane, ich poprawiania oraz żądania ich usunięcia.</li>
                    <li>Klient może skorzystać z opcji zapamiętania jego danych przez system w celu ułatwienia procesu składania kolejnego Zamówienia. W tym celu Klient powinien podać login i hasło, niezbędne do uzyskania dostępu do swojego konta. Login Klienta to podany przez niego adres e-mail. Hasło jest ciągiem znaków ustalanych przez Klienta. Hasło Klienta nie jest znane Sprzedającemu i Klient ma obowiązek zachowania go w tajemnicy i chronienia przed niepowołanym dostępem osób trzecich.</li>
                    <li>Po złożeniu przez Klienta skutecznego zamówienia, otrzyma on automatyczną odpowiedź ze sklepu potwierdzającą otrzymanie zamówienia.</li>
                    <li>Czas rozpoczęcia realizacji zamówienia pokrywa się z chwilą wpływu wpłaty na rachunek bankowy podany w potwierdzeniu zamówienia w przypadku płatności przelewem i systemem płatniczym (Paypal, Przelewy24.pl) lub z chwilą dokonania zamówienia w przypadku płatności kartą lub wyborem opcji „za pobraniem”.</li>
                    <li>Operatorem kart płatniczych jest PayPro SA Agent Rozliczeniowy, ul. Pastelowa 8, 60-198 Poznań, wpisany do Rejestru Przedsiębiorców Krajowego Rejestru Sądowego prowadzonego przez Sąd Rejonowy Poznań Nowe Miasto i Wilda w Poznaniu, VIII Wydział Gospodarczy Krajowego Rejestru Sądowego pod numerem KRS 0000347935, NIP 7792369887, Regon 301345068.</li>
                </ol>

                <div class="section-header"><span>§ 4</span>Koszty i termin wysyłki</div>
                <ol class="terms-list">
                    <li>Towar wysyłany jest pod adres wskazany w formularzu zamówienia lub podany telefonicznie albo drogą mailową. Sklep poinformuje Klienta niezwłocznie o nieprawidłowo wypełnionym formularzu zamówienia, który uniemożliwia dokonanie wysyłki lub może ją opóźnić.</li>
                    <li>Towar jest dostarczany za pomocą wyspecjalizowanych firm kurierskich lub za pośrednictwem Poczty Polskiej.</li>
                    <li>Przesyłka dostarczona jest zgodnie z terminem podanym przy każdym Towarze na stronach serwisu. Przy wyborze opcji płatności „przelew” lub „płatność kartą lub przelewem „online” do czasu podanego na stronach serwisu należy doliczyć czas zaksięgowania środków na rachunku bankowym sklepu (zazwyczaj 3-5 dni robocze).</li>
                    <li>Klient jest obciążany kosztami dostawy (wysyłki) określonymi w cenniku transportu. Koszty przesyłki są stałe bez względu na ilość zamówionego towaru.</li>
                </ol>

                <div class="section-header"><span>§ 5</span>Płatności</div>
                <ol class="terms-list">
                    <li>Na każdy sprzedany towar Sklep wystawia paragon lub imienny dowód zakupu (fakturę).</li>
                    <li>Płatność za zamówiony towar może nastąpić za pośrednictwem systemu płatności elektronicznych (Przelewy24.pl, Paypal) lub przelewem na konto bankowe sklepu.</li>
                </ol>

                <div class="section-header"><span>§ 5 A</span>Zasady obowiązujące przy stosowaniu kodów oraz bonów rabatowych.</div>
                <p class="terms-paragraph">Zasady obowiązujące przy stosowaniu kodów oraz bonów rabatowych.</p>
                <ol class="terms-list">
                    <li>Kody oraz bony rabatowe wynikające z zastosowania indywidualnych rabatów w postaci Karty Stałego Klienta, <span class="red-text">Gold Card</span>, bonów My Benefit bądź innych kodów, mają zastosowanie przy zakupie produktów (towarów) i nie maja wpływu na koszt usługi (wysyłka zamówienia).</li>
                    <li>Kody oraz bony rabatowe wynikające z zastosowania indywidualnych rabatów w postaci Karty Stałego Klienta, <span class="red-text">Gold Card</span>, bonów My Benefit bądź innych podobnych kodów, nie podlegają sumowaniu (łączeniu) z innym kodem rabatowym. Zastosowanie ma tylko jeden kodu uprawniający do zniżki.</li>
                    <li>Produkty będące w cenie promocyjnej dostępnej dla wszystkich klientów, nie podlegają dodatkowemu rabatowi wynikającemu z zastosowania indywidualnych rabatów w postaci Karty Stałego Klienta bądź innych podobnych kodów.</li>
                </ol>

                <div class="section-header"><span>§ 6</span>Odstąpienie od umowy</div>
                <ol class="terms-list">
                    <li>Konsument, który zawarł umowę na odległość, ma prawo do odstąpienia od umowy bez podania przyczyny, składając stosowne oświadczenie na piśmie, w terminie 14 dni (podstawa prawna: "art. 27, 28, 29, 31, 37 i 38 ustawy o prawach konsumenta. Termin ten jest terminem nieprzekraczalnym i liczy się od dnia wydania rzeczy, a gdy umowa dotyczy świadczenia usługi – od dnia jej zawarcia. Do zachowania tego terminu wystarczy wysłanie oświadczenia przed jego upływem na adres Sklepu.</li>
                    <li>W przypadku odstąpienia od umowy zawartej na odległość, umowa jest uważana za niezawartą. To, co strony świadczyły, ulega zwrotowi w stanie niezmienionym, chyba, że zmiana była konieczna w granicach zwykłego zarządu.</li>
                    <li>Zwrot powinien nastąpić niezwłocznie, nie później niż w terminie 14 dni. Zakupiony towar należy zwrócić na adres Sklepu. Koszt zwrotu pokrywa Kupujący.</li>
                    <li>W terminie 14 dni od dnia otrzymania od Konsumenta oświadczenia o odstąpieniu od umowy zwracamy konsumentowi wszystkie dokonane przez niego płatności, zgodnie z Art. 32 Ustawy o prawach konsumenta.</li>
                </ol>

                <div class="section-header"><span>§ 7</span>Procedura reklamacji</div>
                <ol class="terms-list">
                    <li>Reklamacje należy składać na adres Sklepu - PROGRESSIVE, Sosnowiecka 5, 52-008 Wrocław, bądź na email: reklamacje@herbata.net</li>
                    <li>Składając reklamację należy dostarczyć do Sklepu reklamowany produkt wraz z dowodem zakupu i wypełnionym zgłoszeniem reklamacyjnym, dostępnym pod adresem: zgłoszenie reklamacyjne</li>
                    <li>Sklep rozpatrzy reklamację w terminie 14 dni od dnia złożenia za pośrednictwem listu bądź wiadomości email. W przypadku rozpatrzenia reklamacji na korzyść Klienta Sklep wymieni reklamowany Towar na nowy, pełnowartościowy lub zwróci wartość kupionego towaru.</li>
                    <li>Klient traci uprawnienia określone w pkt. 3 niniejszego paragrafu, jeżeli przed upływem dwóch miesięcy od stwierdzenia niezgodności towaru z umową nie zawiadomi sklepu o tym fakcie. Do zachowania terminu wystarczy wysłanie zawiadomienia za pośrednictwem wiadomości email przed jego upływem.</li>
                </ol>

                <div class="section-header"><span>§ 8</span>Polityka prywatności oraz ochrona danych osobowych</div>
                <ol class="terms-list">
                    <li>Administratorem baz danych osobowych przekazywanych przez klientów Sklepu Internetowego w związku z zakupami jest Sklep.</li>
                    <li>Dane osobowe wykorzystywane są w celu realizacji umów sprzedaży, w zawiązku z tym mogą być przekazywane podmiotom odpowiedzialnym za dostawę zakupionych towarów do klienta. Klient maj prawo dostępu do treści swoich danych oraz do ich poprawiania. Dane są przekazywane dobrowolnie.</li>
                    <li>Informacja o metodach i środkach technicznych służących wykrywaniu i korygowaniu błędów we wprowadzanych danych:
                        <ol type="a" style="margin-top: 5px;">
                            <li>W trakcie składania Zamówienia, do chwili naciśnięcia przycisku „Złóż zamówienie” Klienci posiadający konto w Sklepie internetowym mają możliwość samodzielnego korygowania wprowadzonych danych poprzez edycję profilu konta.</li>
                            <li>Weryfikacji danych lub korekty Zamówienia można dokonać także poprzez wysłanie wiadomości e-mail do Sklepu na adres biuro@czasnaherbate.net</li>
                            <li>Klient ma możliwość zmiany danych wprowadzonych podczas tworzenia Konta w każdym czasie w ramach udostępnionych opcji.</li>
                        </ol>
                    </li>
                    <li>Informacja o zasadach i sposobach utrwalania, zabezpieczania i udostępniania przez Sklep drugiej stronie treści zawieranej umowy:
                         <ol type="a" style="margin-top: 5px;">
                            <li>Utrwalenie, zabezpieczenie i udostępnienie treści zawieranej umowy następuje przez przesłanie stosownej wiadomości e-mail po zawarciu Umowy Sprzedaży.</li>
                            <li>Utrwalenie, zabezpieczenie i udostępnienie treści zawieranej Umowy Sprzedaży następuje przez wysłanie Klientowi na podany adres e-mail treści zawieranej umowy lub przez przekazanie Klientowi specyfikacji Zamówienia oraz dowodu zakupu.</li>
                            <li>Treść zawieranej umowy jest dodatkowo utrwalona i zabezpieczona w systemie teleinformatycznym Sklepu.</li>
                        </ol>
                    </li>
                </ol>

                <div class="section-header"><span>§ 9</span>Pozasądowe sposoby rozpatrywania reklamacji oraz dochodzenia roszczeń</div>
                <div class="terms-paragraph">
                    1. Szczegółowe informacje dotyczące możliwości skorzystania przez Konsumenta z pozasądowych sposobów rozpatrywania reklamacji i  dochodzenia roszczeń oraz zasady dostępu do tych procedur dostępne są w siedzibach oraz na stronach internetowych powiatowych  (miejskich) rzeczników konsumentów, organizacji społecznych, do których zadań statutowych należy ochrona konsumentów, Wojewódzkich Inspektoratów Inspekcji Handlowej oraz pod następującymi adresami internetowymi Urzędu Ochrony Konkurencji i Konsumentów:<br>
                    <a href="http://www.uokik.gov.pl/spory_konsumenckie.php" class="link-style">http://www.uokik.gov.pl/spory_konsumenckie.php</a><br>
                    <a href="http://www.uokik.gov.pl/sprawy_indywidualne.php" class="link-style">http://www.uokik.gov.pl/sprawy_indywidualne.php</a><br>
                    <a href="http://www.uokik.gov.pl/wazne_adresy.php" class="link-style">http://www.uokik.gov.pl/wazne_adresy.php</a><br><br>
                    2. Konsument posiada następujące przykładowe możliwości skorzystania z pozasądowych sposobów rozpatrywania reklamacji i dochodzenia roszczeń:
                </div>
                <ul class="terms-bullet-list">
                    <li>Konsument uprawniony jest do zwrócenia się do stałego polubownego sądu konsumenckiego, o którym mowa w art. 37 ustawy z dnia 15 grudnia 2000 r. o Inspekcji Handlowej (Dz.U. z 2014 r. poz. 148 z późn. zm.), z wnioskiem o rozstrzygnięcie sporu wynikłego z Umowy zawartej ze Sprzedawcą</li>
                    <li>Konsument uprawniony jest do zwrócenia się do wojewódzkiego inspektora Inspekcji Handlowej, zgodnie z art. 36 ustawy z dnia 15 grudnia 2000 r. o Inspekcji Handlowej (Dz.U. z 2014 r. poz. 148 z późn. zm.), z wnioskiem o wszczęcie postępowania mediacyjnego w sprawie polubownego zakończenia sporu między Konsumentem a Sprzedawcą.</li>
                    <li>Konsument może uzyskać bezpłatną pomoc w sprawie rozstrzygnięcia sporu między nim a Sprzedawcą, korzystając także z bezpłatnej pomocy powiatowego (miejskiego) rzecznika konsumentów lub organizacji społecznej, do której zadań statutowych należy ochrona konsumentów (m.in. Federacja Konsumentów, Stowarzyszenie Konsumentów Polskich).</li>
                </ul>

                <div class="section-header"><span>§ 10</span>Opinie o sklepie internetowym</div>
                <ol class="terms-list">
                    <li>Klient Sklepu Internetowego ma możliwość dobrowolnego i nieodpłatnego wystawienia opinii dotyczącej zakupów dokonanych w Sklepie Internetowym. Przedmiotem opinii może być także ocena, zdjęcie lub recenzja zakupionego produktu w Sklepie Internetowym.</li>
                    <li>Sprzedawca po dokonanych zakupach w Sklepie Internetowym przekazuje dane niezbędne do stworzenia zaproszenia email firmie obsługującej proces ankietowania.Wysyłka ankiet oraz proces zbierania opinii w formularzach jest obsługiwany w pełni przez firmę TrustMate SA z siedzibą Bartoszowicka 3, 51-641 Wrocław. TrustMate SA wysyła do Klienta wiadomość email z prośbą o wystawienie opinii oraz linkiem do formularza online umożliwiającego jej wystawienie – formularz online umożliwia udzielenie odpowiedzi na pytania Sprzedawcy dotyczące zakupów, ich ocenę, dodanie własnego opisu dot. opinii oraz zdjęcia zakupionego produktu. W razie braku wystawienia opinii po otrzymaniu pierwszego zaproszenia do wystawienia opinii TrustMate może ponowić wysyłkę zaproszenia.</li>
                    <li>Opinia może być wystawiona jedynie przez Klienta, który dokonał zakupów w Sklepie Internetowym Sprzedawcy.</li>
                    <li>Wystawione przez Klienta opinie są publikowane przez Sprzedawcę w Sklepie Internetowym oraz wizytówce TrustMate.io.</li>
                    <li>Wystawienie opinii nie może być wykorzystywane przez Klienta do działań bezprawnych, w szczególności do działań stanowiących czyn nieuczciwej konkurencji wobec Sprzedawcy, czy też działań naruszających dobra osobiste, prawa własności intelektualnej lub inne prawa Sprzedawcy lub osób trzecich.</li>
                    <li>Opinia może być wystawiona tylko do faktycznie zakupionych produktów w Sklepie Internetowym Sprzedawcy. Zabronione jest zawieranie fikcyjnych/pozornych umów sprzedaży w celu wystawienia opinii. Autorem opinii nie może być także sam Sprzedawca ani jego pracownicy bez względu na podstawę zatrudnienia.</li>
                    <li>Wystawiona opinia może zostać w każdym czasie usunięta przez jej autora.</li>
                </ol>

                <div class="section-header"><span>§ 11</span>Zmiana Regulaminu</div>
                <ol class="terms-list">
                    <li>Klienci posiadający konto w Sklepie zostaną poinformowani o zmianie Regulaminu za pośrednictwem korespondencji e-mail.</li>
                    <li>Jeżeli w czasie, jaki upłynął od ostatniego logowania nastąpiła zmiana Regulaminu Sklepu, Klient akceptuje lub nie jego postanowienia po zmianach. W przypadku braku akceptacji warunków Regulaminu, w szczególności po wprowadzeniu jego zmian, zakupy w Sklepie internetowym nie są możliwe.</li>
                    <li>Klientowi, który nie akceptuje wprowadzonych w Regulaminie zmian przysługuje uprawnienie do usunięcia konta w każdym czasie.</li>
                    <li>Zamówienia złożone przez Klientów przed wejściem w życie zmian Regulaminu będą realizowane według dotychczasowych postanowień Regulaminu.</li>
                </ol>

                <div class="section-header"><span>§ 12</span>Postanowienia końcowe</div>
                <ol class="terms-list">
                    <li>W sprawach nieuregulowanych niniejszym Regulaminem zastosowanie mają przepisy ustawy z dnia 30 maja 2014 r. o prawach konsumenta (Dz.U. 2014 poz. 827 ze zm.), ustawy z dnia 23 kwietnia 1964 r. - Kodeks cywilny (Dz.U. 1964 nr 16 poz. 93 ze zm.), ustawa z 29 sierpnia 1997 r. o ochronie danych osobowych (t.j. z dnia 25 listopada 2015 r.(Dz. U. z 2015 r. poz. 2135).</li>
                    <li>Spory wynikające ze stosowania niniejszego Regulaminu i w związku z wykonywaniem zawartych umów między Sklepem a Klientami, będą rozpatrywane przez Sąd właściwy według przepisów o właściwości rzeczowej i miejscowej zgodnie z ustawą z dnia 17.11.1964 r. Kodeks postępowania cywilnego (Dz.U. nr 43 poz. 296 ze. zm.).</li>
                </ol>
                <p class="terms-paragraph">Data opublikowania regulaminu: 01.02.2024 r.<br></p>

            </div>
        </div>

        {elseif $cms.id == 6}
        
        {literal}
        <style>
            #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
            .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }

            .bank-custom-page {
                font-family: 'Garamond', 'Georgia', serif;
                color: #555;
                background: #fff;
                padding-bottom: 80px;
                width: 100%;
            }

            .bank-header-wrapper {
                max-width: 1140px;
                margin: 0 auto;
                padding: 40px 15px 20px 15px;
                border-bottom: 1px solid #f9a918;
                margin-bottom: 40px;
            }

            .bank-header-wrapper h1 {
                font-family: 'Garamond', serif;
                font-size: 42px;
                color: #555;
                margin: 0;
                font-weight: normal;
                text-align: left;
            }

            .bank-content {
                max-width: 1140px;
                margin: 0 auto;
                padding: 0 15px;
                font-size: 15px;
                line-height: 1.6;
                color: #333;
            }

            .company-details {
                margin-bottom: 30px;
            }

            .company-details p {
                margin: 0 0 5px 0;
                text-transform: uppercase;
            }
            
            .account-number {
                font-weight: bold;
                font-size: 16px;
                color: #333;
            }
        </style>
        {/literal}

        <div class="bank-custom-page">
            <div class="bank-header-wrapper">
                <h1>Rachunek bankowy</h1>
            </div>

            <div class="bank-content">
                <div class="company-details">
                    <p>PROGRESSIVE SP. Z O.O.</p>
                    <p>SOSNOWIECKA 5</p>
                    <p>52-008 WROCŁAW</p>
                </div>
                <p class="account-number">23 1930 1190 2220 0264 4091 0002</p>
            </div>
        </div>

    
    {elseif $cms.id == 7}
        
        {literal}
        <style>
            #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
            .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }

            .complaints-custom-page {
                font-family: 'Garamond', 'Georgia', serif;
                color: #555;
                background: #fff;
                padding-bottom: 80px;
                width: 100%;
            }

            .complaints-header-wrapper {
                max-width: 1140px;
                margin: 0 auto;
                padding: 40px 15px 20px 15px;
                border-bottom: 1px solid #f9a918;
                margin-bottom: 40px;
            }

            .complaints-header-wrapper h1 {
                font-family: 'Garamond', serif;
                font-size: 42px;
                color: #555;
                margin: 0;
                font-weight: normal;
                text-align: left;
            }

            .complaints-content {
                max-width: 1140px; 
                margin: 0 auto;
                padding: 0 15px;
                font-size: 15px;
                line-height: 1.6;
                color: #555;
            }

            ol.complaints-list {
                padding-left: 20px;
                margin: 0;
            }

            ol.complaints-list li {
                margin-bottom: 5px; 
                text-align: justify;
                padding-left: 10px;
            }

            .link-style {
                color: #5bc0de;
                text-decoration: none;
            }
            .link-style:hover {
                text-decoration: underline;
            }
        </style>
        {/literal}

        <div class="complaints-custom-page">
            <div class="complaints-header-wrapper">
                <h1>Reklamacje</h1>
            </div>

            <div class="complaints-content">
                <ol class="complaints-list">
                    <li>Reklamacje należy składać na adres Sklepu - PROGRESSIVE, Sosnowiecka 5, 52-008 Wrocław, bądź na email: reklamacje@herbata.net</li>
                    <li>Składając reklamację należy dostarczyć do Sklepu reklamowany produkt wraz z dowodem zakupu i wypełnionym zgłoszeniem reklamacyjnym, dostępnym pod adresem: <a href="https://czasnaherbate.net/img/cms/Zgloszenie_reklamacyjne_towaru_dostawy_formularz.pdf" class="link-style">zgłoszenie reklamacyjne</a></li>
                    <li>Sklep rozpatrzy reklamację w terminie 14 dni od dnia złożenia za pośrednictwem listu bądź wiadomości email. W przypadku rozpatrzenia reklamacji na korzyść Klienta Sklep wymieni reklamowany Towar na nowy, pełnowartościowy lub zwróci wartość kupionego towaru.</li>
                    <li>Klient traci uprawnienia określone w pkt. 3 niniejszego paragrafu, jeżeli przed upływem dwóch miesięcy od stwierdzenia niezgodności towaru z umową nie zawiadomi sklepu o tym fakcie. Do zachowania terminu wystarczy wysłanie zawiadomienia za pośrednictwem wiadomości email przed jego upływem.</li>
                </ol>
            </div>
        </div>

    {elseif $cms.id == 8}
        
        {literal}
        <style>
            #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
            .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }

            .returns-custom-page {
                font-family: 'Garamond', 'Georgia', serif;
                color: #555;
                background: #fff;
                padding-bottom: 80px;
                width: 100%;
            }

            .returns-header-wrapper {
                max-width: 1140px;
                margin: 0 auto;
                padding: 40px 15px 20px 15px;
                border-bottom: 1px solid #f9a918;
                margin-bottom: 40px;
            }

            .returns-header-wrapper h1 {
                font-family: 'Garamond', serif;
                font-size: 42px;
                color: #555;
                margin: 0;
                font-weight: normal;
                text-align: left;
            }

            .returns-content {
                max-width: 1140px; 
                margin: 0 auto;
                padding: 0 15px;
                font-size: 15px;
                line-height: 1.6;
                color: #555;
            }

            ol.returns-list {
                padding-left: 20px;
                margin: 0;
            }

            ol.returns-list li {
                margin-bottom: 5px; 
                text-align: justify;
                padding-left: 10px;
            }

            .link-style {
                color: #5bc0de;
                text-decoration: none;
                text-transform: uppercase;
            }
            .link-style:hover {
                text-decoration: underline;
            }
        </style>
        {/literal}

        <div class="returns-custom-page">
            <div class="returns-header-wrapper">
                <h1>Zwroty</h1>
            </div>

            <div class="returns-content">
                <ol class="returns-list">
                    <li>Konsument, który zawarł umowę na odległość, ma prawo do odstąpienia od umowy bez podania przyczyny, składając stosowne oświadczenie na piśmie, w terminie 14 dni (podstawa prawna: "art. 27, 28, 29, 31, 37 i 38 ustawy o prawach konsumenta). Termin ten jest terminem nieprzekraczalnym i liczy się od dnia wydania rzeczy, a gdy umowa dotyczy świadczenia usługi – od dnia jej zawarcia. Do zachowania tego terminu wystarczy wysłanie oświadczenia przed jego upływem na adres Sklepu.</li>
                    <li>W przypadku odstąpienia od umowy zawartej na odległość, umowa jest uważana za niezawartą. To, co strony świadczyły, ulega zwrotowi w stanie niezmienionym, chyba, że zmiana była konieczna w granicach zwykłego zarządu.</li>
                    <li>Zwrot powinien nastąpić niezwłocznie, nie później niż w terminie 14 dni. Zakupiony towar należy zwrócić na adres Sklepu. Koszt zwrotu pokrywa Kupujący.</li>
                    <li>Zwroty należy wysyłać na adres Sklepu - PROGRESSIVE, Sosnowiecka 5, 52-008 Wrocław, po uprzednim powiadomieniu na mail: biuro@czasnaherbate.net.</li>
                    <li>Zwracany produkt należy dostarczyć do Sklepu wraz z dowodem zakupu i wypełnionym formularzem - <a href="https://czasnaherbate.net/img/cms/oswiadczenie%20o%20odst%C4%85pieniu%20CZASNAHERBATE(1).pdf" class="link-style" target="_blank">ZWROT TOWARU</a></li>
                    <li>W terminie 14 dni od dnia otrzymania od Konsumenta oświadczenia o odstąpieniu od umowy zwracamy konsumentowi wszystkie dokonane przez niego płatności, zgodnie z Art. 32 Ustawy o prawach konsumenta.</li>
                </ol>
            </div>
        </div>

        {elseif $cms.id == 9}
        
        {literal}
        <style>
            #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
            .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }

            .packaging-custom-page {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: #555;
                background: #fff;
                padding-bottom: 80px;
                width: 100%;
            }

            .packaging-header-wrapper {
                max-width: 1140px;
                margin: 0 auto;
                padding: 40px 15px 20px 15px;
                border-bottom: 1px solid #f9a918;
                margin-bottom: 40px;
            }

            .packaging-header-wrapper h1 {
                font-family: 'Garamond', serif;
                font-size: 42px;
                color: #555;
                margin: 0;
                font-weight: normal;
                text-align: left;
            }

            .packaging-content {
                max-width: 1140px;
                margin: 0 auto;
                padding: 0 15px;
                font-size: 14px;
                line-height: 1.8;
                color: #444;
            }

            .packaging-text p {
                margin-bottom: 20px;
                text-align: justify;
            }

            .packaging-images {
                display: flex;
                gap: 0;
                margin-top: 40px;
                justify-content: flex-start;
            }

            .packaging-img-item {
                flex: 0 0 auto;
            }

            .packaging-img-item img {
                max-height: 300px;
                width: auto;
                display: block;
            }

            @media (max-width: 768px) {
                .packaging-images {
                    flex-direction: column;
                    align-items: center;
                    gap: 15px;
                }
            }
        </style>
        {/literal}

        <div class="packaging-custom-page">
            <div class="packaging-header-wrapper">
                <h1>Jak pakujemy zamówienia</h1>
            </div>

            <div class="packaging-content">
                <div class="packaging-text">
                    <p>Zamówienia pakowane są w kartonowe opakowania. W celu zabezpieczenia przedmiotów wolna przestrzeń uzupełniana jest wypełniaczem. Używany przez nas wypełniacz jest produktem naturalnym - nie szkodzi środowisku, rozpuszcza się w wodzie, może być używany do kompostowania - więc jego utylizacja nie powinna sprawić żadnych problemów. Jeżeli hołdują Państwo zasadzie "zero waste", prosimy o taką informację w komentarzu do zamówienia - spakujemy bez żadnych zabezpieczeń i zbędnych dodatków.</p>
                    <p>Kawa i herbaty pakujemy w estetyczne opakowania.</p>
                </div>

                <div class="packaging-images">
                    <div class="packaging-img-item">
                        <img src="{$urls.theme_assets}img/2-f8932c03.jpg" alt="Opakowanie herbaty">
                    </div>
                    <div class="packaging-img-item">
                        <img src="{$urls.theme_assets}img/1-f8932c03.jpg" alt="Opakowanie kawy">
                    </div>
                </div>
            </div>
        </div>

        {elseif $cms.id == 3}

        {literal}
        <style>
            #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
            .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }

            .policy-custom-page {
                font-family: 'Garamond', 'Georgia', serif;
                color: #333;
                background: #fff;
                padding-bottom: 80px;
                width: 100%;
                font-size: 14px;
                line-height: 1.6;
            }

            .policy-header-wrapper {
                max-width: 1140px;
                margin: 0 auto;
                padding: 40px 15px 20px 15px;
                border-bottom: 1px solid #f9a918;
                margin-bottom: 40px;
            }

            .policy-header-wrapper h1 {
                font-family: 'Garamond', serif;
                font-size: 42px;
                color: #555;
                margin: 0;
                font-weight: normal;
                text-align: left;
            }

            .policy-content {
                max-width: 1140px;
                margin: 0 auto;
                padding: 0 15px;
            }

            .policy-title-center {
                text-align: center;
                font-weight: bold;
                text-transform: uppercase;
                display: block;
                margin-bottom: 5px;
                color: #555;
            }

            .policy-chapter-header {
                text-align: center;
                font-weight: bold;
                margin-top: 35px;
                margin-bottom: 15px;
                color: #555;
            }
            
            .policy-chapter-header span {
                display: block;
                font-size: 14px;
            }

            .policy-text {
                text-align: justify;
                margin-bottom: 15px;
            }

            ol.policy-list-alpha {
                list-style-type: lower-alpha;
                padding-left: 25px;
                text-align: justify;
            }
            
            ol.policy-list-num {
                list-style-type: decimal;
                padding-left: 25px;
                text-align: justify;
            }

            ol.policy-list-alpha li, ol.policy-list-num li {
                margin-bottom: 8px;
            }

            .highlight-yellow {
                background-color: #ffff00;
            }
        </style>
        {/literal}

        <div class="policy-custom-page">
            <div class="policy-header-wrapper">
                <h1>Polityka prywatności</h1>
            </div>

            <div class="policy-content">
                
                <div style="margin-bottom: 30px;">
                    <span class="policy-title-center">POLITYKA BEZPIECZEŃSTWA</span>
                    <span class="policy-title-center">PRZETWARZANIA DANYCH OSOBOWYCH ORAZ</span>
                    <span class="policy-title-center">INSTRUKCJA ZARZĄDZANIA SYSTEMEM INFORMATYCZNYM PRZETWARZAJĄCYM DANE OSOBOWE</span>
                    <span class="policy-title-center">w  PROGRESSIVE Sp. z o.o.</span>
                </div>

                <div class="policy-chapter-header">WSTĘP</div>
                <div class="policy-text">
                    Realizując postanowienia ROZPORZĄDZENIA PARLAMENTU EUROPEJSKIEGO I RADY (UE) 2016/679 z dnia 27 kwietnia 2016 r. w sprawie ochrony osób fizycznych w związku z przetwarzaniem danych osobowych i w sprawie swobodnego przepływu takich danych oraz uchylenia dyrektywy 95/46/WE (ogólne rozporządzenie o ochronie danych) oraz przepisów krajowych Rzeczypospolitej Polskiej wprowadza się zestaw reguł i praktycznych doświadczeń regulujących sposób zarządzania, ochrony i dystrybucji informacji wrażliwej pozwalający na zapewnienie ochrony danych osobowych.
                </div>

                <div class="policy-chapter-header">
                    <span>Rozdział 1</span>
                    Postanowienia ogólne
                </div>
                <div class="policy-text">Ilekroć w dokumencie jest mowa o:</div>
                <div class="policy-text">
                    1. „danych osobowych” – należy przez to rozumieć informacje o zidentyfikowanej lub możliwej do zidentyfikowania osobie fizycznej („osobie, której dane dotyczą”); możliwa do zidentyfikowania osoba fizyczna to osoba, którą można bezpośrednio lub pośrednio zidentyfikować, w szczególności na podstawie identyfikatora takiego jak imię i nazwisko, numer identyfikacyjny, dane o lokalizacji, identyfikator internetowy lub jeden bądź kilka szczególnych czynników określających fizyczną, fizjologiczną, genetyczną, psychiczną, ekonomiczną, kulturową lub społeczną tożsamość osoby fizycznej;<br>
                    2. „przetwarzaniu” należy przez to rozumieć operację lub zestaw operacji wykonywanych na danych osobowych lub zestawach danych osobowych w sposób zautomatyzowany lub niezautomatyzowany, taką jak zbieranie, utrwalanie, organizowanie, porządkowanie, przechowywanie, adaptowanie lub modyfikowanie, pobieranie, przeglądanie, wykorzystywanie, ujawnianie poprzez przesłanie, rozpowszechnianie lub innego rodzaju udostępnianie, dopasowywanie lub łączenie, ograniczanie, usuwanie lub niszczenie;<br>
                    3. „ograniczeniu przetwarzania” należy przez to rozumieć oznaczenie przechowywanych danych osobowych w celu ograniczenia ich przyszłego przetwarzania;<br>
                    4. „profilowaniu” należy przez to rozumieć, dowolną formę zautomatyzowanego przetwarzania danych osobowych, które polega na wykorzystaniu danych osobowych do oceny niektórych czynników osobowych osoby fizycznej, w szczególności do analizy lub prognozy aspektów dotyczących efektów pracy tej osoby fizycznej, jej sytuacji ekonomicznej, zdrowia, osobistych preferencji, zainteresowań, wiarygodności, zachowania, lokalizacji lub przemieszczania się;<br>
                    5. „pseudonimizacji” należy przez to rozumieć przetworzenie danych osobowych w taki sposób, by nie można ich było już przypisać konkretnej osobie, której dane dotyczą, bez użycia dodatkowych informacji, pod warunkiem że takie dodatkowe informacje są przechowywane osobno i są objęte środkami technicznymi i organizacyjnymi uniemożliwiającymi ich przypisanie zidentyfikowanej lub możliwej do zidentyfikowania osobie fizycznej;<br>
                    6. „zbiorze danych” należy przez to rozumieć uporządkowany zestaw danych osobowych dostępnych według określonych kryteriów, niezależnie od tego, czy zestaw ten jest scentralizowany, zdecentralizowany czy rozproszony funkcjonalnie lub geograficznie;<br>
                    7. „podmiocie przetwarzającym” należy przez to rozumieć osobę fizyczną lub prawną, organ publiczny, jednostkę lub inny podmiot, który przetwarza dane osobowe w imieniu administratora;<br>
                    8. „Administratorze” lub „Administratorze Danych Osobowych (ADO)” – należy przez to rozumieć firmę PROGRESSIVE Sp . z o.o. , z siedzibą we Wrocławiu przy ul. Sosnowieckiej 5.<br>
                    9. „Administratorze Bezpieczeństwa Danych Osobowych (ABDO)” – należy przez to rozumieć osobę wskazaną przez Zarząd Administratora, do koordynowania wszelkich spraw dotyczących ochrony danych osobowych.<br>
                    10. „odbiorcy” należy przez to rozumieć osobę fizyczną lub prawną, organ publiczny, jednostkę lub inny podmiot, któremu ujawnia się dane osobowe, niezależnie od tego, czy jest stroną trzecią. Organy publiczne, które mogą otrzymywać dane osobowe w ramach konkretnego postępowania zgodnie z przepisami prawa Unii lub państwa członkowskiego, nie są jednak uznawane za odbiorców.<br>
                    11. „stronie trzeciej” należy przez to rozumieć osobę fizyczną lub prawną, organ publiczny, jednostkę lub podmiot inny niż osoba, której dane dotyczą, administrator, podmiot przetwarzający czy osoby, które – z upoważnienia administratora lub podmiotu przetwarzającego – mogą przetwarzać dane osobowe;<br>
                    12. „zgodzie osoby, której dane są przetwarzane” należy przez to rozumieć dobrowolne, konkretne, świadome i jednoznaczne okazanie woli, którym osoba, której dane dotyczą, w formie oświadczenia lub wyraźnego działania potwierdzającego, przyzwala na przetwarzanie dotyczących jej danych osobowych;<br>
                    13. „naruszeniu ochrony danych osobowych” należy przez to rozumieć naruszenie bezpieczeństwa prowadzące do przypadkowego lub niezgodnego z prawem zniszczenia, utracenia, zmodyfikowania, nieuprawnionego ujawnienia lub nieuprawnionego dostępu do danych osobowych przesyłanych, przechowywanych lub w inny sposób przetwarzanych;<br>
                    14. „danych biometrycznych” należy przez to rozumieć dane osobowe, które wynikają ze specjalnego przetwarzania technicznego, dotyczące cech fizycznych, fizjologicznych lub behawioralnych osoby fizycznej oraz umożliwiają lub potwierdzają jednoznaczną identyfikację tej osoby, takie jak wizerunek twarzy lub dane daktyloskopijne;<br>
                    15. „danych dotyczących zdrowia” należy przez to rozumieć dane osobowe o zdrowiu fizycznym lub psychicznym osoby fizycznej – w tym o korzystaniu z usług opieki zdrowotnej – ujawniające informacje o stanie jej zdrowia;<br>
                    16. „obszarze przetwarzania” należy przez to rozumieć budynki, pomieszczenia lub części pomieszczeń w których przetwarzane są dane osobowe.<br>
                    17. „zbiorze danych osobowych” należy przez to rozumieć uporządkowany zestaw danych osobowych dostępnych według określonych kryteriów, niezależnie od tego, czy zestaw ten jest scentralizowany, zdecentralizowany czy rozproszony funkcjonalnie lub geograficznie.<br>
                    18. „opisie struktury zbiorów” należy przez to rozumieć opis zbiorów danych osobowych wskazujący zawartość poszczególnych pól informacyjnych oraz powiązania miedzy nimi.<br>
                    19. „opisie przepływu danych” należy przez to rozumieć opis przepływu danych osobowych pomiędzy zbiorami.<br>
                    20. „środkach technicznych i organizacyjnych” należy przez to rozumieć środki techniczne i organizacyjne niezbędne dla zapewnienia poufności, integralności i rozliczalności przetwarzanych danych.<br>
                    21. „procedurach bezpieczeństwa” należy przez to rozumieć procedury mające na celu zabezpieczenie przetwarzanych danych osobowych.
                </div>

                <div class="policy-chapter-header">
                    <span>Rozdział 2</span>
                    Zasady dotyczące przetwarzania danych osobowych:
                </div>
                <div class="policy-text">
                    1. Każda osoba przetwarzająca dane osobowe z upoważnienia Administratora jest odpowiedzialna (w zakresie obejmującym przetwarzane przez nią dane osobowe) za przestrzeganie powyższych zasad i musi być w stanie wykazać ich przestrzeganie („rozliczalność”):
                </div>
                <ol class="policy-list-alpha">
                    <li>przetwarzane zgodnie z prawem, rzetelnie i w sposób przejrzysty dla osoby, której dane dotyczą („zgodność z prawem, rzetelność i przejrzystość”);</li>
                    <li>zbierane w konkretnych, wyraźnych i prawnie uzasadnionych celach i nieprzetwarzane dalej w sposób niezgodny z tymi celami; dalsze przetwarzanie do celów archiwalnych w interesie publicznym, do celów badań naukowych lub historycznych lub do celów statystycznych nie jest uznawane za niezgodne z pierwotnymi celami („ograniczenie celu”);</li>
                    <li>adekwatne, stosowne oraz ograniczone do tego, co niezbędne do celów, w których są przetwarzane („minimalizacja danych”);</li>
                    <li>prawidłowe i w razie potrzeby uaktualniane; należy podjąć wszelkie rozsądne działania, aby dane osobowe, które są nieprawidłowe w świetle celów ich przetwarzania, zostały niezwłocznie usunięte lub sprostowane („prawidłowość”);</li>
                    <li>przechowywane w formie umożliwiającej identyfikację osoby, której dane dotyczą, przez okres nie dłuższy, niż jest to niezbędne do celów, w których dane te są przetwarzane; dane osobowe można przechowywać przez okres dłuższy, o ile będą one przetwarzane wyłącznie do celów archiwalnych w interesie publicznym, do celów badań naukowych lub historycznych lub do celów statystycznych, z zastrzeżeniem że wdrożone zostaną odpowiednie środki techniczne i organizacyjne wymagane przepisami prawa w celu ochrony praw i wolności osób, których dane dotyczą („ograniczenie przechowywania”);</li>
                    <li>przetwarzane w sposób zapewniający odpowiednie bezpieczeństwo danych osobowych, w tym ochronę przed niedozwolonym lub niezgodnym z prawem przetwarzaniem oraz przypadkową utratą, zniszczeniem lub uszkodzeniem, za pomocą odpowiednich środków technicznych lub organizacyjnych („integralność i poufność”).</li>
                </ol>

                <div class="policy-chapter-header">
                    <span>Rozdział 3</span>
                    Podstawa przetwarzania danych
                </div>
                <div class="policy-text">1. Administrator będzie przetwarzał dane osobowe wyłącznie gdy spełniony będzie co najmniej jeden z poniższych warunków:</div>
                <ol class="policy-list-alpha">
                    <li>osoba, której dane dotyczą wyraziła zgodę na przetwarzanie swoich danych osobowych w jednym lub większej liczbie określonych celów;</li>
                    <li>przetwarzanie jest niezbędne do wykonania umowy, której stroną jest osoba, której dane dotyczą, lub do podjęcia działań na żądanie osoby, której dane dotyczą, przed zawarciem umowy;</li>
                    <li>przetwarzanie jest niezbędne do wypełnienia obowiązku prawnego ciążącego na administratorze – jeżeli obowiązek taki wynika z prawa Unii Europejskiej lub prawa krajowego;</li>
                    <li>przetwarzanie jest niezbędne do ochrony żywotnych interesów osoby, której dane dotyczą, lub innej osoby fizycznej;</li>
                    <li>przetwarzanie jest niezbędne do celów wynikających z prawnie uzasadnionych interesów realizowanych przez administratora lub przez stronę trzecią (przy czym wynika to z prawa Unii Europejskiej lub prawa krajowego), z wyjątkiem sytuacji, w których nadrzędny charakter wobec tych interesów mają interesy lub podstawowe prawa i wolności osoby, której dane dotyczą, wymagające ochrony danych osobowych, w szczególności gdy osoba, której dane dotyczą, jest dzieckiem.</li>
                </ol>
                <div class="policy-text">2. Przetwarzanie danych osobowych ujawniających pochodzenie rasowe lub etniczne, poglądy polityczne, przekonania religijne lub światopoglądowe, przynależność do związków zawodowych oraz przetwarzania danych biometrycznych w celu jednoznacznego zidentyfikowania osoby fizycznej lub danych dotyczących zdrowia, seksualności lub orientacji seksualnej tej osoby, jest dopuszczalne wyłącznie gdy:</div>
                <ol class="policy-list-alpha">
                    <li>osoba, której dane dotyczą, wyraziła wyraźną zgodę na przetwarzanie tych danych osobowych w jednym lub kilku konkretnych celach;</li>
                    <li>przetwarzanie jest niezbędne do wypełnienia obowiązków i wykonywania szczególnych praw przez administratora lub osobę, której dane dotyczą, w dziedzinie prawa pracy, zabezpieczenia społecznego i ochrony socjalnej;</li>
                    <li>przetwarzanie jest niezbędne do ochrony żywotnych interesów osoby, której dane dotyczą, lub innej osoby fizycznej, a osoba, której dane dotyczą, jest fizycznie lub prawnie niezdolna do wyrażenia zgody;</li>
                    <li>przetwarzanie dotyczy danych osobowych w sposób oczywisty upublicznionych przez osobę, której dane dotyczą;</li>
                    <li>przetwarzanie jest niezbędne do celów profilaktyki zdrowotnej lub medycyny pracy, do oceny zdolności pracownika do pracy, diagnozy medycznej, zapewnienia opieki zdrowotnej lub zabezpieczenia społecznego, leczenia lub zarządzania systemami i usługami opieki zdrowotnej lub zabezpieczenia społecznego.</li>
                </ol>

                <div class="policy-chapter-header">
                    <span>Rozdział 4</span>
                    Zmiana celu przetwarzania
                </div>
                <div class="policy-text">Jeżeli przetwarzanie w celu innym niż cel, w którym dane osobowe zostały zebrane, nie odbywa się na podstawie zgody osoby, której dane dotyczą, ani prawa Unii Europejskiej lub prawa krajowego, administrator aby ustalić, czy przetwarzanie w innym celu jest zgodne z celem, w którym dane osobowe zostały pierwotnie zebrane – bierze pod uwagę między innymi:</div>
                <ol class="policy-list-alpha">
                    <li>wszelkie związki między celami, w których zebrano dane osobowe, a celami zamierzonego dalszego przetwarzania;</li>
                    <li>kontekst, w którym zebrano dane osobowe, w szczególności relację między osobami, których dane dotyczą, a administratorem;</li>
                    <li>charakter danych osobowych, w szczególności czy przetwarzane są szczególne kategorie danych osobowych zgodnie z art. 9 RODO lub dane osobowe dotyczące wyroków skazujących i naruszeń prawa zgodnie z art. 10 RODO;</li>
                    <li>ewentualne konsekwencje zamierzonego dalszego przetwarzania dla osób, których dane dotyczą;</li>
                    <li>istnienie odpowiednich zabezpieczeń, w tym ewentualnie szyfrowania lub pseudonimizacji.</li>
                </ol>

                <div class="policy-chapter-header">
                    <span>Rozdział 5</span>
                    Postępowanie z osobami, których dane dotyczą
                </div>
                <ol class="policy-list-num">
                    <li>Administrator podejmuje odpowiednie środki, aby w zwięzłej, przejrzystej, zrozumiałej i łatwo dostępnej formie, jasnym i prostym językiem udzielić osobie, której dane dotyczą, wszelkich informacji, wymaganych przepisami prawa oraz prowadzić z nią wszelką komunikację wymaganą przepisami prawa w sprawie przetwarzania.</li>
                    <li>Informacji udziela się na piśmie lub w inny sposób, w tym w stosownych przypadkach – elektronicznie.</li>
                    <li>Informacje dla pracowników administratora udzielane będą elektronicznie (za pomocą służbowej skrzynki e-mail). Na żądanie pracownika informacja zostanie udzielona na piśmie.</li>
                    <li>Jeżeli osoba, której dane dotyczą, tego zażąda, informacji można udzielić ustnie, o ile nie będzie wątpliwości co do jej tożsamości.</li>
                    <li>Administrator bez zbędnej zwłoki – a w każdym razie w terminie miesiąca od otrzymania żądania – udziela osobie, której dane dotyczą, informacji o działaniach podjętych w związku ze złożonym przez nią żądaniem. W razie potrzeby termin ten można przedłużyć o kolejne dwa miesiące z uwagi na skomplikowany charakter żądania lub liczbę żądań.</li>
                    <li>W terminie miesiąca od otrzymania żądania administrator informuje osobę, której dane dotyczą o takim przedłużeniu terminu, z podaniem przyczyn opóźnienia.</li>
                    <li>Jeśli osoba, której dane dotyczą, przekazała swoje żądanie elektronicznie, w miarę możliwości informacje także są przekazywane elektronicznie, chyba że osoba, której dane dotyczą, zażąda innej formy.</li>
                    <li>Jeżeli administrator nie podejmuje działań w związku z żądaniem osoby, której dane dotyczą, to niezwłocznie – najpóźniej w terminie miesiąca od otrzymania żądania – informuje osobę, której dane dotyczą, o powodach niepodjęcia działań oraz o możliwości wniesienia skargi do organu nadzorczego oraz skorzystania ze środków ochrony prawnej przed sądem. W takiej sytuacji każdorazowo należy skontaktować się z radcą prawnym administratora.</li>
                    <li>Komunikacja oraz informacje podawane osobie, której dane dotyczą, są wolne od opłat.</li>
                </ol>

                <div class="policy-chapter-header">
                    <span>Rozdział 6</span>
                    Informacje podawane osobie, której dane dotyczą
                </div>
                <ol class="policy-list-num">
                    <li>W przypadku zbierania danych osobowych od osoby, której dane dotyczą, osobie takiej należy – podczas pozyskiwania danych – podać informacje określone w Załączniku nr 6.1.</li>
                    <li>W przypadku pozyskiwania danych osobowych w sposób inny niż od osoby, której dane dotyczą, osobie takiej należy podać informacje określone w Załączniku nr 6.2.</li>
                    <li>Informacje te należy podać:
                        <ol class="policy-list-alpha" style="margin-top: 5px;">
                            <li>w rozsądnym terminie po pozyskaniu danych osobowych – najpóźniej w ciągu miesiąca – mając na uwadze konkretne okoliczności przetwarzania danych osobowych;</li>
                            <li>jeżeli dane osobowe mają być stosowane do komunikacji z osobą, której dane dotyczą – najpóźniej przy pierwszej takiej komunikacji z osobą, której dane dotyczą; lub</li>
                            <li>jeżeli planuje się ujawnić dane osobowe innemu odbiorcy – najpóźniej przy ich pierwszym ujawnieniu.</li>
                        </ol>
                    </li>
                    <li>Jeżeli planuje się dalej przetwarzać dane osobowe w celu innym, niż cel w którym dane osobowe zostały zebrane, przed takim dalszym przetwarzaniem należy poinformować osobę, której dane dotyczą o tym nowym celu.</li>
                </ol>

                <div class="policy-chapter-header">
                    <span>Rozdział 7</span>
                    Dostęp do danych
                </div>
                <ol class="policy-list-num">
                    <li>Osoba, której dane dotyczą, jest uprawniona do uzyskania od administratora potwierdzenia, czy przetwarzane są dane osobowe jej dotyczące, a jeżeli ma to miejsce, jest uprawniona do uzyskania dostępu do nich oraz następujących informacji dotyczących:
                        <ol class="policy-list-alpha" style="margin-top: 5px;">
                            <li>celów przetwarzania;</li>
                            <li>kategorii odnośnych danych osobowych;</li>
                            <li>informacji o odbiorcach lub kategoriach odbiorców, którym dane osobowe zostały lub zostaną ujawnione, w szczególności o odbiorcach w państwach trzecich lub organizacjach międzynarodowych;</li>
                            <li>planowanego okresu przechowywania danych osobowych, a gdy nie jest to możliwe, kryteriach ustalania tego okresu;</li>
                            <li>informacji o prawie do żądania od administratora sprostowania, usunięcia lub ograniczenia przetwarzania danych osobowych jej dotyczących oraz do wniesienia sprzeciwu wobec takiego przetwarzania;</li>
                            <li>informacji o prawie wniesienia skargi do organu nadzorczego;</li>
                            <li>jeżeli dane osobowe nie zostały zebrane od osoby, której dane dotyczą – wszelkich dostępnych informacji o ich źródle.</li>
                        </ol>
                    </li>
                    <li>Jeżeli dane osobowe są przekazywane do państwa trzeciego lub organizacji międzynarodowej, osoba, której dane dotyczą, ma prawo zostać poinformowana o odpowiednich zabezpieczeniach związanych z przekazaniem.</li>
                    <li>Na żądanie osoby, której dane dotyczą administrator dostarczy jej kopię danych osobowych podlegających przetwarzaniu. Jeżeli osoba, której dane dotyczą, zwraca się o kopię drogą elektroniczną i jeżeli nie zaznaczy inaczej, informacji udziela się powszechnie stosowaną drogą elektroniczną.</li>
                </ol>

                <div class="policy-chapter-header">
                    <span>Rozdział 8</span>
                    Sprostowanie danych
                </div>
                <div class="policy-text">Osoba, której dane dotyczą, ma prawo żądania od administratora niezwłocznego sprostowania dotyczących jej danych osobowych, które są nieprawidłowe oraz - z uwzględnieniem celów przetwarzania - uzupełnienia niekompletnych danych osobowych.</div>

                <div class="policy-chapter-header">
                    <span>Rozdział 9</span>
                    Usuwanie danych
                </div>
                <ol class="policy-list-num">
                    <li>Osoba, której dane dotyczą, ma prawo żądania od administratora niezwłocznego usunięcia dotyczących jej danych osobowych, a administrator ma obowiązek bez zbędnej zwłoki usunąć dane osobowe, jeżeli:
                        <ol class="policy-list-alpha" style="margin-top: 5px;">
                            <li>dane osobowe nie są już niezbędne do celów, w których zostały zebrane lub w inny sposób przetwarzane;</li>
                            <li>osoba, której dane dotyczą, cofnęła zgodę na przetwarzanie;</li>
                            <li>osoba, której dane dotyczą, wnosi sprzeciw wobec przetwarzania i nie występują nadrzędne prawnie uzasadnione podstawy przetwarzania;</li>
                        </ol>
                    </li>
                    <li>Jeżeli administrator upublicznił dane osobowe, a na mocy obowiązujących przepisów ma obowiązek usunąć te dane osobowe, to – biorąc pod uwagę dostępną technologię i koszt realizacji – podejmuje rozsądne działania, w tym środki techniczne, by poinformować administratorów przetwarzających te dane osobowe, że osoba, której dane dotyczą, żąda, by administratorzy ci usunęli wszelkie łącza do tych danych, kopie tych danych osobowych lub ich replikacje.</li>
                </ol>

                <div class="policy-chapter-header">
                    <span>Rozdział 10</span>
                    Ograniczenie przetwarzania
                </div>
                <div class="policy-text">Osoba, której dane dotyczą, ma prawo żądania od administratora ograniczenia przetwarzania w następujących przypadkach:</div>
                <ol class="policy-list-alpha">
                    <li>osoba, której dane dotyczą, kwestionuje prawidłowość danych osobowych – na okres pozwalający administratorowi sprawdzić prawidłowość tych danych;</li>
                    <li>przetwarzanie jest niezgodne z prawem, a osoba, której dane dotyczą, sprzeciwia się usunięciu danych osobowych, żądając w zamian ograniczenia ich wykorzystywania;</li>
                    <li>administrator nie potrzebuje już danych osobowych do celów przetwarzania, ale są one potrzebne osobie, której dane dotyczą, do ustalenia, dochodzenia lub obrony roszczeń;</li>
                    <li>osoba, której dane dotyczą, wniosła sprzeciw wobec przetwarzania – do czasu stwierdzenia, czy prawnie uzasadnione podstawy po stronie administratora są nadrzędne wobec podstaw sprzeciwu osoby, której dane dotyczą.</li>
                </ol>

                <div class="policy-chapter-header">
                    <span>Rozdział 11</span>
                    Sprzeciw wobec przetwarzania
                </div>
                <ol class="policy-list-num">
                    <li>Osoba, której dane dotyczą, ma prawo w dowolnym momencie wnieść sprzeciw wobec przetwarzania dotyczących jej danych osobowych.</li>
                    <li>Jeżeli dane osobowe są przetwarzane na potrzeby marketingu bezpośredniego lub w celach rekrutacyjnych, osoba, której dane dotyczą, ma prawo w dowolnym momencie wnieść sprzeciw wobec przetwarzania dotyczących jej danych osobowych na takie potrzeby, w tym profilowania, w zakresie, w jakim przetwarzanie jest związane z takim marketingiem bezpośrednim lub rekrutacją.</li>
                    <li>Jeżeli osoba, której dane dotyczą, wniesie sprzeciw wobec przetwarzania do celów marketingu bezpośredniego lub celów rekrutacyjnych, danych osobowych nie wolno już przetwarzać do takich celów.</li>
                    <li>Najpóźniej przy okazji pierwszej komunikacji z osobą, której dane dotyczą, wyraźnie informuje się ją o prawie, do wniesienia sprzeciwu wobec przetwarzania.</li>
                </ol>

                <div class="policy-chapter-header">
                    <span>Rozdział 12</span>
                    Administrator
                </div>
                <ol class="policy-list-num">
                    <li>Administrator, w celu należytej ochrony danych osobowych i zapewnienia aby przetwarzanie odbywało się zgodnie z prawem może:
                        <ol class="policy-list-alpha" style="margin-top: 5px;">
                            <li>Powołać Administratora Bezpieczeństwa Danych Osobowych.</li>
                            <li>Powołać Administratora Systemu Informatycznego.</li>
                        </ol>
                    </li>
                    <li>Administrator powinien w szczególności:
                        <ol class="policy-list-alpha" style="margin-top: 5px;">
                            <li>Określić i wdrożyć odpowiednie środki techniczne i organizacyjne (np. pseudonimizacja, minimalizacja danych), aby przetwarzanie odbywało się zgodnie z przepisami prawa. Środki te powinny uwzględniać charakter, zakres, kontekst i cele przetwarzania oraz ryzyko naruszenia praw lub wolności osób fizycznych o różnym prawdopodobieństwie i wadze zagrożenia.</li>
                            <li>Zapewnić możliwość wykazania, że dane są przetwarzane zgodnie z obowiązującymi przepisami prawa („rozliczalność).</li>
                            <li>Wdrożone środki poddawać przeglądom i uaktualniać; przeglądy powinny odbywać się przynajmniej raz w roku oraz po każdej zmianie przepisów prawa dot. ochrony danych osobowych - w przeglądach tych powinni uczestniczyć szefowie komórek przetwarzających dane osobowe (np. HR), osoba odpowiedzialna za funkcjonowanie infrastruktury IT i w razie potrzeby służby prawne Administratora.</li>
                            <li>Egzekwować Politykę bezpieczeństwa przetwarzania danych osobowych oraz Instrukcję zarządzania systemem informatycznym przetwarzającym dane osobowe.</li>
                            <li>Wydawać i anulować upoważnienia do przetwarzania danych osobowych osobom, które mają te dane przetwarzać.</li>
                            <li>Prowadzić ewidencje osób upoważnionych do przetwarzania danych osobowych.</li>
                            <li>Prowadzić ewidencje zbiorów danych osobowych wraz z opisem oprogramowania użytego do ich przetwarzania, sposobem przepływu danych pomiędzy systemami oraz opisem zastosowanych zabezpieczeń.</li>
                            <li>Prowadzić opis struktury zbiorów danych wraz z opisem pól informacyjnych i powiązań pomiędzy nimi. (załącznik nr 12.6)</li>
                            <li>Prowadzić ewidencje oświadczeń zgody na przetwarzanie danych osobowych osób, których dane te dotyczą. (załącznik nr 12.7)</li>
                            <li>Prowadzić rejestr czynności przetwarzania danych osobowych</li>
                            <li>Sporządzić Regulamin Ochrony Danych Osobowych. (załącznik nr 12.9)</li>
                        </ol>
                    </li>
                </ol>

                <div class="policy-chapter-header">
                    <span>Rozdział 13</span>
                    Środki techniczne i organizacyjne
                </div>
                <ol class="policy-list-num">
                    <li>W celu ochrony danych osobowych i zapewnienia ich przetwarzania zgodnie z przepisami prawa stosuje się następujące zabezpieczenia organizacyjne:
                        <ol class="policy-list-alpha" style="margin-top: 5px;">
                            <li>Została opracowana i wdrożona Polityka bezpieczeństwa przetwarzania danych osobowych oraz Instrukcja zarządzania systemem informatycznym przetwarzającym dane osobowe.</li>
                            <li>Do przetwarzania danych osobowych zostają dopuszczone wyłącznie osoby, którym dostęp do danych jest niezbędny („need to know”) w celu wykonywania obowiązków pracowniczych i jednocześnie posiadające ważne upoważnienia do ich przetwarzania.</li>
                            <li>Prowadzona jest ewidencja osób posiadających upoważnienia do przetwarzania danych osobowych.</li>
                            <li>Osoby posiadające upoważnienia zostały przeszkolone w zakresie ochrony danych osobowych i zabezpieczeń systemu informatycznego.</li>
                            <li>Osoby posiadające upoważnienia złożyły oświadczenie o zachowaniu poufności przetwarzanych danych osobowych.</li>
                            <li>Przetwarzanie danych osobowych jest w warunkach zabezpieczających dane osobowe przed dostępem osób nieupoważnionych.</li>
                            <li>Przebywanie osób nieupoważnionych w obszarze przetwarzania jest możliwe tylko w obecności osób upoważnionych oraz w warunkach zapewniających bezpieczeństwo danych osobowych.</li>
                        </ol>
                    </li>
                    <li>W celu ochrony danych osobowych stosuje się następujące zabezpieczenia fizyczne:
                        <ol class="policy-list-alpha" style="margin-top: 5px;">
                            <li>Dane osobowe w wersji papierowej są przechowywane w meblach zamykanych na klucz.</li>
                            <li>W obszarze przetwarzania są dostępne niszczarki dokumentów i nośników danych.</li>
                        </ol>
                    </li>
                    <li>W celu ochrony danych osobowych stosuje się następujące zabezpieczenia sprzętowe infrastruktury informatycznej i telekomunikacyjnej:
                        <ol class="policy-list-alpha" style="margin-top: 5px;">
                            <li>Zastosowano UPS do serwera lub komputerów, na których znajdują się przetwarzane dane osobowe.</li>
                            <li>Dostęp do komputerów, na których znajdują się dane osobowe odbywa się poprzez podanie loginu i hasła lub karty dostępowej.</li>
                            <li>Dostęp zdalny za pośrednictwem Internetu do danych osobowych odbywa się przez szyfrowane połączenie SSL VPN – Open VPN  i wymaga podania loginu i hasła.</li>
                            <li>Stosuje się system antywirusowy oraz firewall na komputerach, na których znajdują się dane osobowe.</li>
                        </ol>
                    </li>
                </ol>

                <div class="policy-chapter-header">
                    <span>Rozdział 14</span>
                    Procedury zapewniające bezpieczeństwo danych osobowych
                </div>
                <ol class="policy-list-num">
                    <li>Procedura nadawania uprawnień do przetwarzania danych osobowych:
                        <ol class="policy-list-alpha" style="margin-top: 5px;">
                            <li>Upoważnienia do przetwarzania danych osobowych nadaje Administrator.</li>
                            <li>Przed nadaniem upoważnienia do przetwarzania danych osobowych osoba zostaje przeszkolona w zakresie ich ochrony oraz zapoznana z zasadami bezpieczeństwa systemu informatycznego.</li>
                            <li>Osoba posiadająca upoważnienie do przetwarzania danych osobowych podpisuje oświadczenie o zachowaniu poufności danych osobowych do których ma dostęp.</li>
                        </ol>
                    </li>
                    <li>Metody i środki zabezpieczające dostęp do danych osobowych:
                        <ol class="policy-list-alpha" style="margin-top: 5px;">
                            <li>Hasła dostępu do danych osobowych nie mogą być powszechnie znanymi nazwami własnymi.</li>
                            <li>Osoba upoważniona zobowiązuje się do zachowania w poufności hasła dostępu do danych osobowych oraz jego natychmiastowej zmiany w przypadku ujawnienia.</li>
                            <li>Zabronione jest przechowywanie hasła w sposób jawny lub przekazywania go innym osobom.</li>
                            <li>Hasło jest zmieniane pół-automatycznie lub manualnie co 30 dni przez osoby upoważnione.</li>
                            <li>Hasło składa się z co najmniej 8 znaków, w tym małe i duże litery oraz cyfry lub znaki specjalne.</li>
                        </ol>
                    </li>
                    <li>Procedura rozpoczęcia, zawieszenia i zakończenia pracy wymagającej przetwarzania danych osobowych:
                        <ol class="policy-list-alpha" style="margin-top: 5px;">
                            <li>Osoba upoważniona loguje się do systemu lub programu informatycznego przy użyciu loginu i hasła.</li>
                            <li>Osoba upoważniona jest zobowiązana do informowania Administratora Systemu Informatycznego o nieautoryzowanych próbach zalogowania do systemu lub programu jeżeli system lub program takie zjawiska monitoruje.</li>
                            <li>Osoba upoważniona jest zobowiązana do uniemożliwienia wglądu w dane osobowe wyświetlane na ekranie monitora lub w wersji papierowej osobom nieupoważnionym.</li>
                            <li>Osoba upoważniona do przetwarzania danych osobowych jest zobowiązana w trakcie czasowego opuszczenia miejsca pracy do uruchomienia wygaszacza ekranu chronionego hasłem lub wylogowania się z systemu oraz usunięcia wydruków z danymi osobowymi z biurka.</li>
                            <li>Po zakończeniu pracy osoba upoważniona jest zobowiązana do wylogowania się lub wyłączenia komputera oraz usunięcia z biurka wszelkich nośników zawierających dane osobowe jak i zabezpieczenia pomieszczenia przed włamaniem, zalaniem, pożarem lub innym ryzykiem nieautoryzowanego ujawnienia lub zniszczenia dokumentów lub nośników zawierających dane osobowe.</li>
                        </ol>
                    </li>
                    <li>Procedura tworzenia kopii zapasowych:
                        <ol class="policy-list-alpha" style="margin-top: 5px;">
                            <li>W zależności od wielkości przyrostu ilościowego i pojemnościowego danych osobowych tworzy się ich kopie zapasowe w odstępach nie częstszych niż <span class="highlight-yellow">1 dzień</span> i nie rzadszych niż <span class="highlight-yellow">1 miesiąc</span>.</li>
                            <li>Kopie zapasowe danych osobowych w wersji elektronicznej mogą być przechowywane na zewnętrznym nośniku danych zabezpieczonym zgodnie z zabezpieczeniami organizacyjnymi.</li>
                            <li>Osoba sporządzająca kopie zapasowe jest zobowiązana do ich oznaczenia oraz sprawdzenia spójności danych i możliwości ich ponownego odtworzenia.</li>
                            <li>Kopie zapasowe przechowuje się nie krócej niż 1 rok i nie dłużej niż 6 lat.</li>
                            <li>Po upływie okresu przechowywania kopie zapasowe są trwale niszczone lub anonimizowane.</li>
                        </ol>
                    </li>
                    <li>Procedura przechowywania nośników danych osobowych w wersji papierowej i elektronicznej. Nośniki danych osobowych takie jak:
                        <ol class="policy-list-alpha" style="margin-top: 5px;">
                            <li>Laptop/Komputer</li>
                            <li>Telefon komórkowy/Smartfon</li>
                            <li>Pendrive/Karta pamięci</li>
                            <li>Zewnętrzny dysk twardy</li>
                            <li>Płyta CD/DVD/BR</li>
                            <li>Wydruk papierowy</li>
                        </ol>
                        są przechowywane w sposób uniemożliwiający dostęp do nich osób nie upoważnionych jak i zabezpieczający je przed przypadkowym uszkodzeniem.
                    </li>
                    <li>Osoby upoważnione są zobowiązane do trwałego niszczenia/usuwania danych osobowych po ustaniu celu ich przetwarzania.</li>
                    <li>Zabrania się wynoszenia danych osobowych poza obszar przetwarzania bez zgody Administratora Bezpieczeństwa Danych Osobowych lub Administratora, a w przypadku uzyskania takiej zgody i konieczności przetwarzania danych poza siedzibą Administratora, zobowiązuje się osoby upoważnione do zapewnienia co najmniej takich samych warunków bezpieczeństwa przetwarzania danych osobowych jakie obowiązują w siedzibie Administratora.</li>
                    <li>Dane osobowe wysyłane drogą elektroniczną poza obszar przetwarzania muszą być zabezpieczone hasłem.</li>
                    <li>Zabrania się przekazywania nośników danych zawierających dane osobowe podmiotom zewnętrznym, bez zgody Administratora.</li>
                </ol>

                <div class="policy-chapter-header">
                    <span>Rozdział 15</span>
                    Rejestr czynności
                </div>
                <div class="policy-text" style="text-align:center;">(obowiązuje po spełnieniu wymogów określonych w art. 30 RODO)</div>
                <ol class="policy-list-num">
                    <li>Prowadzi się rejestr czynności przetwarzanych danych, określający w szczególności:
                        <ol class="policy-list-alpha" style="margin-top: 5px;">
                            <li>Cel przetwarzania danych.</li>
                            <li>Opis kategorii osób, których dane dotyczą, oraz kategorii danych osobowych.</li>
                            <li>Kategorie odbiorców, którym dane osobowe zostały lub zostaną ujawnione, w tym odbiorców w państwach trzecich.</li>
                            <li>Szczegóły przekazania danych osobowych do państwa trzeciego, w tym dane nazwę państwa trzeciego i podmiotu, do którego dane zostały przekazane i dokumentację odpowiednich zabezpieczeń.</li>
                            <li>Planowane terminy usunięcia poszczególnych kategorii danych – jeżeli określenie tych terminów jest możliwe.</li>
                        </ol>
                    </li>
                    <li>Rejestr będzie prowadzony w formie pisemnej, włączając w to formę elektroniczną.</li>
                </ol>

                <div class="policy-chapter-header">
                    <span>Rozdział 16</span>
                    Przypadki naruszenia ochrony danych
                </div>
                <ol class="policy-list-num">
                    <li>W sytuacji podejrzenia lub stwierdzenia przypadku naruszenia ochrony danych osobowych, każda osoba podlegająca niniejszej procedurze zobowiązana jest do bezzwłocznego poinformowania Administratora Bezpieczeństwa Danych Osobowych.</li>
                    <li>Jeżeli jest to możliwe w zgłoszeniu należy podać:
                        <ol class="policy-list-alpha" style="margin-top: 5px;">
                            <li>charakter naruszenia, w tym w miarę możliwości wskazywać kategorie i przybliżoną liczbę osób, których dane dotyczą, oraz kategorie i przybliżoną liczbę wpisów danych osobowych, których dotyczy naruszenie;</li>
                            <li>opisywać możliwe konsekwencje naruszenia ochrony danych osobowych;</li>
                            <li>dostępne środki mogące zaradzić naruszeniu ochrony danych osobowych lub zminimalizować negatywne skutki naruszenia.</li>
                        </ol>
                    </li>
                    <li>Administrator Bezpieczeństwa Danych Osobowych dokumentuje wszelkie naruszenia ochrony danych osobowych, w tym okoliczności naruszenia ochrony danych osobowych, jego skutki oraz podjęte działania zaradcze.</li>
                    <li>Administrator Bezpieczeństwa Danych Osobowych, po przeanalizowaniu zgłoszenia może podjąć decyzje o konieczności powiadomienia o naruszeniu Generalnego Inspektora Ochrony Danych Osobowych lub inny właściwy organ nadzorczy, a także osoby, których dane dotyczą.</li>
                </ol>

                <div class="policy-chapter-header">
                    <span>Rozdział 17</span>
                    Procedury kontrolne oraz szkolenia pracowników
                </div>
                <ol class="policy-list-num">
                    <li>Przynajmniej raz do roku przeprowadza się kontrole przestrzegania obowiązujących reguł dotyczących ochrony danych osobowych.</li>
                    <li>Z kontroli sporządza się protokół, który jest podstawą do dokonania aktualizacji procedur oraz niniejszego dokumentu.</li>
                    <li>Raz do roku przeprowadza się szkolenie aktualizacyjne pracowników w zakresie ochrony danych osobowych.</li>
                    <li>Każdy pracownik przed otrzymaniem upoważnienia zostaje przeszkolony indywidualnie.</li>
                    <li>Wszelka naprawa lub konserwacja sprzętu komputerowego zawierającego dane osobowe lub pomieszczeń stanowiących obszar przetwarzania może odbywać się tylko pod nadzorem osób upoważnionych.</li>
                </ol>

                <div class="policy-chapter-header">
                    <span>Rozdział 18</span>
                    Postanowienia końcowe
                </div>
                <ol class="policy-list-num">
                    <li>Wszelkie procedury i zasady opisane w niniejszym dokumencie są przestrzegane przez osoby upoważnione do przetwarzania danych osobowych, ze szczególnym uwzględnieniem dobra osób których dane te dotyczą.</li>
                    <li>Niniejsza polityka ma zastosowanie do przetwarzania danych osobowych w sposób całkowicie lub częściowo zautomatyzowany oraz do przetwarzania w sposób inny niż zautomatyzowany danych osobowych stanowiących część zbioru danych lub mających stanowić część zbioru danych.</li>
                    <li>Powierzenie przetwarzania danych osobowych podmiotowi zewnętrznemu może być dokonanie jedynie w drodze umowy zawartej na piśmie z zastrzeżeniem, iż podmiot ten spełnia co najmniej takie same warunki bezpieczeństwa przetwarzania danych osobowych jak Administrator.</li>
                </ol>

            </div>
        </div>

        {elseif $cms.id == 10}
        
        {literal}
        <style>
            #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
            .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }

            .discount-custom-page {
                font-family: 'Garamond', 'Georgia', serif;
                color: #555;
                background: #fff;
                padding-bottom: 80px;
                width: 100%;
                font-size: 15px;
                line-height: 1.6;
            }

            .discount-header-wrapper {
                max-width: 1140px;
                margin: 0 auto;
                padding: 40px 15px 20px 15px;
                border-bottom: 1px solid #f9a918;
                margin-bottom: 40px;
            }

            .discount-header-wrapper h1 {
                font-family: 'Garamond', serif;
                font-size: 42px;
                color: #555;
                margin: 0;
                font-weight: normal;
                text-align: left;
            }

            .discount-content {
                max-width: 1140px;
                margin: 0 auto;
                padding: 0 15px;
                color: #333;
            }

            .discount-intro {
                margin-bottom: 25px;
                text-align: justify;
            }

            ol.discount-list {
                padding-left: 25px;
                margin: 0;
            }

            ol.discount-list li {
                margin-bottom: 15px;
                text-align: justify;
                padding-left: 5px;
            }

            .red-text {
                color: red;
            }
        </style>
        {/literal}

        <div class="discount-custom-page">
            <div class="discount-header-wrapper">
                <h1>Zasady realizowania bonów rabatowych</h1>
            </div>

            <div class="discount-content">
                <p class="discount-intro">Zasady obowiązujące przy stosowaniu kodów oraz bonów rabatowych.</p>
                
                <ol class="discount-list">
                    <li>Kody oraz bony rabatowe wynikające z zastosowania indywidualnych rabatów w postaci Karty Stałego Klienta, <span class="red-text">Gold Card</span>, bonów My Benefit bądź innych kodów, mają zastosowanie przy zakupie produktów (towarów) i nie maja wpływu na koszt usługi (wysyłka zamówienia).</li>
                    <li>Kody oraz bony rabatowe wynikające z zastosowania indywidualnych rabatów w postaci Karty Stałego Klienta, <span class="red-text">Gold Card</span>, bonów My Benefit bądź innych podobnych kodów, nie podlegają sumowaniu (łączeniu) z innym kodem rabatowym. Zastosowanie ma tylko jeden kodu uprawniający do zniżki.</li>
                    <li>Produkty będące w cenie promocyjnej dostępnej dla wszystkich klientów, nie podlegają dodatkowemu rabatowi wynikającemu z zastosowania indywidualnych rabatów w postaci Karty Stałego Klienta bądź innych podobnych kodów.</li>
                </ol>
            </div>
        </div>

        {elseif $cms.id == 11}
        
        {literal}
        <style>
            #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
            .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }

            .loyalty-custom-page {
                font-family: 'Garamond', 'Georgia', serif;
                color: #555;
                background: #fff;
                padding-bottom: 80px;
                width: 100%;
                font-size: 15px;
                line-height: 1.6;
            }

            .loyalty-header-wrapper {
                max-width: 1140px;
                margin: 0 auto;
                padding: 40px 15px 20px 15px;
                border-bottom: 1px solid #f9a918;
                margin-bottom: 40px;
            }

            .loyalty-header-wrapper h1 {
                font-family: 'Garamond', serif;
                font-size: 42px;
                color: #555;
                margin: 0;
                font-weight: normal;
                text-align: left; 
            }

            .loyalty-content {
                max-width: 1140px;
                margin: 0 auto;
                padding: 0 15px;
            }

            .loyalty-subtitle {
                font-weight: normal;
                display: block;
                margin-bottom: 20px;
                color: #555;
                text-align: left; 
            }

            .loyalty-section-header {
                text-align: left; 
                font-weight: bold;
                margin-top: 35px;
                margin-bottom: 15px;
                color: #333;
            }

            .loyalty-text {
                text-align: justify;
                margin-bottom: 15px;
            }

            ol.loyalty-list {
                padding-left: 25px;
                margin: 0;
                text-align: justify;
            }

            ol.loyalty-list li {
                margin-bottom: 10px;
            }

            ul.loyalty-sublist {
                padding-left: 20px;
                list-style-type: disc;
                margin-top: 5px;
                margin-bottom: 10px;
            }

            .red-text {
                color: red;
            }

            .link-style {
                color: #5bc0de;
                text-decoration: none;
            }
            .link-style:hover {
                text-decoration: underline;
            }
        </style>
        {/literal}

        <div class="loyalty-custom-page">
            <div class="loyalty-header-wrapper">
                <h1>Regulamin Karty Stałego Klienta</h1>
            </div>

            <div class="loyalty-content">
                
                <span class="loyalty-subtitle">Regulamin Programu Lojalnościowego Karta Stałego Klienta Czas na Herbatę</span>

                <div class="loyalty-section-header">§ 1. Przedmiot Regulaminu</div>
                <div class="loyalty-text">
                    Niniejszy dokument określa zasady funkcjonowania Programu Lojalnościowego Karta Stałego Klienta w skrócie KSK oraz warunki uczestnictwa w Programie, w tym prawa i obowiązki Organizatora, Uczestnika, zasady przyznawania rabatów oraz informacje o innych korzyściach związanych z uczestnictwem w Programie.
                </div>

                <div class="loyalty-section-header">§ 2. Definicje</div>
                <div class="loyalty-text">Pojęcia użyte w niniejszym Regulaminie należy rozumieć w sposób następujący:</div>
                <ol class="loyalty-list">
                    <li>Program lub Program Lojalnościowy Karta Stałego Klienta KSK - program lojalnościowy dla klientów sieci salonów Czas na Herbatę prowadzony przez Organizatora na zasadach określonych w Regulaminie.</li>
                    <li>Regulamin – niniejszy dokument określający zasady i warunki funkcjonowania Programu Lojalnościowego KSK w tym również warunki i zasady korzystania z przysługujących rabatów oraz przebiegu postępowania reklamacyjnego;</li>
                    <li>Rejestracja – proces przystąpienia Uczestnika do Programu szczegółowo określony w § 5 ust. 2 i 3 Regulaminu, zakończony otrzymaniem przez Uczestnika wiadomości powitalnej wskazanej w § 5 ust. 5 Regulaminu.</li>
                    <li>Organizator – KSK Organizator - PROGRESSIVE sp z o. o. z siedzibą przy ul. Sosnowiecka 5, we Wrocławiu (kod pocztowy: 52-008), NIP 8992984184, REGON 527610437. Kontakt z Organizatorem we wszelkich sprawach dotyczących Programu możliwy jest pod adresem e-mail: stalyklient@herbata.net.</li>
                    <li>Uczestnik – pełnoletnia osoba fizyczna posiadająca pełną zdolność do czynności prawnych, będąca Konsumentem w rozumieniu niniejszego Regulaminu, która przystąpiła do Programu.</li>
                    <li>Konsument – osoba fizyczna w rozumieniu art. 22 (1) Ustawy z dnia 23 kwietnia 1964 r. - Kodeks Cywilny, jak również osoba fizyczna zawierająca umowę bezpośrednio związaną z jej działalnością gospodarczą, gdy z treści tej umowy wynika, że nie posiada ona dla niej charakteru zawodowego – tylko w przypadku i zakresie gdy zgodnie z przepisami powszechnie obowiązującymi do takiej osoby znajdują zastosowanie odpowiednie przepisy dotyczące konsumenta.</li>
                    <li>Rabat standardowy na karcie KSK – 10% rabatu na herbaty na wagę; 5% rabatu na pozostały asortyment Czas na Herbatę na zakupy dokonane w Sklepach Czas na Herbatę;</li>
                    <li>Rabat na karcie uznaniowej <span class="red-text">Gold Card</span> – 20% rabatu na herbaty na wagę; 10% rabatu na pozostały asortyment Czas na Herbatę na zakupy dokonane w Sklepach Czas na Herbatę</li>
                    <li>Oferty specjalne, przywileje – akcje promocyjne i inne świadczenia wskazane w Regulaminie przyznawane Uczestnikom z tytułu udziału w Programie przyznawane przez organizatora polegające na przyznaniu Uczestnikowi dodatkowych rabatów lub innych korzyści. Oferty promocyjne nie łączą się z innymi promocjami, chyba że wyraźnie wskazano inaczej.</li>
                    <li>Karta standardowa KSK / <span class="red-text">Gold Card</span>– karta lojalnościowa w formie niematerialnego nośnika (Wallet Pass), posiadająca unikalny numer identyfikacyjny, przypisana do danego Uczestnika. Karta zapisywana jest przez Uczestnika w aplikacji Google Pay (dla użytkownika telefonu z systemem Android) lub Apple Wallet (dla użytkownika telefonu z systemem iPhone). Karta Stałego Klienta Czas na Herbatę uprawnia Uczestnika do korzystania z należnych mu rabatów bądź innych benefitów opcjonalnie określonych przez organizatora. Karta może przybrać również formę materialnego nośnika, o ile Organizator zapewni taką funkcjonalność.</li>
                    <li>POK – Sklep stacjonarny Czas na Herbatę - Salon firmowy marki Czas na Herbatę na terytorium Rzeczpospolitej Polskiej oraz wybrany sklep franczyzowy marki Czas na Herbatę. Aktualna lista honorujących Karty Stałego Klienta Sklepów Czas na Herbatę znajduje się na stronie internetowej: www.czasnaherbate.net;</li>
                    <li>E-Sklep – platforma sprzedażowa Organizatora dostępna pod adresem net lub inna zewnętrzna platforma, za pośrednictwem której Organizator oferuje sprzedaż Produktów, umożliwiająca składanie Zamówień na odległość, na warunkach określonych odrębnym regulaminem.</li>
                    <li>Zamówienie – zakup Produktu lub Usługi w POK lub E-Sklepie, który może powodować przyznanie rabatów, lub inne działania i aktywności, o których Organizator poinformuje z odpowiednim wyprzedzeniem.</li>
                    <li>Produkt – dostępna w POK lub E-Sklepie rzecz ruchoma w rozumieniu art. 45 Ustawy z dnia 23 kwietnia 1964 r. - Kodeks Cywilny, będąca przedmiotem umowy sprzedaży lub Usługa świadczona przez Organizatora odpłatnie.</li>
                    <li>Usługa – czynność lub zestaw czynności świadczonych odpłatnie przez Organizatora na rzecz Uczestnika, z pominięciem usług transportowych. Na potrzeby niniejszego Regulaminu przez „Produkt” należy rozumieć również „Usługę”, chyba że z kontekstu wyraźnie wynika odmiennie.</li>
                </ol>

                <div class="loyalty-section-header">§ 3. Postanowienia ogólne</div>
                <ol class="loyalty-list">
                    <li>Zakres terytorialny. Program jest prowadzony na terytorium Rzeczypospolitej Polskiej.</li>
                    <li>Cel Programu. Program ma na celu nagradzanie Uczestników, którzy dokonują zakupów Produktów w POK lub E-Sklepie i spełniają wymogi określone w Regulaminie.</li>
                    <li>Nieodpłatny charakter udziału w Programie. Udział Uczestnika w Programie jest bezpłatny, przy czym warunkiem otrzymania korzyści jest nabycie Produktu lub Usług w E-sklepie lub POK.</li>
                    <li>Dobrowolny udział. Udział w Programie jest dobrowolny. Uczestnik może w dowolnym momencie zakończyć uczestnictwo w Programie w sposób i na zasadach określonych w § 9 Regulaminu.</li>
                    <li>Moment przystąpienia do Programu. Przystąpienie do Programu jest możliwe w dowolnym momencie trwania Programu, z zastrzeżeniem odrębności wynikających ze zdania następnego. Przystąpienie do Programu nie jest możliwe w okresie od poinformowania przez Organizatora w sposób wskazany w Regulaminie o zakończeniu Programu do momentu jego zakończenia.</li>
                    <li>Obowiązek przestrzegania prawa. Uczestnik zobowiązany jest do uczestniczenia w Programie w sposób zgodny z przepisami obowiązującego prawa, postanowieniami Regulaminu, a także przyjętymi w danym zakresie zwyczajami i zasadami współżycia społecznego.</li>
                    <li>Zakaz nadużywania uprawnień. Uczestnik zobowiązany jest nie nadużywać praw przyznanych mu przez Organizatora lub przepisy prawa, w sposób, który sprzeczny jest ze społeczno-gospodarczym przeznaczeniem danego prawa lub z zasadami współżycia społecznego. Uczestnik zobowiązany jest również do działania w dobrej wierze.</li>
                </ol>

                <div class="loyalty-section-header">§ 4. Korzyści z uczestnictwa w Programie</div>
                <div class="loyalty-text">Na zasadach określonych w Regulaminie i z zastrzeżeniem spełnienia określonych warunków, po przystąpieniu do Programu Uczestnik może otrzymywać:</div>
                <ol class="loyalty-list">
                    <li>Rabat standardowy na karcie KSK – 10% rabatu na herbaty na wagę; 5% rabatu na pozostały asortyment Czas na Herbatę na zakupy dokonane w Sklepach Czas na Herbatę;</li>
                    <li>Rabat na karcie uznaniowej <span class="red-text">Gold Card</span> – 20% rabatu na herbaty na wagę; 10% rabatu na pozostały asortyment Czas na Herbatę na zakupy dokonane w Sklepach Czas na Herbatę</li>
                    <li>Do końca bieżącego roku tj. 2025 Uczestnicy posiadający papierową kartę KSK mają prawo korzystać z przysługujących im rabatów na dotychczasowych zasadach. Od nowego roku:</li>
                    <li>Uczestnik zachowuje prawo do rabatu, nawet jeśli nie posiada aplikacji ani fizycznej karty,</li>
                    <li>warunkiem jest rejestracja poprzez podanie pracownikowi POK numeru telefonu lub adresu e-mail</li>
                    <li>rabat zostanie naliczony po weryfikacji danych klienta.</li>
                    <li>W ramach korzyści Uczestnikowi za okazaniem Karty Stałego Klienta przysługuje Rabat. Karta Stałego Klienta nie jest elektronicznym instrumentem płatniczym lub pieniężnym, nie jest również kartą płatniczą.</li>
                    <li>Rabatu nie można wymienić na gotówkę.</li>
                    <li>Rabat jest udzielany wyłącznie od pierwszej ceny detalicznej towarów Czas na Herbatę. Rabat nie łączy się z innymi promocjami lub obniżkami towarów Czas na Herbatę w Sklepach Czas na Herbatę, chyba że co innego wynika z regulaminu danej akcji promocyjnej.</li>
                    <li>W celu naliczenia Rabatu należy okazać kasjerowi Kartę Stałego Klienta przed dokonaniem wyboru formy płatności za zakupy.</li>
                    <li>W przypadku zwrotu towaru z przyczyn innych niż te wynikające z ustawy prawa konsumenta z dnia z dnia 30 maja 2014 roku (Dz. U. z 2014 r. poz. 827), przy zakupie którego klient skorzystał z Karty Stałego Klienta, Klient otrzyma wyłącznie zwrot ceny faktycznie uiszczonej.</li>
                    <li>Uczestnik jest uprawniony także do udziału w akcjach specjalnych, w tym specjalnych promocjach, przeznaczonych wyłącznie dla Uczestników Programu.</li>
                    <li>Uczestnictwo w Programie obejmuje ponadto przekazywanie Uczestnikowi informacji o promocjach, ofertach, produktach marki Czas na Herbatę, w tym ofertach specjalnych, a także o wydarzeniach i akcjach marketingowych organizowanych przez markę Czas na Herbatę. Uczestnik będzie otrzymywał wskazane informacje za pomocą podanego przez niego sposobu komunikacji.</li>
                    <li>Przesyłanie informacji handlowych, w tym o promocjach, ofertach, produktach, a także o wydarzeniach i akcjach organizowanych przez markę Czas na Herbatę na podany adres e-mail, lub sms, wymaga zgody Uczestnika zgodnie z art. 10 ustawy o świadczeniu usług drogą elektroniczną.</li>
                    <li>Używanie przez markę Czas na Herbatę telekomunikacyjnych urządzeń końcowych (np. komputera, telefonu lub innych urządzeń mobilnych) i automatycznych systemów wywołujących dla celów marketingu bezpośredniego z wykorzystaniem podanego adresu e-mail, wymaga zgody Uczestnika zgodnie z art. 172 Prawa telekomunikacyjnego.</li>
                    <li>Przesyłanie Uczestnikowi jakichkolwiek informacji handlowych oraz informacji wysyłanych dla celów marketingu bezpośredniego na podany adres e-mail może nastąpić, jeżeli Uczestnik wyraził obie zgody, o których mowa wyżej, co do podanego sposobu komunikacji.</li>
                    <li>Uczestnik powinien powiadomić Organizatora o każdej zmianie swoich danych osobowych lub kontaktowych podanych w Formularzu Przystąpienia do Programu Karty Stałego Klienta.</li>
                </ol>

                <div class="loyalty-section-header">§ 5. Warunki przystąpienia do Programu</div>
                <ol class="loyalty-list">
                    <li>Rozpoczęcie Programu. Uczestnik może przystąpić do Programu w okresie od dnia 15-02-2024 roku do dnia poinformowania przez Organizatora o zakończeniu Programu w sposób określony w 9 § 2 Regulaminu.</li>
                    <li>Minimalne warunki techniczne. Do przystąpienia i uczestnictwa w Programie niezbędne jest posiadanie przez Uczestnika telefonu marki iPhone z zainstalowaną najnowszą Aplikacją Wallet lub telefonu z systemem Android z zainstalowaną najnowszą aplikacją Google Pay, jak również dostęp do Internetu.</li>
                    <li>Sposoby przystąpienia do Programu. Uczestnik może przystąpić do Programu na jeden z poniższych sposobów poprzez:
                        <ul class="loyalty-sublist">
                            <li>samodzielne wypełnienie i złożenie formularza rejestracyjnego dostępnego na dedykowanej stronie w aplikacji AppStore i Google Play</li>
                            <li>złożenie dyspozycji przystąpienia do Programu przedstawicielowi Organizatora w POK po uzupełnieniu formularza przystąpienia do programu KSK .</li>
                        </ul>
                    </li>
                    <li>Przetwarzanie danych osobowych Uczestnika. Przystąpienie do Programu wymaga podania przez Uczestnika następujących aktualnych i prawdziwych danych osobowych w postaci imienia, nazwiska, numeru telefonu oraz adresu e-mail. Przystępując do Programu, Uczestnik powinien wyrazić zgodę lub zgody na kontakt marketingowy, w celu otrzymywaniu bieżących informacji o atrakcyjnych promocjach i dodatkowych korzyściach, za pomocą środków komunikacji elektronicznej na podany adres e-mail, lub numer telefonu w tym również na używanie telekomunikacyjnych urządzeń końcowych (komputera, telefonu, innych urządzeń mobilnych) i automatycznych systemów wywołujących dla celów marketingu bezpośredniego. Szczegółowe informacje dotyczące przetwarzania danych osobowych Uczestnika znajdują się w Polityce Prywatności, stanowiącej Załącznik nr 1 do Regulaminu.</li>
                    <li>Wiadomość powitalna. Bezpośrednio po wykonaniu czynności wskazanych § 5 ust. 3 Regulaminu Organizator wysyła do Uczestnika powitalny e-mail, który zawiera instrukcję postępowania prezentującą krok po kroku to, w jaki sposób podpiąć w odpowiedniej aplikacji na telefonie Uczestnika Kartę. Uczestnik, który posiada telefon z systemem Android, powinien kliknąć w link umieszczony w e-mailu. Uczestnik, który posiada telefon marki iPhone, znajdzie Kartę w załączniku do otrzymanej wiadomości. Wiadomość powitalna zawiera także aktualny Regulamin oraz Politykę Prywatności.</li>
                </ol>

                <div class="loyalty-section-header">§ 6. Zakończenie udziału Uczestnika w Programie</div>
                <ol class="loyalty-list">
                    <li>Nieoznaczony czas trwania Programu. Czas trwania Programu jest nieoznaczony.</li>
                    <li>Wypowiedzenie uczestnictwa przez Organizatora. Z ważnych powodów uczestnictwo w Programie może zostać wypowiedziane Uczestnikowi przez Organizatora w trybie natychmiastowym. Za ważne powody uzasadniające wypowiedzenie uczestnictwa w Programie uznaje się istotne (rażące) naruszenie postanowień Regulaminu. Za istotne (rażące) naruszenie postanowień Regulaminu może zostać uznane w szczególności naruszenie § 3 ust. 7 oraz § 5 ust. 4 Regulaminu, celowe działanie na szkodę Organizatora, dokonywanie oszustw lub nadużyć. Za rażące naruszenie Regulaminu rozumie się w szczególności, ale nie wyłącznie: podanie przez Uczestnika w ramach udziału w Programie danych osobowych osoby trzeciej w celu podszycia się pod taką osobę czy dokonywanie transakcji pozornych mających na celu odniesienie przez Uczestnika korzyści majątkowej lub innej. Wypowiedzenie następuje poprzez wysłanie wiadomości e-mail ze wskazaniem przyczyny wypowiedzenia uczestnictwa w Programie z jednoczesną blokadą Karty i wygaszeniem przysługujących innych benefitów określonych w regulaminie.</li>
                    <li>Wypowiedzenie uczestnictwa przez Uczestnika bez przyczyny. Uczestnik może zrezygnować z udziału w Programie w każdym czasie, bez podawania przyczyny, składając stosowne oświadczenie, drogą e-mailową na adres e-mail: [stalyklient@herbata.net], klikając w link „Wypisz z Programu” znajdujący się w otrzymanej wiadomości powitalnej Wypowiedzenie jest skuteczne niezwłoczne po jego otrzymaniu, nie później niż po upływie 7 dni.</li>
                    <li>Uczestnictwo w Programie ustaje także w przypadku odwołania przez klienta zgody na przetwarzanie przez Organizatora swoich danych osobowych zgodnie z pkt. 5 Regulaminu.</li>
                    <li>Skutki wypowiedzenia. W przypadku opisanym w 5 powyżej Karta Uczestnika jest blokowana.</li>
                </ol>

                <div class="loyalty-section-header">§ 7. Zasady składania i rozpatrywania reklamacji oraz odpowiedzialności</div>
                <ol class="loyalty-list">
                    <li>Okres składania reklamacji. Reklamacje w zakresie zasad i przebiegu Programu mogą być zgłaszane do Organizatora w czasie trwania Programu oraz 3 miesięcy po jego zakończeniu. Upływ terminu wskazanego w zdaniu poprzedzającym nie oznacza wygaśnięcia roszczeń oraz nie narusza prawa do dochodzenia jakichkolwiek roszczeń w drodze postępowania sądowego lub pozasądowego. Reklamacja może zostać złożona:
                        <ul class="loyalty-sublist">
                            <li>drogą elektroniczną na adres e-mail: stalyklient@herbata.net;</li>
                            <li>pocztą tradycyjną poprzez wysłanie pisma na adres siedziby Organizatora z dopiskiem „Program Lojalnościowy Czas na Herbatę”;</li>
                            <li>osobiście w dowolnym POK.</li>
                        </ul>
                    </li>
                    <li>Zakres reklamacji. Reklamacja powinna zawierać́ dane wnoszącego reklamację – jego imię́ i nazwisko, adres e-mail lub adres korespondencyjny, na który ma zostać wysłana odpowiedź oraz opis okoliczności stanowiących podstawę̨ reklamacji.</li>
                    <li>Rozpatrzenie reklamacji. Termin rozpatrzenia reklamacji wynosi 30 dni od chwili jej wpływu. W przypadku, gdy rozpatrzenie złożonej reklamacji będzie wymagać podjęcia dodatkowych czynności, czas na jej rozpatrzenie może ulec stosownemu przedłużeniu, o czym osoba, która złożyła reklamację zostanie poinformowana oddzielną wiadomością w wyżej wskazanym terminie.</li>
                    <li>Sposób poinformowania o rozpatrzeniu reklamacji. Informacja o rozpatrzeniu reklamacji zostanie przekazana Uczestnikowi zgodnie z jego wyborem wskazanym podczas składania reklamacji – za pośrednictwem wiadomości e-mail lub pocztą tradycyjną. Reklamacja może zostać złożona w formie elektronicznej na adres: stalyklient@herbata.net lub w formie pisemnej na adres: PROGRESSIVE sp z o.o., ul. Sosnowiecka 5, 52-008 Wrocław.</li>
                    <li>Brak ograniczeń uprawnień konsumenckich. Uczestnictwo w Programie nie narusza uprawnień przyznanych Uczestnikowi na podstawie przepisów prawa, w tym w szczególności wynikających z posiadania przez Uczestnika statusu konsumenta w rozumieniu Kodeksu cywilnego.</li>
                    <li>Wyłączenie i ograniczenie odpowiedzialności. W zakresie dozwolonym przez odpowiednie przepisy prawa, Organizator nie ponosi odpowiedzialności za brak możliwości realizacji uprawnień wynikających z uczestnictwa w Programie spowodowany siłą wyższą, przyczynami leżącymi po stronie Uczestnika, w tym nieprawidłowym działaniem Aplikacji Wallet czy aplikacji Google Pay.</li>
                    <li>Organizator będzie przetwarzał dane osobowe składającego reklamację wyłącznie w związku z procedurą reklamacyjną, a po zakończeniu procedury reklamacyjnej dane osobowe zostaną usunięte.</li>
                </ol>

                <div class="loyalty-section-header">§ 8. Zmiany Regulaminu</div>
                <ol class="loyalty-list">
                    <li>Okoliczności zmiany Regulaminu. Organizator zastrzega sobie prawo do zmiany Regulaminu w przypadku wystąpienia przynajmniej jednej z poniżej wskazanych ważnych przyczyn:
                        <ul class="loyalty-sublist">
                            <li>zmiana przepisów prawa regulujących prowadzenie Programu wpływająca na wzajemne prawa i obowiązki Uczestnika i Organizatora;</li>
                            <li>konieczność dostosowania zasad prowadzenia Programu do nakazów, orzeczeń, postanowień lub wytycznych wynikających z decyzji właściwego w zakresie prowadzenia przez Organizatora organu administracji publicznej lub orzeczenia sądowego znajdującego zastosowanie w zakresie działalności Organizatora wpływającego na wzajemne prawa i obowiązki Uczestnika i Organizatora;</li>
                            <li>zmiana sposobu prowadzenia Programu spowodowana niezależnymi względami technicznymi lub technologicznymi;</li>
                            <li>zwiększenie bezpieczeństwa Uczestnika, bezpiecznego funkcjonowania Programu, zapobieganie nadużyciom lub uproszczenie zasad Programu;</li>
                            <li>ekonomiczna nieopłacalność prowadzenia Programu;</li>
                            <li>zmiana formy prowadzenia działań marketingowych i promocyjnych przez Organizatora;</li>
                            <li>wystąpienie nieścisłości, bądź wątpliwości interpretacyjnych na gruncie Regulaminu;</li>
                            <li>połączenie, podział albo przekształcenie Organizatora albo zmiana innych danych identyfikacyjnych Organizatora wskazanych w niniejszym Regulaminie (w zakresie niezbędnym do aktualizacji takich danych).</li>
                            <li>Inna przyczyna, istotna z punktu widzenia Organizatora.</li>
                        </ul>
                    </li>
                    <li>Sposób poinformowania o zmianie Regulaminu. Organizator powiadomi Uczestników o zmianie Regulaminu z przyczyn wskazanych w ust. 1 z co najmniej 30-dniowym wyprzedzeniem, udostępniając Uczestnikowi nową treść Regulaminu przy zastosowaniu za pośrednictwem wiadomości e-mail lub sms lub push, lub informując na stronie www.czasnaherbate.net</li>
                    <li>Obowiązywanie zmienionego Regulaminu. Zmiana Regulaminu wiąże Uczestnika, jeżeli Uczestnik po otrzymaniu informacji o zmianie Regulaminu nie wypowie uczestnictwa w Programie w terminie wskazanym w ust. 2 powyżej. Nie narusza to prawa Uczestnika do rezygnacji z udziału w Programie w każdym czasie i bez podawania powodów. Zmiany będą obowiązywać 30 dni o momentu poinformowania o zmianach Uczestników.</li>
                </ol>

                <div class="loyalty-section-header">§ 9. Zakończenie Programu</div>
                <ol class="loyalty-list">
                    <li>Okoliczności zakończenia Programu. Organizator zastrzega sobie prawo do zakończenia Programu, wstrzymania okresowego w przypadku wystąpienia przynajmniej jednej z poniżej wskazanych ważnych przyczyn:
                        <ul class="loyalty-sublist">
                            <li>zmiana przepisów prawa regulujących prowadzenie Programu wpływająca na wzajemne prawa i obowiązki Uczestnika i Organizatora w taki sposób, że powoduje obiektywną konieczność zakończenia Programu;</li>
                            <li>konieczność dostosowania zasad prowadzenia Programu do nakazów, orzeczeń, postanowień lub wytycznych wynikających z decyzji właściwego w zakresie prowadzenia przez Organizatora organu administracji publicznej lub orzeczenia sądowego znajdującego zastosowanie w zakresie działalności Organizatora wpływająca na wzajemne prawa i obowiązki Uczestnika i Organizatora w taki sposób, że powoduje obiektywną konieczność zakończenia Programu;</li>
                            <li>obiektywna ekonomiczna nieopłacalność prowadzenia Programu, lub bez podania przyczyny, z zachowaniem zasady informowania o zakończeniu Programu;</li>
                            <li>zastąpienie Programu inną ekwiwalentną formą prowadzenia działań marketingowych i promocyjnych przez Organizatora.</li>
                        </ul>
                    </li>
                    <li>Sposób poinformowania o zakończeniu Programu. O decyzji Organizatora dotyczącej zakończenia prowadzenia Programu Uczestnicy zostaną poinformowani z odpowiednim wyprzedzeniem, w żadnym razie nie krótszym niż 30 dni przed jego planowanym zakończeniem, za pośrednictwem wiadomości e-mail lub poinformowaniu poprzez umieszczenie informacji na stronie internetowej: www.czasnaherbate.net</li>
                </ol>

                <div class="loyalty-section-header">§ 10. Pozasądowe sposoby rozpatrywania reklamacji i dochodzenia roszczeń oraz zasady dostępu do tych procedur</div>
                <ol class="loyalty-list">
                    <li>Informacja o polubownej możliwości rozwiązania sporu. Spór wynikający z umowy zawartej pomiędzy Uczestnikiem, a Organizatorem może zostać zakończony polubownie w drodze postępowania w sprawie pozasądowego rozwiązywania sporów konsumenckich. Udział Organizatora w postępowaniu w sprawie pozasądowego rozwiązywania sporów konsumenckich jest dobrowolny, a przekazywane poniżej informacje nie stanowią zobowiązania Organizatora do wzięcia udziału w takim postępowaniu. W przypadku, gdy w następstwie złożonej przez Uczestnika reklamacji spór nie został rozwiązany, Organizator każdorazowo przekaże Uczestnikowi na papierze lub innym trwałym nośniku oświadczenie o zamiarze wystąpienia z wnioskiem o wszczęcie postępowania w sprawie pozasądowego rozwiązywania sporów konsumenckich albo zgodzie na udział w takim postępowaniu albo o odmowie wzięcia udziału w postępowaniu w sprawie pozasądowego rozwiązywania sporów konsumenckich. Jeżeli Organizator nie złożył żadnego oświadczenia, uznaje się, że wyraża zgodę na udział w postępowaniu w sprawie pozasądowego rozwiązywania sporów konsumenckich.</li>
                    <li>Inspekcja Handlowa. Na zasadach określonych w Ustawie z dnia 15 grudnia 2000 r. o Inspekcji Handlowej, pod rozstrzygnięcie stałych sądów polubownych przy wojewódzkich inspektorach Inspekcji Handlowej może być poddany na wniosek Uczestnika spór o prawa majątkowe wynikające z umowy zawartej pomiędzy Uczestnikiem a Organizatorem.</li>
                    <li>Działania Inspekcji Handlowej. Na zasadach określonych w Ustawie z dnia 15 grudnia 2000 r. o Inspekcji Handlowej, jeżeli przemawia za tym charakter sprawy, Wojewódzki Inspektor Inspekcji Handlowej podejmuje działania mające na celu pozasądowe rozwiązanie sporu cywilnoprawnego pomiędzy konsumentem, a przedsiębiorcą poprzez umożliwienie zbliżenia stanowisk stron w celu rozwiązania sporu przez jego strony lub przedstawienie stronom propozycji rozwiązania sporu. Postępowanie wszczyna się na wniosek Uczestnika, złożony do Wojewódzkiego Inspektora właściwego ze względu na miejsce wykonywania działalności gospodarczej przez Organizatora.</li>
                    <li>Bezpłatne poradnictwo konsumenckie. Uczestnik może również zwrócić się do powiatowego (miejskiego) rzecznika konsumentów, do którego zadań należy w szczególności zapewnienie bezpłatnego poradnictwa konsumenckiego i informacji prawnej w zakresie ochrony interesów konsumentów oraz występowanie do przedsiębiorców w sprawach ochrony praw i interesów konsumentów.</li>
                    <li>Inne informacje prawne. Zasady i procedury dostępu do pozasądowego rozwiązywania sporów konsumenckich określane są odrębnie w przepisach prawa (w tym w szczególności w Ustawie z dnia 23 września 2016 r. o pozasądowym rozwiązywaniu sporów konsumenckich) lub w regulacjach stosowanych przez podmioty uprawnione w ramach rozwiązywania sporów konsumenckich, w szczególności, w obowiązujących w tych podmiotach regulaminach. Uczestnik może również uzyskać informacje o pozasądowych sposobach rozpatrywania reklamacji i dochodzenia roszczeń oraz zasadach dostępu do tych procedur na stronach internetowych powiatowych (miejskich) rzeczników konsumentów, organizacji społecznych, wojewódzkich inspektoratów Inspekcji Handlowych, organizacji społecznych, do których zadań statutowych należy ochrona konsumentów oraz Urzędu Ochrony Konkurencji i Konsumentów (w szczególności: <a href="https://www.uokik.gov.pl/pozasadowe_rozwiazywanie_sporow_konsumenckich.php" class="link-style">https://www.uokik.gov.pl/pozasadowe_rozwiazywanie_sporow_konsumenckich.php</a>).</li>
                    <li>Platforma ODR. Zgodnie z rozporządzeniem Parlamentu Europejskiego i Rady (UE) nr 524/2013 z dnia 21 maja 2013 r. w sprawie internetowego systemu rozstrzygania sporów konsumenckich oraz zmiany rozporządzenia (WE) nr 2006/2004 i dyrektywy 2009/22/WE (rozporządzenie w sprawie ODR w sporach konsumenckich), Uczestnik może wnieść skargę za pośrednictwem platformy internetowej ODR (<a href="http://ec.europa.eu/consumers/odr/" class="link-style">http://ec.europa.eu/consumers/odr/</a>)</li>
                </ol>

                <div class="loyalty-section-header">§ 11. Postanowienia końcowe</div>
                <ol class="loyalty-list">
                    <li>Dostępność Regulaminu. Pełna treść Regulaminu dostępna jest na stronie pod adresem: <a href="https://www.czasnaherbate.net" class="link-style">www.czasnaherbate.net</a> oraz w aplikacji KSK.</li>
                    <li>Prawo właściwe. Prawem właściwym dla niniejszego Regulaminu oraz prowadzenia i uczestnictwa w Programie jest prawo Rzeczpospolitej Polskiej, a sądami sądy powszechne w Rzeczpospolitej Polskiej, chyba że co innego wynika z bezwzględnie obowiązujących przepisów prawa.</li>
                    <li>Wybór prawa, a uprawnienia konsumenckie. Wybór prawa polskiego na podstawie Regulaminu nie pozbawia Uczestnika będącego konsumentem ochrony przyznanej mu na podstawie przepisów, których nie można wyłączyć w drodze umowy między Organizatorem, a Uczestnikiem, na mocy prawa które zgodnie z właściwymi regulacjami byłoby właściwe w przypadku prawa wyboru.</li>
                </ol>

                <br><hr><br>

                <span class="loyalty-subtitle" style="text-align: left; font-weight: bold; text-transform: uppercase;">Załącznik nr 1 Polityka Prywatności Programu Lojalnościowego KSK</span>

                <div class="loyalty-section-header">1. Oświadczenie o ochronie danych</div>
                <div class="loyalty-text">
                    Niniejszy dokument zawiera wszelkie wymagane prawem informacje w zakresie przetwarzania przez nas Państwa danych osobowych w związku z realizacją Programu lojalnościowego KSK. Wszelkie dane pochodzące od Państwa gromadzone są w oparciu o dobrowolne ich podanie. W trakcie rejestracji do Programu informujemy Państwa, o tym które dane (wymienione w formularzu rejestracyjnym) są niezbędne do realizacji usług oraz wskazujemy, które dane w formularzu są danymi dodatkowymi, nie wpływającymi na wstrzymanie procesu rejestracji. Naszym celem jest umożliwienie Państwu bezpiecznego korzystania z oferowanych przez nas usług. Dlatego prosimy Państwa o staranne zapoznanie się z poniższym podsumowaniem, informującym, w jaki sposób przetwarzamy Państwa dane. Mogą mieć Państwo pewność, że Państwa dane będą przetwarzane w sposób przejrzysty i uczciwy, oraz że dołożymy wszelkich starań, aby Państwa dane były traktowane z zachowaniem ostrożności i odpowiedzialnie.
                </div>

                <div class="loyalty-section-header">2. Administrator danych osobowych</div>
                <div class="loyalty-text">
                    Administratorem Państwa danych osobowych przetwarzanych w związku z Państwa uczestnictwem w Programie jest Progressive sp. z o.o., czyli podmiot, który zgodnie z RODO decyduje o sposobach i celach przetwarzania Państwa danych osobowych. Z Administratorem można się kontaktować:
                    <ul class="loyalty-sublist">
                        <li>a) listownie, na adres: PROGRESSIVE sp. z o.o., ul. Sosnowiecka 5, 52-008 Wrocław;</li>
                        <li>b) mailowo, na adres: stalyklient@herbata.net.</li>
                    </ul>
                </div>

                <div class="loyalty-section-header">3. Zakres przetwarzanych danych</div>
                <div class="loyalty-text">
                    W związku z uczestnictwem w Programie możemy przetwarzać takie Państwa dane jak: imię, nazwisko, adres e-mail, numer telefonu, adres korespondencyjny.
                </div>

                <div class="loyalty-section-header">4. Cele przetwarzania danych</div>
                <div class="loyalty-text">Dane przetwarzamy w następujących celach:</div>
                <ol class="loyalty-list">
                    <li>udzielenia odpowiedzi na Państwa pytania za pośrednictwem oferowanych przez nas kanałów komunikacji,</li>
                    <li>poprawy funkcjonalności oprogramowania umożliwiającego obsługę Programu Lojalnościowego,</li>
                    <li>utrzymywania historii aktywności i korzyści realizowanych za pomocą Programu, w szczególności rabatów</li>
                    <li>zbierania statystyk odnoszących się do korzystania z Programu Lojalnościowego, obejmujących w szczególności raportowanie, badania marketingowe, planowanie rozwoju oferty, produktów lub sieci marki Czas na Herbatę, prace rozwojowe w systemach informatycznych marki Czas na Herbatę;</li>
                    <li>zapewnienia bezpieczeństwa sieci i informacji;</li>
                    <li>przekazywania informacji o aktualnych promocjach, usługach, nowościach, wydarzeniach, akcjach marki Czas na Herbatę, ofertach specjalnych ( w tym tylko dla uczestników) za pośrednictwem e-maili, newsletterow, wiadomościu push, smsów</li>
                    <li>prowadzenia działalności marketingowej poprzez profilowanie polegające na dopasowaniu oferty handlowej oraz promocji do Państwa preferencji;</li>
                    <li>wykonania czynności zmierzających do zawarcia umowy, zawarcia i wykonania umowy, której przedmiotem jest realizacja Programu Lojalnościowego,</li>
                    <li>wypełnienia obowiązków fiskalnych wynikających z przepisów (wystawianie i przechowywanie dokumentów księgowych),</li>
                    <li>obsługi reklamacji w zakresie wszystkich świadczonych usług,</li>
                    <li>dochodzenia roszczeń lub obrony przed roszczeniami.</li>
                    <li>przygotowania ofert promocyjnych w oparciu o przetwarzane dane np. historię transakcji, preferencje zakupowe.</li>
                    <li>wsparcia obsługi, w tym poprzez jej dostosowanie do potrzeb wynikających z dokonywanych transakcji, skarg, wniosków Uczestników.</li>
                    <li>Dane osobowe Uczestnika Programu przekazywane są dobrowolnie, choć mogą być niezbędne do realizacji wszystkich lub niektórych uprawnień z tytułu Programu. Uczestnik nie jest zobowiązany do podania jakichkolwiek danych, a ich podanie nie jest obowiązkiem ustawowym oraz może nastąpić wyłącznie, jeżeli Uczestnik się na to zgodzi i według uznania Uczestnika.</li>
                    <li>Niepodanie przez Uczestnika danych osobowych lub niewyrażenie którejkolwiek ze zgód określonych w Formularzu Przystąpienia do Programu Karty Stałego Klienta nie powoduje dla Uczestnika żadnych negatywnych konsekwencji poza brakiem możliwości:
                        <ul class="loyalty-sublist">
                            <li>skorzystania z Przywilejów Programu (Rabatu);</li>
                            <li>otrzymania informacji o promocjach, produktach, w tym usługach, wydarzeniach, akcjach, w tym ofertach specjalnych (w tym dostępnych tylko dla Uczestników Programu) poprzez np. e-mail, newsletter, wiadomości push, sms</li>
                        </ul>
                    </li>
                </ol>

                <div class="loyalty-section-header">5. Podstawa prawna</div>
                <div class="loyalty-text">Podstawą prawną przetwarzania Państwa danych osobowych jest:</div>
                <ol class="loyalty-list">
                    <li>Państwa zgoda, którą wyrażają Państwo: zwracając się do nas z pytaniem dotyczącym funkcjonowania naszych usług, zaznaczając odpowiedni checkbox bądź akceptując oświadczenie o otrzymywaniu informacji marketingowych danym kanałem komunikacji (SMS, e-mail);</li>
                    <li>niezbędność realizacji czynności zmierzających bezpośrednio do zawarcia umowy oraz zawarcie i wykonanie umowy – dane podane przez Państwa w związku z Rejestracją do Programu lojalnościowego;</li>
                    <li>realizacja obowiązku prawnego wynikającego z przepisów Ustawy o podatku od towarów i usług oraz Ordynacji podatkowej polegającego na należytym wystawieniu dokumentu księgowego oraz jego przechowywania przez okres wymagany aktualnie obowiązującymi przepisami podatkowymi - dane podane w zakresie niezbędnym do wystawienia dokumentu księgowego;</li>
                    <li>nasz uzasadniony interes, którym jest zabezpieczenie prawa do dochodzenia ewentualnych roszczeń lub obrony przed ewentualnymi roszczeniami, prowadzenie działań marketingowych, w szczególności poprzez prowadzenie firmowych kont w mediach społecznościowych w celu dbania o popularyzację naszej marki, zbieranie statystyk i analiz związanych z korzystaniem z Programu.</li>
                    <li>Dobrowolność podania danych Podanie Państwa danych osobowych jest dobrowolne, lecz niezbędne do realizacji celu, dla którego podanie danych jest wymagane. Przykładowo, jeśli chcą Państwo otrzymywać od nas informacje marketingowe, powinni Państwo wyrazić na to stosowną zgodę. Jeśli chcą Państwo korzystać z Programu, konieczne jest podanie danych niezbędnych do zawarcia umowy. Podanie danych niezbędnych do spełnienia obowiązku prawnego, jakim jest wystawienie odpowiedniego dokumentu księgowego jest obowiązkowe.</li>
                </ol>

                <div class="loyalty-section-header">7. Okres przetwarzania danych</div>
                <div class="loyalty-text">Państwa dane będziemy przetwarzać przez następujący okres:</div>
                <ol class="loyalty-list">
                    <li>dane przetwarzane na podstawie zgody – przez czas ważności zgody, do czasu jej wycofania;</li>
                    <li>dane przetwarzane w związku z zawarciem umowy – przez czas realizacji umowy, a następnie przez okres przedawnienia ewentualnych roszczeń wynoszący 6 lat;</li>
                    <li>dane przetwarzane w związku z realizacją obowiązku prawnego – przez okres 5 lat od końca roku kalendarzowego, w którym został wystawiony dokument księgowy;</li>
                    <li>dane przetwarzane na podstawie naszego uzasadnionego interesu prawnego – przez okres niezbędny do realizacji celu, jednak nie dłużej niż do upływu okresu przedawnienia ewentualnych roszczeń na podstawie przepisów powszechnie obowiązujących.</li>
                </ol>

                <div class="loyalty-section-header">5. Uprawnienia</div>
                <ol class="loyalty-list">
                    <li>Uczestnikowi przysługuje prawo dostępu do treści jego danych osobowych, ich poprawiania, przenoszenia, wycofania każdej zgody na przetrwarzanie jego danych osobowych wyrażonych w formularzu przystąpienia do programu Karta Stałego Klienta w dowolnym momencie bez podawania przyczyn, ograniczenia przetwarzania, przeniesienia, usunięcia, uzyskania kopii, złożenia skargi do Prezesa Urzędu Ochrony Danych Osobowych w Warszawie.</li>
                    <li>Cofnięcie zgody nie ma wpływu na zgodność z prawem przetwarzania danych, którego dokonano na podstawie zgody przed jej cofnięciem.</li>
                    <li>Uczestnikowi Programu przysługuje prawo do wniesienia sprzeciwu wobec przetwarzania jego danych osobowych:
                        <ul class="loyalty-sublist">
                            <li>gdy zaistnieją przyczyny związane ze szczególną sytuacją Uczestnika a przetwarzanie danych oparte jest na podstawie niezbędności do celów wynikających z prawnie uzasadnionych interesów Administratora lub</li>
                            <li>w dowolnym momencie, gdy dane przetwarzane są na potrzeby marketingu bezpośredniego (tj. wobec przekazywania Uczestnikowi informacji o promocjach, ofertach, produktach, w tym usługach, akcjach i wydarzeniach), przy czym po wniesieniu sprzeciwu wobec przetwarzania danych dla celów marketingowych nie wolno już przetwarzać danych do takich celów.</li>
                        </ul>
                    </li>
                    <li>Uczestnik może realizować prawa, o których mowa w punkcie 8b -c wyżej, w każdym czasie, występując z odpowiednim żądaniem.</li>
                    <li>Uczestnik może wystąpić do Administratora z żądaniami, o których mowa w punkcie 8b -c wyżej, poprzez przekazanie pisemnego oświadczenia:
                        <ul class="loyalty-sublist">
                            <li>Pracownikowi Salonu;</li>
                            <li>mailowo, na adres: stalyklient@herbata.net;</li>
                            <li>korespondencyjnie, na adres: PROGRESSIVE sp z o.o., ul. Sosnowiecka 5, 52-008 Wrocław.</li>
                        </ul>
                    </li>
                    <li>Administrator ma obowiązek udzielenia Uczestnikowi informacji o działaniach podjętych w związku z żądaniami, o których mowa w punkcie 8 b-c wyżej, bez zbędnej zwłoki, a w każdym razie w terminie miesiąca od otrzymania żądania. W razie potrzeby termin, o którym mowa w zdaniu poprzedzającym, może być przedłużony o kolejne dwa miesiące z uwagi na skomplikowany charakter żądania lub liczbę żądań. W terminie miesiąca od otrzymania żądania Administrator informuje Uczestnika o takim przedłużeniu terminu z podaniem przyczyn opóźnienia.</li>
                    <li>Jeżeli Administrator nie podejmuje działań w związku z żądaniem Uczestnika, o których mowa w punkcie 8 b-c wyżej, to niezwłocznie – najpóźniej w terminie miesiąca od otrzymania żądania – informuje Uczestnika o powodach niepodjęcia działań oraz możliwości wniesienia skargi do Prezesa Urzędu Ochrony Danych Osobowych oraz skorzystania ze środków ochrony prawnej przed Sądem.</li>
                    <li>Jeżeli Administrator będzie miał uzasadnione wątpliwości dotyczące tożsamości Uczestnika, w związku ze zgłoszeniem żądania, może poprosić Uczestnika o podanie dodatkowych informacji niezbędnych do jej potwierdzenia.</li>
                    <li>Administrator udziela informacji, o których mowa w punkcie 8 f-h wyżej, na piśmie, według wyboru Administratora:
                        <ul class="loyalty-sublist">
                            <li>listem poleconym na podany przez Uczestnika adres pocztowy;</li>
                            <li>drogą elektroniczną na podany przez Uczestnika adres e-mail; za wyjątkiem przypadków gdy:
                                <ul>
                                    <li>Uczestnik przekazał swoje żądanie drogą elektroniczną i nie zażądał udzielenia informacji przez Administratora w innej formie – wówczas Administrator przekazuje informacje na podany przez Uczestnika adres e-mail;</li>
                                    <li>Uczestnik zażądał udzielenia informacji przez Administratora ustnie, a jego tożsamość została potwierdzona innymi sposobami – wówczas Administrator udziela informacji ustnie.</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li>Wszelka komunikacja i działania podejmowane przez Administratora w związku z żądaniami Uczestnika, o których mowa w punkcie 8b-c i wyżej, są wolne od opłat. Jeżeli jednak powołane żądania będą ewidentnie nieuzasadnione lub nadmierne, np. z uwagi na ustawiczny charakter, Administrator może: a) pobrać rozsądną opłatę, uwzględniającą administracyjne koszty udzielenia informacji, komunikacji lub podjęcia żądanych działań albo, b)odmówić podjęcia działań w związku z żądaniem.</li>
                    <li>Administrator informuje o sprostowaniu lub uzupełnieniu lub usunięciu lub ograniczeniu przetwarzania danych osobowych Uczestnika, których dokonał w wykonaniu żądania Uczestnika, każdego odbiorcę, któremu zostały ujawnione dane Uczestnika. Administrator nie jest zobowiązany do przekazania takich informacji jedynie wówczas, gdy okaże się to niemożliwe (np. zlikwidowano spółkę) lub będzie to wymagało niewspółmiernie dużego wysiłku (dane ujawniono wiele lat temu oraz pomimo podjętych prób nie udało się nawiązać kontaktu z odbiorcą).</li>
                    <li>Na żądanie Uczestnika Administrator informuje Uczestnika o odbiorcach, których poinformował o sprostowaniu lub usunięciu lub ograniczeniu przetwarzania danych osobowych Uczestnika, a także o odbiorcach, których nie udało się powiadomić Administratorowi. Powyższe uprawnienia przysługują na zasadach i z zastrzeżeniem wyjątków przewidzianych w RODO. W razie woli realizacji powyższych uprawnień, w szczególności w razie woli wycofania zgody, jakichkolwiek pytań lub wątpliwości w zakresie przysługujących Uczestnikowi uprawnień, prosimy o kontakt na adres e-mail: stalyklient@herbata.net lub wysłanie listu bezpośrednio na adres siedziby Organizatora. Cofnięcie zgody nie ma wpływu na zgodność z prawem przetwarzania danych, którego dokonano na podstawie zgody przed jej cofnięciem.</li>
                </ol>

                <div class="loyalty-section-header">9. Odbiorcy danych</div>
                <div class="loyalty-text">
                    Odbiorcą danych osobowych będą nasi Zaufani Partnerzy oraz Organizator- podmioty świadczące usługi prawne, księgowe, podatkowe, jak również dostawcy usług IT w zakresie hostingu danych oraz usług poczty służbowej. Organizator Progressive sp. z o.o., gdzie dane mogą być udostępniane:
                </div>
                <ol class="loyalty-list">
                    <li>pracownikom i współpracownikom PROGRESSIVE, którzy muszą mieć dostęp do danych Uczestników, aby móc wykonywać zobowiązania PROGRESSIVE wynikające z Programu;</li>
                    <li>innym nie wymienionym poniżej podmiotom przetwarzającym w imieniu PROGRESSIVE dane osobowe Uczestnika i uczestniczącym w wykonywaniu Programu, tj.:
                        <ul class="loyalty-sublist">
                            <li>podwykonawcom wspierającym PROGRESSIVE w prowadzeniu i realizacji Programu, np. w obsłudze korespondencji lub w procesie obsługi Uczestników lub prowadzącym Sklepy Czas na Herbatę;</li>
                            <li>agencjom reklamowym i innym podmiotom pośredniczącym w sprzedaży produktów marki Czas na Herbatę lub organizacji akcji marketingowych;</li>
                            <li>podmiotom obsługującym systemy teleinformatyczne PROGRESSIVE lub udostępniającym PROGRESSIVE narzędzia teleinformatyczne;</li>
                            <li>podmiotom świadczącym PROGRESSIVE usługi doradcze, konsultacyjne, audytowe lub pomoc prawną, podatkową, rachunkową;</li>
                            <li>agencjom badawczym działającym na zlecenie PROGRESSIVE;</li>
                        </ul>
                    </li>
                    <li>innym administratorom będącym: (i)
                        <ul class="loyalty-sublist">
                            <li>agencjami reklamowymi i podmiotami współpracującymi przy organizacji akcji marketingowych lub przy prowadzeniu i obsłudze Programu, w tym prowadzeniu Sklepów Czas na Herbatę – w celu rozliczenia należnych im wynagrodzeń;</li>
                            <li>podmiotami prowadzącymi działalność pocztową lub kurierską.</li>
                        </ul>
                    </li>
                </ol>
                <div class="loyalty-text" style="font-weight: bold; margin-top: 10px;">Naszymi Zaufanymi Partnerami są:</div>
                <ul class="loyalty-sublist" style="list-style-type: none; padding-left: 0;">
                    <li>LoyRise sp. z o.o. sp. komandytowa</li>
                    <li>LoyRise sp. z o.o. Spartavity sp. z o.o.</li>
                    <li>Sparta Loyalty spółka z ograniczoną odpowiedzialnością</li>
                    <li>Vercom S.A. (dostawca serwersms.pl)</li>
                    <li>Orange Polska S.A. Polska</li>
                    <li>T-Mobile Polska S.A. Polska</li>
                    <li>P4 Sp. z o.o. (Play) Polska</li>
                    <li>Polkomtel Sp. z o.o. (Plus GSM)Polska</li>
                    <li>H88 S.A. Poznań, Polska</li>
                    <li>Hetzner GMBH</li>
                </ul>

                <div class="loyalty-section-header">10. Brak przetwarzania poza EOG</div>
                <div class="loyalty-text">Dane Uczestnika nie będą przetwarzane poza Europejskim Obszarem Gospodarczym.</div>

                <div class="loyalty-section-header">11. Profilowanie</div>
                <div class="loyalty-text">Dane osobowe Uczestnika będą podlegały profilowaniu w celu dopasowania promocji lub oferty handlowej do osobistych preferencji.</div>

                <div class="loyalty-section-header">12. Postanowienia końcowe</div>
                <div class="loyalty-text">
                    Jako administrator zastrzegamy sobie prawo zmiany Polityki w przyszłości – może to nastąpić z ważnych powodów, m.in. takich jak zmiany obowiązujących przepisów, w szczególności w zakresie ochrony danych osobowych, prawa telekomunikacyjnego, usług świadczonych drogą elektroniczną oraz regulujących prawa konsumentów, wpływające na nasze prawa i obowiązki lub prawa i obowiązki Uczestnika, a także w związku z rozwojem funkcjonalności lub usług elektronicznych podyktowanych postępem technologii internetowej, w tym stosowania/wdrażania nowych rozwiązań technologicznych lub technicznych, mających wpływ na zakres Polityki.
                </div>

            </div>
        </div>

        {elseif $cms.id == 12}
        
        {literal}
        <style>
            #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
            .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }

            .leaf-custom-page {
                font-family: 'Garamond', 'Georgia', serif;
                color: #555;
                background: #fff;
                padding-bottom: 80px;
                width: 100%;
                font-size: 15px;
                line-height: 1.6;
            }

            .leaf-header-wrapper {
                max-width: 1140px;
                margin: 0 auto;
                padding: 40px 15px 20px 15px;
                border-bottom: 1px solid #f9a918;
                margin-bottom: 40px;
            }

            .leaf-header-wrapper h1 {
                font-family: 'Garamond', serif;
                font-size: 42px;
                color: #555;
                margin: 0;
                font-weight: normal;
                text-align: left;
            }

            .leaf-content {
                max-width: 1140px;
                margin: 0 auto;
                padding: 0 15px;
            }

            .leaf-title-center {
                text-align: center;
                display: block;
                margin-bottom: 10px;
                color: #333;
                font-weight: bold;
            }

            .leaf-date-center {
                text-align: center;
                display: block;
                margin-bottom: 30px;
                font-style: italic;
                font-size: 14px;
            }

            .leaf-section-header {
                text-align: center;
                font-weight: bold;
                margin-top: 35px;
                margin-bottom: 15px;
                color: #333;
                font-size: 16px;
            }

            .leaf-text {
                text-align: justify;
                margin-bottom: 15px;
            }

            ol.leaf-list {
                padding-left: 25px;
                margin: 0;
                text-align: justify;
            }

            ol.leaf-list li {
                margin-bottom: 10px;
            }

            ol.leaf-sublist {
                list-style-type: lower-alpha;
                padding-left: 20px;
                margin-top: 5px;
                margin-bottom: 5px;
            }

            .shop-list-container {
                margin-top: 20px;
                display: block; 
            }

            .shop-item {
                margin-bottom: 25px;
                font-size: 14px;
            }

            .shop-city {
                font-weight: bold;
                color: #333;
                display: block;
                margin-bottom: 3px;
            }

            .link-style {
                color: #5bc0de;
                text-decoration: none;
            }
            .link-style:hover {
                text-decoration: underline;
            }
        </style>
        {/literal}

        <div class="leaf-custom-page">
            <div class="leaf-header-wrapper">
                <h1>Regulamin programu lojalnościowego „Listek herbaty”</h1>
            </div>

            <div class="leaf-content">
                
                <span class="leaf-title-center">Regulamin programu lojalnościowego</span>
                <span class="leaf-title-center">„Listek herbaty”</span>
                <span class="leaf-date-center">wersja z dnia 10.05.2024</span>

                <div class="leaf-section-header">§ 1 Definicje</div>
                <ol class="leaf-list">
                    <li>Program – program lojalnościowy organizowany na terytorium Rzeczypospolitej Polskiej skierowany do klientów sieci salonów firmowych „Czas na Herbatę”, których właścicielem jest PROGRESSIVE SPÓŁKA Z OGRANICZONĄ ODPOWIEDZIALNOŚCIĄ z siedzibą we Wrocławiu.</li>
                    <li>Organizator – PROGRESSIVE SPÓŁKA Z OGRANICZONĄ ODPOWIEDZIALNOŚCIĄ z siedzibą we Wrocławiu (52-008), ul. Sosnowiecka 5, KRS 0001080458, REGON 527610437, NIP 8992984184.</li>
                    <li>Salon – objęty Programem salon, zlokalizowany na terytorium Rzeczypospolitej Polskiej, należący do sieci sprzedaży pod marką „Czas na Herbatę”, której właścicielem jest PROGRESSIVE SPÓŁKA Z OGRANICZONĄ ODPOWIEDZIALNOŚCIĄ z siedzibą we Wrocławiu lub należący do sieci Czas na Herbatę salon franczyzowy. Każdy Salon Czas na Herbatę może być w dowolnym momencie trwania Programu wyłączony z Programu lub włączony do Programu przez Organizatora. Lista salonów firmowych i franczyzowych Czas na Herbatę biorących udział w Promocji stanowi załącznik 1 niniejszego Regulaminu.</li>
                    <li>Strona internetowa – witryna Organizatora dostępna pod adresem www.czasnaherbate.net.</li>
                    <li>Sklep internetowy – platforma sprzedażowa online Organizatora, dostępna pod adresem czasnaherbate.net.</li>
                    <li>Uczestnik – klient Salonu spełniający wymogi Regulaminu, będący konsumentem w rozumieniu art. 22(1) ustawy z dnia 23 kwietnia 1964 roku Kodeks cywilny (Dz. U. z 2018 r., poz. 1025).</li>
                    <li>Karta programu – umożliwiająca korzystanie z Programu karta papierowa, otrzymana przez Uczestnika w ramach prowadzonego przez Organizatora programu lojalnościowego „Listek herbaty”. Karta programu uprawnia do uczestnictwa w Programie do daty ważności karty włącznie. Data ważności karty jest umieszczona na Karcie programu wydanej Uczestnikowi.</li>
                    <li>Listki – punkty lojalnościowe przyznawane Uczestnikowi z tytułu dokonania zakupu określonych produktów objętych Programem w Salonach Czas na Herbatę.</li>
                    <li>Kod rabatowy – umieszczony na Karcie uczestnika kod umożliwiający skorzystanie z opustu w Sklepie internetowym.</li>
                    <li>Regulamin – niniejszy regulamin Programu lojalnościowego „Listek herbaty”.</li>
                </ol>

                <div class="leaf-section-header">§ 2 Postanowienia ogólne</div>
                <ol class="leaf-list">
                    <li>Program prowadzony jest na podstawie Regulaminu określającego prawa i obowiązki Uczestnika i Organizatora.</li>
                    <li>Program prowadzony jest w celu promocji i marketingu działalności Organizatora.</li>
                    <li>Program rozpoczyna się w dniu 10 maja 2024 roku i obowiązuje do dnia 30.06.2025 lub do wyczerpania zapasów produktów objętych promocją.</li>
                    <li>Organizator zastrzega sobie prawo do zakończenia Programu w dowolnym momencie, bez podawania przyczyny, z zastrzeżeniem poinformowania Uczestników z co najmniej miesięcznym wyprzedzeniem. Informacja ta będzie ogłoszona poprzez Stronę Internetową oraz komunikaty w Salonach biorących udział w Programie, określając dokładną datę zakończenia Programu.</li>
                    <li>Program nie łączy się z innymi promocjami lub programami prowadzonymi przez Organizatora, za wyjątkiem programów, których regulaminy stanowią, że można je łączyć z Programem.</li>
                </ol>

                <div class="leaf-section-header">§ 3 Uczestnictwo w Programie</div>
                <ol class="leaf-list">
                    <li>Uczestnictwo w Programie jest dobrowolne. Do wzięcia udziału w Programie niezbędne jest dokonanie zakupu w Salonie Czas na Herbatę.</li>
                    <li>Uczestnik w momencie przystąpienia do Programu akceptuje warunki określone w Regulaminie. Uczestnicy mogą przystąpić do Programu w dowolnym momencie jego trwania.</li>
                    <li>Uczestnikami mogą być osoby fizyczne posiadające pełną zdolność do czynności prawnych.</li>
                    <li>Uczestnik bierze udział w programie osobiście. Wyłączona jest możliwość działania Uczestnika za pośrednictwem przedstawiciela. Uczestnikowi nie przysługuje prawo do przeniesienia praw i obowiązków związanych z udziałem w Programie na osobę trzecią.</li>
                    <li>Uczestnikami Programu nie mogą być pracownicy Organizatora.</li>
                    <li>Uczestnik Programu powinien postępować zgodnie z obowiązującymi przepisami prawa, a także zgodnie z zasadami współżycia społecznego i dobrymi obyczajami. Organizator ma prawo do wyłączenia Uczestnika z udziału w Programie w przypadku, gdy ten nie spełnia wymagań uczestnictwa, łamie regulamin Programu, dopuszcza się działań zabronionych prawem lub innych akcji sprzecznych z przepisami prawa w stosunku do Organizatora lub innego Uczestnika.</li>
                    <li>W przypadku powzięcia przez Organizatora podejrzenia, że Uczestnik łamie zasady Regulaminu Programu, Organizator zastrzega sobie możliwość rozpoczęcia dochodzenia oraz tymczasowej blokady Karty programu dla danego Uczestnika. Proces ten może skutkować albo usunięciem Uczestnika z Programu, jeśli dochodzenie potwierdzi naruszenie zasad, albo umorzeniem sprawy, jeśli naruszenia nie zostaną stwierdzone. W przypadku usunięcia z Programu, Organizator może odmówić przyznania Uczestnikowi przysługujących mu korzyści z Programu. Jeśli dochodzenie nie wykaże naruszeń, Organizator wyda decyzję o zakończeniu postępowania. Uczestnik ma prawo odwołać się od decyzji Organizatora zgodnie z procedurą składania reklamacji określoną w § 7 Regulaminu.</li>
                    <li>Uczestnik przestaje uczestniczyć w Programie z chwilą złożenia przez niego pisemnej rezygnacji, decyzji Organizatora o jego wykluczeniu lub w przypadku śmierci Uczestnika. Rezygnację z Programu Uczestnik może przesłać pisemnie na adres Organizatora: PROGRESSIVE sp. z o.o., ul. Sosnowiecka 5, 52-008 Wrocław, z dopiskiem: „Program Listek herbaty”.</li>
                    <li>W przypadku nieskorzystania przez Uczestnika z praw przewidzianych w Programie w okresie jego trwania, Uczestnikowi nie przysługuje prawo zgłoszenia jakichkolwiek roszczeń z powyższego tytułu wobec Organizatora.</li>
                </ol>

                <div class="leaf-section-header">§ 4 Zasady Programu</div>
                <ol class="leaf-list">
                    <li>Uczestnik bierze udział w Programie poprzez dokonanie zakupu produktów w:
                        <ol class="leaf-sublist">
                            <li>Salonie poprzez zarejestrowanie na Karcie programu zakupu herbaty lub kawy na wagę, w momencie jego dokonywania.</li>
                            <li>Sklepie internetowym poprzez podanie Kodu rabatowego w momencie finalizacji zamówienia herbaty lub kawy na wagę.</li>
                        </ol>
                    </li>
                    <li>Uczestnikowi programu przysługuje:
                        <ol class="leaf-sublist">
                            <li>Otrzymanie opustu na zakup 50 g dowolnej kompozycji herbacianej na wagę o maksymalnej cenie sprzedaży 35 zł brutto za 100 g, za 1 zł brutto, po wcześniejszym uzyskaniu przez Uczestnika 4 (czterech) listków. Uczestnik otrzymuje 1 (jeden) Listek w chwili dokonania zakupu herbat i kaw na wagę w Salonie, za sumę równą lub przekraczającą 35 zł brutto na pojedynczym paragonie. Skorzystanie z niniejszego opustu w Salonie firmowym wymaga okazania pracownikowi Salonu Karty programu, bezpośrednio przed dokonaniem zakupu, w celu umieszczenia w przewidzianym do tego na niej miejscu, Listka w formie pieczątki. Pieczątka stanowi potwierdzanie skorzystania z niniejszego opustu.</li>
                            <li>Jednorazowy opust w wysokości 15%, na zakupy całego asortymentu kaw i herbat na wagę. W celu skorzystania z opustu należy, przy następnych zakupach po przystąpieniu Uczestnika do Programu, bezpośrednio przed dokonaniem zakupu okazać pracownikowi Salonu Karty programu. Skorzystanie z jednorazowego opustu przez Uczestnika jest możliwe wyłącznie w salonie, w którym karta została wydana i jest rejestrowane poprzez wpisanie daty realizacji zakupu rabatowego przez sprzedawcę.</li>
                            <li>Stały opust w wysokości 15%, na zakupy całego asortymentu kaw i herbat na wagę w Sklepie internetowym. W celu skorzystania z opustu należy podać w Sklepie internetowym w sekcji „koszyk” Kod rabatowy podany na Karcie. Kod rabatowy można używać wielokrotnie, do daty ważności karty włącznie.</li>
                        </ol>
                    </li>
                    <li>Uzyskanie nagrody w Programie jest możliwe wyłącznie poprzez wymianę uzyskanych Listków, skorzystania z jednorazowego opustu lub wykorzystanie Kodu rabatowego na opust, bez możliwości uzyskania ekwiwalentu pieniężnego lub dokonywania dopłat do wartości zakupu.</li>
                    <li>W ramach Programu i w celu jego uatrakcyjnienia Organizator zastrzega sobie prawo do przeprowadzania innych niż wymienione w Regulaminie działania promocyjne dla Uczestników Programu. W przypadku wprowadzenia do Programu wyżej opisanych działań promocyjnych, Organizator poinformuje Uczestników o zasadach i szczegółach danej promocji za pośrednictwem wybranych środków przekazu tj. Strony Internetowej lub komunikatu w Salonach sprzedaży.</li>
                </ol>

                <div class="leaf-section-header">§ 5 Karta programu</div>
                <ol class="leaf-list">
                    <li>Karta programu jest własnością Organizatora i jest wydawana Uczestnikom Programu.</li>
                    <li>Karta programu może być wykorzystywana wyłącznie na potrzeby Programu i zgodnie z niniejszym Regulaminem.</li>
                    <li>Karta programu, wydana Uczestnikowi, jest kartą na okaziciela. Organizator nie ponosi odpowiedzialności za szkody poniesione przez Uczestnika w związku dokonaniem transakcji przez osoby nieupoważnione, które weszły w posiadanie Karty programu.</li>
                    <li>Karta programu może być wykorzystywana jedynie do daty ważności określonej na karcie.</li>
                    <li>W przypadku utraty lub zniszczenia przez Uczestnika dotychczasowo posiadanej Karty programu, nowy egzemplarz karty nie będzie wydawany Uczestnikowi, a uzyskane Listki i inne korzyści wynikające z jej posiadania podlegają przepadkowi.</li>
                </ol>

                <div class="leaf-section-header">§ 7 Postępowanie reklamacyjne</div>
                <ol class="leaf-list">
                    <li>Uczestnik może składać reklamacje w formie pisemnej na adres Organizatora: PROGRESSIVE sp. z o.o., ul. Sosnowiecka 5, 52-008 Wrocław, z dopiskiem: „Program Listek herbaty”</li>
                    <li>Reklamacja powinna zawierać imię i nazwisko Uczestnika, jego adres korespondencyjny oraz dokładny opis i przyczynę reklamacji wraz z żądaniem reklamującego.</li>
                    <li>Złożona reklamacja rozpatrywana będzie przez Organizatora w terminie 14 dni roboczych od daty otrzymania reklamacji. Zainteresowani zostaną powiadomieni o sposobie rozpatrzenia reklamacji w formie pisemnej, na adres podany w korespondencji. Za datę rozpatrzenia reklamacji przyjmuje się dzień nadania korespondencji pocztą.</li>
                    <li>Powyższe postępowanie reklamacyjne nie wyłącza prawa Uczestnika do dochodzenia swoich roszczeń w sądzie powszechnym.</li>
                </ol>

                <div class="leaf-section-header">§ 8 Ochrona danych osobowych</div>
                <ol class="leaf-list" start="5">
                    <li>Administratorem danych osobowych Uczestników jest PROGRESSIVE SPÓŁKA Z OGRANICZONĄ ODPOWIEDZIALNOŚCIĄ z siedzibą we Wrocławiu (52-008), ul. Sosnowiecka 5, KRS 0001080458, REGON 527610437, NIP 8992984184.</li>
                    <li>Szczegółowe zasady związane z przetwarzaniem danych osobowych Uczestnika zostały określone w Polityce Prywatności, dostępnej w internecie pod adresem:  <a href="https://czasnaherbate.net/blog/polityka-prywatnosci/" class="link-style">https://czasnaherbate.net/blog/polityka-prywatnosci/</a></li>
                </ol>

                <div class="leaf-section-header">§ 9 Postanowienia końcowe</div>
                <ol class="leaf-list">
                    <li>Zgłoszenie udziału w Programie oznacza, że Uczestnik zapoznał się z treścią Regulaminu i go akceptuje.</li>
                    <li>Pełna treść Regulaminu będzie dostępna w siedzibie Organizatora, w Salonach firmowych oraz na Stronie internetowej. Podstawowe zasady Programu zawarte będą w materiałach informacyjnych dystrybuowanych w związku z realizacją Programu.</li>
                    <li>Organizator może wprowadzić zmiany do Regulaminu w każdym czasie z ważnych powodów, w tym zmian technologicznych, biznesowych lub prawnych. O planowanej zmianie Regulaminu Uczestnicy zostaną powiadomieni za pośrednictwem Strony Internetowej z minimum 14 dniowym wyprzedzeniem. Organizator zastrzega sobie prawo do wprowadzania zmian w Regulaminie z zastrzeżeniem, że zmiana Regulaminu nie będzie powodować utraty przez Uczestnika nabytych już przez niego praw w Programie, co nie ogranicza uprawnienia Organizatora do zakończenia Programu zgodnie z § 2 ust. 4 Regulaminu oraz § 3 ust. 8 Regulaminu. Zmiana Regulaminu jest skuteczna wobec Uczestników, którzy nie zrezygnują z uczestnictwa w Programie stosownie do postanowienia § 3 ust. 10 niniejszego regulaminu.</li>
                    <li>W przypadkach nieuregulowanych Regulaminem, zastosowanie znajdą właściwe przepisy prawa powszechnie obowiązujące w Polsce.</li>
                    <li>Wszelkie spory wynikłe z tytułu wykonania zobowiązań związanych z Programem będą rozstrzygane przez sądy powszechne.</li>
                </ol>

                <br><hr><br>

                <div class="leaf-text">
                    <strong>Załącznik nr 1</strong><br>
                    Lista salonów Czas na Herbatę biorących udział w programie lojalnościowym „Listek herbaty”
                </div>

                <div class="shop-list-container">
                    <div class="shop-item"><span class="shop-city">Bełchatów</span>Olimpia<br>Ul. Kolejowa 6, 97-400 Bełchatów</div>
                    <div class="shop-item"><span class="shop-city">Białystok</span>Jurowiecka<br>ul. Jurowiecka 1, 15-101 Białystok</div>
                    <div class="shop-item"><span class="shop-city">Białystok</span>Biała<br>ul. Miłosza 2, 15-265 Białystok</div>
                    <div class="shop-item"><span class="shop-city">Bielsko-Biała</span>Gemini<br>ul. Leszczyńska 20, 43-300 Bielsko-Biała</div>
                    <div class="shop-item"><span class="shop-city">Bielsko-Biała</span>Sfera<br>ul. Mostowa 5, 43-300 Bielsko Biała</div>
                    <div class="shop-item"><span class="shop-city">Dąbrowa</span>Pogoria<br>ul. Jana III Sobieskiego 6, 41-300 Dąbrowa</div>
                    <div class="shop-item"><span class="shop-city">Elbląg</span>Ogrody<br>Il. Pułkownika Dąbka 152, 82-300 Elbląg</div>
                    <div class="shop-item"><span class="shop-city">Gdańsk</span>Auchan<br>ul. Szczęśliwa 3, 80-176 Gdańsk</div>
                    <div class="shop-item"><span class="shop-city">Gdańsk</span>Alfa<br>ul. Kołobrzeska 41c, 80-391 Gdańsk</div>
                    <div class="shop-item"><span class="shop-city">Gdynia</span>Klif<br>al. Zwycięstwa 256, 81-525 Gdynia</div>
                    <div class="shop-item"><span class="shop-city">Gdynia</span>Riviera<br>ul. Kazimierza Górskiego 2, 81-304 Gdynia</div>
                    <div class="shop-item"><span class="shop-city">Gorzów</span>Askana<br>al. Konstytucji 3-go maja 102, 66-400 Gorzów</div>
                    <div class="shop-item"><span class="shop-city">Grudziądz</span>Galeria Grudziądzka<br>ul. Konarskiego 45, 86-300 Grudziądz</div>
                    <div class="shop-item"><span class="shop-city">Jelenia Góra</span>Sudecka<br>al. Jana Pawła II 51 , 58-506 Jelenia Góra</div>
                    <div class="shop-item"><span class="shop-city">Kalisz</span>Amber<br>ul. Górnośląska 82, 62-800 Kalisz</div>
                    <div class="shop-item"><span class="shop-city">Kalisz</span>Tęcza<br>ul. 3 Maja 1, 62-800 Kalisz</div>
                    <div class="shop-item"><span class="shop-city">Katowice</span>Libero<br>ul. Kościuszki 229, 40-600 Katowice</div>
                    <div class="shop-item"><span class="shop-city">Kielce</span>Korona<br>ul. Warszawska 26, 25-312 Kielce</div>
                    <div class="shop-item"><span class="shop-city">Kielce</span>Echo<br>ul. Świętokrzyska 20, 25-406 Kielce</div>
                    <div class="shop-item"><span class="shop-city">Koszalin</span>Forum<br>ul. Paderewskiego 1, 75-736 Koszalin</div>
                    <div class="shop-item"><span class="shop-city">Koszalin</span>Emka<br>ul. Jana Pawła II 20, 75-752 Koszalin</div>
                    <div class="shop-item"><span class="shop-city">Kraków</span>Serenada<br>ul. Bora Komorowskiego 41, 31-416 Kraków</div>
                    <div class="shop-item"><span class="shop-city">Kraków</span>Bonarka<br>ul. Kamieńskiego 11, 30-644 Kraków</div>
                    <div class="shop-item"><span class="shop-city">Kraków</span>Krakowska<br>ul. Pawia 5, 31-154 Kraków</div>
                    <div class="shop-item"><span class="shop-city">Kraków</span>Galeria Kazimierz<br>ul. Podgórska 34, 31-536 Kraków</div>
                    <div class="shop-item"><span class="shop-city">Kłodzko</span>Twierdza<br>ul. Noworudzka 2, 57-300 Kłodzko</div>
                    <div class="shop-item"><span class="shop-city">Leszno</span>Galeria Leszno<br>al. Aleje Konstytucji 3 Maja 12, 64-100 Leszno</div>
                    <div class="shop-item"><span class="shop-city">Lubin</span>Cuprum Arena<br>ul. Generała Władysława Sikorskiego 20, 59-300 Lubin</div>
                    <div class="shop-item"><span class="shop-city">Lublin</span>Vivo<br>al. Lubelskiej 2, 20-108 Lublin</div>
                    <div class="shop-item"><span class="shop-city">Mielec</span>Navigator<br>ul. Powstańców Warszawy 4, 39-300 Mielec</div>
                    <div class="shop-item"><span class="shop-city">Olsztyn</span>Warmińska<br>ul. Tuwima 26, 10-748 Olsztyn</div>
                    <div class="shop-item"><span class="shop-city">Olsztyn</span>Aura<br>ul. Piłsudskiego 16, 10-576 Olsztyn</div>
                    <div class="shop-item"><span class="shop-city">Opole</span>Solaris<br>pl. Kopernika 16, 45-040 Opole</div>
                    <div class="shop-item"><span class="shop-city">Opole</span>Karolinka<br>ul. Wrocławska 154, 45-835 Opole</div>
                    <div class="shop-item"><span class="shop-city">Ostrów</span>Ostrovia<br>ul. Kaliska 120, 63-400 Ostrów Wielkopolski</div>
                    <div class="shop-item"><span class="shop-city">Piotrków Trybunalski</span>Focus<br>ul Słowackiego 123, 97-300 Piotrków</div>
                    <div class="shop-item"><span class="shop-city">Piła</span>Vivo<br>ul. 14-go Lutego 26, 64-920 Piła</div>
                    <div class="shop-item"><span class="shop-city">Poznań</span>Plaza<br>ul. Drużbickiego 3, 61-693 Poznań</div>
                    <div class="shop-item"><span class="shop-city">Poznań</span>Posnania<br>ul. Pleszewska 1, 61-136 Poznań</div>
                    <div class="shop-item"><span class="shop-city">Płock</span>Wisła<br>ul. Wyszogrodzka 144, 09-410 Płock</div>
                    <div class="shop-item"><span class="shop-city">Rumia</span>Rumia<br>ul. Grunwaldzka 108, 84-230 Rumia</div>
                    <div class="shop-item"><span class="shop-city">Stalowa Wola</span>Vivo<br>ul. Chopina 42, 37-450 Stalowa Wola</div>
                    <div class="shop-item"><span class="shop-city">Suwałki</span>Plaza<br>ul. Generała Józefa Dwernickiego 15, 16-400 Suwałki</div>
                    <div class="shop-item"><span class="shop-city">Szczecin</span>Galaxy<br>al. Wyzwolenia 18/20, 70-554 Szczecin</div>
                    <div class="shop-item"><span class="shop-city">Szczecin</span>Gryf<br>ul. Wiosenna 32, 70-807 Szczecin</div>
                    <div class="shop-item"><span class="shop-city">Tarnów</span>Gemini<br>ul. Nowodąbrowska 127, 33-100 Tarnów</div>
                    <div class="shop-item"><span class="shop-city">Tomaszów Mazowiecki</span>Tomaszów<br>ul. Warszawska 1, 97-200 Tomaszów Mazowiecki</div>
                    <div class="shop-item"><span class="shop-city">Tychy</span>Gemini<br>ul. Towarowa 2C, 43-100 Tychy</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Młociny<br>ul. Zgrupowania AK Kampinos 15, 01-943 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Północna<br>ul. Światowida 17, 03-144 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Sadyba Best Mall<br>ul. Powsińska 31, 02-903 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Galeria Mokotów<br>ul. Wołoska 12, 02-675 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Centrum Ursynów<br>ul. Puławska 427, 02-801 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Reduta<br>al. Jerozolimskie 148, 02-326 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Złote Tarasy<br>ul. Złota 59, 00-120 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Arkadia<br>al. Jana Pawla II 82, 00-175 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Wola Park Poziom 1<br>ul. Górczewska 124, 01-460 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Wola Park Poziom 0<br>ul. Górczewska 124, 01-460 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Wrocław</span>Tesco<br>ul. Czekoladowa 9, 55-075 Bielany Wrocławskie</div>
                    <div class="shop-item"><span class="shop-city">Wrocław</span>Dominikańska<br>pl. Dominikański 3, 50-159 Wrocław</div>
                    <div class="shop-item"><span class="shop-city">Wrocław</span>Pasaż Grunwaldzki<br>pl. Grunwaldzki 22, 50-363 Wrocław</div>
                    <div class="shop-item"><span class="shop-city">Wrocław</span>Auchan<br>ul. Francuska 6, 55-040 Kobierzyce</div>
                    <div class="shop-item"><span class="shop-city">Wrocław</span>Borek<br>ul. Hallera 52, 50-984 Wrocław</div>
                    <div class="shop-item"><span class="shop-city">Zabrze</span>Platan<br>pl. Teatralny 12, 41-800 Zabrze</div>
                    <div class="shop-item"><span class="shop-city">Zielona Góra</span>Focus<br>ul. Wrocławska 17, 65-427 Zielona Góra</div>
                    <div class="shop-item"><span class="shop-city">Łódź</span>Tulipan<br>ul. Piłsudskiego 94 , 92-202 Łódź</div>
                    <div class="shop-item"><span class="shop-city">Łódź</span>Manufaktura<br>ul. Karskiego 5, 91-071 Łódź</div>
                    <div class="shop-item"><span class="shop-city">Inowrocław</span>Czas na Herbatę<br>ul. Wojska Polskiego 16, 88-100 Inowrocław</div>
                    <div class="shop-item"><span class="shop-city">Toruń</span>Czas na Herbatę<br>ul. Władysława Broniewskiego 90, 87-100 Toruń</div>
                    <div class="shop-item"><span class="shop-city">Toruń</span>Czas na Herbatę<br>ul. Żółkiewskiego 15, 87-100 Toruń</div>
                    <div class="shop-item"><span class="shop-city">Toruń</span>Czas na Herbatę<br>ul. Olsztyńska 8, 87-100 Toruń</div>
                    <div class="shop-item"><span class="shop-city">Bydgoszcz</span>Czas na Herbatę<br>ul. Kruszwicka 1, 85-110 Bydgoszcz</div>
                    <div class="shop-item"><span class="shop-city">Marki</span>Czas na Herbatę<br>ul. Józefa Piłsudskiego 1, 05-270 Marki</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Czas na Herbatę<br>ul. Głębocka 15, 03-287 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Siedlce</span>Czas na Herbatę<br>ul. Józefa Piłsudskiego 74, 08-110 Siedlce</div>
                    <div class="shop-item"><span class="shop-city">Lublin</span>Czas na Herbatę<br>Aleja Spółdzielczości Pracy 88, 20-147 Lublin</div>
                    <div class="shop-item"><span class="shop-city">Zamość</span>Czas na Herbatę<br>ul. Przemysłowa 10, 22-400 Zamość</div>
                    <div class="shop-item"><span class="shop-city">Lublin</span>Czas na Herbatę<br>ul. Lipowa 13, 20-020 Lublin</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Czas na Herbatę<br>ul. Jubilerska 1/3, 04-190 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Wołomin</span>Czas na Herbatę<br>ul. Geodetów 2, 05-200 Wołomin</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Czas na Herbatę<br>ul. Targowa 72, 03-734 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Pruszków</span>Czas na Herbatę<br>ul. Sienkiewicza 19, 05-800 Pruszków</div>
                    <div class="shop-item"><span class="shop-city">Ząbki</span>Czas na Herbatę<br>ul. Powstańców 23, 05-091 Ząbki</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Czas na Herbatę<br>ul. Kazimierza Szpotańskiego 4, 04-760 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Piaseczno</span>Czas na Herbatę<br>ul. Puławska 46, 05-500 Piaseczno</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Czas na Herbatę<br>ul. Połczyńska 4, 01-258 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Czas na Herbatę<br>ul. Sławoja-Składkowskiego 4 lok.R32, 02-497 Warszawa</div>
                    <div class="shop-item"><span class="shop-city">Warszawa</span>Czas na Herbatę<br>ul. Powstańców Śląskich 126 lok. 14, 01-466 Warszawa</div>
                </div>

            </div>
        </div>

        {elseif $cms.id == 13}
        
        {literal}
        <style>
            #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
            .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }

            .cookies-custom-page {
                font-family: 'Garamond', 'Georgia', serif;
                color: #555;
                background: #fff;
                padding-bottom: 80px;
                width: 100%;
                font-size: 15px;
                line-height: 1.6;
            }

            .cookies-header-wrapper {
                max-width: 1140px;
                margin: 0 auto;
                padding: 40px 15px 20px 15px;
                border-bottom: 1px solid #f9a918;
                margin-bottom: 40px;
            }

            .cookies-header-wrapper h1 {
                font-family: 'Garamond', serif;
                font-size: 42px;
                color: #555;
                margin: 0;
                font-weight: normal;
                text-align: left;
            }

            .cookies-content {
                max-width: 1140px;
                margin: 0 auto;
                padding: 0 15px;
            }

            .cookies-title-center {
                text-align: center;
                display: block;
                margin-bottom: 30px;
                color: #333;
                font-weight: bold;
                text-transform: uppercase;
            }

            .cookies-section-header {
                font-weight: bold;
                margin-top: 30px;
                margin-bottom: 15px;
                color: #333;
                font-size: 16px;
                text-align: left;
            }

            .cookies-text {
                text-align: justify;
                margin-bottom: 15px;
            }

            ol.cookies-list {
                padding-left: 25px;
                margin: 0;
                text-align: justify;
            }

            ol.cookies-list li {
                margin-bottom: 10px;
            }

            ul.cookies-sublist {
                list-style-type: none;
                padding-left: 0; 
                margin-top: 5px;
                margin-bottom: 10px;
            }
            
            ul.cookies-sublist li {
                margin-bottom: 8px;
                padding-left: 20px;
                text-indent: -20px;
            }

            .cookie-type-block {
                margin-bottom: 20px;
            }
            
            .cookie-type-title {
                font-weight: bold;
                display: block;
                margin-bottom: 5px;
                color: #333;
            }

            .link-style {
                color: #5bc0de;
                text-decoration: none;
                word-break: break-all; 
            }
            .link-style:hover {
                text-decoration: underline;
            }
        </style>
        {/literal}

        <div class="cookies-custom-page">
            <div class="cookies-header-wrapper">
                <h1>Polityka cookies</h1>
            </div>

            <div class="cookies-content">
                
                <span class="cookies-title-center">Polityka plików cookies</span>

                <div class="cookies-text">
                    <strong>Co znajdziesz w tym dokumencie?</strong><br>
                    Zasady stosowania plików cookies i innych podobnych technologii oraz informacje o ochronie Twoich danych osobowych zgromadzonych za pośrednictwem plików cookies lub innej podobnej technologii.
                </div>

                <div class="cookies-section-header">§ 1   Administrator</div>
                <ol class="cookies-list">
                    <li>Administratorem Twoich danych osobowych jest PROGRESSIVE Sp. z o.o. z siedzibą we Wrocławiu, ul. Sosnowiecka 5, NIP 8992984184, REGON 527610437. W dalszej części Polityki prywatności piszemy o sobie w pierwszej osobie lub określamy się jako „Administrator”.</li>
                    <li>Możesz skontaktować się z nami:
                        <ul class="cookies-sublist">
                            <li>a. listownie: PROGRESSIVE Sp. z o.o. ul. Sosnowiecka 5, 52-008 Wrocław.</li>
                            <li>b. korzystając z formularza zgłoszeniowego na stronie <a href="https://czasnaherbate.net/kontakt" class="link-style">https://czasnaherbate.net/kontakt</a></li>
                        </ul>
                    </li>
                </ol>

                <div class="cookies-section-header">§ 2  Pojęcia używane w Polityce prywatności</div>
                <ol class="cookies-list">
                    <li>Jeżeli w dalszej części naszej Polityki prywatności zauważysz jedno z poniższych pojęć pisane wielką literą, to powinieneś je rozumieć zgodnie z poniższymi definicjami:
                        <ul class="cookies-sublist">
                            <li>a. <strong>„Serwis”</strong> – serwis internetowy, którego główna strona znajduje się pod adresem <a href="https://czasnaherbate.net" class="link-style">https://czasnaherbate.net</a>,</li>
                            <li>b. <strong>„Polityka”</strong> – oznacza niniejszy dokument, czyli politykę plików cookies, którą czytasz,</li>
                            <li>d. <strong>„RODO”</strong> – rozporządzenie Parlamentu Europejskiego i Rady (UE) 2016/679 z dnia 27 kwietnia 2016 r. w sprawie ochrony osób fizycznych w związku z przetwarzaniem danych osobowych i w sprawie swobodnego przepływu takich danych oraz uchylenia dyrektywy 95/46/WE. Tekst RODO znajdziesz tutaj.</li>
                            <li>e. <strong>Urządzenie</strong> - oznacza elektroniczne urządzenie, za pośrednictwem którego Użytkownik uzyskuje dostęp do Serwisu.</li>
                            <li>f. <strong>Użytkownik</strong> - oznacza podmiot, na rzecz którego, zgodnie z właściwym regulaminem i obowiązującymi przepisami prawa, mogą być świadczone usługi drogą elektroniczną lub, z którym zawarta może być Umowa o świadczenie takich usług.</li>
                            <li>g. <strong>Dane osobowe</strong> - oznaczają wszelkie informacje o zidentyfikowanej lub możliwej do zidentyfikowania osobie fizycznej ("osobie, której dane dotyczą"); możliwa do zidentyfikowania osoba fizyczna to osoba, którą można bezpośrednio lub pośrednio zidentyfikować, w szczególności na podstawie identyfikatora takiego jak imię i nazwisko, numer identyfikacyjny, dane o lokalizacji, identyfikator internetowy lub jeden bądź kilka szczególnych czynników określających fizyczną, fizjologiczną, genetyczną, psychiczną, ekonomiczną, kulturową lub społeczną tożsamość osoby fizycznej.</li>
                            <li>h. <strong>Profilowanie:</strong> dowolna forma zautomatyzowanego przetwarzania Danych osobowych, które polega na wykorzystaniu Danych osobowych do oceny niektórych czynników osobowych, w szczególności do analizy lub prognozy aspektów dotyczących efektów pracy Użytkownika Urządzenia, osobistych preferencji, zainteresowań, wiarygodności, zachowania, lokalizacji lub przemieszczania się.</li>
                            <li>i. <strong>Zautomatyzowane podejmowanie decyzji:</strong> zdolność do podejmowania decyzji z wykorzystaniem rozwiązań technicznych bez interwencji ludzkiej, ma inny zakres niż profilowanie, może jednak częściowo pokrywać się z profilowaniem lub z niego wynikać.</li>
                        </ul>
                    </li>
                    <li><strong>Pliki cookies</strong> to niewielkie informacje tekstowe, przechowywane na Twoim Urządzeniu końcowym (np. komputerze, tablecie, smartfonie). Pliki cookies mogą być odczytywane przez Serwis lub Aplikację.</li>
                    <li>Pod pojęciem plików cookies używanym w Polityce należy także rozumieć inne podobne technologie, które wykorzystujemy tj. mobilne identyfikatory reklamowe, piksele i tagi narzędzi reklamowych.</li>
                </ol>

                <div class="cookies-section-header">§ 3  Twoje prawa dotyczące danych osobowych</div>
                <ol class="cookies-list">
                    <li>Przetwarzamy Twoje dane osobowe, dlatego:
                        <ul class="cookies-sublist">
                            <li>a) masz prawo dostępu do Twoich danych osobowych,</li>
                            <li>b) możesz dokonywać ich sprostowania</li>
                            <li>c) możesz żądać usunięcia Twoich danych osobowych, gdy pozwala na to RODO,</li>
                            <li>d) możesz żądać usunięcia Twoich danych osobowych, gdy pozwala na to RODO</li>
                        </ul>
                    </li>
                </ol>

                <div class="cookies-section-header">§ 4  Zabezpieczenie danych osobowych i zagrożenia</div>
                <ol class="cookies-list">
                    <li>Stosujemy wymagane aktualnymi przepisami o ochronie danych osobowych środki techniczne zapobiegające pozyskiwaniu i modyfikowaniu przez osoby nieuprawnione Danych osobowych przesyłanych drogą elektroniczną, czyli w ramach naszego Serwisu i Aplikacji.</li>
                    <li>Zwracamy uwagę, że szczególnymi zagrożeniami związanymi z korzystaniem z takich serwisów, jak nasz są:
                        <ul class="cookies-sublist">
                            <li>a) złośliwe oprogramowanie (ang. <em>malware</em>),</li>
                            <li>b) programy szpiegujące (ang. <em>spyware</em>),</li>
                            <li>c) wyłudzanie informacji poprzez podszywanie się pod godne zaufania podmioty (tzw. <em>phishing</em>),</li>
                            <li>d) działania hakerów zmierzające do włamania się do systemów teleinformatycznych.</li>
                        </ul>
                    </li>
                </ol>

                <div class="cookies-section-header">§ 5 Czym są pliki cookies i po co je stosujemy</div>
                <div class="cookies-text">
                    W Serwisie stosujemy cookies.<br>
                    Wejście na stronę Serwisu wiąże się z przetwarzaniem przez nas informacji zawartych w plikach cookies, w tym zbieranych przez nie Danych osobowych, na opisanych poniżej zasadach.
                </div>

                <div class="cookie-type-block">
                    <span class="cookie-type-title">Funkcjonalne pliki cookie</span>
                    Funkcjonalne pliki cookie są bezwzględnie niezbędne do świadczenia usług sklepu, a także do jego prawidłowego działania, dlatego nie ma możliwości odmowy ich użycia. Umożliwiają one użytkownikowi poruszanie się po naszej stronie internetowej i korzystanie z różnych opcji lub usług, które na niej istnieją.
                </div>

                <div class="cookie-type-block">
                    <span class="cookie-type-title">Reklamowe pliki cookie</span>
                    To te, które zbierają informacje o reklamach wyświetlanych użytkownikom serwisu. Mogą być anonimowe, jeśli zbierają tylko informacje o wyświetlanych powierzchniach reklamowych bez identyfikacji użytkownika lub spersonalizowane, jeśli zbierają dane osobowe użytkownika sklepu przez osobę trzecią, w celu personalizacji wspomnianych powierzchni reklamowych.
                </div>

                <div class="cookie-type-block">
                    <span class="cookie-type-title">Analityczne pliki cookie</span>
                    Zbierają informacje o tym, jak użytkownik przegląda sklep, zwykle anonimowo, choć czasami pozwalają również na jednoznaczną identyfikację użytkownika w celu uzyskania raportów o zainteresowaniach użytkowników produktami lub usługami, które oferuje sklep.
                </div>

                <div class="cookie-type-block">
                    <span class="cookie-type-title">Wydajnościowe pliki cookie</span>
                    Służą one do usprawnienia przeglądania i optymalizacji działania sklepu.
                </div>

                <div class="cookie-type-block">
                    <span class="cookie-type-title">Inne pliki cookie</span>
                    Są to pliki cookie bez wyraźnego celu lub te, które wciąż klasyfikujemy.
                </div>

                <div class="cookies-section-header">§ 6  Jak usunąć pliki cookies</div>
                <ol class="cookies-list">
                    <li>Pliki cookies możesz usunąć po ich zapisaniu przez nas. W tym celu możesz skorzystać z: odpowiednich funkcji przeglądarki internetowej, programów służących w tym celu lub odpowiednich narzędzi dostępnych w ramach Twojego systemu operacyjnego.</li>
                    <li>Pod tymi linkami znajdziesz informacje o sposobach usunięcia cookies w najpopularniejszych przeglądarkach internetowych:<br><br>
                        Firefox: <a href="https://support.mozilla.org/pl/kb/usuwanie-ciasteczek-i-danych-stron-firefox" class="link-style" target="_blank">https://support.mozilla.org/pl/kb/usuwanie-ciasteczek-i-danych-stron-firefox</a><br>
                        Opera: <a href="http://help.opera.com/Linux/9.60/pl/cookies.html" class="link-style" target="_blank">http://help.opera.com/Linux/9.60/pl/cookies.html</a><br>
                        Edge: <a href="https://support.microsoft.com/pl-pl/microsoft-edge/usuwanie-plików-cookie-w-przeglądarce-microsoft-edge-63947406-40ac-c3b8-57b9-2a946a29ae09" class="link-style" target="_blank">https://support.microsoft.com/pl-pl/microsoft-edge/usuwanie-plików-cookie-w-przeglądarce-microsoft-edge-63947406-40ac-c3b8-57b9-2a946a29ae09</a><br>
                        Chrome: <a href="https://support.google.com/chrome/answer/95647?hl=pl" class="link-style" target="_blank">https://support.google.com/chrome/answer/95647?hl=pl</a><br>
                        Safari: <a href="http://support.apple.com/kb/HT1677?viewlocale=pl_PL" class="link-style" target="_blank">http://support.apple.com/kb/HT1677?viewlocale=pl_PL</a>
                    </li>
                </ol>

                <div class="cookies-section-header">§ 7  Jak blokować pliki cookies</div>
                <ol class="cookies-list">
                    <li>Możesz tak skonfigurować swoją przeglądarkę internetową, by uniemożliwiała przechowywanie plików cookies na Twoim komputerze, telefonie lub tablecie. Możesz także wykorzystać w tym celu odpowiednie rozszerzenia do przeglądarek lub programy, jak również dostarczane przez nas w Serwisie narzędzie do zarządzania zgodami.</li>
                    <li>Informacje o sposobie blokowania cookies w najpopularniejszych przeglądarkach internetowych znajdziesz pod tymi linkami:<br><br>
                        Firefox: <a href="https://support.mozilla.org/pl/kb/blokowanie-ciasteczek" class="link-style" target="_blank">https://support.mozilla.org/pl/kb/blokowanie-ciasteczek</a><br>
                        Opera: <a href="https://help.opera.com/pl/latest/web-preferences/" class="link-style" target="_blank">https://help.opera.com/pl/latest/web-preferences/</a>
                    </li>
                </ol>

            </div>
        </div>

        {elseif $cms.id == 14}
        
        {literal}
        <style>
            #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
            .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }

            .contest-custom-page {
                font-family: 'Garamond', 'Georgia', serif;
                color: #555;
                background: #fff;
                padding-bottom: 80px;
                width: 100%;
                font-size: 15px;
                line-height: 1.6;
            }

            .contest-header-wrapper {
                max-width: 1140px;
                margin: 0 auto;
                padding: 40px 15px 20px 15px;
                border-bottom: 1px solid #f9a918;
                margin-bottom: 40px;
            }

            .contest-header-wrapper h1 {
                font-family: 'Garamond', serif;
                font-size: 42px;
                color: #555;
                margin: 0;
                font-weight: normal;
                text-align: left;
            }

            .contest-content {
                max-width: 1140px;
                margin: 0 auto;
                padding: 0 15px;
            }

            .contest-section-header {
                font-weight: bold;
                margin-top: 35px;
                margin-bottom: 15px;
                color: #333;
                text-align: left;
                display: block;
            }

            .contest-text {
                text-align: justify;
                margin-bottom: 15px;
            }

            ul.contest-list {
                list-style-type: disc;
                padding-left: 25px;
                margin-bottom: 15px;
                text-align: justify;
            }

            ul.contest-list li {
                margin-bottom: 5px;
            }
            
            ul.contest-list-none {
                list-style-type: none;
                padding-left: 0;
                margin-bottom: 15px;
            }
            
            ul.contest-list-none li {
                margin-bottom: 5px;
            }

            .link-style {
                color: #5bc0de;
                text-decoration: none;
            }
            .link-style:hover {
                text-decoration: underline;
            }
        </style>
        {/literal}

        <div class="contest-custom-page">
            <div class="contest-header-wrapper">
                <h1>Regulamin Konkursu Dzień Nauczyciela</h1>
            </div>

            <div class="contest-content">
                
                <span class="contest-section-header">§1. Postanowienia ogólne</span>
                <div class="contest-text">
                    Organizatorem Konkursu, organizowanego pod nazwą „Dzień Nauczyciela” (dalej: „Konkurs”), jest Progressive sp. z o.o., z siedzibą ul. Sosnowiecka 5, 52-008 Wrocław, wpisana do Rejestru Przedsiębiorców przez Sąd Rejonowy dla Wrocławia-Fabrycznej, VI Wydział Gospodarczy Krajowego Rejestru Sądowego pod numerem KRS 0001080458, kapitał zakładowy: 100.000,00 zł, REGON 527610437, NIP 8992984184 (dalej „Organizator”).<br>
                    Konkurs jest organizowana na obszarze Rzeczypospolitej Polskiej. Konkurs wraz z okresem reklamacyjnym rozpoczyna się dnia 22.09.2025 r. i kończy dnia 11.11.2025 r. Zgłoszenia udziału w Konkursie przyjmowane są od dnia 22.09.2025 r. od godz. 9:00:00 do dnia 14.10.2025 r. do godz. 23:59:59 (czas polski). Wyniki Konkursu zostaną opublikowane w dniu 21.10.2025 r. na profilach Organizatora w serwisach Facebook i Instagram, a także na stronie internetowej Organizatora. Konkurs odbywa się zgodnie z postanowieniami niniejszego regulaminu (dalej „Regulamin”) oraz zgodnie z powszechnie obowiązującymi przepisami prawa. Konkurs nie jest w żaden sposób sponsorowany, wspierany ani administrowany przez serwisy Facebook/Instagram. Serwisy te są zwolnione z jakiejkolwiek odpowiedzialności wobec uczestników.
                </div>

                <span class="contest-section-header">§2. Warunki uczestnictwa w Konkursie</span>
                <div class="contest-text">
                    Uczestnikiem Konkursu może być każda osoba fizyczna, która najpóźniej w dniu rozpoczęcia Konkursu ukończyła 13 lat, a w przypadku osób nieposiadających pełnej zdolności do czynności prawnych – uzyskała zgodę przedstawiciela ustawowego na udział w Konkursie oraz jest zamieszkała na terenie Polski posiada aktywne konto w serwisach Facebook lub Instagram, (dalej „Uczestnik”). Za Uczestnika uznaje się tę samą osobę fizyczną, niezależnie od tego, czy bierze udział w Konkursie za pośrednictwem jednego czy kilku kont w serwisach Facebook lub Instagram. W przypadku stwierdzenia udziału tej samej osoby z różnych kont, wszystkie zgłoszenia traktowane są jako zgłoszenia jednego Uczestnika. W Konkursie nie mogą uczestniczyć: pracownicy lub przedstawiciele Organizatora, pracownicy podmiotów bezpośrednio zaangażowanych w przygotowanie lub przeprowadzenie Konkursu, w tym członkowie ich rodzin.<br>
                    Przez członków rodziny rozumie się wstępnych, zstępnych, rodzeństwo, małżonków, rodziców małżonków oraz osoby pozostające w stosunku przysposobienia. Udział w Konkursie jest dobrowolny i nieodpłatny. Warunkiem udziału w Konkursie jest dokonanie w salonie Organizatora lub w sklepie internetowym Organizatora zakupu o wartości co najmniej 79 zł brutto w okresie trwania Konkursu, tj. od dnia 22.09.2025 r. do dnia 14.10.2025 r., oraz zachowanie dowodu zakupu w postaci paragonu fiskalnego lub faktury wystawionej przez Organizatora.
                </div>

                <span class="contest-section-header">§3. Zasady udziału w Konkursie</span>
                <div class="contest-text">
                    Aby wziąć udział w Konkursie, Uczestnik powinien pod postem konkursowym zamieszczonym na profilu Organizatora w serwisie Facebook lub Instagram dodać komentarz zawierający cytat, wspomnienie lub mądrość nauczyciela oraz starać się zebrać jak najwięcej reakcji użytkowników. Przez „reakcje” rozumie się wszystkie dostępne w danym serwisie oznaczenia, takie jak polubienia, serduszka czy inne reakcje. Komentarz spełniający powyższe warunki stanowi zgłoszenie konkursowe (dalej: „Zgłoszenie konkursowe”). Uczestnik może dodać dowolną liczbę Zgłoszeń konkursowych, jednak reakcje przypisane do poszczególnych komentarzy nie sumują się – w rankingu brane jest pod uwagę wyłącznie Zgłoszenie konkursowe danego uczestnika z największą liczbą reakcji. Niezależnie od liczby Zgłoszeń konkursowych każdy uczestnik może otrzymać maksymalnie jedną nagrodę.<br>
                    Do wyniku w Konkursie uwzględnia się wyłącznie reakcje oddane do dnia zakończenia przyjmowania Zgłoszeń konkursowych, tj. do dnia 14.10. 2025 r. do godz. 23:59:59 (czas polski). Zgłoszenie Konkursowe (komentarz pod postem) musi być w języku polskim i nie może:
                </div>
                <ul class="contest-list">
                    <li>naruszać prawa lub dóbr osobistych osób trzecich (w tym praw autorskich), zawierać treści reklamowych podmiotów innych niż Organizator, spamu, wulgaryzmów, treści nienawistnych, obscenicznych, dyskryminacyjnych, pornograficznych, sprzecznych z prawem lub dobrymi obyczajami,</li>
                    <li>naruszać wizerunku lub dobrego imienia Organizatora. Organizator ma prawo usuwać/ukrywać komentarze naruszające Regulamin i wykluczać takie Zgłoszenia konkursowe.</li>
                </ul>

                <span class="contest-section-header">§4. Nagrody</span>
                <div class="contest-text">Nagrodami w Konkursie są:</div>
                <ul class="contest-list-none">
                    <li>Nagroda I stopnia: iPhone 16 o wartości 3399 zł brutto;</li>
                    <li>Nagroda II stopnia: Apple Watch o wartości 1799 zł brutto;</li>
                    <li>Nagroda III stopnia: AirPods 4 o wartości 569,70 zł brutto;</li>
                    <li>Nagroda IV stopnia – wyróżnienie – zestaw produktów Czas na Herbatę o wartości 450 zł brutto</li>
                    <li>Nagroda V stopnia – wyróżnienie – zestaw produktów Czas na Herbatę o wartości 450 zł brutto</li>
                    <li>Nagroda VI stopnia – wyróżnienie – zestaw produktów Czas na Herbatę o wartości 450 zł brutto</li>
                    <li>Nagroda VII stopnia – wyróżnienie – zestaw produktów Czas na Herbatę o wartości 450 zł brutto</li>
                </ul>
                <div class="contest-text">
                    (dalej: „Nagrody”).<br>
                    Nagrody w Konkursie podlegają opodatkowaniu zryczałtowanym podatkiem dochodowym od osób fizycznych w wysokości 10%, zgodnie z ustawą z dnia 26 lipca 1991 r. o podatku dochodowym od osób fizycznych. Do każdej nagrody rzeczowej doliczana jest dodatkowa nagroda pieniężna w wysokości 11,111% jej wartości brutto, przeznaczona na pokrycie zryczałtowanego podatku dochodowego od osób fizycznych w wysokości 10%. Dodatkowa nagroda pieniężna nie jest wydawana Zwycięzcy, lecz w całości przekazywana przez Organizatora do właściwego urzędu skarbowego tytułem należnego podatku.<br>
                    Organizator, jako płatnik podatku, pobierze i odprowadzi należny podatek do właściwego urzędu skarbowego. Zwycięzca zobowiązany jest do współpracy z Organizatorem w zakresie niezbędnym do prawidłowego wykonania obowiązków podatkowych. Łączna wartość puli nagród w Konkursie wynosi 7567,7 zł brutto.
                </div>

                <span class="contest-section-header">§5. Komisja Konkursowa</span>
                <div class="contest-text">
                    Organizator powołuje wewnętrzną Komisję konkursową (dalej „Komisja”), która sprawuje nadzór nad prawidłowością urządzania Konkursu. Komisja musi składać się przynajmniej trzech członków:
                </div>
                <ul class="contest-list">
                    <li>Przewodniczącego</li>
                    <li>Wiceprzewodniczącego;</li>
                    <li>Sekretarza.</li>
                </ul>
                <div class="contest-text">
                    Komisja zobowiązana jest do sporządzania pisemnych protokołów dokumentujących wszystkie działania związane z organizacją Konkursu, w tym przebiegu wyłonienia zwycięzców. Protokoły te muszą być podpisane przez co najmniej trzech członków Komisji.
                </div>

                <span class="contest-section-header">§6. Wyłanianie Zwycięzców i przyznawanie Nagród</span>
                <div class="contest-text">
                    Nagrody, o których mowa w §4 Regulaminu, zostaną przyznane Uczestnikom, których Zgłoszenia konkursowe uzyskają największą liczbę reakcji (takich jak polubienia, serduszka czy inne reakcje) do dnia 14.10.2025 r., do godz. 23:59:59 czasu polskiego. Reakcje do komentarzy będą zliczane odrębnie w serwisie Facebook i Instagram, a następnie zostanie sporządzony wspólny ranking Zgłoszeń konkursowych. Nagrody otrzymają autorzy 4 Zgłoszeń konkursowych najwyżej sklasyfikowanych w rankingu. W przypadku, gdy dwa lub więcej Zgłoszeń konkursowych uzyska identyczną liczbę reakcji, o kolejności w rankingu decyduje data i godzina ich publikacji – pierwszeństwo ma Zgłoszenie konkursowe opublikowane wcześniej. Każdy Uczestnik może otrzymać wyłącznie jedną Nagrodę. Jeżeli kilka Zgłoszeń tego samego Uczestnika uzyska miejsca premiowane Nagrodą (w tym na różnych platformach), do klasyfikacji brane jest wyłącznie Zgłoszenie konkursowe z najwyższą liczbą reakcji, a Nagroda przypada kolejnemu Uczestnikowi z listy rankingowej. Wyniki Konkursu zostaną ogłoszone w dniu 21 października 2025 r. na profilach Organizatora w serwisach Facebook i Instagram oraz na stronie internetowej Organizatora. Zwycięzcy są zobowiązani do skontaktowania się z Organizatorem i przekazania wymaganych danych w terminie 7 (siedmiu) dni kalendarzowych od dnia ogłoszenia wyników Konkursu. Brak kontaktu ze strony Zwycięzcy lub nieprzekazanie wymaganych danych w wyznaczonym terminie skutkuje utratą prawa do Nagrody. W takim przypadku Nagroda zostaje przyznana kolejnemu Uczestnikowi z listy rankingowej. Jeżeli kolejny Uczestnik również nie spełni warunków określonych w Regulaminie, Nagroda zostaje przyznana następnym Uczestnikom z listy rankingowej, zgodnie z kolejnością zajmowanych miejsc, aż do skutecznego przyznania Nagrody. W przypadku wyczerpania listy rankingowej, a braku spełnienia warunków przez Uczestników, nagroda pozostaje do dyspozycji Organizatora.
                </div>

                <span class="contest-section-header">§7. Wydanie Nagród</span>
                <div class="contest-text">
                    Nagrody w Konkursie zostaną wydane zgodnie z obowiązującymi przepisami prawa, w tym prawa podatkowego, o ile znajdą zastosowanie.<br>
                    Zwycięzcom nie przysługuje prawo wymiany Nagrody na inną, zastrzegania szczególnych właściwości Nagród ani wymiany na ekwiwalent pieniężny. Nie jest dopuszczalne przeniesienie prawa do Nagrody na osoby trzecie. Nagrody zostaną przekazane Zwycięzcom w sposób uzgodniony indywidualnie – osobiście w siedzibie Organizatora lub przesyłką pocztową/kurierską – zgodnie z danymi kontaktowymi podanymi przez Zwycięzcę. Warunkiem otrzymania Nagrody jest przestrzeganie przez Uczestnika postanowień Regulaminu. Organizator nie ponosi odpowiedzialności za brak możliwości przekazania Nagrody wynikający z przyczyn leżących po stronie Uczestnika, w szczególności z powodu podania nieprawdziwych lub nieaktualnych danych kontaktowych. W przypadku, gdy Nagroda nie zostanie odebrana przez Zwycięzcę w terminie 30 dni od poinformowania o wygranej, prawo do Nagrody wygasa, a Nagroda pozostaje do dyspozycji Organizatora.
                </div>

                <span class="contest-section-header">§8. Zapobieganie nadużyciom i weryfikacja Uczestników</span>
                <div class="contest-text">
                    Organizator zastrzega sobie prawo do weryfikacji autentyczności reakcji oddanych na zgłoszenia konkursowe oraz do odrzucenia zgłoszeń, w przypadku których istnieje uzasadnione podejrzenie wykorzystania niedozwolonych metod, w szczególności automatycznych narzędzi (tzw. botów), zakupu reakcji, korzystania z grup wymiany czy innych działań prowadzących do sztucznego zawyżania aktywności. W przypadku stwierdzenia nadużyć Zgłoszenie konkursowe Uczestnika może zostać unieważnione, a nagroda przyznana kolejnej osobie z listy rankingowej. W celu prawidłowej identyfikacji Uczestnika oraz umożliwienia kontaktu Organizator może zażądać od zwycięzcy potwierdzenia danych, w szczególności wskazania linku do profilu w serwisie Facebook lub Instagram oraz podania adresu e-mail lub numeru telefonu do korespondencji.
                </div>

                <span class="contest-section-header">§9. Postępowanie reklamacyjne</span>
                <div class="contest-text">
                    Każdy Uczestnik ma prawo zgłosić reklamację związaną z udziałem w Konkursie. Reklamacje związane z Konkursem można składać:
                </div>
                <ul class="contest-list">
                    <li>elektronicznie – na adres e-mail: marketing@herbata.net, z tytułem: „Reklamacja – Konkurs Dzień Nauczyciela”,</li>
                    <li>listownie – na adres pocztowy: Progressive sp. z o.o., ul. Sosnowiecka 5, 52-008 Wrocław, z dopiskiem „Reklamacja – Konkurs Dzień Nauczyciela”.</li>
                </ul>
                <div class="contest-text">Reklamacja powinna zawierać:</div>
                <ul class="contest-list">
                    <li>imię i nazwisko</li>
                    <li>nick (pseudonim) używany w serwisie Facebook lub Instagram</li>
                    <li>dane kontaktowe</li>
                    <li>opis zdarzenia oraz przyczynę reklamacji,</li>
                    <li>treść żądania.</li>
                </ul>
                <div class="contest-text">
                    Reklamacje można zgłaszać w terminie 7 dni od dnia ogłoszenia wyników Konkursu, tj. do dnia 28.10.2025 r. (włącznie). Reklamacje złożone po tym terminie nie będą rozpatrywane. Reklamacje rozpatrywane są przez Komisję, o której mowa w par. 5 Regulaminu. Organizator powiadomi uczestnika składającego reklamację o rozstrzygnięciu Komisji listem poleconym (dla reklamacji listownych) lub e-mailem (dla reklamacji elektronicznych) w terminie do 14 dni od daty otrzymania reklamacji. Złożenie reklamacji nie wyłącza prawa do dochodzenia roszczeń na drodze sądowej.
                </div>

                <span class="contest-section-header">§10. Prawa autorskie i wizerunek</span>
                <div class="contest-text">Zamieszczając komentarz (Zgłoszenie konkursowe), Uczestnik oświadcza, że:</div>
                <ul class="contest-list">
                    <li>posiada pełne prawa autorskie i prawa pokrewne do utworu w postaci komentarza,</li>
                    <li>treść komentarza nie narusza praw osób trzecich, w tym praw autorskich, dóbr osobistych ani innych praw chronionych prawem,</li>
                    <li>przejmuje pełną odpowiedzialność za ewentualne roszczenia osób trzecich wynikające z naruszenia wskazanych praw.</li>
                </ul>
                <div class="contest-text">
                    Uczestnik udziela Organizatorowi nieodpłatnej, niewyłącznej licencji, obejmującej prawo do korzystania z komentarza w celach związanych z Konkursem, jego promocją oraz ogłoszeniem wyników, w szczególności poprzez:
                </div>
                <ul class="contest-list">
                    <li>utrwalanie i zwielokrotnianie dowolną techniką,</li>
                    <li>publikację w serwisach społecznościowych Organizatora,</li>
                    <li>zamieszczanie na stronie internetowej Organizatora oraz w materiałach informacyjnych i promocyjnych dotyczących Konkursu,</li>
                    <li>publiczne wyświetlanie i udostępnianie w taki sposób, aby każdy mógł mieć do niego dostęp w miejscu i czasie przez siebie wybranym (np. w Internecie).</li>
                </ul>
                <div class="contest-text">
                    Licencja zostaje udzielona na okres trwania Konkursu oraz rozliczenia jego wyników, a także na okres przedawnienia ewentualnych roszczeń związanych z Konkursem, na terytorium całego świata. Zwycięzcy Konkursu mogą zostać poproszeni o wyrażenie odrębnej, dobrowolnej zgody na wykorzystanie ich imienia, nazwiska lub pseudonimu (nicka) oraz wizerunku w materiałach informacyjnych i promocyjnych związanych z Konkursem. Brak zgody nie wpływa na przyznanie nagrody, może jednak ograniczyć zakres publikacji informacji o wynikach Konkursu. Organizator nie będzie wykorzystywał komentarzy ani wizerunku Uczestników w celach komercyjnych niezwiązanych z Konkursem bez uzyskania odrębnej zgody Uczestnika.
                </div>

                <span class="contest-section-header">§11. Przetwarzanie danych osobowych (RODO)</span>
                <div class="contest-text">
                    Administratorem danych osobowych Uczestników jest Progressive sp. z o.o., z siedzibą ul. Sosnowiecka 5, 52-008 Wrocław, KRS 0001080458, REGON 527610437, NIP 8992984184. Dane osobowe Uczestników i Zwycięzców Konkursu są przetwarzane zgodnie z Rozporządzeniem Parlamentu Europejskiego i Rady (UE) 2016/679 z dnia 27.04.2016 r. (RODO), ustawą z dnia 10.05.2018 r. o ochronie danych osobowych (Dz.U. z 2019 r., poz. 1781), a także ustawą z dnia 26.07.1991 r. o podatku dochodowym od osób fizycznych (Dz.U. z 2022 r., poz. 2647 z późn. zm.).<br>
                    Dane osobowe przetwarzane są w następujących celach:
                </div>
                <ul class="contest-list">
                    <li>udzielenie odpowiedzi na pytania zadane za pośrednictwem formularza kontaktowego – na podstawie art. 6 ust. 1 lit. f) RODO (prawnie uzasadniony interes administratora), wykonanie obowiązków wynikających z niniejszego Regulaminu, w tym przeprowadzenie Konkursu, wyłonienie zwycięzców, wydanie nagród, rozpatrywanie reklamacji – na podstawie art. 6 ust. 1 lit. b) i c) RODO,</li>
                    <li>realizacja obowiązków podatkowych związanych z przyznaniem nagród – na podstawie art. 6 ust. 1 lit. c) RODO,</li>
                    <li>dochodzenie i obrona przed roszczeniami – na podstawie art. 6 ust. 1 lit. f) RODO.</li>
                </ul>
                <div class="contest-text">
                    W zakresie, w jakim przetwarzanie odbywa się na podstawie art. 6 ust. 1 lit. f) RODO, prawnie uzasadnionym interesem administratora jest zabezpieczenie roszczeń oraz ochrona przed ewentualnymi roszczeniami uczestników, zwycięzców lub osób trzecich, w tym w ramach procedury reklamacyjnej.<br>
                    Dane osobowe mogą być udostępniane następującym kategoriom odbiorców:
                </div>
                <ul class="contest-list">
                    <li>pracownikom administratora oraz osobom działającym z jego upoważnienia,</li>
                    <li>podmiotom przetwarzającym dane w imieniu administratora, na podstawie umów powierzenia (np. firmom kurierskim, kancelariom prawnym, biurom rachunkowym, podmiotom IT),</li>
                    <li>uprawnionym organom publicznym – w przypadkach przewidzianych przepisami prawa.</li>
                </ul>
                <div class="contest-text">
                    Dane osobowe Uczestników i Zwycięzców nie są przekazywane poza Europejski Obszar Gospodarczy ani do organizacji międzynarodowych.<br>
                    Okres przechowywania danych:
                </div>
                <ul class="contest-list">
                    <li>dane przetwarzane w celu realizacji Regulaminu (w tym reklamacje, kontakt) – do czasu przedawnienia roszczeń, nie dłużej niż 6 miesięcy od zakończenia Konkursu,</li>
                    <li>dane przetwarzane w celu wypełnienia obowiązków podatkowych/księgowych – przez okres wymagany przepisami prawa (co do zasady 6 lat),</li>
                    <li>dane przetwarzane na podstawie uzasadnionego interesu administratora – do czasu skutecznego wniesienia sprzeciwu lub przedawnienia roszczeń,</li>
                    <li>dane przetwarzane na podstawie zgody – od jej udzielenia do czasu cofnięcia zgody, nie dłużej jednak niż 6 miesięcy od zakończenia Konkursu.</li>
                </ul>
                <div class="contest-text">
                    Administrator przestrzega zasad określonych w art. 5 RODO, w szczególności zasady legalności, ograniczenia celu, minimalizacji danych i ograniczenia czasu przechowywania.<br><br>
                    Uczestnikowi lub Zwycięzcy przysługuje prawo do:
                </div>
                <ul class="contest-list">
                    <li>dostępu do danych osobowych,</li>
                    <li>sprostowania danych,</li>
                    <li>usunięcia danych,</li>
                    <li>ograniczenia przetwarzania,</li>
                    <li>przenoszenia danych,</li>
                    <li>wniesienia sprzeciwu wobec przetwarzania – zgodnie z art. 15–21 RODO.</li>
                </ul>
                <div class="contest-text">
                    Jeżeli dane są przetwarzane na podstawie zgody, osoba, której dane dotyczą, ma prawo cofnięcia zgody w dowolnym momencie, bez wpływu na zgodność z prawem przetwarzania przed jej wycofaniem (art. 7 ust. 3 RODO). Każdemu uczestnikowi przysługuje prawo wniesienia skargi do organu nadzorczego – Prezesa Urzędu Ochrony Danych Osobowych.
                </div>

                <span class="contest-section-header">§12. Odpowiedzialność Organizatora</span>
                <div class="contest-text">
                    Organizator ponosi odpowiedzialność za prawidłowe przeprowadzenie Konkursu w zakresie określonym niniejszym Regulaminem. Organizator nie ponosi odpowiedzialności w szczególności za:
                </div>
                <ul class="contest-list">
                    <li>przerwy w funkcjonowaniu, ograniczenia dostępności lub awarie serwisów społecznościowych Facebook lub Instagram wykorzystywanych do przeprowadzenia Konkursu,</li>
                    <li>działania uczestników sprzeczne z postanowieniami Regulaminu lub obowiązującymi przepisami prawa,</li>
                    <li>treści publikowane przez Uczestników w ramach Zgłoszeń Konkursowych.</li>
                    <li>skutki podania przez uczestników nieprawdziwych, niepełnych lub nieaktualnych danych kontaktowych,</li>
                    <li>opóźnienia bądź brak doręczenia nagród wynikające z przyczyn leżących po stronie operatorów pocztowych, firm kurierskich lub innych podmiotów odpowiedzialnych za ich dostarczenie,</li>
                    <li>zdarzenia losowe pozostające poza kontrolą Organizatora, które uniemożliwiają prawidłową realizację Konkursu.</li>
                </ul>
                <div class="contest-text">
                    Organizator nie odpowiada za nieprawidłowe działanie urządzeń, systemów teleinformatycznych lub oprogramowania wykorzystywanego przez uczestników w celu wzięcia udziału w Konkursie.
                </div>

                <span class="contest-section-header">§13. Postanowienia końcowe</span>
                <div class="contest-text">
                    W kwestiach nieuregulowanych niniejszym Regulaminem stosuje się przepisy prawa polskiego, w szczególności Kodeksu cywilnego, ustawy o prawach konsumenta oraz przepisy o ochronie danych osobowych (RODO). Organizator może zmienić Regulamin z ważnych przyczyn, o ile nie naruszy to praw nabytych Uczestników. Informacja o zmianach zostanie opublikowana w tym samym miejscu co Regulamin. Regulamin dostępny jest przez cały czas trwania Konkursu w siedzibie Organizatora oraz na stronie internetowej Organizatora herbata.net. Konkurs oraz ewentualne spory z nim związane będą rozstrzygane przez sąd powszechny właściwy dla siedziby Organizatora.
                </div>

            </div>
        </div>

        {elseif $cms.id == 15}
        
        {literal}
        <style>
            #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
            .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }

            .results-custom-page {
                font-family: 'Garamond', 'Georgia', serif;
                color: #555;
                background: #fff;
                padding-bottom: 80px;
                width: 100%;
                font-size: 15px;
                line-height: 1.6;
            }

            .results-header-wrapper {
                max-width: 1140px;
                margin: 0 auto;
                padding: 40px 15px 20px 15px;
                border-bottom: 1px solid #f9a918;
                margin-bottom: 40px;
            }

            .results-header-wrapper h1 {
                font-family: 'Garamond', serif;
                font-size: 42px;
                color: #555;
                margin: 0;
                font-weight: normal;
                text-align: left;
            }

            .results-content {
                max-width: 1140px;
                margin: 0 auto;
                padding: 0 15px;
            }

            .results-sub-header {
                font-weight: bold;
                text-transform: uppercase;
                margin-bottom: 20px;
                display: block;
                color: #333;
            }

            .results-text {
                text-align: justify;
                margin-bottom: 20px;
            }

            .winners-section {
                margin-bottom: 30px;
            }

            .winners-title {
                font-weight: bold;
                display: block;
                margin-bottom: 5px;
            }

            ul.simple-list {
                list-style-type: none;
                padding-left: 0;
                margin-bottom: 20px;
            }

            ul.simple-list li {
                margin-bottom: 5px;
            }

            ul.bullet-list {
                list-style-type: disc;
                padding-left: 20px;
                margin-bottom: 20px;
            }

            ul.check-list {
                list-style-type: none;
                padding-left: 0;
                margin-bottom: 20px;
            }

            ul.check-list li {
                margin-bottom: 5px;
                position: relative;
                padding-left: 25px;
            }

            .green-check {
                color: #4CAF50;
                font-weight: bold;
                position: absolute;
                left: 0;
                top: 0;
            }

            .warning-text {
                font-weight: bold;
                color: #000;
                margin-top: 20px;
                margin-bottom: 10px;
                display: block;
            }

            .link-style {
                color: #5bc0de;
                text-decoration: none;
            }
        </style>
        {/literal}

        <div class="results-custom-page">
            <div class="results-header-wrapper">
                <h1>Rozstrzygnięcie konkursu - Dzień Nauczyciela</h1>
            </div>

            <div class="results-content">
                
                <span class="results-sub-header">ZAKOŃCZENIE KONKURSU „DZIEŃ NAUCZYCIELA”</span>

                <div class="results-text">
                    Dziękujemy wszystkim za udział w naszym konkursie z okazji Dnia Nauczyciela! Było nam niezmiernie miło czytać Wasze wspomnienia, cytaty i mądrości, którymi dzieliliście się w komentarzach. Wasze zaangażowanie przerosło nasze oczekiwania! Zgodnie z Regulaminem, konkurs został zakończony 14 października 2025 r., a dziś – 21 października 2025 r. – ogłaszamy wyniki!
                </div>

                <div class="winners-section">
                    <span class="winners-title">Zwycięzcy konkursu:</span>
                    <ul class="simple-list">
                        <li>I miejsce – iPhone 16: @mw99pl</li>
                        <li>II miejsce – Apple Watch: Przemysław Chanas</li>
                        <li>III miejsce – AirPods 4: Izabela Janczak</li>
                    </ul>
                </div>

                <div class="winners-section">
                    <span class="winners-title">Wyróżnienia – zestawy produktowe „Czas na Herbatę” (4x):</span>
                    <ul class="bullet-list">
                        <li>Danuta Szewczyk</li>
                        <li>@orientacyjnie</li>
                        <li>@asia_aus_posen</li>
                        <li>Joanna Osman</li>
                    </ul>
                </div>

                <div class="results-text">
                    Zwycięzców prosimy o kontakt z Organizatorem w wiadomości prywatnej (Facebook, Instagram) lub mailowo na adres: marketing@herbata.net – <strong>w terminie 7 dni od dziś, tj. do 28 października 2025 r.</strong>
                </div>

                <div class="results-text">
                    W wiadomości należy przesłać:
                </div>
                <ul class="check-list">
                    <li><span class="green-check">✔</span> dane kontaktowe (imię, nazwisko, adres, nr telefonu),</li>
                    <li><span class="green-check">✔</span> paragon lub fakturę potwierdzającą zakup za min. 79 zł w salonie stacjonarnym „Czas na Herbatę” lub sklepie internetowym, dokonany w okresie trwania promocji – od 22.09 do 14.10.2025 r.</li>
                </ul>

                <span class="warning-text">Brak kontaktu w wymaganym terminie skutkuje utratą prawa do nagrody, zgodnie z Regulaminem.</span>
                
                <div class="results-text">
                    Jeszcze raz dziękujemy za wspólną zabawę – do zobaczenia w kolejnych akcjach!<br><br>
                    Zespół Czas na Herbatę & Progressive sp. z o.o.
                </div>

            </div>
        </div>

    {else}
        {$cms.content nofilter}
    {/if}
    
  </section>
{/block}