--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 15.3 (Ubuntu 15.3-1.pgdg22.04+1)

-- Started on 2023-08-01 21:04:11 CEST

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

COPY dbmig_nomenclature.biological_characteristic_type (no_id, no_code, no_type, no_name, bc_label, bc_unit, bc_data_type) FROM stdin;
38	\N	Biological characteristic type	Unknown	Unknown	Unknown	Unknown
42	\N	Biological characteristic type	Weight	Weight	g	real
43	\N	Biological characteristic type	Age	Age	year	integer
44	\N	Biological characteristic type	Sex	Sex	Dimensionless	nomenclature
45	\N	Biological characteristic type	Stage	stage	Dimensionless	nomenclature
46	\N	Biological characteristic type	Rate	rate	%	real
48	\N	Biological characteristic type	Density	Density	nb/m²	real
39	\N	Biological characteristic type	Length	Total length	mm	real
41	\N	Biological characteristic type	Upper length	Total length - upper bound	mm	real
40	\N	Biological characteristic type	Lower length	Total length - lower bound	mm	real
47	\N	Biological characteristic type	Number	Number	Dimensionless	Integer
232	\N	Biological characteristic type	Number p2	Number in the second pass	Dimensionless	Integer
231	\N	Biological characteristic type	Number p1	Number in the first pass	Dimensionless	Integer
233	\N	Biological characteristic type	Number p3	Number in the 3rd pass	Dimensionless	Integer
234	\N	Biological characteristic type	Number p4	Number in the 4th pass	Dimensionless	Integer
235	\N	Biological characteristic type	Number p5	Number in the 5th pass	Dimensionless	Integer
262	\N	Biological characteristic type	eye_diam_vert	Vertical eye diameter	mm	real
263	\N	Biological characteristic type	eye_diam_horiz	Horizontal eye diameter	mm	real
264	\N	Biological characteristic type	length_pect	Length of the pectoral fin	mm	real
265	\N	Biological characteristic type	presence_neuromast	Presence of neuromasts along the lateral line	logical	boolean
266	\N	Biological characteristic type	contrast	Contrasted colors between dorsal and ventral	logical	boolean
236	\N	Biological characteristic type	Number p6	Number in the 6th pass	Dimensionless	Integer
\.


--
-- TOC entry 8058 (class 0 OID 2558508)
-- Dependencies: 380
-- Data for Name: control_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.control_type (no_id, no_code, no_type, no_name) FROM stdin;
84	\N	Control type	Unknown
85	\N	Control type	Trapping
86	\N	Control type	Resistivity fish counter
87	\N	Control type	Visual image analysis
88	\N	Control type	Acoustic counter
89	\N	Control type	Optoelectronics
\.


--
-- TOC entry 8059 (class 0 OID 2558511)
-- Dependencies: 381
-- Data for Name: downstream_mitigation_measure; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.downstream_mitigation_measure (no_id, no_code, no_type, no_name) FROM stdin;
282	\N	downstream mitigation measure	Water intake
283	\N	downstream mitigation measure	Fish friendly turbine
284	\N	downstream mitigation measure	Fish adapted Management
\.


--
-- TOC entry 8060 (class 0 OID 2558514)
-- Dependencies: 382
-- Data for Name: ecological_productivity; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.ecological_productivity (no_id, no_code, no_type, no_name) FROM stdin;
215	\N	Ecological productivity	Unknown
216	\N	Ecological productivity	Good productivity
217	\N	Ecological productivity	Bad productivity
\.


--
-- TOC entry 8061 (class 0 OID 2558517)
-- Dependencies: 383
-- Data for Name: ecological_status_class; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.ecological_status_class (no_id, no_code, no_type, no_name) FROM stdin;
90	\N	Ecological status class	High
91	\N	Ecological status class	Good
92	\N	Ecological status class	Moderate
93	\N	Ecological status class	Poor
94	\N	Ecological status class	Unclassified
\.


