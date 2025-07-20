-- *************************************************
-- 7) Foreign keys constraints
-- !!!!!! BEWARE : at this stage, you need dbell_nomenclature schema to be created !!!!!!
-- *************************************************

--
-- TOC entry 7792 (class 2606 OID 6987452)
-- Name: bypass c_fk_bypass_hpp_id; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.bypass
    ADD CONSTRAINT c_fk_bypass_hpp_id FOREIGN KEY (bypass_hpp_id) REFERENCES dbmig.hpp(hpp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7853 (class 2606 OID 6987457)
-- Name: hpp c_fk_hpp_ob_id; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.hpp
    ADD CONSTRAINT c_fk_hpp_ob_id FOREIGN KEY (hpp_ob_id) REFERENCES dbmig.physical_obstruction(ob_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7854 (class 2606 OID 6987462)
-- Name: hpp c_fk_hpp_orient_flow_no_id; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.hpp
    ADD CONSTRAINT c_fk_hpp_orient_flow_no_id FOREIGN KEY (hpp_orient_flow_no_id) REFERENCES dbmig_nomenclature.orient_flow(no_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7876 (class 2606 OID 6987467)
-- Name: physical_obstruction c_fk_mitigation_measure_no_id; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT c_fk_mitigation_measure_no_id FOREIGN KEY (mitigation_measure_no_id) REFERENCES dbmig_nomenclature.downstream_mitigation_measure(no_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7888 (class 2606 OID 6987472)
-- Name: turbine c_fk_turb_hpp_id; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.turbine
    ADD CONSTRAINT c_fk_turb_hpp_id FOREIGN KEY (turb_hpp_id) REFERENCES dbmig.hpp(hpp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7889 (class 2606 OID 6987477)
-- Name: turbine c_fk_turb_turbine_type_no_id; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.turbine
    ADD CONSTRAINT c_fk_turb_turbine_type_no_id FOREIGN KEY (turb_turbine_type_no_id) REFERENCES dbmig_nomenclature.turbine_type(no_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7785 (class 2606 OID 6987482)
-- Name: batch fk_ba_biological_characteristic_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.batch
    ADD CONSTRAINT fk_ba_biological_characteristic_type FOREIGN KEY (ba_no_biological_characteristic_type) REFERENCES dbmig_nomenclature.biological_characteristic_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7786 (class 2606 OID 6987487)
-- Name: batch fk_ba_individual_status; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.batch
    ADD CONSTRAINT fk_ba_individual_status FOREIGN KEY (ba_no_individual_status) REFERENCES dbmig_nomenclature.individual_status(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7787 (class 2606 OID 6987492)
-- Name: batch fk_ba_species; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.batch
    ADD CONSTRAINT fk_ba_species FOREIGN KEY (ba_no_species) REFERENCES dbmig_nomenclature.species(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7788 (class 2606 OID 6987497)
-- Name: batch fk_ba_stage; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.batch
    ADD CONSTRAINT fk_ba_stage FOREIGN KEY (ba_no_stage) REFERENCES dbmig_nomenclature.stage(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7789 (class 2606 OID 6987502)
-- Name: batch fk_ba_value_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.batch
    ADD CONSTRAINT fk_ba_value_type FOREIGN KEY (ba_no_value_type) REFERENCES dbmig_nomenclature.value_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7790 (class 2606 OID 6987507)
-- Name: biological_characteristic fk_bc_characteristic_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.biological_characteristic
    ADD CONSTRAINT fk_bc_characteristic_type FOREIGN KEY (bc_no_characteristic_type) REFERENCES dbmig_nomenclature.biological_characteristic_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7791 (class 2606 OID 6987512)
-- Name: biological_characteristic fk_bc_value_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.biological_characteristic
    ADD CONSTRAINT fk_bc_value_type FOREIGN KEY (bc_no_value_type) REFERENCES dbmig_nomenclature.value_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7808 (class 2606 OID 6987517)
-- Name: differentiation fk_di_sex; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.differentiation
    ADD CONSTRAINT fk_di_sex FOREIGN KEY (di_no_sex) REFERENCES dbmig_nomenclature.sex(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7837 (class 2606 OID 6987522)
-- Name: gear_fishing fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.gear_fishing
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7864 (class 2606 OID 6987527)
-- Name: migration_monitoring fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration_monitoring
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7813 (class 2606 OID 6987532)
-- Name: ecological_status fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.ecological_status
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7847 (class 2606 OID 6987537)
-- Name: habitat_loss fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.habitat_loss
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7884 (class 2606 OID 6987542)
-- Name: stocking fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.stocking
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7825 (class 2606 OID 6987547)
-- Name: predation fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.predation
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7831 (class 2606 OID 6987552)
-- Name: fishery fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.fishery
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7892 (class 2606 OID 6987557)
-- Name: wildlife fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.wildlife
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7797 (class 2606 OID 6987562)
-- Name: obstruction fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.obstruction
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7877 (class 2606 OID 6987567)
-- Name: physical_obstruction fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7803 (class 2606 OID 6987572)
-- Name: chemical_obstruction fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.chemical_obstruction
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7860 (class 2606 OID 6987577)
-- Name: migration fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7855 (class 2606 OID 6987582)
-- Name: maturation fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.maturation
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7843 (class 2606 OID 6987587)
-- Name: growth fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.growth
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7870 (class 2606 OID 6987592)
-- Name: mortality fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.mortality
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7809 (class 2606 OID 6987597)
-- Name: differentiation fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.differentiation
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7818 (class 2606 OID 6987602)
-- Name: electrofishing fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.electrofishing
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7793 (class 2606 OID 6987607)
-- Name: observations fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.observations
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7824 (class 2606 OID 6987612)
-- Name: environmental_characteristic fk_ec_no_ecologicalproduct; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.environmental_characteristic
    ADD CONSTRAINT fk_ec_no_ecologicalproduct FOREIGN KEY (ec_no_ecologicalproduct) REFERENCES dbmig_nomenclature.ecological_productivity(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7819 (class 2606 OID 6987617)
-- Name: electrofishing fk_ef_electrofishing_mean; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.electrofishing
    ADD CONSTRAINT fk_ef_electrofishing_mean FOREIGN KEY (ef_no_electrofishing_mean) REFERENCES dbmig_nomenclature.electrofishing_mean(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7820 (class 2606 OID 6987622)
-- Name: electrofishing fk_ef_electrofishing_method; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.electrofishing
    ADD CONSTRAINT fk_ef_electrofishing_method FOREIGN KEY (ef_no_fishingmethod) REFERENCES dbmig_nomenclature.scientific_observation_method(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7848 (class 2606 OID 6987627)
-- Name: habitat_loss fk_el_habitat_losstype; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.habitat_loss
    ADD CONSTRAINT fk_el_habitat_losstype FOREIGN KEY (el_no_hahitat_losstype) REFERENCES dbmig_nomenclature.habitat_loss_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7849 (class 2606 OID 6987632)
-- Name: habitat_loss fk_el_unity_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.habitat_loss
    ADD CONSTRAINT fk_el_unity_type FOREIGN KEY (el_no_unity_type) REFERENCES dbmig_nomenclature.type_of_unit(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7814 (class 2606 OID 6987637)
-- Name: ecological_status fk_es_statusclass; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.ecological_status
    ADD CONSTRAINT fk_es_statusclass FOREIGN KEY (es_no_statusclass) REFERENCES dbmig_nomenclature.ecological_status_class(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7807 (class 2606 OID 6987642)
-- Name: data_provider fk_et_id; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.data_provider
    ADD CONSTRAINT fk_et_id FOREIGN KEY (dp_et_id) REFERENCES dbmig.establishment(et_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7832 (class 2606 OID 6987647)
-- Name: fishery fk_fi_fisher_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.fishery
    ADD CONSTRAINT fk_fi_fisher_type FOREIGN KEY (fi_no_fisher_type) REFERENCES dbmig_nomenclature.fisher_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7833 (class 2606 OID 6987652)
-- Name: fishery fk_fi_geartype; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.fishery
    ADD CONSTRAINT fk_fi_geartype FOREIGN KEY (fi_no_geartype) REFERENCES dbmig_nomenclature.gear_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7838 (class 2606 OID 6987657)
-- Name: gear_fishing fk_gf_effort_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.gear_fishing
    ADD CONSTRAINT fk_gf_effort_type FOREIGN KEY (gf_no_effort_type) REFERENCES dbmig_nomenclature.effort_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7839 (class 2606 OID 6987662)
-- Name: gear_fishing fk_gf_geartype; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.gear_fishing
    ADD CONSTRAINT fk_gf_geartype FOREIGN KEY (gf_no_gear_type) REFERENCES dbmig_nomenclature.gear_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7856 (class 2606 OID 6987667)
-- Name: maturation fk_ma_sex; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.maturation
    ADD CONSTRAINT fk_ma_sex FOREIGN KEY (ma_no_sex) REFERENCES dbmig_nomenclature.sex(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7865 (class 2606 OID 6987672)
-- Name: migration_monitoring fk_mm_monitoring_direction; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration_monitoring
    ADD CONSTRAINT fk_mm_monitoring_direction FOREIGN KEY (mm_no_monitoring_direction) REFERENCES dbmig_nomenclature.migration_direction(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7866 (class 2606 OID 6987677)
-- Name: migration_monitoring fk_mm_monitoring_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration_monitoring
    ADD CONSTRAINT fk_mm_monitoring_type FOREIGN KEY (mm_no_monitoring_type) REFERENCES dbmig_nomenclature.control_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7871 (class 2606 OID 6987682)
-- Name: mortality fk_mo_mortality; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.mortality
    ADD CONSTRAINT fk_mo_mortality FOREIGN KEY (mo_no_mortality_type) REFERENCES dbmig_nomenclature.mortality_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7794 (class 2606 OID 6987687)
-- Name: observations fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.observations
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7840 (class 2606 OID 6987692)
-- Name: gear_fishing fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.gear_fishing
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7867 (class 2606 OID 6987697)
-- Name: migration_monitoring fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration_monitoring
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7815 (class 2606 OID 6987702)
-- Name: ecological_status fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.ecological_status
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7850 (class 2606 OID 6987707)
-- Name: habitat_loss fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.habitat_loss
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7885 (class 2606 OID 6987712)
-- Name: stocking fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.stocking
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7826 (class 2606 OID 6987717)
-- Name: predation fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.predation
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7834 (class 2606 OID 6987722)
-- Name: fishery fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.fishery
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7893 (class 2606 OID 6987727)
-- Name: wildlife fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.wildlife
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7798 (class 2606 OID 6987732)
-- Name: obstruction fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.obstruction
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7878 (class 2606 OID 6987737)
-- Name: physical_obstruction fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7804 (class 2606 OID 6987742)
-- Name: chemical_obstruction fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.chemical_obstruction
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7861 (class 2606 OID 6987747)
-- Name: migration fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7857 (class 2606 OID 6987752)
-- Name: maturation fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.maturation
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7844 (class 2606 OID 6987757)
-- Name: growth fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.growth
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7872 (class 2606 OID 6987762)
-- Name: mortality fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.mortality
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7810 (class 2606 OID 6987767)
-- Name: differentiation fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.differentiation
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7821 (class 2606 OID 6987772)
-- Name: electrofishing fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.electrofishing
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7795 (class 2606 OID 6987777)
-- Name: observations fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.observations
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7841 (class 2606 OID 6987782)
-- Name: gear_fishing fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.gear_fishing
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7868 (class 2606 OID 6987787)
-- Name: migration_monitoring fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration_monitoring
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7816 (class 2606 OID 6987792)
-- Name: ecological_status fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.ecological_status
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7851 (class 2606 OID 6987797)
-- Name: habitat_loss fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.habitat_loss
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7886 (class 2606 OID 6987802)
-- Name: stocking fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.stocking
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7827 (class 2606 OID 6987807)
-- Name: predation fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.predation
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7835 (class 2606 OID 6987812)
-- Name: fishery fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.fishery
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7894 (class 2606 OID 6987817)
-- Name: wildlife fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.wildlife
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7799 (class 2606 OID 6987822)
-- Name: obstruction fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.obstruction
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7879 (class 2606 OID 6987827)
-- Name: physical_obstruction fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7805 (class 2606 OID 6987832)
-- Name: chemical_obstruction fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.chemical_obstruction
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7862 (class 2606 OID 6987837)
-- Name: migration fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7858 (class 2606 OID 6987842)
-- Name: maturation fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.maturation
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7845 (class 2606 OID 6987847)
-- Name: growth fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.growth
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7873 (class 2606 OID 6987852)
-- Name: mortality fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.mortality
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7811 (class 2606 OID 6987857)
-- Name: differentiation fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.differentiation
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7822 (class 2606 OID 6987862)
-- Name: electrofishing fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.electrofishing
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7796 (class 2606 OID 6987867)
-- Name: observations fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.observations
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7842 (class 2606 OID 6987872)
-- Name: gear_fishing fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.gear_fishing
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7869 (class 2606 OID 6987877)
-- Name: migration_monitoring fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration_monitoring
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7817 (class 2606 OID 6987882)
-- Name: ecological_status fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.ecological_status
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7852 (class 2606 OID 6987887)
-- Name: habitat_loss fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.habitat_loss
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7887 (class 2606 OID 6987892)
-- Name: stocking fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.stocking
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7828 (class 2606 OID 6987897)
-- Name: predation fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.predation
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7836 (class 2606 OID 6987902)
-- Name: fishery fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.fishery
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7895 (class 2606 OID 6987907)
-- Name: wildlife fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.wildlife
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7800 (class 2606 OID 6987912)
-- Name: obstruction fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.obstruction
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7880 (class 2606 OID 6987917)
-- Name: physical_obstruction fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7806 (class 2606 OID 6987922)
-- Name: chemical_obstruction fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.chemical_obstruction
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7863 (class 2606 OID 6987927)
-- Name: migration fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7859 (class 2606 OID 6987932)
-- Name: maturation fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.maturation
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7846 (class 2606 OID 6987937)
-- Name: growth fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.growth
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7874 (class 2606 OID 6987942)
-- Name: mortality fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.mortality
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7812 (class 2606 OID 6987947)
-- Name: differentiation fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.differentiation
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7823 (class 2606 OID 6987952)
-- Name: electrofishing fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.electrofishing
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7875 (class 2606 OID 6987957)
-- Name: observation_places fk_op_no_observationplacetype; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.observation_places
    ADD CONSTRAINT fk_op_no_observationplacetype FOREIGN KEY (op_no_observationplacetype) REFERENCES dbmig_nomenclature.observation_place_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7801 (class 2606 OID 6987962)
-- Name: obstruction fk_ot_mortality_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.obstruction
    ADD CONSTRAINT fk_ot_mortality_type FOREIGN KEY (ot_no_mortality_type) REFERENCES dbmig_nomenclature.biological_characteristic_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7881 (class 2606 OID 6987967)
-- Name: physical_obstruction fk_ot_mortality_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT fk_ot_mortality_type FOREIGN KEY (ot_no_mortality_type) REFERENCES dbmig_nomenclature.biological_characteristic_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7802 (class 2606 OID 6987972)
-- Name: obstruction fk_ot_obstruction_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.obstruction
    ADD CONSTRAINT fk_ot_obstruction_type FOREIGN KEY (ot_no_obstruction_type) REFERENCES dbmig_nomenclature.obstruction_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7882 (class 2606 OID 6987977)
-- Name: physical_obstruction fk_ot_phys_obstruction_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT fk_ot_phys_obstruction_type FOREIGN KEY (ot_no_obstruction_type) REFERENCES dbmig_nomenclature.obstruction_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7883 (class 2606 OID 6987982)
-- Name: physical_obstruction fk_po_obstruction_passability; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT fk_po_obstruction_passability FOREIGN KEY (po_no_obstruction_passability) REFERENCES dbmig_nomenclature.obstruction_impact(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7829 (class 2606 OID 6987987)
-- Name: predation fk_pr_effort_unit; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.predation
    ADD CONSTRAINT fk_pr_effort_unit FOREIGN KEY (pr_no_effort_unit) REFERENCES dbmig_nomenclature.effort_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7830 (class 2606 OID 6987992)
-- Name: predation fk_pr_predation_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.predation
    ADD CONSTRAINT fk_pr_predation_type FOREIGN KEY (pr_no_predation_type) REFERENCES dbmig_nomenclature.predation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7890 (class 2606 OID 6987997)
-- Name: upstream fk_up_op_idchild; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.upstream
    ADD CONSTRAINT fk_up_op_idchild FOREIGN KEY (up_op_id_child) REFERENCES dbmig.observation_places(op_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7891 (class 2606 OID 6988002)
-- Name: upstream fk_up_op_idparent; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.upstream
    ADD CONSTRAINT fk_up_op_idparent FOREIGN KEY (up_op_id_parent) REFERENCES dbmig.observation_places(op_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7897 (class 2606 OID 6988007)
-- Name: within fk_wi_op_idchild; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.within
    ADD CONSTRAINT fk_wi_op_idchild FOREIGN KEY (wi_op_id_child) REFERENCES dbmig.observation_places(op_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7898 (class 2606 OID 6988012)
-- Name: within fk_wi_op_idparent; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.within
    ADD CONSTRAINT fk_wi_op_idparent FOREIGN KEY (wi_op_id_parent) REFERENCES dbmig.observation_places(op_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7896 (class 2606 OID 6988017)
-- Name: wildlife fk_wi_species; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.wildlife
    ADD CONSTRAINT fk_wi_species FOREIGN KEY (wi_no_species) REFERENCES dbmig_nomenclature.species(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;

