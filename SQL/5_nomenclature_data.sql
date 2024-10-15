-- ***************************************************************
-- Fill dbmig_nomenclature in dbmig_France database
-- la syntaxe COPY FROM stdin ne fonctionne pas dans Dbeaver
-- changement en INSERT INTO.. Values
-- ***************************************************************

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8055 (class 0 OID 2558486)
-- Dependencies: 374
-- Data for Name: biological_characteristic_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(38, NULL, 'Biological characteristic type', 'Unknown', 'Unknown', 'Unknown', 'Unknown');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(42, NULL, 'Biological characteristic type', 'Weight', 'Weight', 'g', 'real');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(43, NULL, 'Biological characteristic type', 'Age', 'Age', 'year', 'integer');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(44, NULL, 'Biological characteristic type', 'Sex', 'Sex', 'Dimensionless', 'nomenclature');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(45, NULL, 'Biological characteristic type', 'Stage', 'stage', 'Dimensionless', 'nomenclature');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(46, NULL, 'Biological characteristic type', 'Rate', 'rate', '%', 'real');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(48, NULL, 'Biological characteristic type', 'Density', 'Density', 'nb/m²', 'real');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(39, NULL, 'Biological characteristic type', 'Length', 'Total length', 'mm', 'real');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(41, NULL, 'Biological characteristic type', 'Upper length', 'Total length - upper bound', 'mm', 'real');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(40, NULL, 'Biological characteristic type', 'Lower length', 'Total length - lower bound', 'mm', 'real');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(47, NULL, 'Biological characteristic type', 'Number', 'Number', 'Dimensionless', 'Integer');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(232, NULL, 'Biological characteristic type', 'Number p2', 'Number in the second pass', 'Dimensionless', 'Integer');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(231, NULL, 'Biological characteristic type', 'Number p1', 'Number in the first pass', 'Dimensionless', 'Integer');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(233, NULL, 'Biological characteristic type', 'Number p3', 'Number in the 3rd pass', 'Dimensionless', 'Integer');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(234, NULL, 'Biological characteristic type', 'Number p4', 'Number in the 4th pass', 'Dimensionless', 'Integer');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(235, NULL, 'Biological characteristic type', 'Number p5', 'Number in the 5th pass', 'Dimensionless', 'Integer');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(262, NULL, 'Biological characteristic type', 'eye_diam_vert', 'Vertical eye diameter', 'mm', 'real');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(263, NULL, 'Biological characteristic type', 'eye_diam_horiz', 'Horizontal eye diameter', 'mm', 'real');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(264, NULL, 'Biological characteristic type', 'length_pect', 'Length of the pectoral fin', 'mm', 'real');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(265, NULL, 'Biological characteristic type', 'presence_neuromast', 'Presence of neuromasts along the lateral line', 'logical', 'boolean');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(266, NULL, 'Biological characteristic type', 'contrast', 'Contrasted colors between dorsal and ventral', 'logical', 'boolean');
INSERT INTO dbmig_nomenclature.biological_characteristic_type
(no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type)
VALUES(236, NULL, 'Biological characteristic type', 'Number p6', 'Number in the 6th pass', 'Dimensionless', 'Integer');



--
-- TOC entry 8058 (class 0 OID 2558508)
-- Dependencies: 380
-- Data for Name: control_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.control_type
(no_id, no_code, no_type, no_name)
VALUES(84, NULL, 'Control type', 'Unknown');
INSERT INTO dbmig_nomenclature.control_type
(no_id, no_code, no_type, no_name)
VALUES(85, NULL, 'Control type', 'Trapping');
INSERT INTO dbmig_nomenclature.control_type
(no_id, no_code, no_type, no_name)
VALUES(86, NULL, 'Control type', 'Resistivity fish counter');
INSERT INTO dbmig_nomenclature.control_type
(no_id, no_code, no_type, no_name)
VALUES(87, NULL, 'Control type', 'Visual image analysis');
INSERT INTO dbmig_nomenclature.control_type
(no_id, no_code, no_type, no_name)
VALUES(88, NULL, 'Control type', 'Acoustic counter');
INSERT INTO dbmig_nomenclature.control_type
(no_id, no_code, no_type, no_name)
VALUES(89, NULL, 'Control type', 'Optoelectronics');



--
-- TOC entry 8059 (class 0 OID 2558511)
-- Dependencies: 381
-- Data for Name: downstream_mitigation_measure; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.downstream_mitigation_measure
(no_id, no_code, no_type, no_name)
VALUES(282, NULL, 'downstream mitigation measure', 'Water intake');
INSERT INTO dbmig_nomenclature.downstream_mitigation_measure
(no_id, no_code, no_type, no_name)
VALUES(283, NULL, 'downstream mitigation measure', 'Fish friendly turbine');
INSERT INTO dbmig_nomenclature.downstream_mitigation_measure
(no_id, no_code, no_type, no_name)
VALUES(284, NULL, 'downstream mitigation measure', 'Fish adapted Management');



--
-- TOC entry 8060 (class 0 OID 2558514)
-- Dependencies: 382
-- Data for Name: ecological_productivity; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.ecological_productivity
(no_id, no_code, no_type, no_name)
VALUES(215, NULL, 'Ecological productivity', 'Unknown');
INSERT INTO dbmig_nomenclature.ecological_productivity
(no_id, no_code, no_type, no_name)
VALUES(216, NULL, 'Ecological productivity', 'Good productivity');
INSERT INTO dbmig_nomenclature.ecological_productivity
(no_id, no_code, no_type, no_name)
VALUES(217, NULL, 'Ecological productivity', 'Bad productivity');



--
-- TOC entry 8061 (class 0 OID 2558517)
-- Dependencies: 383
-- Data for Name: ecological_status_class; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.ecological_status_class
(no_id, no_code, no_type, no_name)
VALUES(90, NULL, 'Ecological status class', 'High');
INSERT INTO dbmig_nomenclature.ecological_status_class
(no_id, no_code, no_type, no_name)
VALUES(91, NULL, 'Ecological status class', 'Good');
INSERT INTO dbmig_nomenclature.ecological_status_class
(no_id, no_code, no_type, no_name)
VALUES(92, NULL, 'Ecological status class', 'Moderate');
INSERT INTO dbmig_nomenclature.ecological_status_class
(no_id, no_code, no_type, no_name)
VALUES(93, NULL, 'Ecological status class', 'Poor');
INSERT INTO dbmig_nomenclature.ecological_status_class
(no_id, no_code, no_type, no_name)
VALUES(94, NULL, 'Ecological status class', 'Unclassified');



--
-- TOC entry 8062 (class 0 OID 2558520)
-- Dependencies: 384
-- Data for Name: effort_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.effort_type
(no_id, no_code, no_type, no_name)
VALUES(99, NULL, 'Effort type', 'Unknown');
INSERT INTO dbmig_nomenclature.effort_type
(no_id, no_code, no_type, no_name)
VALUES(100, NULL, 'Effort type', 'Number of gear');
INSERT INTO dbmig_nomenclature.effort_type
(no_id, no_code, no_type, no_name)
VALUES(101, NULL, 'Effort type', 'Duration days');
INSERT INTO dbmig_nomenclature.effort_type
(no_id, no_code, no_type, no_name)
VALUES(102, NULL, 'Effort type', 'Area in square meters');
INSERT INTO dbmig_nomenclature.effort_type
(no_id, no_code, no_type, no_name)
VALUES(103, NULL, 'Effort type', 'Volume in cubic meters');
INSERT INTO dbmig_nomenclature.effort_type
(no_id, no_code, no_type, no_name)
VALUES(104, NULL, 'Effort type', 'Number gear par days');
INSERT INTO dbmig_nomenclature.effort_type
(no_id, no_code, no_type, no_name)
VALUES(105, NULL, 'Effort type', 'Number gear per month');