--
-- TOC entry 8062 (class 0 OID 2558520)
-- Dependencies: 384
-- Data for Name: effort_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.effort_type (no_id, no_code, no_type, no_name) FROM stdin;
99	\N	Effort type	Unknown
100	\N	Effort type	Number of gear
101	\N	Effort type	Duration days
102	\N	Effort type	Area in square meters
103	\N	Effort type	Volume in cubic meters
104	\N	Effort type	Number gear par days
105	\N	Effort type	Number gear per month
\.


--
-- TOC entry 8063 (class 0 OID 2558523)
-- Dependencies: 385
-- Data for Name: electrofishing_mean; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.electrofishing_mean (no_id, no_code, no_type, no_name, ef_definition) FROM stdin;
70	\N	Electrofishing mean	Unknown	\N
71	\N	Electrofishing mean	By foot	\N
72	\N	Electrofishing mean	By boat	\N
73	\N	Electrofishing mean	Mix	\N
\.


--
-- TOC entry 8064 (class 0 OID 2558528)
-- Dependencies: 386
-- Data for Name: fisher_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.fisher_type (no_id, no_code, no_type, no_name) FROM stdin;
95	\N	Fisher type	Unknown
96	\N	Fisher type	Professional fishing
97	\N	Fisher type	Amateur fishing
98	\N	Fisher type	Other
\.


--
-- TOC entry 8065 (class 0 OID 2558531)
-- Dependencies: 387
-- Data for Name: fishway_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.fishway_type (no_id, no_code, no_type, no_name) FROM stdin;
270	VS	Fishway type	Vertical slot fishway
271	PO	Fishway type	Pool type fishway
272	FL	Fishway type	Fish lock
273	D	Fishway type	Denil pass
275	RR	Fishway type	Rock ramp
276	ER	Fishway type	Eel ramp
277	LA	Fishway type	Lateral canal
278	AR	Fishway type	Artificial river
279	?	Fishway type	Unknown
280	S	Fishway type	Sluice
274	L	Fishway type	Fish lift
\.


--
-- TOC entry 8066 (class 0 OID 2558534)
-- Dependencies: 388
-- Data for Name: gear_characteristic_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.gear_characteristic_type (no_id, no_code, no_type, no_name) FROM stdin;
200	\N	Gear characteristic type	Unknown
201	\N	Gear characteristic type	Stretched mesh size by the trap net
202	\N	Gear characteristic type	Sieve area by net
203	\N	Gear characteristic type	Net length
\.


