create table siig_d_kemler (
       codice_kemler        character varying(5) not null,
       descrizione_kemler   character varying(100) null
);


alter table siig_d_kemler
       add  constraint pk_siig_d_kemler primary key (codice_kemler) ;


create table siig_d_onu (
       codice_onu           character varying(5) not null,
       codice_kemler        character varying(5) not null,
       descrizione_onu      character varying(100) null
);


alter table siig_d_onu
       add  constraint pk_siig_d_onu primary key (codice_onu) ;


create table siig_gate_d_direzione (
       id_gate              numeric(3) not null,
       flg_direzione        numeric(1) not null check (flg_direzione in (0,1)),
       descrizione_cardinale character varying(2) not null,
       descrizione          character varying(20) null
);


alter table siig_gate_d_direzione
       add  constraint pk_siig_gate_d_direzione primary key (
              id_gate, flg_direzione) ;


create table siig_gate_d_server (
       id_server            numeric(1) not null,
       descrizione_server   character varying(100) null
);


alter table siig_gate_d_server
       add  constraint pk_siig_gate_d_server primary key (id_server) ;


create table siig_gate_geo_gate (
       id_gate              numeric(3) not null,
       fk_partner           character varying(5) null,
       fk_server            numeric(1) not null,
       descrizione          character varying(100) not null,
       collocazione         character varying(250) null,
       geometria 						geometry(point,32632),
       data_inizio_validita timestamp without time zone,
       data_fine_validita   timestamp without time zone,
       concessionaria_sito  character varying(50) null,
       nr_corsie_carreggiata numeric(1) null
);


alter table siig_gate_geo_gate
       add  constraint pk_siig_gate_geo_gate primary key (id_gate) ;


create table siig_gate_t_dato (
       id_dato              numeric(12) not null,
       fk_gate              numeric(3) not null,
       flg_direzione        numeric(1) not null check (flg_direzione in (0,1)),
       data_rilevamento     timestamp without time zone not null,
       ora_fuso_orario      integer not null,
       minuto_fuso_orario   integer not null,
       data_ricezione       date not null,
       flg_corsia           numeric(1) not null check (flg_corsia in (0,1,2)),
       codice_onu           character varying(5) null,
       data_trasmissione    timestamp without time zone
);

comment on column siig_gate_t_dato.data_rilevamento is 'comunicata dal gate';
comment on column siig_gate_t_dato.data_ricezione is 'valorizzato da applicativo';
comment on column siig_gate_t_dato.flg_corsia is '0=corsia di marcia
1=corsia di sorpasso
2=corsia di sorpasso veloce';
comment on column siig_gate_t_dato.data_trasmissione is 'data_trasmissione da parte di cria';

alter table siig_gate_t_dato
       add  constraint pk_siig_gate_t_dato primary key (id_dato) ;


create table siig_gate_d_intervalli(
    id_intervallo numeric(2,0),
    descrizione_it varchar(50),
    descrizione_en varchar(50),
    descrizione_de varchar(50),
    descrizione_fr varchar(50),
    primary key(id_intervallo)
);       
       
create table siig_gate_t_dato_statistico (
       id_dato              numeric(5) not null,
       fk_gate              numeric(3) not null,
       flg_direzione        numeric(1) not null check (flg_direzione in (0,1)),
       data_stat_inizio     timestamp without time zone not null,
       data_stat_fine       timestamp without time zone null,
       flg_corsia           numeric(1) not null check (flg_corsia in (0,1,2)),
       codice_onu           character varying(5) null,
       quantita             numeric(10) null,
       fk_interval          numeric(2,0) not null,
       data_trasmissione    timestamp without time zone
);

comment on column siig_gate_t_dato_statistico.data_stat_inizio is 'comunicata dal gate';
comment on column siig_gate_t_dato_statistico.flg_corsia is '0=corsia di marcia
1=corsia di sorpasso
2=corsia di sorpasso veloce';
comment on column siig_gate_t_dato_statistico.data_trasmissione is 'data_trasmissione da parte di cria';

alter table siig_gate_t_dato_statistico
       add   constraint pk_siig_gate_t_dato_statistico primary key (
              id_dato)  ;

alter table siig_gate_t_dato_statistico add CONSTRAINT fk_siig_gate_t_stat_intervalli FOREIGN KEY (fk_interval) REFERENCES siig_gate_d_intervalli(id_intervallo);              

