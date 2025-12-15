{extends file='page.tpl'}

{block name='page_content_container'}
  <section id="content" class="page-content page-stores">

    {literal}
    <style>
        #wrapper, #content-wrapper { padding-top: 0 !important; margin-top:0 !important;}
        .container { max-width: 100% !important; padding: 0 !important; width: 100% !important; }

        .stores-custom-page {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #555;
            background: #fff;
        }

        .stores-parallax-banner {
            background-image: url('../themes/czasnaherbate/assets/img/salon-CnH-2020.jpg'); 
            
            background-attachment: fixed;
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            
            height: 450px; 
            width: 100vw;
            margin-left: calc(-50vw + 50%); 
            
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            margin-bottom: 60px;
        }
        
        .stores-parallax-banner::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(0,0,0,0.3); 
        }

        .stores-parallax-banner h1 {
            position: relative;
            color: #fff;
            font-size: 52px;
            font-family: 'Garamond', 'Georgia', serif;
            font-weight: 700;
            text-shadow: 0 2px 5px rgba(0,0,0,0.5);
            z-index: 2;
            margin: 0;
        }

        .stores-content-width {
            max-width: 1140px;
            margin: 0 auto;
            padding: 0 15px 80px 15px;
        }

        h2.gold-title {
            color: #f9a918; 
            font-size: 36px;
            font-family: 'Garamond', 'Georgia', serif;
            margin-bottom: 20px;
            font-weight: normal;
            margin-top: 0;
            text-align: left;
            padding-bottom: 15px;
            border-bottom: 1px solid #eaeaea;
        }

        .intro-text {
            font-size: 13px;
            line-height: 1.8;
            color: #4a4a4a;
            margin-bottom: 50px;
            text-align: left;
        }

        .map-section {
            display: flex;
            flex-wrap: nowrap;
            gap: 40px;
            align-items: flex-start;
            justify-content: flex-start;
        }

        .map-container {
            width: 500px;
            flex-shrink: 0;
        }

        .map-image-png {
            width: 100%;
            height: auto;
            display: block;
        }

        .list-container {
            flex-grow: 1;
            padding-top: 10px;
        }

        .list-header {
            font-family: 'Garamond', serif;
            font-size: 16px;
            font-weight: bold;
            color: #381b15;
            margin-bottom: 20px;
            border-bottom: 1px solid #eaeaea;
            padding-bottom: 10px;
            display: block;
            width: 100%;
        }

        .voivodeships-columns {
            display: flex;
            gap: 40px;
        }

        .v-col {
            min-width: 150px;
        }

        .v-col ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .v-col li {
            margin-bottom: 12px;
        }

        .v-col li a {
            font-size: 13px;
            color: #555;
            text-decoration: none;
            transition: color 0.2s;
        }

        .v-col li a:hover {
            color: #f9a918;
            font-weight: bold;
        }

        @media (max-width: 992px) {
             .map-section { flex-direction: column; align-items: center; }
             .map-container { width: 100%; max-width: 500px; }
             .stores-parallax-banner h1 { font-size: 36px; }
             .stores-parallax-banner { margin-left: 0; width: 100%; }
        }
    </style>
    {/literal}

    <div class="stores-custom-page">
        
        <div class="stores-parallax-banner">
            <h1>Salony</h1>
        </div>

        <div class="stores-content-width">
            
            <h2 class="gold-title">Odszukaj najbliższy sklep</h2>
            <div class="intro-text">
                <p>Nasze salony odnajdziesz na terenie całej Polski, zatem nie czekaj i <strong>Znajdź swój Czas na Herbatę</strong>.</p>
                <p>Jeśli jednak nasz punkt nie jest w pobliżu Twojej lokalizacji, zapraszamy do odwiedzenia naszego sklepu internetowego www.czasnaherbate.net</p>
            </div>

            <div class="map-section">
                
                <div class="map-container">
                    <img src="{$urls.theme_assets}img/pl-02.png" alt="Mapa Salonów" class="map-image-png">
                </div>

                <div class="list-container">
                    <span class="list-header">Województwa</span>
                    
                    <div class="voivodeships-columns">
                        <div class="v-col">
                            <ul>
                                <li><a href="#">dolnośląskie</a></li>
                                <li><a href="#">łódzkie</a></li>
                                <li><a href="#">lubuskie</a></li>
                                <li><a href="#">mazowieckie</a></li>
                                <li><a href="#">podkarpackie</a></li>
                                <li><a href="#">pomorskie</a></li>
                                <li><a href="#">świętokrzyskie</a></li>
                                <li><a href="#">wielkopolskie</a></li>
                            </ul>
                        </div>
                        
                        <div class="v-col">
                            <ul>
                                <li><a href="#">kujawsko-pomorskie</a></li>
                                <li><a href="#">lubelskie</a></li>
                                <li><a href="#">małopolskie</a></li>
                                <li><a href="#">opolskie</a></li>
                                <li><a href="#">podlaskie</a></li>
                                <li><a href="#">śląskie</a></li>
                                <li><a href="#">warmińsko-mazurskie</a></li>
                                <li><a href="#">zachodniopomorskie</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
  </section>
{/block}