--
-- TOC entry 8067 (class 0 OID 2558537)
-- Dependencies: 389
-- Data for Name: gear_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.gear_type (no_id, no_code, no_type, no_name, isscfg_code, main_gear, eel_specific_gear) FROM stdin;
106	\N	Gear type	Unknown	01.0.0	SURROUNDING NETS	\N
107	\N	Gear type	Surrounding Nets with Purse Lines (Purse Seines)	01.1.0	SURROUNDING NETS	\N
108	\N	Gear type	Surrounding Nets with Purse Lines - one boat	01.1.1	SURROUNDING NETS	\N
109	\N	Gear type	Surrounding Nets with Purse Lines - two boats 	01.1.2	SURROUNDING NETS	\N
110	\N	Gear type	Surrounding Nets without Purse Lines	01.2.0	SURROUNDING NETS	\N
111	\N	Gear type	Unknown	02.0.0	SEINE NETS	\N
112	\N	Gear type	Beach Seines	02.1.0	SEINE NETS	\N
113	\N	Gear type	Boat Seines	02.2.0	SEINE NETS	\N
114	\N	Gear type	Boat Seines	02.2.1	SEINE NETS	\N
115	\N	Gear type	Boat Seines	02.2.2	SEINE NETS	\N
116	\N	Gear type	Boat Seines	02.2.3	SEINE NETS	\N
117	\N	Gear type	Boat Seines	02.9.0	SEINE NETS	\N
118	\N	Gear type	Unknown	03.0.0	TRAWLS	\N
119	\N	Gear type	Unknown	03.1.0	TRAWLS	\N
120	\N	Gear type	Beam trawls	03.1.1	TRAWL NETS	\N
121	\N	Gear type	Bottom otter trawls	03.1.2	TRAWL NETS	\N
122	\N	Gear type	Bottom pair trawls	03.1.3	TRAWL NETS	\N
123	\N	Gear type	Unknown	03.1.4	TRAWLS	\N
124	\N	Gear type	Unknown	03.1.5	TRAWLS	\N
125	\N	Gear type	Unknown	03.1.9	TRAWLS	\N
126	\N	Gear type	Unknown	03.2.0	TRAWLS	\N
127	\N	Gear type	Midwater otter trawls	03.2.1	TRAWL NETS	\N
128	\N	Gear type	Midwater pair trawls	03.2.2	TRAWL NETS	\N
129	\N	Gear type	Unknown	03.2.3	TRAWLS	\N
130	\N	Gear type	Unknown	03.2.9	TRAWLS	\N
131	\N	Gear type	0tter Twin Trawls	03.3.0	TRAWL NETS	\N
132	\N	Gear type	0tter Twin Trawls	03.4.9	TRAWL NETS	\N
133	\N	Gear type	0tter Twin Trawls	03.5.9	TRAWL NETS	\N
134	\N	Gear type	0tter Twin Trawls	03.9.0	TRAWL NETS	\N
135	\N	Gear type	Boat Dredges	04.0.0	DREDGES	\N
136	\N	Gear type	Boat Dredges	04.1.0	DREDGES	\N
137	\N	Gear type	Hand Dredges	04.2.0	DREDGES	\N
138	\N	Gear type	Portable Lift Nets	05.0.0	LIFT NETS	\N
139	\N	Gear type	Portable Lift Nets	05.1.0	LIFT NETS	\N
140	\N	Gear type	Boat Operated Lift Nets	05.2.0	LIFT NETS	\N
141	\N	Gear type	Shore Operated Lift Nets	05.3.0	LIFT NETS	\N
142	\N	Gear type	Shore Operated Lift Nets	05.9.0	LIFT NETS	\N
143	\N	Gear type	Cast Nets	06.0.0	FALLING GEAR	\N
144	\N	Gear type	Cast Nets	06.1.0	FALLING GEAR	\N
145	\N	Gear type	Falling Gear (Not Specified)	06.9.0	FALLING GEAR	\N
146	\N	Gear type	Set Gillnets (Anchored)	07.0.0	GILLNETS AND ENTANGLING NETS	\N
147	\N	Gear type	Set Gillnets (Anchored)	07.1.0	GILLNETS AND ENTANGLING NETS	\N
148	\N	Gear type	Drifting Gillnets (Driftnets)	07.2.0	GILLNETS AND ENTANGLING NETS	\N
149	\N	Gear type	Encircling gillnets	07.3.0	GILLNETS AND ENTANGLING NETS	\N
150	\N	Gear type	Fixed Gillnets (on Stakes)	07.4.0	GILLNETS AND ENTANGLING NETS	\N
151	\N	Gear type	Trammel Nets	07.5.0	GILLNETS AND ENTANGLING NETS	\N
152	\N	Gear type	Trammel Nets	07.6.0	GILLNETS AND ENTANGLING NETS	\N
153	\N	Gear type	Trammel Nets	07.9.0	GILLNETS AND ENTANGLING NETS	\N
154	\N	Gear type	Trammel Nets	07.9.1	GILLNETS AND ENTANGLING NETS	\N
155	\N	Gear type	Unknown	08.0.0	TRAPS	\N
156	\N	Gear type	Stationary Uncovered Pound Nets	08.1.0	TRAPS	\N
157	\N	Gear type	Pots	08.2.0	TRAPS	Eel pots
158	\N	Gear type	Fyke Nets	08.3.0	TRAPS	Eel fyke nets
159	\N	Gear type	Stow Nets	08.4.0	TRAPS	Dideau
160	\N	Gear type	Barriers, Fences, Weirs, Corrals, etc.	08.5.0	TRAPS	\N
161	\N	Gear type	Aerial Traps	08.6.0	TRAPS	\N
162	\N	Gear type	Aerial Traps	08.9.0	TRAPS	\N
163	\N	Gear type	Handlines and Pole-Lines (Hand Operated)	09.0.0	HOOKS AND LINES	\N
164	\N	Gear type	Handlines and Pole-Lines (Hand Operated)	09.1.0	HOOKS AND LINES	\N
165	\N	Gear type	Handlines and Pole-Lines (Mechanized)	09.2.0	HOOKS AND LINES	\N
166	\N	Gear type	Set Longlines	09.3.0	HOOKS AND LINES	\N
167	\N	Gear type	Drifting Longlines	09.4.0	HOOKS AND LINES	\N
168	\N	Gear type	Longlines (Not Specified)	09.5.0	HOOKS AND LINES	\N
169	\N	Gear type	Trolling Lines	09.6.0	HOOKS AND LINES	\N
170	\N	Gear type	Trolling Lines	09.9.0	HOOKS AND LINES	\N
171	\N	Gear type	Unknown	10.0.0	GRAPPLING AND WOUNDING	\N
172	\N	Gear type	Harpoons	10.1.0	GRAPPLING AND WOUNDING	\N
173	\N	Gear type	Pumps	11.0.0	HARVESTING GEAR	\N
174	\N	Gear type	Pumps	11.1.0	HARVESTING GEAR	\N
175	\N	Gear type	Mechanized Dredges	11.2.0	HARVESTING GEAR	\N
176	\N	Gear type	Pumps	11.9.0	HARVESTING GEAR	\N
177	\N	Gear type	Miscellaneous	20.0.0	MISCELLANEOUS	Glass eel scoop net and push net
178	\N	Gear type	Recreational fishing gear	25.0.0	RECREATIVE FISHING GEAR	\N
179	\N	Gear type	Unknown	99.0.0	UNKNOWN	\N
\.


