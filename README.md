https://czasnaherbate.net/ - Sklep Internetowy Prestashop.

Projekt realizowany w ramach zajęć z przedmiotu Biznes elektroniczny.

Celem projektu jest praktyczne zastosowanie narzędzi Open Source (Docker, Git, Selenium) do wdrożenia, konfiguracji oraz dostosowania sklepu internetowego Prestashop 1.7.8.

1. Wymagania Projektu.

Wszystkie wymagania obowiązkowe zostały spełnione.

Repozytorium: założone zgodnie z wytycznymi (Issues, PR/MR, .gitignore, README.md).

Środowisko: zbudowane z wykorzystaniem konteneryzacji (Docker/Docker Compose).

Dane: zeskanowano i zaimportowano produkty ze sklepu źródłowego https://czasnaherbate.net/.

Testy: przygotowano zestaw automatycznych testów Selenium.

2. Wykorzystane Technologie i Wersje

Skorzystaliśmy z Prestashop 1.7.8 do rozwiązania bazowego projektu.

Repozytorium - GitHub repozytorium do zarządzania kodem źródłowym i organizacji pracy (Issues, PR/MR).

Wirtualizacja - Docker do konteneryzacji środowiska deweloperskiego.

Baza Danych - MariaDB 12.1.2, uruchomiona w kontenerze mariadb.

Testy UI - Selenium. Skrypt automatyzujący proces zakupowy i testujący podstawowe działania strony internetowej.

3. Uruchomienie Środowiska Deweloperskiego

Projekt jest zoptymalizowany pod kątem pracy w konteneryzacji.

A. Wymagania wstępne

-Zainstalowany Docker Desktop.

-Zainstalowany Git.

-(Zalecane) Korzystanie z Visual Studio Code oraz rozszerzenia Remote - WSL (w przypadku pracy na Windows).

B. Instrukcja uruchomienia
1. Klonowanie Repozytorium: Sklonuj projekt i przejdź do katalogu głównego.

git clone https://github.com/peachwat/business.git,

cd business

2. Uruchomienie Kontenerów:

Użyj pliku docker-compose.yml do uruchomienia wszystkich wymaganych usług.

docker-compose up -d

3. Adresy Dostępu:

Sklep: http://localhost:8080;

Panel Admina: http://localhost:8080/admin532eej0yx;

phpMyAdmin: http://localhost:8081.

4. Foldery i Skrypty

Repozytorium jest podzielone zgodnie z wymogami projektu:

-kody źródłowe sklepu/: Główny kod Prestashop.

-kody źródłowe testów automatycznych/: Zawiera skrypty testowe Selenium.

-kody źródłowe narzędzia do scrapowania/: Zawiera skrypt do pobierania danych produktów.

-rezultat scrappowania/: Zawiera pliki UTF-8 z danymi produktów (kategorie, nazwy, ceny, opisy).

-pliki konfiguracyjne i skrypty wykorzystywane w procesie instalacji/wdrożenia/: Zawiera docker-compose.yml, skrypty instalacyjne oraz eksport ustawień sklepu.

5. Skład Zespołu

Evelina Rylova - 201303;

Artem Ulianych - 196803;

Mikita Kasiak - 201342;