--
-- TOC entry 8063 (class 0 OID 2558523)
-- Dependencies: 385
-- Data for Name: electrofishing_mean; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.electrofishing_mean
(no_id, no_code, no_type, no_name, ef_definition)
VALUES(70, NULL, 'Electrofishing mean', 'Unknown', NULL);
INSERT INTO dbmig_nomenclature.electrofishing_mean
(no_id, no_code, no_type, no_name, ef_definition)
VALUES(71, NULL, 'Electrofishing mean', 'By foot', NULL);
INSERT INTO dbmig_nomenclature.electrofishing_mean
(no_id, no_code, no_type, no_name, ef_definition)
VALUES(72, NULL, 'Electrofishing mean', 'By boat', NULL);
INSERT INTO dbmig_nomenclature.electrofishing_mean
(no_id, no_code, no_type, no_name, ef_definition)
VALUES(73, NULL, 'Electrofishing mean', 'Mix', NULL);



--
-- TOC entry 8064 (class 0 OID 2558528)
-- Dependencies: 386
-- Data for Name: fisher_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.fisher_type
(no_id, no_code, no_type, no_name)
VALUES(95, NULL, 'Fisher type', 'Unknown');
INSERT INTO dbmig_nomenclature.fisher_type
(no_id, no_code, no_type, no_name)
VALUES(96, NULL, 'Fisher type', 'Professional fishing');
INSERT INTO dbmig_nomenclature.fisher_type
(no_id, no_code, no_type, no_name)
VALUES(97, NULL, 'Fisher type', 'Amateur fishing');
INSERT INTO dbmig_nomenclature.fisher_type
(no_id, no_code, no_type, no_name)
VALUES(98, NULL, 'Fisher type', 'Other');


--
-- TOC entry 8065 (class 0 OID 2558531)
-- Dependencies: 387
-- Data for Name: fishway_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.fishway_type
(no_id, no_code, no_type, no_name)
VALUES(270, 'VS', 'Fishway type', 'Vertical slot fishway');
INSERT INTO dbmig_nomenclature.fishway_type
(no_id, no_code, no_type, no_name)
VALUES(271, 'PO', 'Fishway type', 'Pool type fishway');
INSERT INTO dbmig_nomenclature.fishway_type
(no_id, no_code, no_type, no_name)
VALUES(272, 'FL', 'Fishway type', 'Fish lock');
INSERT INTO dbmig_nomenclature.fishway_type
(no_id, no_code, no_type, no_name)
VALUES(273, 'D', 'Fishway type', 'Denil pass');
INSERT INTO dbmig_nomenclature.fishway_type
(no_id, no_code, no_type, no_name)
VALUES(275, 'RR', 'Fishway type', 'Rock ramp');
INSERT INTO dbmig_nomenclature.fishway_type
(no_id, no_code, no_type, no_name)
VALUES(276, 'ER', 'Fishway type', 'Eel ramp');
INSERT INTO dbmig_nomenclature.fishway_type
(no_id, no_code, no_type, no_name)
VALUES(277, 'LA', 'Fishway type', 'Lateral canal');
INSERT INTO dbmig_nomenclature.fishway_type
(no_id, no_code, no_type, no_name)
VALUES(278, 'AR', 'Fishway type', 'Artificial river');
INSERT INTO dbmig_nomenclature.fishway_type
(no_id, no_code, no_type, no_name)
VALUES(279, '?', 'Fishway type', 'Unknown');
INSERT INTO dbmig_nomenclature.fishway_type
(no_id, no_code, no_type, no_name)
VALUES(280, 'S', 'Fishway type', 'Sluice');
INSERT INTO dbmig_nomenclature.fishway_type
(no_id, no_code, no_type, no_name)
VALUES(274, 'L', 'Fishway type', 'Fish lift');


--
-- TOC entry 8066 (class 0 OID 2558534)
-- Dependencies: 388
-- Data for Name: gear_characteristic_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.gear_characteristic_type
(no_id, no_code, no_type, no_name)
VALUES(200, NULL, 'Gear characteristic type', 'Unknown');
INSERT INTO dbmig_nomenclature.gear_characteristic_type
(no_id, no_code, no_type, no_name)
VALUES(201, NULL, 'Gear characteristic type', 'Stretched mesh size by the trap net');
INSERT INTO dbmig_nomenclature.gear_characteristic_type
(no_id, no_code, no_type, no_name)
VALUES(202, NULL, 'Gear characteristic type', 'Sieve area by net');
INSERT INTO dbmig_nomenclature.gear_characteristic_type
(no_id, no_code, no_type, no_name)
VALUES(203, NULL, 'Gear characteristic type', 'Net length');