--
-- TOC entry 8068 (class 0 OID 2558540)
-- Dependencies: 390
-- Data for Name: habitat_loss_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.habitat_loss_type (no_id, no_code, no_type, no_name) FROM stdin;
190	\N	Habitat loss type	Unknown
191	\N	Habitat loss type	Marshland
192	\N	Habitat loss type	Lake
193	\N	Habitat loss type	Sea
194	\N	Habitat loss type	Estuary
195	\N	Habitat loss type	River
\.


--
-- TOC entry 8069 (class 0 OID 2558543)
-- Dependencies: 391
-- Data for Name: individual_status; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.individual_status (no_id, no_code, no_type, no_name) FROM stdin;
49	\N	Individual status	Alive
50	\N	Individual status	Dead
51	\N	Individual status	extracted from the aqu. env.
52	\N	Individual status	added to the aquatic env.
53	\N	Individual status	Other
\.


--
-- TOC entry 8070 (class 0 OID 2558546)
-- Dependencies: 392
-- Data for Name: migration_direction; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.migration_direction (no_id, no_code, no_type, no_name) FROM stdin;
204	\N	Migration direction	Unknown
205	\N	Migration direction	Upstream migration
206	\N	Migration direction	Downstream migration
\.


--
-- TOC entry 8071 (class 0 OID 2558549)
-- Dependencies: 393
-- Data for Name: mortality_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.mortality_type (no_id, no_code, no_type, no_name) FROM stdin;
184	\N	Mortality type	Unknown
185	\N	Mortality type	Natural
186	\N	Mortality type	Total anthropogenic mortality
187	\N	Mortality type	Total mortality
188	\N	Mortality type	Fishing Mortality
189	\N	Mortality type	Anthropogenic mortality other than fishing
\.