create table siig_gate_t_dato_storico (
       id_dato              numeric(12) not null,
       fk_gate              numeric(3) not null,
       flg_direzione        numeric(1) not null check (flg_direzione in (0,1)),
       data_rilevamento     timestamp without time zone not null,
       ora_fuso_orario      integer not null,
       minuto_fuso_orario   integer not null,
       data_ricezione       date not null,
       flg_corsia           numeric(1) not null check (flg_corsia in (0,1,2)),
       codice_onu           character varying(5) null,
       data_trasmissione    timestamp without time zone
);

comment on column siig_gate_t_dato_storico.data_rilevamento is 'comunicata dal gate';
comment on column siig_gate_t_dato_storico.data_ricezione is 'valorizzato da applicativo';
comment on column siig_gate_t_dato_storico.flg_corsia is '0=corsia di marcia
1=corsia di sorpasso
2=corsia di sorpasso veloce';
comment on column siig_gate_t_dato_storico.data_trasmissione is 'data_trasmissione da parte di cria';

alter table siig_gate_t_dato_storico
       add  constraint pk_siig_gate_t_dato_storico primary key (
              id_dato)  ;


alter table siig_d_onu
       add   constraint fk_siig_d_kemler_01
              foreign key (codice_kemler)
                             references siig_d_kemler  ;


alter table siig_gate_d_direzione
       add   constraint fk_siig_gate_geo_gate_01
              foreign key (id_gate)
                             references siig_gate_geo_gate  ;


alter table siig_gate_geo_gate
       add   constraint fk_siig_gate_d_server_01
              foreign key (fk_server)
                             references siig_gate_d_server  ;


alter table siig_gate_geo_gate
       add   constraint fk_siig_d_partner_08
              foreign key (fk_partner)
                             references siig_d_partner  ;


alter table siig_gate_t_dato
       add   constraint fk_siig_gate_d_direzione_03
              foreign key (fk_gate, flg_direzione)
                             references siig_gate_d_direzione  ;


alter table siig_gate_t_dato
       add  constraint fk_siig_d_onu_02
              foreign key (codice_onu)
                             references siig_d_onu  ;


alter table siig_gate_t_dato_statistico
       add   constraint fk_siig_gate_d_direzione_02
              foreign key (fk_gate, flg_direzione)
                             references siig_gate_d_direzione  ;


alter table siig_gate_t_dato_statistico
       add   constraint fk_siig_d_onu_01
              foreign key (codice_onu)
                             references siig_d_onu  ;


alter table siig_gate_t_dato_storico
       add   constraint fk_siig_gate_d_direzione_01
              foreign key (fk_gate, flg_direzione)
                             references siig_gate_d_direzione  ;


alter table siig_gate_t_dato_storico
       add   constraint fk_siig_d_onu_03
              foreign key (codice_onu)
                             references siig_d_onu  ;
                             
                             
INSERT INTO siig_gate_d_server (id_server, descrizione_server) VALUES (0, 'Server GATE:  Regione Piemonte, Regione Lombardia e Canton Ticino');
INSERT INTO siig_gate_d_server (id_server, descrizione_server) VALUES (1, 'Server GATE:  Provincia Bolzano');
INSERT INTO siig_gate_d_server (id_server, descrizione_server) VALUES (2, 'Server GATE:  Provincia Bolzano Brennero');
INSERT INTO siig_gate_d_server (id_server, descrizione_server) VALUES (3, 'Server GATE:  Regione Valle D''Aosta');


INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (1, '5', 0, 'Autostrada Chiasso Basilea', NULL, NULL, '2013-10-01 00:00:00', NULL, 'Autostrada Chiasso Basilea', 2);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (2, '5', 0, 'Autostrada Chiasso Basilea', NULL, NULL, '2013-10-01 00:00:00', NULL, 'Autostrada Chiasso Basilea', 2);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (101, '3', 3, 'Autostrada Torino Aosta', NULL, '0101000020787F0000CDCCCCCC79BF1841000000403B435341', '2013-10-01 00:00:00', NULL, 'Autostrada Torino Aosta', 2);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (102, '3', 3, 'Autostrada Torino Aosta', NULL, '0101000020787F000052B81E85F7BF184114AE471132435341', '2013-10-01 00:00:00', NULL, 'Autostrada Torino Aosta', 2);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (201, '1', 0, 'Autostrada SATAP', NULL, '0101000020787F0000AE47E17AD6391A41D7A3705D59285341', '2013-10-01 00:00:00', NULL, 'Autostrada SATAP', 3);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (202, '1', 0, 'Autostrada SATAP', NULL, '0101000020787F000033333333D5921C418FC2F558B9355341', '2013-10-01 00:00:00', NULL, 'Autostrada SATAP', 3);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (203, '1', 0, 'Autostrada SATAP', NULL, '0101000020787F0000EC51B81EF22C1A41B81E858B5E275341', '2013-10-01 00:00:00', NULL, 'Autostrada SATAP', 3);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (204, '1', 0, 'Autostrada SATAP', NULL, '0101000020787F000014AE47E1B75F1D415C8FC23539F95241', '2013-10-01 00:00:00', NULL, 'Autostrada SATAP', 2);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (205, '1', 0, 'Autostrada SATAP', NULL, '0101000020787F0000B81E85EB1A971C4100000020E9FB5241', '2013-10-01 00:00:00', NULL, 'Autostrada SATAP', 2);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (206, '1', 0, 'Trecate/San Martino', NULL, '0101000020787F00005C8FC2F554831D41D7A370AD98325341', '2013-10-01 00:00:00', NULL, 'Trecate/San Martino', 2);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (301, '2', 0, 'Autostrada Milano-Serravalle', NULL, '0101000020787F00008FC2F5283AC01E415C8FC2C5001E5341', '2013-10-01 00:00:00', NULL, 'Autostrada Milano-Serravalle', 3);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (302, '2', 0, 'Autostrada Milano-Serravalle', NULL, '0101000020787F000085EB51B8F9B01E418FC2F5C80A1C5341', '2013-10-01 00:00:00', NULL, 'Autostrada Milano-Serravalle', 3);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (303, '2', 0, 'Autostrada Milano-Serravalle', NULL, '0101000020787F0000E17A14AE86DE1E41295C8FF2EF315341', '2013-10-01 00:00:00', NULL, 'Autostrada Milano-Serravalle', 3);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (304, '2', 0, 'Autostrada Milano-Serravalle', NULL, '0101000020787F0000A4703D0A2DBE1F41EC51B89EB82B5341', '2013-10-01 00:00:00', NULL, 'Autostrada Milano-Serravalle', 3);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (305, '2', 0, 'Autostrada Brescia/Verona/Vicenza/Padova', NULL, '0101000020787F0000C3F5285C6F0F23411F85EB119C325341', '2013-10-01 00:00:00', NULL, 'Autostrada Brescia/Verona/Vicenza/Padova', 3);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (306, '2', 0, 'Autostrada Brescia/Verona/Vicenza/Padova', NULL, '0101000020787F0000CDCCCCCCFA452241B81E857BF9385341', '2013-10-01 00:00:00', NULL, 'Autostrada Brescia/Verona/Vicenza/Padova', 3);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (307, '2', 0, 'Autostrada Centropadane', NULL, '0101000020787F0000EC51B81EE1CF21411F85EB812C105341', '2013-10-01 00:00:00', NULL, 'Autostrada Centropadane', 2);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (308, '2', 0, 'Autostrada Centropadane', NULL, '0101000020787F000048E17A14D5CF21411F85EB513F105341', '2013-10-01 00:00:00', NULL, 'Autostrada Centropadane', 2);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (309, '2', 0, 'Autostrada SATAP', NULL, '0101000020787F00005C8FC2F544D11D4148E17A04DC365341', '2013-10-01 00:00:00', NULL, 'Autostrada SATAP', 3);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (401, '4', 2, 'Auostrada A22 del Brennero', NULL, '0101000020787F0000666666E6FF4C2441D7A3708D23885341', '2013-10-01 00:00:00', NULL, 'Auostrada A22 del Brennero', 3);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (402, '4', 2, 'Auostrada A22 del Brennero', NULL, '0101000020787F00001F85EB514FE92441CDCCCC9C8AD45341', '2013-10-01 00:00:00', NULL, 'Auostrada A22 del Brennero', 3);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (403, '4', 1, 'Gallerie servizio strade', NULL, '0101000020787F000052B81E85C1E5234152B81E35EAB65341', '2013-10-01 00:00:00', NULL, 'Gallerie servizio strade', 2);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (404, '4', 1, 'Gallerie servizio strade', NULL, '0101000020787F0000EC51B81E93A324415C8FC2F593A55341', '2013-10-01 00:00:00', NULL, 'Gallerie servizio strade', 2);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (405, '4', 1, 'Gallerie servizio strade', NULL, '0101000020787F0000EC51B81E93A324415C8FC2F593A55341', '2013-10-01 00:00:00', NULL, 'Gallerie servizio strade', 2);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (406, '4', 1, 'Gallerie servizio strade', NULL, '0101000020787F000052B81E8536C124415C8FC2D514A25341', '2013-10-01 00:00:00', NULL, 'Gallerie servizio strade', 2);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (407, '4', 1, 'Gallerie servizio strade', NULL, '0101000020787F0000C3F5285CDB9F244166666636B5955341', '2013-10-01 00:00:00', NULL, 'Gallerie servizio strade', 2);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (408, '4', 1, 'Gallerie servizio strade', NULL, '0101000020787F00005C8FC27593E92441EC51B86E0CB15341', '2013-10-01 00:00:00', NULL, 'Gallerie servizio strade', 2);
INSERT INTO siig_gate_geo_gate (id_gate, fk_partner, fk_server, descrizione, collocazione, geometria, data_inizio_validita, data_fine_validita, concessionaria_sito, nr_corsie_carreggiata) VALUES (409, '4', 1, 'Gallerie servizio strade', NULL, '0101000020787F0000A4703D0A5B7F26411F85EB21E6C45341', '2013-10-01 00:00:00', NULL, 'Gallerie servizio strade', 2);


