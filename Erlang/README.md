# Pollution

Utwórz nowy moduł o nazwie _pollution_, który będzie zbierał i przetwarzał dane ze stacji mierzących jakość powietrza. Moduł powinien przechowywać:



* informacje o stacjach pomiarowych,

  * współrzędne geograficzne,

  * nazwy stacji pomiarowych,

* zmierzone wartości pomiarów, np stężenia pyłów PM10, PM2.5 czy wartości temperatury (wraz z datą i godziną pomiaru).



Nie powinno byc możliwe:



* dodanie dwóch stacji pomiarowych o tej samej nazwie lub tych samych współrzędnych;

* dodanie dwóch pomiarów o tych samych:

  * współrzędnych,

  * dacie i godzinie,

  * typie (PM10, PM2.5, temperatura, …);

* dodanie pomiaru do nieistniejącej stacji.



Zaprojektuj strukturę danych dla przechowywania takich informacji (jest przynajmniej kilka dobrych rozwiązań tego problemu).



Zaimplementuj funkcje w module _pollution_:


* _createMonitor/0_ - tworzy i zwraca nowy monitor zanieczyszczeń;

* _addStation/3_ - dodaje do monitora wpis o nowej stacji pomiarowej (nazwa i współrzędne geograficzne), zwraca zaktualizowany monitor;

* _addValue/5_ - dodaje odczyt ze stacji (współrzędne geograficzne lub nazwa stacji, data, typ pomiaru, wartość), zwraca zaktualizowany monitor;

* _removeValue/4_ - usuwa odczyt ze stacji (współrzędne geograficzne lub nazwa stacji, data, typ pomiaru), zwraca zaktualizowany monitor;

* _getOneValue/4_ - zwraca wartość pomiaru o zadanym typie, z zadanej daty i stacji;

* _getStationMean/3_ - zwraca średnią wartość parametru danego typu z zadanej stacji;

* _getDailyMean/3_ - zwraca średnią wartość parametru danego typu, danego dnia na wszystkich stacjach;



W funkcjach używaj następujących typów i formatów danych:


* do przechowywania dat użyj struktur z modułu calendar (zob. calendar:local_time(). ),

* współrzędne geograficzne to para (krotka) liczb,

* nazwy, typy to ciągi znaków.



Dodaj do modułu _pollution_ funkcję _getDailyAverageDataCount/2_, która zwraca średnią dzienną liczbę odczytów przypadających na jedną stację.

Napisz testy do modułu _pollution_ z wykorzystaniem EUnit.
