
  CREATE OR REPLACE PROCEDURE dodaj_rezerwacje
    (pv_id_wycieczki IN INT,
     pv_id_osoby     IN INT)
  IS
    check1                      NUMBER; --1 GDY, TAKA WYCIECZKA ISTNIEJE, JESZCZE SIE NIE ODBYLA
                                        -- ORAZ SA JESZCZE WOLNE MIEJSCA
    check2                      NUMBER; --1 GDY TAKA OSOBA ISTNIEJE
    v_numer_rezerwacji          NUMBER;
    v_exc_niepoprawna_wycieczka VARCHAR2(4000) := 'Exception: wycieczka jest niepoprawna';
    v_exc_brak_osoby            VARCHAR2(4000) := 'Exception: osoba o tym id nie istnieje';
    BEGIN

      SELECT count(*)
          INTO check1
      FROM wycieczki_miejsca w
      WHERE w.id_wycieczki = pv_id_wycieczki
        AND w.data > TRUNC(SYSDATE)
        AND w.liczba_wolnych_miejsc > 0;

      IF check1 = 0
      THEN
        RAISE_APPLICATION_ERROR(-20001, v_exc_niepoprawna_wycieczka);
      END IF;

      SELECT count(*)
          INTO check2 FROM osoby o WHERE o.id_osoby = pv_id_osoby;

      IF check2 = 0
      THEN
        RAISE_APPLICATION_ERROR(-20002, v_exc_brak_osoby);
      END IF;
      ------------------------------


      INSERT INTO rezerwacje (id_wycieczki, id_osoby, status)
      VALUES (pv_id_wycieczki, pv_id_osoby, 'N')
          RETURNING nr_rezerwacji INTO v_numer_rezerwacji;

      INSERT INTO rezerwacje_log (nr_rezerwacji, data, status) VALUES (v_numer_rezerwacji, SYSDATE, 'N');
      COMMIT;
    END;

------------------------------------------------------------------------------------------------------------------------

  CREATE OR REPLACE PROCEDURE zmien_liczbe_miejsc
    (pv_id_wycieczki       IN INT,
     pv_nowa_liczba_miejsc IN INT)
  IS
    check1                      NUMBER; --czy wycieczka o podanym ID istnieje?
    check2                      NUMBER; --czy zapisalo sie na wycieczke mniej osob, niz nasz nowy limit miejsc?
    v_exc_niepoprawna_wycieczka VARCHAR2(4000) := 'Exception: wycieczka jest niepoprawna';
    v_exc_za_duzo_miejsc        VARCHAR2(4000) := 'Exception: zarezerwowano za duzo miejsc';
    BEGIN

      SELECT COUNT(*)
          INTO check1 FROM wycieczki w WHERE w.id_wycieczki = pv_id_wycieczki;

      IF check1 = 0
      THEN
        RAISE_APPLICATION_ERROR(-20001, v_exc_niepoprawna_wycieczka);
      END IF;

      SELECT COUNT(*)
          INTO check2
      FROM wycieczki_miejsca wm
      WHERE wm.id_wycieczki = pv_id_wycieczki
        AND wm.liczba_miejsc - wm.liczba_wolnych_miejsc < pv_nowa_liczba_miejsc;

      IF check2 = 0
      THEN
        RAISE_APPLICATION_ERROR(-20003, v_exc_za_duzo_miejsc);
      END IF;


      UPDATE wycieczki SET liczba_miejsc = pv_nowa_liczba_miejsc WHERE id_wycieczki = pv_id_wycieczki;
      COMMIT;
    END;