--
-- TOC entry 8054 (class 0 OID 2558478)
-- Dependencies: 372
-- Data for Name: nomenclature; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.nomenclature (no_id, no_code, no_type, no_name) FROM stdin;
\.


--
-- TOC entry 8073 (class 0 OID 2558553)
-- Dependencies: 395
-- Data for Name: observation_origin; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.observation_origin (no_id, no_code, no_type, no_name) FROM stdin;
11	\N	Observation origin	Raw data
12	\N	Observation origin	Modelling result
\.


--
-- TOC entry 8074 (class 0 OID 2558556)
-- Dependencies: 396
-- Data for Name: observation_place_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.observation_place_type (no_id, no_code, no_type, no_name, obs_subtype_name) FROM stdin;
1	\N	Observation place	Unknown	Unknown
2	\N	Observation place	Country	Administrative
3	\N	Observation place	Region	Administrative
4	\N	Observation place	River Basin District	Administrative
5	\N	Observation place	EMU	Administrative
6	\N	Observation place	Waterbody	Geographic
7	\N	Observation place	River Basin	Geographic
8	\N	Observation place	River	Geographic
9	\N	Observation place	River stretch	Geographic
10	\N	Observation place	Sampling station	Geographic
281	\N	Observation place	Obstacle location	Geographic
\.


--
-- TOC entry 8075 (class 0 OID 2558559)
-- Dependencies: 397
-- Data for Name: observation_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.observation_type (no_id, no_code, no_type, no_name, obs_type_class_name) FROM stdin;
13	\N	Observation Type	Unknown	Unknown
14	\N	Observation Type	Pression - Impact	Pression - Impact
15	\N	Observation Type	Habitat loss	Pression - Impact
16	\N	Observation Type	Obstruction	Pression - Impact
17	\N	Observation Type	Stocking	Pression - Impact
18	\N	Observation Type	Predation	Pression - Impact
19	\N	Observation Type	Ecological status	Pression - Impact
20	\N	Observation Type	Scientific Observation	Scientific Observation
21	\N	Observation Type	Gear fishing	Scientific Observation
22	\N	Observation Type	Electro-fishing	Scientific Observation
23	\N	Observation Type	Migration monitoring	Scientific Observation
24	\N	Observation Type	Biological process	Biological process
25	\N	Observation Type	Migration	Biological process
26	\N	Observation Type	Maturation	Biological process
27	\N	Observation Type	Growth	Biological process
28	\N	Observation Type	Mortality	Biological process
29	\N	Observation Type	Differentiation	Biological process
\.


--
-- TOC entry 8076 (class 0 OID 2558562)
-- Dependencies: 398
-- Data for Name: obstruction_impact; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.obstruction_impact (no_id, no_code, no_type, no_name) FROM stdin;
287	LI	Obstruction impact	Barrier passable with Limited Impact (source ICE)
288	SO	Obstruction impact	Partial barrier with Some Impact (source ICE)
289	MA	Obstruction impact	Partial barrier with Major Impact (source ICE)
290	TO	Obstruction impact	Total barrier (source ICE)
208	NA	Obstruction impact	Unknown
209	0	Obstruction impact	Unobtrusive and/or no barrier
210	1	Obstruction impact	Passable without apparent difficulty
211	2	Obstruction impact	Passable with some risk of delay
212	3	Obstruction impact	Difficult to pass
213	4	Obstruction impact	Very difficult to pass
214	5	Obstruction impact	Impassable
267	LO	Obstruction impact	Low (scale with three categories)
268	ME	Obstruction impact	Medium (scale with three categories)
269	HI	Obstruction impact	High (scale with three categories)
\.


