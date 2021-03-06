
  CREATE VIEW wycieczki_osoby
    AS
      SELECT w.id_wycieczki, w.kraj, w.data, w.nazwa, o.imie, o.nazwisko, r.status
      FROM wycieczki w
             JOIN rezerwacje r ON w.id_wycieczki = r.id_wycieczki
             JOIN osoby o ON r.id_osoby = o.id_osoby;

  CREATE VIEW wycieczki_osoby_potwierdzone
    AS
      SELECT w.id_wycieczki, w.kraj, w.data, w.nazwa, o.imie, o.nazwisko, r.status
      FROM wycieczki w
             JOIN rezerwacje r ON w.id_wycieczki = r.id_wycieczki
             JOIN osoby o ON r.id_osoby = o.id_osoby
      WHERE r.status = 'Z'
         OR r.status = 'P';

  CREATE VIEW wycieczki_przyszle
    AS
      SELECT w.kraj, w.data, w.nazwa, o.imie, o.nazwisko, r.status
      FROM wycieczki w
             LEFT JOIN rezerwacje r ON w.id_wycieczki = r.id_wycieczki
             LEFT JOIN osoby o ON r.id_osoby = o.id_osoby
      WHERE w.data > TRUNC(SYSDATE);

  CREATE VIEW wycieczki_miejsca
    AS
      SELECT w.id_wycieczki,
             w.kraj,
             w.data,
             w.nazwa,
             w.liczba_miejsc,
             w.liczba_miejsc - (SELECT count(*) FROM rezerwacje r WHERE r.id_wycieczki = w.id_wycieczki
                                                                    AND r.status != 'A') AS liczba_wolnych_miejsc
      FROM wycieczki w;

  CREATE VIEW dostepne_wycieczki
    AS
      SELECT *
      FROM (SELECT w.id_wycieczki,
                   w.kraj,
                   w.data,
                   w.nazwa,
                   w.liczba_miejsc,
                   w.liczba_miejsc - (SELECT count(*) FROM rezerwacje r WHERE r.id_wycieczki = w.id_wycieczki
                                                                          AND r.status != 'A') AS liczba_wolnych_miejsc
            FROM wycieczki w
            WHERE w.data > SYSDATE)
      WHERE liczba_wolnych_miejsc > 0;

  CREATE VIEW rezerwacje_do_anulowania
    AS
      SELECT r.nr_rezerwacji, r.id_wycieczki, r.id_osoby, w.nazwa AS nazwa_wycieczki, w.kraj, w.data
      FROM rezerwacje r
             JOIN wycieczki w ON r.id_wycieczki = w.id_wycieczki
      WHERE r.status = 'N'
        AND w.data BETWEEN TRUNC(SYSDATE) AND TRUNC(SYSDATE) + 7;


  --------
  CREATE VIEW wycieczki_miejsca2
    AS
      SELECT w.id_wycieczki, w.kraj, w.data, w.nazwa, w.liczba_miejsc, w.liczba_wolnych_miejsc
      FROM wycieczki2 w;

  CREATE OR REPLACE VIEW dostepne_wycieczki2
    AS
      SELECT *
      FROM (SELECT w.id_wycieczki, w.kraj, w.data, w.nazwa, w.liczba_miejsc, w.liczba_wolnych_miejsc
            FROM wycieczki2 w
            WHERE w.data > SYSDATE)
      WHERE liczba_wolnych_miejsc > 0;