------------------------------------------------------------------------------------------------------------------------

  CREATE OR REPLACE PROCEDURE zmien_status_rezerwacji
    (pv_id_rezerwacji IN INT,
     pv_status        IN CHAR)
  IS
    check1                         NUMBER; --czy rezerwacja o podanym ID istnieje?
    check2                         NUMBER; --czy wycieczka o podanym ID juz sie odbyla?
    check3                         NUMBER; --czy mozna przejść do innego stanu?
    v_status                       CHAR; --poprzedni status rezerwacji
    v_exc_brak_wycieczki           VARCHAR(4000) := 'Exception: wycieczka o tym id nie istnieje';
    v_exc_wycieczka_juz_sie_odbyla VARCHAR(4000) := 'Exception: wycieczka juz sie odbyla';
    v_exc_rezerwacja_zle_przejscie VARCHAR(4000) := 'Exception: nie mozna zmienic rezerwacji na ten status';
    BEGIN

      SELECT COUNT(*)
          INTO check1 FROM rezerwacje r WHERE r.nr_rezerwacji = pv_id_rezerwacji;

      IF check1 = 0
      THEN
        RAISE_APPLICATION_ERROR(-20004, v_exc_brak_wycieczki);
      END IF;

      SELECT COUNT(*)
          INTO check2
      FROM rezerwacje r
             JOIN wycieczki w ON w.id_wycieczki = r.id_wycieczki
      WHERE w.data > TRUNC(SYSDATE)
        AND r.nr_rezerwacji = pv_id_rezerwacji;

      IF check2 = 0
      THEN
        RAISE_APPLICATION_ERROR(-20005, v_exc_wycieczka_juz_sie_odbyla);
      END IF;

      SELECT r.status
          INTO v_status FROM rezerwacje r WHERE nr_rezerwacji = pv_id_rezerwacji;

      IF (v_status = 'N' AND pv_status IN ('P', 'Z', 'A'))
         OR (v_status = 'P' AND pv_status IN ('Z', 'A'))
         OR (v_status = 'Z' AND pv_status = 'A')
      THEN
        SELECT 1
            INTO check3 FROM dual;
      ELSE
        SELECT 0
            INTO check3 FROM dual;
      END IF;

      IF check3 = 0
      THEN
        RAISE_APPLICATION_ERROR(-20006, v_exc_rezerwacja_zle_przejscie);
      END IF;

      UPDATE rezerwacje SET status = pv_status WHERE nr_rezerwacji = pv_id_rezerwacji;

      INSERT INTO rezerwacje_log (nr_rezerwacji, data, status)
      VALUES (pv_id_rezerwacji, SYSDATE, pv_status);
      COMMIT;
    END;

