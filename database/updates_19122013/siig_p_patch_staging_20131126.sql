alter table siig_r_arco_1_sostanza ALTER COLUMN padr TYPE numeric(6,5);
alter table siig_r_arco_2_sostanza ALTER COLUMN padr TYPE numeric(6,5);
alter table siig_r_arco_3_sostanza ALTER COLUMN padr TYPE numeric(6,5);

ALTER TABLE siig_t_sostanza
  ADD COLUMN padr_statistico numeric(6,5);



-- nuove tbl

create table siig_d_categoria_strada (
       id_categoria_strada  numeric(2) not null,
       cod_categoria        character varying(1) not null,
       descrizione_categoria character varying(100) not null,
       vel_media_vei_leggeri numeric(3) null,
       vel_media_vei_pesanti numeric(3) null,
       nr_medio_corsie      numeric(1) null
);


alter table siig_d_categoria_strada
       add  constraint pk_siig_d_categoria_strada primary key (
              id_categoria_strada) ;


create table siig_d_patrimonialita_strada (
       id_patrimonialita    numeric(2) not null,
       cod_patrimonialita   character varying(2) not null,
       descrizione_patrimonialita character varying(100) not null
);


alter table siig_d_patrimonialita_strada
       add   constraint pk_siig_d_patrimonialita_strad primary key (
              id_patrimonialita) ;


create table siig_geo_pl_province (
       cod_provincia        character varying(5) not null,
       sigla_provincia      character varying(4) null,
       descrizione          character varying(100) null,
        geometria geometry(multipolygon,32632) not null
);

comment on column siig_geo_pl_province.cod_provincia is 'contiene il codice belfiore per le province italiane ed il codine nuts per la svizzera
http://en.wikipedia.org/wiki/nuts_of_switzerland';

alter table siig_geo_pl_province
       add   constraint pk_siig_geo_pl_province primary key (
              cod_provincia)  ;


create table siig_t_incidentalita (
       cod_provincia        character varying(5) not null,
       id_patrimonialita    numeric(2) not null,
       anno                 numeric(4) not null,
       nr_incidenti         numeric(6) 
);

comment on column siig_t_incidentalita.cod_provincia is 'contiene il codice belfiore per le province italiane ed il codine nuts per la svizzera
http://en.wikipedia.org/wiki/nuts_of_switzerland';

alter table siig_t_incidentalita
       add   constraint pk_siig_t_incidentalita primary key (
              cod_provincia, id_patrimonialita, anno) ;


alter table siig_t_incidentalita
       add   constraint fk_siig_d_patrimonialita_strad
              foreign key (id_patrimonialita)
                             references siig_d_patrimonialita_strada ;

/*
alter table siig_t_incidentalita
       add   constraint fk_siig_geo_pl_province_01
              foreign key (cod_provincia)
                             references siig_geo_pl_province ;
*/

