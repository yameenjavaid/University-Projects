  CREATE TABLE osoby
  (
    id_osoby INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    imie     VARCHAR2(50),
    nazwisko VARCHAR2(50),
    pesel    VARCHAR2(11),
    kontakt  VARCHAR2(100),

    CONSTRAINT osoby_pk PRIMARY KEY
      (
        id_osoby
      )
    ENABLE
  );


  CREATE TABLE wycieczki
  (
    id_wycieczki  INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    nazwa         VARCHAR2(100),
    kraj          VARCHAR2(50),
    data          DATE,
    opis          VARCHAR2(200),
    liczba_miejsc INT,

    CONSTRAINT wycieczki_pk PRIMARY KEY
      (
        id_wycieczki
      )
    ENABLE
  );


  CREATE TABLE rezerwacje
  (
    nr_rezerwacji INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    id_wycieczki  INT,
    id_osoby      INT,
    status        CHAR(1),

    CONSTRAINT rezerwacje_pk PRIMARY KEY
      (
        nr_rezerwacji
      )
    ENABLE
  );


  ALTER TABLE rezerwacje
    ADD CONSTRAINT rezerwacje_fk1 FOREIGN KEY
    (
      id_osoby
    )
  REFERENCES osoby
    (
      id_osoby
    )
  ENABLE;

  ALTER TABLE rezerwacje
    ADD CONSTRAINT rezerwacje_fk2 FOREIGN KEY
    (
      id_wycieczki
    )
  REFERENCES wycieczki
    (
      id_wycieczki
    )
  ENABLE;

  ALTER TABLE rezerwacje
    ADD CONSTRAINT rezerwacje_chk1 CHECK
  (status IN ('N', 'P', 'Z', 'A'))
  ENABLE;


  CREATE TABLE rezerwacje_log
  (
    log_id        INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    nr_rezerwacji INT,
    data          DATE,
    status        CHAR(1),
    CONSTRAINT rezerwacje_log_pk PRIMARY KEY
      (
        log_id
      )
    ENABLE
  );

  ALTER TABLE rezerwacje_log
    ADD CONSTRAINT rezerwacje_log_fk1 FOREIGN KEY
    (
      nr_rezerwacji
    )
  REFERENCES rezerwacje
    (
      nr_rezerwacji
    )
  ENABLE;

  ALTER TABLE rezerwacje_log
    ADD CONSTRAINT rezerwacje_log_chk1 CHECK
  (status IN ('N', 'P', 'Z', 'A'))
  ENABLE;

  CREATE TABLE wycieczki2
  (
    id_wycieczki  INT NOT NULL,
    nazwa         VARCHAR2(100),
    kraj          VARCHAR2(50),
    data          DATE,
    opis          VARCHAR2(200),
    liczba_miejsc INT,
    liczba_wolnych_miejsc INT,

    CONSTRAINT wycieczki2_pk PRIMARY KEY
      (
        id_wycieczki
      )
    ENABLE
  );