------------------


  CREATE OR REPLACE PROCEDURE przelicz
  IS
    BEGIN
      FOR i IN (SELECT w.id_wycieczki, (SELECT w.liczba_miejsc - COUNT(*)
                                        FROM rezerwacje r
                                        WHERE r.id_wycieczki = w.id_wycieczki
                                          AND r.status != 'A') AS nowa_liczba_miejsc
                FROM wycieczki2 w)
      LOOP
        UPDATE wycieczki2 w SET liczba_wolnych_miejsc = i.nowa_liczba_miejsc
        WHERE w.id_wycieczki = i.id_wycieczki;
      END LOOP;
    END;

  -------------------------------------------


  CREATE OR REPLACE PROCEDURE dodaj_rezerwacje2
    (pv_id_wycieczki IN INT,
     pv_id_osoby     IN INT)
  IS
    check1                      NUMBER; --1 GDY, TAKA WYCIECZKA ISTNIEJE, JESZCZE SIE NIE ODBYLA
    -- ORAZ SA JESZCZE WOLNE MIEJSCA
    check2                      NUMBER; --1 GDY TAKA OSOBA ISTNIEJE
    v_numer_rezerwacji          NUMBER;
    v_exc_niepoprawna_wycieczka VARCHAR2(4000) := 'Exception: wycieczka jest niepoprawna';
    v_exc_brak_osoby            VARCHAR2(4000) := 'Exception: osoba o tym id nie istnieje';
    BEGIN

      SELECT count(*)
          INTO check1
      FROM wycieczki_miejsca2 w
      WHERE w.id_wycieczki = pv_id_wycieczki
        AND w.data > TRUNC(SYSDATE)
        AND w.liczba_wolnych_miejsc > 0;

      IF check1 = 0
      THEN
        RAISE_APPLICATION_ERROR(-20001, v_exc_niepoprawna_wycieczka);
      END IF;

      SELECT count(*)
          INTO check2 FROM osoby o WHERE o.id_osoby = pv_id_osoby;

      IF check2 = 0
      THEN
        RAISE_APPLICATION_ERROR(-20002, v_exc_brak_osoby);
      END IF;
      ------------------------------
      UPDATE wycieczki2 SET liczba_wolnych_miejsc = liczba_wolnych_miejsc - 1;

      INSERT INTO rezerwacje (id_wycieczki, id_osoby, status)
      VALUES (pv_id_wycieczki, pv_id_osoby, 'N')
          RETURNING nr_rezerwacji INTO v_numer_rezerwacji;

      INSERT INTO rezerwacje_log (nr_rezerwacji, data, status) VALUES (v_numer_rezerwacji, SYSDATE, 'N');
      COMMIT;
    END;

  ------------------------------------------------------------------------------------------------------------------------




  CREATE OR REPLACE PROCEDURE zmien_liczbe_miejsc2
    (pv_id_wycieczki       IN INT,
     pv_nowa_liczba_miejsc IN INT)
  IS
    check1                      NUMBER; --czy wycieczka o podanym ID istnieje?
    check2                      NUMBER; --czy zapisalo sie na wycieczke mniej osob, niz nasz nowy limit miejsc?
    v_exc_niepoprawna_wycieczka VARCHAR2(4000) := 'Exception: wycieczka jest niepoprawna';
    v_exc_za_duzo_miejsc        VARCHAR2(4000) := 'Exception: zarezerwowano za duzo miejsc';
    BEGIN

      SELECT COUNT(*)
          INTO check1 FROM wycieczki2 w WHERE w.id_wycieczki = pv_id_wycieczki;

      IF check1 = 0
      THEN
        RAISE_APPLICATION_ERROR(-20001, v_exc_niepoprawna_wycieczka);
      END IF;

      SELECT COUNT(*)
          INTO check2
      FROM wycieczki_miejsca2 wm
      WHERE wm.id_wycieczki = pv_id_wycieczki
        AND wm.liczba_miejsc - wm.liczba_wolnych_miejsc < pv_nowa_liczba_miejsc;

      IF check2 = 0
      THEN
        RAISE_APPLICATION_ERROR(-20003, v_exc_za_duzo_miejsc);
      END IF;

      UPDATE wycieczki2
      SET liczba_wolnych_miejsc = liczba_wolnych_miejsc + (pv_nowa_liczba_miejsc - liczba_miejsc)
      WHERE pv_id_wycieczki = id_wycieczki;

      UPDATE wycieczki2 SET liczba_miejsc = pv_nowa_liczba_miejsc WHERE id_wycieczki = pv_id_wycieczki;
      COMMIT;
    END;

  -------------------------


  CREATE OR REPLACE PROCEDURE dodaj_rezerwacje3
    (pv_id_wycieczki IN INT,
     pv_id_osoby     IN INT)
  IS
    BEGIN
      INSERT INTO rezerwacje (id_wycieczki, id_osoby, status)
      VALUES (pv_id_wycieczki, pv_id_osoby, 'N');
      COMMIT;
    END;

  CREATE OR REPLACE PROCEDURE zmien_status_rezerwacji3
    (pv_id_rezerwacji IN INT,
     pv_status        IN CHAR)
  IS
    BEGIN
      UPDATE rezerwacje SET status = pv_status WHERE nr_rezerwacji = pv_id_rezerwacji;
      COMMIT;
    END;

  CREATE OR REPLACE PROCEDURE zmien_liczbe_miejsc3
    (pv_id_wycieczki       IN INT,
     pv_nowa_liczba_miejsc IN INT)
  IS
    BEGIN
      UPDATE wycieczki2 SET liczba_miejsc = pv_nowa_liczba_miejsc
      WHERE id_wycieczki = pv_id_wycieczki;
      COMMIT;
    END;