--
-- TOC entry 8067 (class 0 OID 2558537)
-- Dependencies: 389
-- Data for Name: gear_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(106, NULL, 'Gear type', 'Unknown', '01.0.0', 'SURROUNDING NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(107, NULL, 'Gear type', 'Surrounding Nets with Purse Lines (Purse Seines)', '01.1.0', 'SURROUNDING NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(108, NULL, 'Gear type', 'Surrounding Nets with Purse Lines - one boat', '01.1.1', 'SURROUNDING NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(109, NULL, 'Gear type', 'Surrounding Nets with Purse Lines - two boats ', '01.1.2', 'SURROUNDING NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(110, NULL, 'Gear type', 'Surrounding Nets without Purse Lines', '01.2.0', 'SURROUNDING NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(111, NULL, 'Gear type', 'Unknown', '02.0.0', 'SEINE NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(112, NULL, 'Gear type', 'Beach Seines', '02.1.0', 'SEINE NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(113, NULL, 'Gear type', 'Boat Seines', '02.2.0', 'SEINE NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(114, NULL, 'Gear type', 'Boat Seines', '02.2.1', 'SEINE NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(115, NULL, 'Gear type', 'Boat Seines', '02.2.2', 'SEINE NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(116, NULL, 'Gear type', 'Boat Seines', '02.2.3', 'SEINE NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(117, NULL, 'Gear type', 'Boat Seines', '02.9.0', 'SEINE NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(118, NULL, 'Gear type', 'Unknown', '03.0.0', 'TRAWLS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(119, NULL, 'Gear type', 'Unknown', '03.1.0', 'TRAWLS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(120, NULL, 'Gear type', 'Beam trawls', '03.1.1', 'TRAWL NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(121, NULL, 'Gear type', 'Bottom otter trawls', '03.1.2', 'TRAWL NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(122, NULL, 'Gear type', 'Bottom pair trawls', '03.1.3', 'TRAWL NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(123, NULL, 'Gear type', 'Unknown', '03.1.4', 'TRAWLS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(124, NULL, 'Gear type', 'Unknown', '03.1.5', 'TRAWLS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(125, NULL, 'Gear type', 'Unknown', '03.1.9', 'TRAWLS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(126, NULL, 'Gear type', 'Unknown', '03.2.0', 'TRAWLS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(127, NULL, 'Gear type', 'Midwater otter trawls', '03.2.1', 'TRAWL NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(128, NULL, 'Gear type', 'Midwater pair trawls', '03.2.2', 'TRAWL NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(129, NULL, 'Gear type', 'Unknown', '03.2.3', 'TRAWLS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(130, NULL, 'Gear type', 'Unknown', '03.2.9', 'TRAWLS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(131, NULL, 'Gear type', '0tter Twin Trawls', '03.3.0', 'TRAWL NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(132, NULL, 'Gear type', '0tter Twin Trawls', '03.4.9', 'TRAWL NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(133, NULL, 'Gear type', '0tter Twin Trawls', '03.5.9', 'TRAWL NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(134, NULL, 'Gear type', '0tter Twin Trawls', '03.9.0', 'TRAWL NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(135, NULL, 'Gear type', 'Boat Dredges', '04.0.0', 'DREDGES', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(136, NULL, 'Gear type', 'Boat Dredges', '04.1.0', 'DREDGES', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(137, NULL, 'Gear type', 'Hand Dredges', '04.2.0', 'DREDGES', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(138, NULL, 'Gear type', 'Portable Lift Nets', '05.0.0', 'LIFT NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(139, NULL, 'Gear type', 'Portable Lift Nets', '05.1.0', 'LIFT NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(140, NULL, 'Gear type', 'Boat Operated Lift Nets', '05.2.0', 'LIFT NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(141, NULL, 'Gear type', 'Shore Operated Lift Nets', '05.3.0', 'LIFT NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(142, NULL, 'Gear type', 'Shore Operated Lift Nets', '05.9.0', 'LIFT NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(143, NULL, 'Gear type', 'Cast Nets', '06.0.0', 'FALLING GEAR', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(144, NULL, 'Gear type', 'Cast Nets', '06.1.0', 'FALLING GEAR', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(145, NULL, 'Gear type', 'Falling Gear (Not Specified)', '06.9.0', 'FALLING GEAR', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(146, NULL, 'Gear type', 'Set Gillnets (Anchored)', '07.0.0', 'GILLNETS AND ENTANGLING NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(148, NULL, 'Gear type', 'Drifting Gillnets (Driftnets)', '07.2.0', 'GILLNETS AND ENTANGLING NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(149, NULL, 'Gear type', 'Encircling gillnets', '07.3.0', 'GILLNETS AND ENTANGLING NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(150, NULL, 'Gear type', 'Fixed Gillnets (on Stakes)', '07.4.0', 'GILLNETS AND ENTANGLING NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(151, NULL, 'Gear type', 'Trammel Nets', '07.5.0', 'GILLNETS AND ENTANGLING NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(152, NULL, 'Gear type', 'Trammel Nets', '07.6.0', 'GILLNETS AND ENTANGLING NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(153, NULL, 'Gear type', 'Trammel Nets', '07.9.0', 'GILLNETS AND ENTANGLING NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(154, NULL, 'Gear type', 'Trammel Nets', '07.9.1', 'GILLNETS AND ENTANGLING NETS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(155, NULL, 'Gear type', 'Unknown', '08.0.0', 'TRAPS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(156, NULL, 'Gear type', 'Stationary Uncovered Pound Nets', '08.1.0', 'TRAPS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(157, NULL, 'Gear type', 'Pots', '08.2.0', 'TRAPS', 'Eel pots');
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(158, NULL, 'Gear type', 'Fyke Nets', '08.3.0', 'TRAPS', 'Eel fyke nets');
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(159, NULL, 'Gear type', 'Stow Nets', '08.4.0', 'TRAPS', 'Dideau');
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(160, NULL, 'Gear type', 'Barriers, Fences, Weirs, Corrals, etc.', '08.5.0', 'TRAPS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(161, NULL, 'Gear type', 'Aerial Traps', '08.6.0', 'TRAPS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(162, NULL, 'Gear type', 'Aerial Traps', '08.9.0', 'TRAPS', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(163, NULL, 'Gear type', 'Handlines and Pole-Lines (Hand Operated)', '09.0.0', 'HOOKS AND LINES', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(164, NULL, 'Gear type', 'Handlines and Pole-Lines (Hand Operated)', '09.1.0', 'HOOKS AND LINES', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(165, NULL, 'Gear type', 'Handlines and Pole-Lines (Mechanized)', '09.2.0', 'HOOKS AND LINES', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(166, NULL, 'Gear type', 'Set Longlines', '09.3.0', 'HOOKS AND LINES', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(167, NULL, 'Gear type', 'Drifting Longlines', '09.4.0', 'HOOKS AND LINES', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(168, NULL, 'Gear type', 'Longlines (Not Specified)', '09.5.0', 'HOOKS AND LINES', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(169, NULL, 'Gear type', 'Trolling Lines', '09.6.0', 'HOOKS AND LINES', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(170, NULL, 'Gear type', 'Trolling Lines', '09.9.0', 'HOOKS AND LINES', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(171, NULL, 'Gear type', 'Unknown', '10.0.0', 'GRAPPLING AND WOUNDING', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(172, NULL, 'Gear type', 'Harpoons', '10.1.0', 'GRAPPLING AND WOUNDING', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(173, NULL, 'Gear type', 'Pumps', '11.0.0', 'HARVESTING GEAR', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(174, NULL, 'Gear type', 'Pumps', '11.1.0', 'HARVESTING GEAR', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(175, NULL, 'Gear type', 'Mechanized Dredges', '11.2.0', 'HARVESTING GEAR', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(176, NULL, 'Gear type', 'Pumps', '11.9.0', 'HARVESTING GEAR', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(177, NULL, 'Gear type', 'Miscellaneous', '20.0.0', 'MISCELLANEOUS', 'Glass eel scoop net and push net');
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(178, NULL, 'Gear type', 'Recreational fishing gear', '25.0.0', 'RECREATIVE FISHING GEAR', NULL);
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(179, NULL, 'Gear type', 'Unknown', '99.0.0', 'UNKNOWN', NULL);



--
-- TOC entry 8068 (class 0 OID 2558540)
-- Dependencies: 390
-- Data for Name: habitat_loss_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.habitat_loss_type (no_id, no_code, no_type, no_name) VALUES(190, NULL, 'Habitat loss type', 'Unknown');
INSERT INTO dbmig_nomenclature.habitat_loss_type (no_id, no_code, no_type, no_name) VALUES(191, NULL, 'Habitat loss type', 'Marshland');
INSERT INTO dbmig_nomenclature.habitat_loss_type (no_id, no_code, no_type, no_name) VALUES(192, NULL, 'Habitat loss type', 'Lake');
INSERT INTO dbmig_nomenclature.habitat_loss_type (no_id, no_code, no_type, no_name) VALUES(193, NULL, 'Habitat loss type', 'Sea');
INSERT INTO dbmig_nomenclature.habitat_loss_type (no_id, no_code, no_type, no_name) VALUES(194, NULL, 'Habitat loss type', 'Estuary');
INSERT INTO dbmig_nomenclature.habitat_loss_type (no_id, no_code, no_type, no_name) VALUES(195, NULL, 'Habitat loss type', 'River');



--
-- TOC entry 8069 (class 0 OID 2558543)
-- Dependencies: 391
-- Data for Name: individual_status; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.individual_status (no_id, no_code, no_type, no_name) VALUES(49, NULL, 'Individual status', 'Alive');
INSERT INTO dbmig_nomenclature.individual_status (no_id, no_code, no_type, no_name) VALUES(50, NULL, 'Individual status', 'Dead');
INSERT INTO dbmig_nomenclature.individual_status (no_id, no_code, no_type, no_name) VALUES(51, NULL, 'Individual status', 'extracted from the aqu. env.');
INSERT INTO dbmig_nomenclature.individual_status (no_id, no_code, no_type, no_name) VALUES(52, NULL, 'Individual status', 'added to the aquatic env.');
INSERT INTO dbmig_nomenclature.individual_status (no_id, no_code, no_type, no_name) VALUES(53, NULL, 'Individual status', 'Other');



--
-- TOC entry 8070 (class 0 OID 2558546)
-- Dependencies: 392
-- Data for Name: migration_direction; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.migration_direction (no_id, no_code, no_type, no_name) VALUES(204, NULL, 'Migration direction', 'Unknown');
INSERT INTO dbmig_nomenclature.migration_direction (no_id, no_code, no_type, no_name) VALUES(205, NULL, 'Migration direction', 'Upstream migration');
INSERT INTO dbmig_nomenclature.migration_direction (no_id, no_code, no_type, no_name) VALUES(206, NULL, 'Migration direction', 'Downstream migration');


--
-- TOC entry 8071 (class 0 OID 2558549)
-- Dependencies: 393
-- Data for Name: mortality_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.mortality_type (no_id, no_code, no_type, no_name) VALUES(184, NULL, 'Mortality type', 'Unknown');
INSERT INTO dbmig_nomenclature.mortality_type (no_id, no_code, no_type, no_name) VALUES(185, NULL, 'Mortality type', 'Natural');
INSERT INTO dbmig_nomenclature.mortality_type (no_id, no_code, no_type, no_name) VALUES(186, NULL, 'Mortality type', 'Total anthropogenic mortality');
INSERT INTO dbmig_nomenclature.mortality_type (no_id, no_code, no_type, no_name) VALUES(187, NULL, 'Mortality type', 'Total mortality');
INSERT INTO dbmig_nomenclature.mortality_type (no_id, no_code, no_type, no_name) VALUES(188, NULL, 'Mortality type', 'Fishing Mortality');
INSERT INTO dbmig_nomenclature.mortality_type (no_id, no_code, no_type, no_name) VALUES(189, NULL, 'Mortality type', 'Anthropogenic mortality other than fishing');
INSERT INTO dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) VALUES(147, NULL, 'Gear type', 'Set Gillnets (Anchored)', '07.1.0', 'GILLNETS AND ENTANGLING NETS', NULL);


--
-- TOC entry 8054 (class 0 OID 2558478)
-- Dependencies: 372
-- Data for Name: nomenclature; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

/* INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(38, NULL, 'Biological characteristic type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(42, NULL, 'Biological characteristic type', 'Weight');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(43, NULL, 'Biological characteristic type', 'Age');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(44, NULL, 'Biological characteristic type', 'Sex');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(45, NULL, 'Biological characteristic type', 'Stage');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(46, NULL, 'Biological characteristic type', 'Rate');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(48, NULL, 'Biological characteristic type', 'Density');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(39, NULL, 'Biological characteristic type', 'Length');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(41, NULL, 'Biological characteristic type', 'Upper length');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(40, NULL, 'Biological characteristic type', 'Lower length');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(47, NULL, 'Biological characteristic type', 'Number');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(232, NULL, 'Biological characteristic type', 'Number p2');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(231, NULL, 'Biological characteristic type', 'Number p1');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(233, NULL, 'Biological characteristic type', 'Number p3');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(234, NULL, 'Biological characteristic type', 'Number p4');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(235, NULL, 'Biological characteristic type', 'Number p5');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(262, NULL, 'Biological characteristic type', 'eye_diam_vert');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(263, NULL, 'Biological characteristic type', 'eye_diam_horiz');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(264, NULL, 'Biological characteristic type', 'length_pect');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(265, NULL, 'Biological characteristic type', 'presence_neuromast');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(266, NULL, 'Biological characteristic type', 'contrast');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(236, NULL, 'Biological characteristic type', 'Number p6');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(30, NULL, 'Species', 'Anguilla anguilla');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(54, NULL, 'Value type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(55, NULL, 'Value type', 'Raw data or Individual data');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(56, NULL, 'Value type', 'Mean value');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(57, NULL, 'Value type', 'Class value');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(58, NULL, 'Value type', 'Elaborated data');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(59, NULL, 'Value type', 'Cumulated data');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(84, NULL, 'Control type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(85, NULL, 'Control type', 'Trapping');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(86, NULL, 'Control type', 'Resistivity fish counter');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(87, NULL, 'Control type', 'Visual image analysis');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(88, NULL, 'Control type', 'Acoustic counter');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(89, NULL, 'Control type', 'Optoelectronics');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(282, NULL, 'downstream mitigation measure', 'Water intake');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(283, NULL, 'downstream mitigation measure', 'Fish friendly turbine');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(284, NULL, 'downstream mitigation measure', 'Fish adapted Management');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(215, NULL, 'Ecological productivity', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(216, NULL, 'Ecological productivity', 'Good productivity');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(217, NULL, 'Ecological productivity', 'Bad productivity');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(90, NULL, 'Ecological status class', 'High');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(91, NULL, 'Ecological status class', 'Good');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(92, NULL, 'Ecological status class', 'Moderate');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(93, NULL, 'Ecological status class', 'Poor');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(94, NULL, 'Ecological status class', 'Unclassified');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(99, NULL, 'Effort type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(100, NULL, 'Effort type', 'Number of gear');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(101, NULL, 'Effort type', 'Duration days');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(102, NULL, 'Effort type', 'Area in square meters');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(103, NULL, 'Effort type', 'Volume in cubic meters');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(104, NULL, 'Effort type', 'Number gear par days');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(105, NULL, 'Effort type', 'Number gear per month');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(70, NULL, 'Electrofishing mean', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(71, NULL, 'Electrofishing mean', 'By foot');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(72, NULL, 'Electrofishing mean', 'By boat');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(73, NULL, 'Electrofishing mean', 'Mix');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(95, NULL, 'Fisher type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(96, NULL, 'Fisher type', 'Professional fishing');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(97, NULL, 'Fisher type', 'Amateur fishing');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(98, NULL, 'Fisher type', 'Other');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(270, 'VS', 'Fishway type', 'Vertical slot fishway');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(271, 'PO', 'Fishway type', 'Pool type fishway');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(272, 'FL', 'Fishway type', 'Fish lock');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(273, 'D', 'Fishway type', 'Denil pass');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(275, 'RR', 'Fishway type', 'Rock ramp');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(276, 'ER', 'Fishway type', 'Eel ramp');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(277, 'LA', 'Fishway type', 'Lateral canal');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(278, 'AR', 'Fishway type', 'Artificial river');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(279, '?', 'Fishway type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(280, 'S', 'Fishway type', 'Sluice');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(274, 'L', 'Fishway type', 'Fish lift');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(200, NULL, 'Gear characteristic type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(201, NULL, 'Gear characteristic type', 'Stretched mesh size by the trap net');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(202, NULL, 'Gear characteristic type', 'Sieve area by net');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(203, NULL, 'Gear characteristic type', 'Net length');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(106, NULL, 'Gear type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(107, NULL, 'Gear type', 'Surrounding Nets with Purse Lines (Purse Seines)');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(108, NULL, 'Gear type', 'Surrounding Nets with Purse Lines - one boat');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(109, NULL, 'Gear type', 'Surrounding Nets with Purse Lines - two boats ');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(110, NULL, 'Gear type', 'Surrounding Nets without Purse Lines');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(111, NULL, 'Gear type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(112, NULL, 'Gear type', 'Beach Seines');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(113, NULL, 'Gear type', 'Boat Seines');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(114, NULL, 'Gear type', 'Boat Seines');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(115, NULL, 'Gear type', 'Boat Seines');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(116, NULL, 'Gear type', 'Boat Seines');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(117, NULL, 'Gear type', 'Boat Seines');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(118, NULL, 'Gear type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(119, NULL, 'Gear type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(120, NULL, 'Gear type', 'Beam trawls');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(121, NULL, 'Gear type', 'Bottom otter trawls');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(122, NULL, 'Gear type', 'Bottom pair trawls');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(123, NULL, 'Gear type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(124, NULL, 'Gear type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(125, NULL, 'Gear type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(126, NULL, 'Gear type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(127, NULL, 'Gear type', 'Midwater otter trawls');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(128, NULL, 'Gear type', 'Midwater pair trawls');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(129, NULL, 'Gear type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(130, NULL, 'Gear type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(131, NULL, 'Gear type', '0tter Twin Trawls');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(132, NULL, 'Gear type', '0tter Twin Trawls');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(133, NULL, 'Gear type', '0tter Twin Trawls');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(134, NULL, 'Gear type', '0tter Twin Trawls');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(135, NULL, 'Gear type', 'Boat Dredges');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(136, NULL, 'Gear type', 'Boat Dredges');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(137, NULL, 'Gear type', 'Hand Dredges');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(138, NULL, 'Gear type', 'Portable Lift Nets');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(139, NULL, 'Gear type', 'Portable Lift Nets');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(140, NULL, 'Gear type', 'Boat Operated Lift Nets');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(141, NULL, 'Gear type', 'Shore Operated Lift Nets');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(142, NULL, 'Gear type', 'Shore Operated Lift Nets');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(143, NULL, 'Gear type', 'Cast Nets');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(144, NULL, 'Gear type', 'Cast Nets');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(145, NULL, 'Gear type', 'Falling Gear (Not Specified)');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(146, NULL, 'Gear type', 'Set Gillnets (Anchored)');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(147, NULL, 'Gear type', 'Set Gillnets (Anchored)');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(148, NULL, 'Gear type', 'Drifting Gillnets (Driftnets)');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(149, NULL, 'Gear type', 'Encircling gillnets');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(150, NULL, 'Gear type', 'Fixed Gillnets (on Stakes)');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(151, NULL, 'Gear type', 'Trammel Nets');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(152, NULL, 'Gear type', 'Trammel Nets');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(153, NULL, 'Gear type', 'Trammel Nets');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(154, NULL, 'Gear type', 'Trammel Nets');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(155, NULL, 'Gear type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(156, NULL, 'Gear type', 'Stationary Uncovered Pound Nets');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(157, NULL, 'Gear type', 'Pots');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(158, NULL, 'Gear type', 'Fyke Nets');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(159, NULL, 'Gear type', 'Stow Nets');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(160, NULL, 'Gear type', 'Barriers, Fences, Weirs, Corrals, etc.');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(161, NULL, 'Gear type', 'Aerial Traps');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(162, NULL, 'Gear type', 'Aerial Traps');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(163, NULL, 'Gear type', 'Handlines and Pole-Lines (Hand Operated)');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(164, NULL, 'Gear type', 'Handlines and Pole-Lines (Hand Operated)');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(165, NULL, 'Gear type', 'Handlines and Pole-Lines (Mechanized)');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(166, NULL, 'Gear type', 'Set Longlines');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(167, NULL, 'Gear type', 'Drifting Longlines');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(168, NULL, 'Gear type', 'Longlines (Not Specified)');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(169, NULL, 'Gear type', 'Trolling Lines');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(170, NULL, 'Gear type', 'Trolling Lines');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(171, NULL, 'Gear type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(172, NULL, 'Gear type', 'Harpoons');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(173, NULL, 'Gear type', 'Pumps');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(174, NULL, 'Gear type', 'Pumps');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(175, NULL, 'Gear type', 'Mechanized Dredges');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(176, NULL, 'Gear type', 'Pumps');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(177, NULL, 'Gear type', 'Miscellaneous');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(178, NULL, 'Gear type', 'Recreational fishing gear');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(179, NULL, 'Gear type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(190, NULL, 'Habitat loss type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(191, NULL, 'Habitat loss type', 'Marshland');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(192, NULL, 'Habitat loss type', 'Lake');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(193, NULL, 'Habitat loss type', 'Sea');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(194, NULL, 'Habitat loss type', 'Estuary');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(195, NULL, 'Habitat loss type', 'River');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(49, NULL, 'Individual status', 'Alive');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(50, NULL, 'Individual status', 'Dead');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(51, NULL, 'Individual status', 'extracted from the aqu. env.');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(52, NULL, 'Individual status', 'added to the aquatic env.');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(53, NULL, 'Individual status', 'Other');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(204, NULL, 'Migration direction', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(205, NULL, 'Migration direction', 'Upstream migration');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(206, NULL, 'Migration direction', 'Downstream migration');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(184, NULL, 'Mortality type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(185, NULL, 'Mortality type', 'Natural');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(186, NULL, 'Mortality type', 'Total anthropogenic mortality');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(187, NULL, 'Mortality type', 'Total mortality');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(188, NULL, 'Mortality type', 'Fishing Mortality');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(189, NULL, 'Mortality type', 'Anthropogenic mortality other than fishing');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(11, NULL, 'Observation origin', 'Raw data');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(12, NULL, 'Observation origin', 'Modelling result');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(1, NULL, 'Observation place', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(2, NULL, 'Observation place', 'Country');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(3, NULL, 'Observation place', 'Region');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(4, NULL, 'Observation place', 'River Basin District');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(5, NULL, 'Observation place', 'EMU');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(6, NULL, 'Observation place', 'Waterbody');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(7, NULL, 'Observation place', 'River Basin');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(8, NULL, 'Observation place', 'River');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(9, NULL, 'Observation place', 'River stretch');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(10, NULL, 'Observation place', 'Sampling station');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(281, NULL, 'Observation place', 'Obstacle location');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(13, NULL, 'Observation Type', 'Unknown');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(14, NULL, 'Observation Type', 'Pression - Impact');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(15, NULL, 'Observation Type', 'Habitat loss');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(16, NULL, 'Observation Type', 'Obstruction');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(17, NULL, 'Observation Type', 'Stocking');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(18, NULL, 'Observation Type', 'Predation');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(19, NULL, 'Observation Type', 'Ecological status');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(20, NULL, 'Observation Type', 'Scientific Observation');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(21, NULL, 'Observation Type', 'Gear fishing');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(22, NULL, 'Observation Type', 'Electro-fishing');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(23, NULL, 'Observation Type', 'Migration monitoring');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(24, NULL, 'Observation Type', 'Biological process');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(25, NULL, 'Observation Type', 'Migration');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(26, NULL, 'Observation Type', 'Maturation');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(27, NULL, 'Observation Type', 'Growth');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(28, NULL, 'Observation Type', 'Mortality');
INSERT INTO dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) VALUES(29, NULL, 'Observation Type', 'Differentiation'); */



--
-- TOC entry 8073 (class 0 OID 2558553)
-- Dependencies: 395
-- Data for Name: observation_origin; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.observation_origin (no_id, no_code, no_type, no_name) VALUES(11, NULL, 'Observation origin', 'Raw data');
INSERT INTO dbmig_nomenclature.observation_origin (no_id, no_code, no_type, no_name) VALUES(12, NULL, 'Observation origin', 'Modelling result');


--
-- TOC entry 8074 (class 0 OID 2558556)
-- Dependencies: 396
-- Data for Name: observation_place_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.observation_place_type (no_id, no_code, no_type, no_name, obs_subtype_name) VALUES(1, NULL, 'Observation place', 'Unknown', 'Unknown');
INSERT INTO dbmig_nomenclature.observation_place_type (no_id, no_code, no_type, no_name, obs_subtype_name) VALUES(2, NULL, 'Observation place', 'Country', 'Administrative');
INSERT INTO dbmig_nomenclature.observation_place_type (no_id, no_code, no_type, no_name, obs_subtype_name) VALUES(3, NULL, 'Observation place', 'Region', 'Administrative');
INSERT INTO dbmig_nomenclature.observation_place_type (no_id, no_code, no_type, no_name, obs_subtype_name) VALUES(4, NULL, 'Observation place', 'River Basin District', 'Administrative');
INSERT INTO dbmig_nomenclature.observation_place_type (no_id, no_code, no_type, no_name, obs_subtype_name) VALUES(5, NULL, 'Observation place', 'EMU', 'Administrative');
INSERT INTO dbmig_nomenclature.observation_place_type (no_id, no_code, no_type, no_name, obs_subtype_name) VALUES(6, NULL, 'Observation place', 'Waterbody', 'Geographic');
INSERT INTO dbmig_nomenclature.observation_place_type (no_id, no_code, no_type, no_name, obs_subtype_name) VALUES(7, NULL, 'Observation place', 'River Basin', 'Geographic');
INSERT INTO dbmig_nomenclature.observation_place_type (no_id, no_code, no_type, no_name, obs_subtype_name) VALUES(8, NULL, 'Observation place', 'River', 'Geographic');
INSERT INTO dbmig_nomenclature.observation_place_type (no_id, no_code, no_type, no_name, obs_subtype_name) VALUES(9, NULL, 'Observation place', 'River stretch', 'Geographic');
INSERT INTO dbmig_nomenclature.observation_place_type (no_id, no_code, no_type, no_name, obs_subtype_name) VALUES(10, NULL, 'Observation place', 'Sampling station', 'Geographic');
INSERT INTO dbmig_nomenclature.observation_place_type (no_id, no_code, no_type, no_name, obs_subtype_name) VALUES(281, NULL, 'Observation place', 'Obstacle location', 'Geographic');



--
-- TOC entry 8075 (class 0 OID 2558559)
-- Dependencies: 397
-- Data for Name: observation_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(13, NULL, 'Observation Type', 'Unknown', 'Unknown');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(14, NULL, 'Observation Type', 'Pression - Impact', 'Pression - Impact');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(15, NULL, 'Observation Type', 'Habitat loss', 'Pression - Impact');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(16, NULL, 'Observation Type', 'Obstruction', 'Pression - Impact');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(17, NULL, 'Observation Type', 'Stocking', 'Pression - Impact');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(18, NULL, 'Observation Type', 'Predation', 'Pression - Impact');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(19, NULL, 'Observation Type', 'Ecological status', 'Pression - Impact');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(20, NULL, 'Observation Type', 'Scientific Observation', 'Scientific Observation');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(21, NULL, 'Observation Type', 'Gear fishing', 'Scientific Observation');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(22, NULL, 'Observation Type', 'Electro-fishing', 'Scientific Observation');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(23, NULL, 'Observation Type', 'Migration monitoring', 'Scientific Observation');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(24, NULL, 'Observation Type', 'Biological process', 'Biological process');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(25, NULL, 'Observation Type', 'Migration', 'Biological process');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(26, NULL, 'Observation Type', 'Maturation', 'Biological process');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(27, NULL, 'Observation Type', 'Growth', 'Biological process');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(28, NULL, 'Observation Type', 'Mortality', 'Biological process');
INSERT INTO dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) VALUES(29, NULL, 'Observation Type', 'Differentiation', 'Biological process');



--
-- TOC entry 8076 (class 0 OID 2558562)
-- Dependencies: 398
-- Data for Name: obstruction_impact; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.obstruction_impact (no_id, no_code, no_type, no_name) VALUES(287, 'LI', 'Obstruction impact', 'Barrier passable with Limited Impact (source ICE)');
INSERT INTO dbmig_nomenclature.obstruction_impact (no_id, no_code, no_type, no_name) VALUES(288, 'SO', 'Obstruction impact', 'Partial barrier with Some Impact (source ICE)');
INSERT INTO dbmig_nomenclature.obstruction_impact (no_id, no_code, no_type, no_name) VALUES(289, 'MA', 'Obstruction impact', 'Partial barrier with Major Impact (source ICE)');
INSERT INTO dbmig_nomenclature.obstruction_impact (no_id, no_code, no_type, no_name) VALUES(290, 'TO', 'Obstruction impact', 'Total barrier (source ICE)');
INSERT INTO dbmig_nomenclature.obstruction_impact (no_id, no_code, no_type, no_name) VALUES(208, 'NA', 'Obstruction impact', 'Unknown');
INSERT INTO dbmig_nomenclature.obstruction_impact (no_id, no_code, no_type, no_name) VALUES(209, '0', 'Obstruction impact', 'Unobtrusive and/or no barrier');
INSERT INTO dbmig_nomenclature.obstruction_impact (no_id, no_code, no_type, no_name) VALUES(210, '1', 'Obstruction impact', 'Passable without apparent difficulty');
INSERT INTO dbmig_nomenclature.obstruction_impact (no_id, no_code, no_type, no_name) VALUES(211, '2', 'Obstruction impact', 'Passable with some risk of delay');
INSERT INTO dbmig_nomenclature.obstruction_impact (no_id, no_code, no_type, no_name) VALUES(212, '3', 'Obstruction impact', 'Difficult to pass');
INSERT INTO dbmig_nomenclature.obstruction_impact (no_id, no_code, no_type, no_name) VALUES(213, '4', 'Obstruction impact', 'Very difficult to pass');
INSERT INTO dbmig_nomenclature.obstruction_impact (no_id, no_code, no_type, no_name) VALUES(214, '5', 'Obstruction impact', 'Impassable');
INSERT INTO dbmig_nomenclature.obstruction_impact (no_id, no_code, no_type, no_name) VALUES(267, 'LO', 'Obstruction impact', 'Low (scale with three categories)');
INSERT INTO dbmig_nomenclature.obstruction_impact (no_id, no_code, no_type, no_name) VALUES(268, 'ME', 'Obstruction impact', 'Medium (scale with three categories)');
INSERT INTO dbmig_nomenclature.obstruction_impact (no_id, no_code, no_type, no_name) VALUES(269, 'HI', 'Obstruction impact', 'High (scale with three categories)');



--
-- TOC entry 8077 (class 0 OID 2558565)
-- Dependencies: 399
-- Data for Name: obstruction_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.obstruction_type (no_id, no_code, no_type, no_name) VALUES(218, 'UN', 'Obstruction type', 'Unknown');
INSERT INTO dbmig_nomenclature.obstruction_type (no_id, no_code, no_type, no_name) VALUES(291, 'DA', 'Obstruction_type', 'Dam');
INSERT INTO dbmig_nomenclature.obstruction_type (no_id, no_code, no_type, no_name) VALUES(292, 'WE', 'Obstruction_type', 'Weir');
INSERT INTO dbmig_nomenclature.obstruction_type (no_id, no_code, no_type, no_name) VALUES(293, 'RR', 'Obstruction_type', 'Rock ramp');
INSERT INTO dbmig_nomenclature.obstruction_type (no_id, no_code, no_type, no_name) VALUES(294, 'CU', 'Obstruction_type', 'Culvert');
INSERT INTO dbmig_nomenclature.obstruction_type (no_id, no_code, no_type, no_name) VALUES(295, 'FO', 'Obstruction_type', 'Ford');
INSERT INTO dbmig_nomenclature.obstruction_type (no_id, no_code, no_type, no_name) VALUES(296, 'BR', 'Obstruction_type', 'Bridge');
INSERT INTO dbmig_nomenclature.obstruction_type (no_id, no_code, no_type, no_name) VALUES(297, 'OT', 'Obstruction_type', 'Other');
INSERT INTO dbmig_nomenclature.obstruction_type (no_id, no_code, no_type, no_name) VALUES(298, 'DI', 'Obstruction_type', 'Dike');
INSERT INTO dbmig_nomenclature.obstruction_type (no_id, no_code, no_type, no_name) VALUES(299, 'GR', 'Obstruction_type', 'Grid');
INSERT INTO dbmig_nomenclature.obstruction_type (no_id, no_code, no_type, no_name) VALUES(219, 'PU', 'Obstruction type', 'Physical obstruction (Unknown)');
INSERT INTO dbmig_nomenclature.obstruction_type (no_id, no_code, no_type, no_name) VALUES(220, 'CH', 'Obstruction type', 'Chemical obstruction');
INSERT INTO dbmig_nomenclature.obstruction_type (no_id, no_code, no_type, no_name) VALUES(300, 'PP', 'Obstruction_type', 'Penstock Pipe');


--
-- TOC entry 8078 (class 0 OID 2558568)
-- Dependencies: 400
-- Data for Name: orient_flow; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.orient_flow (no_id, no_code, no_type, no_name) VALUES(238, '1', 'orient_flow', '[70-90°]');
INSERT INTO dbmig_nomenclature.orient_flow (no_id, no_code, no_type, no_name) VALUES(239, '2', 'orient_flow', '[50-70°[');
INSERT INTO dbmig_nomenclature.orient_flow (no_id, no_code, no_type, no_name) VALUES(240, '3', 'orient_flow', '[30-50°[');
INSERT INTO dbmig_nomenclature.orient_flow (no_id, no_code, no_type, no_name) VALUES(241, '4', 'orient_flow', '<30°');



--
-- TOC entry 8079 (class 0 OID 2558571)
-- Dependencies: 401
-- Data for Name: period_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.period_type (no_id, no_code, no_type, no_name) VALUES(74, NULL, 'Period type', 'Unknown');
INSERT INTO dbmig_nomenclature.period_type (no_id, no_code, no_type, no_name) VALUES(75, NULL, 'Period type', 'Daily');
INSERT INTO dbmig_nomenclature.period_type (no_id, no_code, no_type, no_name) VALUES(76, NULL, 'Period type', 'Weekly');
INSERT INTO dbmig_nomenclature.period_type (no_id, no_code, no_type, no_name) VALUES(77, NULL, 'Period type', 'Semimonthly');
INSERT INTO dbmig_nomenclature.period_type (no_id, no_code, no_type, no_name) VALUES(78, NULL, 'Period type', 'Monthly');
INSERT INTO dbmig_nomenclature.period_type (no_id, no_code, no_type, no_name) VALUES(79, NULL, 'Period type', 'Bimonthly');
INSERT INTO dbmig_nomenclature.period_type (no_id, no_code, no_type, no_name) VALUES(80, NULL, 'Period type', 'Quaterly');
INSERT INTO dbmig_nomenclature.period_type (no_id, no_code, no_type, no_name) VALUES(81, NULL, 'Period type', 'Half-yearly');
INSERT INTO dbmig_nomenclature.period_type (no_id, no_code, no_type, no_name) VALUES(82, NULL, 'Period type', 'Yearly');
INSERT INTO dbmig_nomenclature.period_type (no_id, no_code, no_type, no_name) VALUES(83, NULL, 'Period type', 'Other');


--
-- TOC entry 8080 (class 0 OID 2558574)
-- Dependencies: 402
-- Data for Name: predation_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.predation_type (no_id, no_code, no_type, no_name) VALUES(221, NULL, 'Predation type', 'Unknown');
INSERT INTO dbmig_nomenclature.predation_type (no_id, no_code, no_type, no_name) VALUES(222, NULL, 'Predation type', 'fishery');
INSERT INTO dbmig_nomenclature.predation_type (no_id, no_code, no_type, no_name) VALUES(223, NULL, 'Predation type', 'wildlife');



--
-- TOC entry 8081 (class 0 OID 2558577)
-- Dependencies: 403
-- Data for Name: predator_subtype; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.predator_subtype (no_id, no_code, no_type, no_name) VALUES(207, NULL, 'Predator_subtype', 'Cormorant');


--
-- TOC entry 8082 (class 0 OID 2558580)
-- Dependencies: 404
-- Data for Name: scientific_observation_method; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(68, NULL, 'Scientific observation type', 'Unknown', 'Gear fishing', NULL);
INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(69, NULL, 'Scientific observation type', 'Unknown', 'Migration monitoring', NULL);
INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(60, 'NA', 'Scientific observation type', 'Unknown', 'Unknown', 'Unknown scientific observation of unknown category');
INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(61, 'UN', 'Scientific observation type', 'Unknown', 'Electro-fishing', 'Electrofishing, method unknown');
INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(62, 'WH', 'Scientific observation type', 'Whole', 'Electro-fishing', 'Electrofishing, full two pass by foot');
INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(63, 'P1', 'Scientific observation type', 'Partial1bank', 'Electro-fishing', 'Electrofishing, partial on one bank');
INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(64, 'P2', 'Scientific observation type', 'Partial2banks', 'Electro-fishing', 'Electrofishing, partial on two banks');
INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(65, 'PR', 'Scientific observation type', 'Partialrandom', 'Electro-fishing', 'Electrofishing, partial random');
INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(66, 'PR', 'Scientific observation type', 'Partialprop', 'Electro-fishing', 'Electrofishing, partial proportional');
INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(67, 'OT', 'Scientific observation type', 'Other', 'Electro-fishing', 'Electrofishing, other method');
INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(301, 'DH', 'Scientific_observation_type', 'Deep habitat', 'Electro-fishing', 'Normalized method for deep habitat (Belliard et al.,2018)');
INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(302, 'WE', 'Scientific_observation_type', 'Whole eel', 'Electro-fishing', 'Electrofishing, whole eel specific');
INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(303, 'PE', 'Scientific_observation_type', 'Point sampling eel', 'Electro-fishing', 'Electrofishing, eel specific point sampling (Germis, 2009)');
INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(305, 'BB', 'Scientific_observation_type', 'Boom boat', 'Electro-fishing', 'Boom boat (Pulsed)');
INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(304, 'TE', 'Scientific_observation_type', 'TEF', 'Electro-fishing', 'Timed electrofishing, 10 min in Ireland');
INSERT INTO dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) VALUES(306, 'EP', 'Scientific_observation_type', 'EPA', 'Electro-fishing', 'Partial point sampling with density current, protocol Feunteun, Rigaud');


--
-- TOC entry 8083 (class 0 OID 2558585)
-- Dependencies: 405
-- Data for Name: sex; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.sex (no_id, no_code, no_type, no_name) VALUES(180, NULL, 'Sex', 'Unknown');
INSERT INTO dbmig_nomenclature.sex (no_id, no_code, no_type, no_name) VALUES(181, NULL, 'Sex', 'male');
INSERT INTO dbmig_nomenclature.sex (no_id, no_code, no_type, no_name) VALUES(182, NULL, 'Sex', 'female');
INSERT INTO dbmig_nomenclature.sex (no_id, no_code, no_type, no_name) VALUES(183, NULL, 'Sex', 'Unidentifed');



--
-- TOC entry 8056 (class 0 OID 2558489)
-- Dependencies: 375
-- Data for Name: species; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--
INSERT INTO dbmig_nomenclature.species (no_id, no_code, no_type, no_name, sp_vernacular_name) VALUES(30, NULL, 'Species', 'Anguilla anguilla', 'Eel');



--
-- TOC entry 8084 (class 0 OID 2558588)
-- Dependencies: 406
-- Data for Name: stage; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.stage (no_id, no_code, no_type, no_name) VALUES(224, NULL, 'Stage', 'Unknown');
INSERT INTO dbmig_nomenclature.stage (no_id, no_code, no_type, no_name) VALUES(225, NULL, 'Stage', 'Glass eel');
INSERT INTO dbmig_nomenclature.stage (no_id, no_code, no_type, no_name) VALUES(226, NULL, 'Stage', 'Yellow eel');
INSERT INTO dbmig_nomenclature.stage (no_id, no_code, no_type, no_name) VALUES(227, NULL, 'Stage', 'Silver eel');
INSERT INTO dbmig_nomenclature.stage (no_id, no_code, no_type, no_name) VALUES(228, NULL, 'Stage', 'Glass & yellow eel mixed');
INSERT INTO dbmig_nomenclature.stage (no_id, no_code, no_type, no_name) VALUES(229, NULL, 'Stage', 'Yellow & silver eel mixed');
INSERT INTO dbmig_nomenclature.stage (no_id, no_code, no_type, no_name) VALUES(230, NULL, 'Stage', 'G, Y & S eel mixed');



--
-- TOC entry 8085 (class 0 OID 2558591)
-- Dependencies: 407
-- Data for Name: turbine_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(242, NULL, 'Turbine type', 'Horizontal axis Kaplan (bulb)');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(243, NULL, 'Turbine type', 'Other (please specify)');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(244, NULL, 'Turbine type', 'Double Francis (spiral case)');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(245, NULL, 'Turbine type', 'Francis unspecified');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(246, NULL, 'Turbine type', 'Turbine with fixed blade propeller and vertical axis');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(247, NULL, 'Turbine type', 'Kaplan not specified');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(248, NULL, 'Turbine type', 'Pelton');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(249, NULL, 'Turbine type', 'Reversible');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(250, NULL, 'Turbine type', 'Kaplan (model of S-turbine)');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(251, NULL, 'Turbine type', 'Turbine with fixed blade propeller and horizontal axis');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(252, NULL, 'Turbine type', 'Unknown');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(253, NULL, 'Turbine type', 'Vertical axis Kaplan');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(254, NULL, 'Turbine type', 'Francis without volute');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(255, NULL, 'Turbine type', 'Francis (spiral case)');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(256, NULL, 'Turbine type', 'Banki-Michell (cross-flow)');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(257, NULL, 'Turbine type', 'VLH');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(258, NULL, 'Turbine type', 'Archimedean screw turbine');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(259, NULL, 'Turbine type', 'Water wheel turbine (aqualienne)');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(260, NULL, 'Turbine type', 'Water wheel turbine (others)');
INSERT INTO dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) VALUES(261, NULL, 'Turbine type', 'Propeller unspecified');



--
-- TOC entry 8086 (class 0 OID 2558594)
-- Dependencies: 408
-- Data for Name: type_of_unit; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.type_of_unit (no_id, no_code, no_type, no_name, tu_unit) VALUES(196, NULL, 'Type of unit', 'Unknown', 'Unknown');
INSERT INTO dbmig_nomenclature.type_of_unit (no_id, no_code, no_type, no_name, tu_unit) VALUES(197, NULL, 'Type of unit', 'Area', 'm2');
INSERT INTO dbmig_nomenclature.type_of_unit (no_id, no_code, no_type, no_name, tu_unit) VALUES(198, NULL, 'Type of unit', 'Linear', 'm');
INSERT INTO dbmig_nomenclature.type_of_unit (no_id, no_code, no_type, no_name, tu_unit) VALUES(199, NULL, 'Type of unit', 'Percent', '%');



--
-- TOC entry 8057 (class 0 OID 2558492)
-- Dependencies: 376
-- Data for Name: value_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

INSERT INTO dbmig_nomenclature.value_type (no_id, no_code, no_type, no_name) VALUES(54, NULL, 'Value type', 'Unknown');
INSERT INTO dbmig_nomenclature.value_type (no_id, no_code, no_type, no_name) VALUES(55, NULL, 'Value type', 'Raw data or Individual data');
INSERT INTO dbmig_nomenclature.value_type (no_id, no_code, no_type, no_name) VALUES(56, NULL, 'Value type', 'Mean value');
INSERT INTO dbmig_nomenclature.value_type (no_id, no_code, no_type, no_name) VALUES(57, NULL, 'Value type', 'Class value');
INSERT INTO dbmig_nomenclature.value_type (no_id, no_code, no_type, no_name) VALUES(58, NULL, 'Value type', 'Elaborated data');
INSERT INTO dbmig_nomenclature.value_type (no_id, no_code, no_type, no_name) VALUES(59, NULL, 'Value type', 'Cumulated data');



--
-- TOC entry 8092 (class 0 OID 0)
-- Dependencies: 394
-- Name: nomenclature_no_id_seq; Type: SEQUENCE SET; Schema: dbmig_nomenclature; Owner: postgres
--
-- A CONFIRMER (dans la table dbmig_nomenclature.nomenclature, le dernier ID est 306
SELECT pg_catalog.setval('dbmig_nomenclature.nomenclature_no_id_seq', 307, false);

