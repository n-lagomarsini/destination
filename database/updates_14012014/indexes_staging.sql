CREATE INDEX  idx_arco_1_scen_tipo_bers_arco ON siig_r_arco_1_scen_tipobers(id_geo_arco);
CREATE INDEX  idx_arco_1_scen_tipo_bers_partner ON siig_r_arco_1_scen_tipobers(fk_partner);

CREATE INDEX  idx_arco_1_sostanza_arco ON siig_r_arco_1_sostanza(id_geo_arco);
CREATE INDEX  idx_arco_1_sostanza_partner ON siig_r_arco_1_sostanza(fk_partner);

CREATE INDEX  idx_arco_1_tipovei_partner ON siig_r_tipovei_geoarco1(fk_partner);

CREATE INDEX  idx_arco_1_elab_arco ON siig_t_elab_standard_1(id_geo_arco);
CREATE INDEX  idx_arco_1_elab_partner ON siig_t_elab_standard_1(fk_partner);

CREATE INDEX  idx_arco_1_vuln_arco ON siig_t_vulnerabilita_1(id_geo_arco);
CREATE INDEX  idx_arco_1_vuln_partner ON siig_t_vulnerabilita_1(fk_partner);

CREATE INDEX  idx_arco_1_scen_vuln_arco ON siig_r_scen_vuln_1(id_geo_arco);
CREATE INDEX  idx_arco_1_scen_vuln_partner ON siig_r_scen_vuln_1(fk_partner);

CREATE INDEX  idx_arco_2_scen_tipo_bers_arco ON siig_r_arco_2_scen_tipobers(id_geo_arco);
CREATE INDEX  idx_arco_2_scen_tipo_bers_partner ON siig_r_arco_2_scen_tipobers(fk_partner);

CREATE INDEX  idx_arco_2_sostanza_arco ON siig_r_arco_2_sostanza(id_geo_arco);
CREATE INDEX  idx_arco_2_sostanza_partner ON siig_r_arco_2_sostanza(fk_partner);

CREATE INDEX  idx_arco_2_tipovei_partner ON siig_r_tipovei_geoarco2(fk_partner);

CREATE INDEX  idx_arco_2_elab_arco ON siig_t_elab_standard_2(id_geo_arco);
CREATE INDEX  idx_arco_2_elab_partner ON siig_t_elab_standard_2(fk_partner);

CREATE INDEX  idx_arco_2_vuln_arco ON siig_t_vulnerabilita_2(id_geo_arco);
CREATE INDEX  idx_arco_2_vuln_partner ON siig_t_vulnerabilita_2(fk_partner);

CREATE INDEX  idx_arco_2_scen_vuln_arco ON siig_r_scen_vuln_2(id_geo_arco);
CREATE INDEX  idx_arco_2_scen_vuln_partner ON siig_r_scen_vuln_2(fk_partner);

CREATE INDEX  idx_arco_3_scen_tipo_bers_arco ON siig_r_arco_3_scen_tipobers(id_geo_arco);
CREATE INDEX  idx_arco_3_scen_tipo_bers_partner ON siig_r_arco_3_scen_tipobers(fk_partner);

CREATE INDEX  idx_arco_3_sostanza_arco ON siig_r_arco_3_sostanza(id_geo_arco);
CREATE INDEX  idx_arco_3_sostanza_partner ON siig_r_arco_3_sostanza(fk_partner);

CREATE INDEX  idx_arco_3_tipovei_partner ON siig_r_tipovei_geoarco3(fk_partner);

CREATE INDEX  idx_arco_3_elab_arco ON siig_t_elab_standard_3(id_geo_arco);
CREATE INDEX  idx_arco_3_elab_partner ON siig_t_elab_standard_3(fk_partner);

CREATE INDEX  idx_arco_3_vuln_arco ON siig_t_vulnerabilita_3(id_geo_arco);
CREATE INDEX  idx_arco_3_vuln_partner ON siig_t_vulnerabilita_3(fk_partner);

CREATE INDEX  idx_arco_3_scen_vuln_arco ON siig_r_scen_vuln_3(id_geo_arco);
CREATE INDEX  idx_arco_3_scen_vuln_partner ON siig_r_scen_vuln_3(fk_partner);