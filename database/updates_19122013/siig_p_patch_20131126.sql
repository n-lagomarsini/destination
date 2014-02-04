-- alter table

alter table siig_r_arco_1_sostanza ALTER COLUMN padr TYPE numeric(6,5);
alter table siig_r_arco_2_sostanza ALTER COLUMN padr TYPE numeric(6,5);
alter table siig_r_arco_3_sostanza ALTER COLUMN padr TYPE numeric(6,5);

ALTER TABLE siig_t_sostanza
  ADD COLUMN padr_statistico numeric(6,5);




-------------------
--				gate
------------------- 
drop table siig_gate_t_dato;
drop table siig_gate_t_dato_statistico;
drop table siig_gate_t_dato_storico;
drop table siig_gate_geo_gate;



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


create table siig_gate_t_dato_statistico (
       id_dato              numeric(5) not null,
       fk_gate              numeric(3) not null,
       flg_direzione        numeric(1) not null check (flg_direzione in (0,1)),
       data_stat_inizio     timestamp without time zone not null,
       data_stat_fine       timestamp without time zone null,
       flg_corsia           numeric(1) not null check (flg_corsia in (0,1,2)),
       codice_onu           character varying(5) null,
       quantita             numeric(10) null,
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