INSERT INTO siig_gate_d_direzione VALUES (301, 0, 'SO', 'dir - Genova');
INSERT INTO siig_gate_d_direzione VALUES (302, 0, 'NE', 'dir - Milano');
INSERT INTO siig_gate_d_direzione VALUES (303, 0, 'S', 'dir - A1 Bologna');
INSERT INTO siig_gate_d_direzione VALUES (304, 0, 'O', 'A8-Laghi');
INSERT INTO siig_gate_d_direzione VALUES (408, 0, 'N', 'Brennero');
INSERT INTO siig_gate_d_direzione VALUES (408, 1, 'S', 'Bolzano');
INSERT INTO siig_gate_d_direzione VALUES (409, 0, 'E', 'San Candido');
INSERT INTO siig_gate_d_direzione VALUES (409, 1, 'O', 'Brunico');
INSERT INTO siig_gate_d_direzione VALUES (403, 0, 'E', 'Merano');
INSERT INTO siig_gate_d_direzione VALUES (403, 1, 'O', 'Resia');
INSERT INTO siig_gate_d_direzione VALUES (404, 0, 'E', 'Bolzano');
INSERT INTO siig_gate_d_direzione VALUES (405, 0, 'O', 'Merano');
INSERT INTO siig_gate_d_direzione VALUES (406, 0, 'N', 'Bolzano');
INSERT INTO siig_gate_d_direzione VALUES (406, 1, 'S', 'Laives');
INSERT INTO siig_gate_d_direzione VALUES (407, 0, 'N', 'Bolzano');
INSERT INTO siig_gate_d_direzione VALUES (407, 1, 'S', 'Egna');
INSERT INTO siig_gate_d_direzione VALUES (401, 0, 'N', 'Bolzano');
INSERT INTO siig_gate_d_direzione VALUES (402, 0, 'N', 'Brennero');
INSERT INTO siig_gate_d_direzione VALUES (305, 0, 'E', 'Padova');
INSERT INTO siig_gate_d_direzione VALUES (306, 0, 'O', 'Brescia');
INSERT INTO siig_gate_d_direzione VALUES (307, 0, 'N', 'Brescia');
INSERT INTO siig_gate_d_direzione VALUES (308, 0, 'S', 'Piacenza');
INSERT INTO siig_gate_d_direzione VALUES (201, 0, 'NE', 'Milano');
INSERT INTO siig_gate_d_direzione VALUES (309, 0, 'E', 'Milano');
INSERT INTO siig_gate_d_direzione VALUES (202, 0, 'O', 'Torino');
INSERT INTO siig_gate_d_direzione VALUES (203, 0, 'SO', 'Torino');
INSERT INTO siig_gate_d_direzione VALUES (204, 0, 'E', 'Piacenza');
INSERT INTO siig_gate_d_direzione VALUES (205, 0, 'O', 'Torino');
INSERT INTO siig_gate_d_direzione VALUES (206, 0, 'N', 'Trecate');
INSERT INTO siig_gate_d_direzione VALUES (206, 1, 'S', 'Cerano');
INSERT INTO siig_gate_d_direzione VALUES (101, 0, 'N', 'Aosta');
INSERT INTO siig_gate_d_direzione VALUES (102, 0, 'S', 'Torino');
INSERT INTO siig_gate_d_direzione VALUES (1, 0, 'S', 'Chiasso');
INSERT INTO siig_gate_d_direzione VALUES (2, 0, 'N', 'Basilea');
INSERT INTO siig_gate_d_direzione VALUES (401, 1, 'S', 'Mezzocorona');
INSERT INTO siig_gate_d_direzione VALUES (402, 1, 'S', 'Vipiteno');
INSERT INTO siig_gate_d_direzione VALUES (301, 1, 'NE', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (302, 1, 'SO', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (303, 1, 'S', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (304, 1, 'S', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (404, 1, 'E', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (405, 1, 'O', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (305, 1, 'E', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (306, 1, 'O', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (307, 1, 'N', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (308, 1, 'S', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (201, 1, 'NE', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (309, 1, 'E', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (202, 1, 'O', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (203, 1, 'SO', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (204, 1, 'E', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (205, 1, 'O', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (101, 1, 'N', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (102, 1, 'S', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (1, 1, 'S', 'Empty');
INSERT INTO siig_gate_d_direzione VALUES (2, 1, 'N', 'Empty');                   

INSERT INTO siig_gate_d_intervalli (id_intervallo, descrizione_it, descrizione_en, descrizione_de, descrizione_fr) VALUES(1,'Ultimo giorno','Ultimo giorno','Ultimo giorno','Ultimo giorno');
INSERT INTO siig_gate_d_intervalli (id_intervallo, descrizione_it, descrizione_en, descrizione_de, descrizione_fr) VALUES(2,'Ultima settimana','Ultima settimana','Ultima settimana','Ultima settimana');
INSERT INTO siig_gate_d_intervalli (id_intervallo, descrizione_it, descrizione_en, descrizione_de, descrizione_fr) VALUES(3,'Ultimo mese','Ultimo mese','Ultimo mese','Ultimo mese');
INSERT INTO siig_gate_d_intervalli (id_intervallo, descrizione_it, descrizione_en, descrizione_de, descrizione_fr) VALUES(4,'Ultimo anno','Ultimo anno','Ultimo anno','Ultimo anno');


-- Kemler code missed data
insert into siig_d_kemler (codice_kemler) values ('668');
insert into siig_d_kemler (codice_kemler) values ('30');
insert into siig_d_kemler (codice_kemler) values ('225');
insert into siig_d_kemler (codice_kemler) values ('22');
insert into siig_d_kemler (codice_kemler) values ('90');
insert into siig_d_kemler (codice_kemler) values ('23');
insert into siig_d_kemler (codice_kemler) values ('33');
insert into siig_d_kemler (codice_kemler) values ('80');
insert into siig_d_kemler (codice_kemler) values ('00');
insert into siig_d_kemler (codice_kemler) values ('336');

-- Onu code missed data (we suppose if one transit have onu and kemler code, the relation exists between those codes)
insert into siig_d_onu (codice_onu, codice_kemler) values ('3264', '80');
insert into siig_d_onu (codice_onu, codice_kemler) values ('1263', '33');
insert into siig_d_onu (codice_onu, codice_kemler) values ('2735', '80');
insert into siig_d_onu (codice_onu, codice_kemler) values ('0000', '00');
insert into siig_d_onu (codice_onu, codice_kemler) values ('2582', '80');
insert into siig_d_onu (codice_onu, codice_kemler) values ('1090', '33');
insert into siig_d_onu (codice_onu, codice_kemler) values ('3082', '90');
insert into siig_d_onu (codice_onu, codice_kemler) values ('1230', '336');
insert into siig_d_onu (codice_onu, codice_kemler) values ('1965', '23');
insert into siig_d_onu (codice_onu, codice_kemler) values ('1951', '22');
insert into siig_d_onu (codice_onu, codice_kemler) values ('1073', '225');
insert into siig_d_onu (codice_onu, codice_kemler) values ('2261', '90');
insert into siig_d_onu (codice_onu, codice_kemler) values ('1789', '80');
insert into siig_d_onu (codice_onu, codice_kemler) values ('1830', '80');
insert into siig_d_onu (codice_onu, codice_kemler) values ('1203', '33');
insert into siig_d_onu (codice_onu, codice_kemler) values ('1202', '30');
insert into siig_d_onu (codice_onu, codice_kemler) values ('1977', '22');
insert into siig_d_onu (codice_onu, codice_kemler) values ('3246', '668');
insert into siig_d_onu (codice_onu, codice_kemler) values ('3256', '30');