--
-- TOC entry 8077 (class 0 OID 2558565)
-- Dependencies: 399
-- Data for Name: obstruction_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.obstruction_type (no_id, no_code, no_type, no_name) FROM stdin;
218	UN	Obstruction type	Unknown
291	DA	Obstruction_type	Dam
292	WE	Obstruction_type	Weir
293	RR	Obstruction_type	Rock ramp
294	CU	Obstruction_type	Culvert
295	FO	Obstruction_type	Ford
296	BR	Obstruction_type	Bridge
297	OT	Obstruction_type	Other
298	DI	Obstruction_type	Dike
299	GR	Obstruction_type	Grid
219	PU	Obstruction type	Physical obstruction (Unknown)
220	CH	Obstruction type	Chemical obstruction
300	PP	Obstruction_type	Penstock Pipe
\.


--
-- TOC entry 8078 (class 0 OID 2558568)
-- Dependencies: 400
-- Data for Name: orient_flow; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.orient_flow (no_id, no_code, no_type, no_name) FROM stdin;
238	1	orient_flow	[70-90°]
239	2	orient_flow	[50-70°[
240	3	orient_flow	[30-50°[
241	4	orient_flow	<30°
\.


--
-- TOC entry 8079 (class 0 OID 2558571)
-- Dependencies: 401
-- Data for Name: period_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.period_type (no_id, no_code, no_type, no_name) FROM stdin;
74	\N	Period type	Unknown
75	\N	Period type	Daily
76	\N	Period type	Weekly
77	\N	Period type	Semimonthly
78	\N	Period type	Monthly
79	\N	Period type	Bimonthly
80	\N	Period type	Quaterly
81	\N	Period type	Half-yearly
82	\N	Period type	Yearly
83	\N	Period type	Other
\.


--
-- TOC entry 8080 (class 0 OID 2558574)
-- Dependencies: 402
-- Data for Name: predation_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.predation_type (no_id, no_code, no_type, no_name) FROM stdin;
221	\N	Predation type	Unknown
222	\N	Predation type	fishery
223	\N	Predation type	wildlife
\.


--
-- TOC entry 8081 (class 0 OID 2558577)
-- Dependencies: 403
-- Data for Name: predator_subtype; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.predator_subtype (no_id, no_code, no_type, no_name) FROM stdin;
207	\N	Predator_subtype	Cormorant
\.


--
-- TOC entry 8082 (class 0 OID 2558580)
-- Dependencies: 404
-- Data for Name: scientific_observation_method; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.scientific_observation_method (no_id, no_code, no_type, no_name, sc_observation_category, sc_definition) FROM stdin;
68	\N	Scientific observation type	Unknown	Gear fishing	\N
69	\N	Scientific observation type	Unknown	Migration monitoring	\N
60	NA	Scientific observation type	Unknown	Unknown	Unknown scientific observation of unknown category
61	UN	Scientific observation type	Unknown	Electro-fishing	Electrofishing, method unknown
62	WH	Scientific observation type	Whole	Electro-fishing	Electrofishing, full two pass by foot
63	P1	Scientific observation type	Partial1bank	Electro-fishing	Electrofishing, partial on one bank
64	P2	Scientific observation type	Partial2banks	Electro-fishing	Electrofishing, partial on two banks
65	PR	Scientific observation type	Partialrandom	Electro-fishing	Electrofishing, partial random
66	PR	Scientific observation type	Partialprop	Electro-fishing	Electrofishing, partial proportional
67	OT	Scientific observation type	Other	Electro-fishing	Electrofishing, other method
301	DH	Scientific_observation_type	Deep habitat	Electro-fishing	Normalized method for deep habitat (Belliard et al.,2018)
302	WE	Scientific_observation_type	Whole eel	Electro-fishing	Electrofishing, whole eel specific
303	PE	Scientific_observation_type	Point sampling eel	Electro-fishing	Electrofishing, eel specific point sampling (Germis, 2009)
305	BB	Scientific_observation_type	Boom boat	Electro-fishing	Boom boat (Pulsed)
304	TE	Scientific_observation_type	TEF	Electro-fishing	Timed electrofishing, 10 min in Ireland
306	EP	Scientific_observation_type	EPA	Electro-fishing	Partial point sampling with density current, protocol Feunteun, Rigaud
\.


--
-- TOC entry 8083 (class 0 OID 2558585)
-- Dependencies: 405
-- Data for Name: sex; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.sex (no_id, no_code, no_type, no_name) FROM stdin;
180	\N	Sex	Unknown
181	\N	Sex	male
182	\N	Sex	female
183	\N	Sex	Unidentifed
\.


--
-- TOC entry 8056 (class 0 OID 2558489)
-- Dependencies: 375
-- Data for Name: species; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.species (no_id, no_code, no_type, no_name, sp_vernacular_name) FROM stdin;
30	\N	Species	Anguilla anguilla	Eel
\.


--
-- TOC entry 8084 (class 0 OID 2558588)
-- Dependencies: 406
-- Data for Name: stage; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.stage (no_id, no_code, no_type, no_name) FROM stdin;
224	\N	Stage	Unknown
225	\N	Stage	Glass eel
226	\N	Stage	Yellow eel
227	\N	Stage	Silver eel
228	\N	Stage	Glass & yellow eel mixed
229	\N	Stage	Yellow & silver eel mixed
230	\N	Stage	G, Y & S eel mixed
\.


--
-- TOC entry 8085 (class 0 OID 2558591)
-- Dependencies: 407
-- Data for Name: turbine_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.turbine_type (no_id, no_code, no_type, no_name) FROM stdin;
242	\N	Turbine type	Horizontal axis Kaplan (bulb)
243	\N	Turbine type	Other (please specify)
244	\N	Turbine type	Double Francis (spiral case)
245	\N	Turbine type	Francis unspecified
246	\N	Turbine type	Turbine with fixed blade propeller and vertical axis
247	\N	Turbine type	Kaplan not specified
248	\N	Turbine type	Pelton
249	\N	Turbine type	Reversible
250	\N	Turbine type	Kaplan (model of S-turbine)
251	\N	Turbine type	Turbine with fixed blade propeller and horizontal axis
252	\N	Turbine type	Unknown
253	\N	Turbine type	Vertical axis Kaplan
254	\N	Turbine type	Francis without volute
255	\N	Turbine type	Francis (spiral case)
256	\N	Turbine type	Banki-Michell (cross-flow)
257	\N	Turbine type	VLH
258	\N	Turbine type	Archimedean screw turbine
259	\N	Turbine type	Water wheel turbine (aqualienne)
260	\N	Turbine type	Water wheel turbine (others)
261	\N	Turbine type	Propeller unspecified
\.


--
-- TOC entry 8086 (class 0 OID 2558594)
-- Dependencies: 408
-- Data for Name: type_of_unit; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.type_of_unit (no_id, no_code, no_type, no_name, tu_unit) FROM stdin;
196	\N	Type of unit	Unknown	Unknown
197	\N	Type of unit	Area	m2
198	\N	Type of unit	Linear	m
199	\N	Type of unit	Percent	%
\.


--
-- TOC entry 8057 (class 0 OID 2558492)
-- Dependencies: 376
-- Data for Name: value_type; Type: TABLE DATA; Schema: dbmig_nomenclature; Owner: postgres
--

COPY dbmig_nomenclature.value_type (no_id, no_code, no_type, no_name) FROM stdin;
54	\N	Value type	Unknown
55	\N	Value type	Raw data or Individual data
56	\N	Value type	Mean value
57	\N	Value type	Class value
58	\N	Value type	Elaborated data
59	\N	Value type	Cumulated data
\.


--
-- TOC entry 8092 (class 0 OID 0)
-- Dependencies: 394
-- Name: nomenclature_no_id_seq; Type: SEQUENCE SET; Schema: dbmig_nomenclature; Owner: postgres
--

SELECT pg_catalog.setval('dbmig_nomenclature.nomenclature_no_id_seq', 303, false);


-- Completed on 2023-08-01 21:04:19 CEST

--
-- PostgreSQL database dump complete
--

