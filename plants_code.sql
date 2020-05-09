--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Ubuntu 11.5-3.pgdg16.04+1)
-- Dumped by pg_dump version 11.5 (Ubuntu 11.5-3.pgdg16.04+1)

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: adversereactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adversereactions (
    arcode smallint NOT NULL,
    arname character varying(100)
);


ALTER TABLE public.adversereactions OWNER TO postgres;

--
-- Name: chimicalcomponent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chimicalcomponent (
    ccname character varying(100) NOT NULL,
    formula character varying(250)
);


ALTER TABLE public.chimicalcomponent OWNER TO postgres;

--
-- Name: contraindications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contraindications (
    cicode smallint NOT NULL,
    ciname character varying(100)
);


ALTER TABLE public.contraindications OWNER TO postgres;

--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    countryname character varying(100) NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: dialect; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dialect (
    dialectname character varying(100) NOT NULL
);


ALTER TABLE public.dialect OWNER TO postgres;

--
-- Name: family; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family (
    familyname character varying(100) NOT NULL
);


ALTER TABLE public.family OWNER TO postgres;

--
-- Name: nameindialect; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nameindialect (
    name character varying(100) NOT NULL,
    dialectname character varying(100) NOT NULL,
    countryname character varying(100) NOT NULL,
    botanicname character varying(100) NOT NULL
);


ALTER TABLE public.nameindialect OWNER TO postgres;

--
-- Name: plant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plant (
    botanicname character varying(100) NOT NULL,
    speciesname character varying(100),
    geographic character varying(100),
    conservation character varying(100),
    description character varying(250),
    ethnomedicaluse character varying(250)
);


ALTER TABLE public.plant OWNER TO postgres;

--
-- Name: plantadversereactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plantadversereactions (
    botanicname character varying(100) NOT NULL,
    arcode smallint NOT NULL
);


ALTER TABLE public.plantadversereactions OWNER TO postgres;

--
-- Name: plantcomponents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plantcomponents (
    botanicname character varying(100) NOT NULL,
    ccname character varying(100) NOT NULL
);


ALTER TABLE public.plantcomponents OWNER TO postgres;

--
-- Name: plantcontraindications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plantcontraindications (
    botanicname character varying(100) NOT NULL,
    cicode smallint NOT NULL
);


ALTER TABLE public.plantcontraindications OWNER TO postgres;

--
-- Name: plantpart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plantpart (
    partname character varying(100) NOT NULL
);


ALTER TABLE public.plantpart OWNER TO postgres;

--
-- Name: plantsinrecipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plantsinrecipe (
    recipecode character varying(100) NOT NULL,
    botanicname character varying(100) NOT NULL,
    partname character varying(100) NOT NULL,
    quantity numeric(8,2)
);


ALTER TABLE public.plantsinrecipe OWNER TO postgres;

--
-- Name: planttherapeuticactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planttherapeuticactions (
    tacode smallint NOT NULL,
    botanicname character varying(100) NOT NULL
);


ALTER TABLE public.planttherapeuticactions OWNER TO postgres;

--
-- Name: planttherapeuticindications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planttherapeuticindications (
    ticode smallint NOT NULL,
    botanicname character varying(100) NOT NULL
);


ALTER TABLE public.planttherapeuticindications OWNER TO postgres;

--
-- Name: plantusageprecaution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plantusageprecaution (
    botanicname character varying(100) NOT NULL,
    precautioncode smallint NOT NULL,
    observations character varying(250)
);


ALTER TABLE public.plantusageprecaution OWNER TO postgres;

--
-- Name: recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipe (
    recipecode character varying(100) NOT NULL
);


ALTER TABLE public.recipe OWNER TO postgres;

--
-- Name: recipeadversereactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipeadversereactions (
    arcode smallint NOT NULL,
    recipecode character varying(100) NOT NULL
);


ALTER TABLE public.recipeadversereactions OWNER TO postgres;

--
-- Name: recipecontraindications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipecontraindications (
    recipecode character varying(100) NOT NULL,
    cicode smallint NOT NULL
);


ALTER TABLE public.recipecontraindications OWNER TO postgres;

--
-- Name: recipetherapeuticindication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipetherapeuticindication (
    recipecode character varying(100) NOT NULL,
    ticode smallint NOT NULL
);


ALTER TABLE public.recipetherapeuticindication OWNER TO postgres;

--
-- Name: species; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.species (
    speciesname character varying(100) NOT NULL,
    familyname character varying(100)
);


ALTER TABLE public.species OWNER TO postgres;

--
-- Name: specimen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specimen (
    specimencode character varying(30) NOT NULL,
    countryname character varying(100),
    botanicname character varying(100)
);


ALTER TABLE public.specimen OWNER TO postgres;

--
-- Name: therapeuticactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.therapeuticactions (
    tacode smallint NOT NULL,
    taname character varying(100)
);


ALTER TABLE public.therapeuticactions OWNER TO postgres;

--
-- Name: therapeuticindication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.therapeuticindication (
    ticode smallint NOT NULL,
    tiname character varying(100)
);


ALTER TABLE public.therapeuticindication OWNER TO postgres;

--
-- Name: tmp_nameindialect; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tmp_nameindialect (
    name character varying(100) NOT NULL,
    dialectname character varying(100),
    countryname character varying(100),
    botanicname character varying(100)
);


ALTER TABLE public.tmp_nameindialect OWNER TO postgres;

--
-- Name: usageprecaution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usageprecaution (
    precautioncode smallint NOT NULL,
    precautiondescription character varying(250)
);


ALTER TABLE public.usageprecaution OWNER TO postgres;

--
-- Data for Name: adversereactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adversereactions (arcode, arname) FROM stdin;
\.


--
-- Data for Name: chimicalcomponent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chimicalcomponent (ccname, formula) FROM stdin;
Gallic acid	\N
Arabic acid	\N
Chlorogenic acid	\N
Leucoanthocyanidin	\N
3-beta-acetoxy-17-beta-hydroxyandrost-5-ene	\N
Glucuroric acid	\N
Vitamin C	\N
Vitamin A	\N
Threonine	\N
Linoleic acid	\N
Conyzorygun	\N
Chromene	\N
Kaempferol	\N
Eugenol	\N
Alchornine	\N
Cadinol	\N
Caryophyllene	\N
Endo-alpha-bergamotene	\N
Allicin	\N
Ajoene	\N
Diallyl disulfide	\N
Diallyl trisulfide	\N
Aloe emodin	\N
Aloin	\N
Isobarbaloin	\N
Anthranol	\N
Echitamine	\N
Echitamidine	\N
Beta-amyrin	\N
Lupeol	\N
Ursolic acid	\N
Berberine	\N
Protopine	\N
Allocryptopine	\N
Sanguinarine	\N
Azadirachtin	\N
Gedunin	\N
6-Methyldiosgenin	\N
Balanitin-3	\N
Balanitoside	\N
Quercitrin	\N
Myricitrin	\N
Caffeic acid	\N
Cotinine	\N
Campesterol	\N
Benzyl glucosinolate	\N
Myosmine	\N
Carpaine	\N
Quinine	\N
Quinidine	\N
Cinchonine	\N
Cinchonidine	\N
Cryptolepine	\N
Hydroxycryptolepine	\N
Cryptoheptine	\N
Quindoline	\N
Citronellal	\N
Camphene	\N
Citral	\N
Geraniol	\N
Quercetin	\N
Quercitin	\N
Rutin	\N
Phorbol	\N
Quinovic acid	\N
Zygophyloside A	\N
Zygophyloside B	\N
Obacunone	\N
Friedelanone	\N
Protocatechuic acid	\N
Hibiscus acid	\N
Betulinic acid	\N
Aesculetin	\N
Scoparone	\N
Methyl angolensate	\N
Khayalenoid E	\N
Lawsone	\N
Laxathone 1	\N
Esculetin	\N
Scopoletin	\N
Lacoumarin	\N
Linalool	\N
Myrtenol	\N
Limonoid	\N
Terpineol	\N
Unermiside I	\N
Unermiside II	\N
Uncarine	\N
Rotundifoline	\N
Charatin	\N
Momordicin	\N
Momorcharin	\N
Viclue	\N
Ursolic	\N
3-hydroxy-1-methoxy-2-methylanthraquinone	\N
Damnacanthal	\N
3-hydroxy-1-methoxy-3-methylanthraquinone	\N
4-(4'-O-acetyl-a-L-rhamnosyloxy) benzyl isothiocyanate	\N
4-(a-L-rahmnopyranosyloxy) benzyl isothiocyanate	\N
4-(a-l-rhamnopyranosyloxy) benzyl glucosinolate	\N
Pterygospermin	\N
Benzyl isothiocyanate	\N
Niazimicin	\N
4-methoxycinnamaldehyde	\N
Cuminaldehyde	\N
Anethole	\N
Limonene	\N
Methyl cinnamate	\N
Estragole	\N
Thymol	\N
Camphor	\N
Securinine	\N
Phyllanthin	\N
Hypophyllanthin	\N
Methyl salicylate	\N
Phytolaccoside B	\N
Bayogenin	\N
Oleanolic acid	\N
Hederagenin	\N
Afromosin	\N
Friedelin	\N
Pterocarpin	\N
Epicatechin	\N
Alstonine	\N
Rescinnamine	\N
Serpentine	\N
Reserpine	\N
Nauclefidine	\N
Naucletine	\N
Valencene	\N
Alloaromadendrene	\N
Alloaromadendrene epoxide	\N
Epi-alpha-selinene	\N
14-Hydroxy-alpha-humulene	\N
Scopadulin	\N
Scopadulcic acid B	\N
Scoparic acid	\N
Scopadulic acid A	\N
Ifflaionic acid	\N
Sinapic acid	\N
2-hydroxy-6-methoxy benzoic acid methyl ester	\N
Racine alkaloid	\N
Methyl-2-hydroxy-6-methoxybenzoate	\N
Emodin	\N
Chrysophanol	\N
Emodin-8-glucose	\N
Franguilin A	\N
Senoside A	\N
Senoside B	\N
Chrysophanic acid anthrone	\N
Anthraquinone	\N
Geraniin	\N
Zeaxanthin	\N
Mimosine	\N
Aridanin	\N
2, 2', 4'-trihydroxychalcone	\N
4', 5, 7-trihydroxyflavanone	\N
2', 3, 4, 4'-tetrahydroxychalcone	\N
Palmatine	\N
Tinosporafuranol	\N
Tinosporide	\N
Vernodalol	\N
Vernolepin	\N
Vernolide	\N
Vernodalin	\N
Vernonioside D	\N
Nitidine chloride	\N
Fagaronine	\N
Fagaridine	\N
Skimmianine	\N
Zingiberine	\N
6-Gingerol	\N
Inermiside I	\N
Inermiside II	\N
Charantin	\N
2-hydroxy-1-methoxy-3-methylanthraquinone	\N
Scopadulcic acid A	\N
Racine alkaloids	\N
Allo-hydroxycitric acid	\N
\.


--
-- Data for Name: contraindications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contraindications (cicode, ciname) FROM stdin;
1	a mother who is producing milk and breastfeeding
2	A Rupture in the Wall of the Stomach or Intestine
3	Abnormal EKG with QT changes from Birth
4	abnormal heart rhythm
5	abnormal liver function tests
6	Abnormal Movements of Face Muscles and Tongue
7	abnormally low blood pressure
8	Acute Inflammation of the Pancreas
9	acute thromboembolic stroke
10	alcohol intoxication
11	alcoholism
12	Allergies:
13	Alzheimer's disease
14	Anemia
15	Anemia from Pyruvate Kinase and G6PD Deficiencies
16	Arginase Deficiency
17	Ascorbic Acid (Vitamin C)
18	aspirin exacerbated respiratory disease
19	asthma
20	At Risk for Formation of Blood Clots
21	atypical femoral fracture
22	avascular necrosis of bone
23	Barrett's Esophagus
24	Bedridden Patient or One Unable to Move Around Freely
25	Behaving with Excessive Cheerfulness and Activity
26	Bleeding of the Stomach or Intestines
27	Blockage of the Esophagus
28	Blocked Bowels with Decreased Peristaltic Movement
29	Blood Clot
30	blood clot in a deep vein of the extremities
31	Blood Clotting Disorder - Von Willebrand's Disease
32	Blood Pressure Drop Upon Standing
33	Blood Pressure Drop Upon Standing
34	bone necrosis of the jaw bone
35	breast cancer
36	Broken Bone due to Disease or Illness
37	Burning Stomach
38	Cancer in the Lining of the Uterus
39	cancer of the ovary
40	Cannot Empty Bladder
41	Cataracts
42	chronic heart failure
43	Chronic Lung Disease
44	Citrullinemia
45	closed angle glaucoma
46	condition caused by low levels of parathyroid hormone
47	confused
48	constipation
49	coronary artery disease
50	Damage to Stomach Lining
51	Decrease in the Blood-Clotting Protein Prothrombin
52	Decreased Blood Platelets
53	Decreased Calcification or Density of Bone
54	decreased function of bone marrow
55	Decreased Lung Function
56	Decreased Motility Function of Stomach or Intestines
57	Decreased Neutrophils a Type of White Blood Cell
58	decreased white blood cells
59	Deficiency of Anti-Clotting Agents
60	Deficiency of Granulocytes a Type of White Blood Cell
61	Dementia in an Elderly Person
62	depression
63	Diabetes
64	Difficulty Swallowing
65	Dilated Cardiomyopathy
66	Disease of Inadequate Blood Flow to the Heart Muscle
67	Disease of the Gallbladder
68	Disorder of Mental Processes due to a Brain Disease
69	Disorder of the Blood Vessels of the Brain
70	Diverticulitis
71	drug abuse
72	Enlarged Prostate
73	excessive fat in the blood
74	Exposure to the Chickenpox
75	Exposure to the Measles
76	Extreme Loss of Body Water
77	Failure of Esophageal Sphincter to Relax
78	Family History of Breast Cancer
79	Gout
80	Hardening of the Liver
81	having thoughts of suicide
82	heart attack
83	Hemophilia
84	Hepatic Porphyria
85	herpes simplex infection
86	herpes simplex infection of the eye
87	high amount of calcium in the blood
88	high amount of oxalic acid in the urine
89	high amount of triglyceride in the blood
90	high blood pressure
91	High Blood Sugar
92	high cholesterol
93	history of gastric bypass surgery
94	Hyperammonemia associated with N-acetylglutamate synthase deficiency
95	hypothyroidism
96	Impacted Stool
97	inactive tuberculosis
98	Inadequate Vitamin K
99	Increased Cardiovascular Event Risk
100	Increased Eosinophils in the Blood
101	Increased Pressure in the Eye
102	increased risk of bleeding
103	increased risk of bleeding due to clotting disorder
104	increased risk of blood clotting
105	Infection caused by the Varicella Zoster Virus
106	Inflammation of Duodenum or Top Portion of Small Intestine
107	Inflammation of the Esophagus
108	Inflammation of the Middle Tissue Heart Muscle
109	Inflammation of the Tissues Surrounding a Tooth
110	Inherited Deficiency of Arginosuccinate Lyase
111	Inherited Deficiency of Carbamyl Phosphate Synthetase
112	Inherited Disorder of Continuing Episodes of Swelling
113	Insufficiency of the Hypothalamus and Pituitary Gland
114	intestinal infection caused by the roundworm Strongyloides
115	Invasive Dental Procedure
116	Iron Metabolism Disorder causing Increased Iron Storage
117	Joint Pain
118	kidney disease with likely reduction in kidney function
119	kidney disease with reduction in kidney function
120	kidney disease with reduction in kidney function
121	liver problems
122	low amount of calcium in the blood
123	low amount of sodium in the blood
124	Lower Seizure Threshold
125	lung embolism
126	malignant melanoma
127	Measles
128	Migraine Headache
129	Mild Degree of Mania
130	Mild to Moderate Kidney Impairment
131	Muscle Pain
132	Muscle Pain or Tenderness with Increase Creatine Kinase
133	muscle problems
134	Muscle Wasting
135	Neuroleptic Malignant Syndrome
136	Obstruction of a Blood Vessel by a Blood Clot
137	Optic Disk Edema
138	Ornithine Carbamoyltransferase Deficiency
139	Osteoporosis
140	overweight
141	Paralysis of the Intestines
142	Parkinson Symptoms
143	Porphyria
144	pregnancy
145	Presence of Polyps in the Nose
146	Problems with Food Passing Through the Esophagus
147	prolonged QT interval on EKG
148	Protein C Deficiency Disease
149	psychotic disorder
150	recent operation
151	reduction in the body's resistance to infection
152	retinal thrombosis
153	Reye's Syndrome
154	risk of angle-closure glaucoma due to narrow angle of anterior chamber of eye
155	Rupture of a Tendon
156	seizures
157	serotonin syndrome - adverse drug interaction
158	severe liver disease
159	Severe Mental Disorder with Loss of Personality & Reality
160	severe renal impairment
161	Severe Uncontrolled High Blood Pressure
162	Severely Decreased Levels of Neutrophils in the Blood
163	Sickle Cell Anemia
164	Sinus Tachycardia
165	Slow Heartbeat
166	Stomach Cancer
167	Stomach or Intestinal Ulcer
168	Stomach or Intestine Blockage
169	Stool Blockage of the Intestine
170	Stricture of Esophagus
171	stroke
172	Surgical Joining of Two Parts of the Intestine
173	Susceptible to Breathing Fluid Into Lungs
174	Syndrome of Inappropriate Antidiuretic Hormone Secretion
175	Systemic Lupus Erythematosus
176	systemic mastocytosis
177	Temporarily Stops Breathing While Sleeping
178	Thrombotic Thrombocytopenic Purpura
179	Time Immediately after Coronary Bypass Surgery
180	tobacco smoking
181	Tumor that is Dependent on Estrogen for Growth
182	Ulcer from Stomach Acid
183	Ulcers of Esophagus
184	unspecified lump in breast
185	Untreated Systemic Fungal Infection
186	Untreated Tuberculosis
187	uterine fibroid
188	Very Rapid Heartbeat - Torsades de Pointes
189	Visible Water Retention
190	Visible Water Retention
191	weight gain
192	weight loss
193	Wide-Angle Glaucoma
194	Diarrhea
195	Child under 12
196	Babies
197	Prostate diseases
198	Prostate cancer
199	Diseased or damaged skin
200	Intestinal obstruction or stenosis
201	Sluggish
202	Severe dehydration with electrolyte depletion or chronic constipation,
203	Inflammatory bowel diseases
204	Ulcerative colitis
205	Irritable bowel syndrome
206	Children under 10 years old
207	Children
208	Renal disease known or hepatic
209	hypoglycemia
210	Seniors
211	Renal or hepatic impairment
212	hypotension
213	Anticoagulant drugs
214	Low sperm count
215	Gastric ulceration
216	Bronchodilatators
217	Hepatobiliary patients known
218	Patients with orthostatic hypotension.
219	high doses
220	Antihypertensive drugs
221	Persons with erythrocyte glucose 6-phosphate dehydrogenase genetic deficiency
222	Suspected of potentiating insulin and antidiabetic drugs
223	Cardiac disorders and / or heart medications
224	Uterine inertia
225	Urinary retention
226	Antidepressant
227	Barbiturate
228	Rectal bleeding
229	Appendicitis
230	Hemorrhoids
231	Bowel obstruction
232	Diuretic
233	Corticotherapy or digoxin
234	Hypermobility of the intestine
235	Patients who have difficulty breathing
236	Reactive and allergic skin
237	Infections of the tooth
238	Patients sensitive to its particular smell
239	Nephritis
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (countryname) FROM stdin;
Benin
Burkina Faso
Cabo Verde
Côte d'Ivoire
Gambia
Ghana
Guinea
Guinea-Bissau
Liberia
Mali
Mauritania
Niger
Nigeria
Senegal
Sierra Leone
Togo
\.


--
-- Data for Name: dialect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dialect (dialectname) FROM stdin;
Mossi
Gourmanchéma
Akan
Dan
Igbo
Manding Mandinka
Fante
Mandinka
Basa
Mano
Mende
Nima
Fula Fulfulde
Gwari
Ando
Songhai
Vulgar Balanta
Hausa
Manding Bambara
Kanuri
Mandigo
Bulom
Bissa
Yoruba
Susu
Maninka
Loma
Banyun
Akasselem
Banyan
Balanta
Badyara
Kpèlè
Dagbani
Fon
Serer
Tem
Bambara
Baule
Fula
Twi
Manding
Basari
Krio
Kulango
Gbe Fo
Bassar
Igbo (Ogwashi)
Koranko
Konyagi
Igbo (Owerri)
Mendu
Krou Bété
Dyula
Kabiyè
Gagu
Edo
Akyé
Tamachek
Kirma
Nzema
Engenni
Mina
Dagaare
Baoule
Anyi
Diola Flup
Bulom (Kim)
Agni
Vulgar
Temne
Guéré
Lamba
Noms
Diola
Kono
Madingo
Akyem
Crioulo
Susu Dyalonke
Asante
Ga Adangbe
Kru Guera(Krahn)
Abe
Adja
Soce
Ibo
Abbey
Gagou
Dende
Kalango
Adioukrou
Goun
Dendi
Ibibio
Fula Pulaar
Ga
Peulh
Ouatchi
Brong
Senufo Dyimini
Senoufo
Baatonun
Hono
Bobo
Ewe
Pular
Konkomba
Loko
Moba
Wolof
Dioula
Fulfulde
Malinke
Dogons
Djerma
Sisaala
Arabic
Nawdem
Kissi
Limba
Tukulor
\.


--
-- Data for Name: family; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family (familyname) FROM stdin;
Acanthaceae
Acanthacease
Acantuaceae
Adeantaceae
Adiantaceae
Agavaceae
Amaranthaceae
Amaryllidaceae
Anacardaceae
Anacardiaceae
Anaradiaceae
Annonaceae
Apiaceae
Apocynaceae
Apocynacee
Apocynaeae Bagozaki
Apoynaceae
Aracandiaceae
Araceae
Aristolochiaceae
Ascelepiadaceae
Asclepiadaceae
Asclepidiaceae
Asclopiadaceae
Asteraceae
Avicenniaceae
Balanophoraceae
Balsaminaceae
Bignoniaceae
Bignonlacea
Bixaceae
Bombacaceae
Bombaceae
Boraginaceae
Bromeliaceae
Burseraceae
Cactaceae
Caesalpiniaceae
Canellaceae
Cannabinaceae
Cannaceae
Capparaceae
Cappararaceae
Capparidaceae
Caprifoliaceae
Caricaceae
Casuarinaceae
Celastraceae
Chailletiaceae
Chenopodiaceae
Cochlospermaceae
Combretaceae
Commelinaceae
Compositae
Compositlae
Connaraceae
Convolvulaceae
Convulvulaceae
Crassulaceae
Cruciferae
Cucurbitaceae
Cyperaceae
Dichapetalaceae
Dilleniaceae
Dioscoreaceae
Discoreaceae
Dracaenaceae
Ebenaceae
Erythroxylaceae
Euphorbiaceae
Ficoidaceae
Flacourtiaceae
Geraniaceae
Graminae
Guttferae
Guttiferae
Hymenocardiacae
Hypericaceae
Hypoxidaceae
Hypoxodaceae
Icacinaceae
Iccinaceae
Iridaceae
Irvingiaceae
Labiatae
Lamiaceae
Lauraceae
Lecythidaceae
Leeaceae
Leguminosae
Leguminosae (Caesalpiniaceae)
Leguminosae(Caesalpiniaceae)
Legumonosae
Legumonsae
Liliaceae
Lobeliaceae
Loganiaceae
Loganlaceae
Loranthaceae
Lycopodiaceae
Lythraceae
Malpighiaceae
Malvaceae
Marantaceae
Melastomataceae
Meliaceae
Melianthaceae
Menispermaceae
Mennispermaceae
Mimosaceae
Molluginaceae
Moraceae
Moringaceae
Musaceae
Myristicaceae
Myrsinaceae
Myrtaceae
Nephrolepidaceae
Neyctaginaceae
Nyctaginaceae
Nymphaeceae
Ochnaceae
Olacaceae
Oleaceae
Onagraceae
Opiliaceae
Orchidaceae
Oxalidaceae
Palmae
Papaveraceae
Papilionaceae
Passifloraceae
Passsfloraceae
Pedaliaceae
Pedialiaceae
Periplocaceae
Phytolaccaceae
Piperaceae
Plumbaginaceae
Poaceae
Polygalaceae
Polygonaceae
Polypodiaceae
Pontederiaceae
Portulacaceae
Puriaceae
Rhamnaceae
Rhomnaceae
Rosaceae
Roseaceae
Rubiaceae
Rultaceae
Rutaceae
Salvadoraceae
Samydaceae
Sapindaceae
Sapotaceae
Scrophulariaceae
Simaroubaceae
Smilacaceae
Solanacea
Solanaceae
Sterculiaceae
Taccacaceae
Thelyptoidacea
Thymelaeceae
Thymeloceae
Tiliaceae
Ulmaceae
Umbelliferae
Urticaceae
Verbenaceae
Verbenaecae
Violaceae
Vitaceae
Zingiberaceae
Zygophyllaceae

\.


--
-- Data for Name: nameindialect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nameindialect (name, dialectname, countryname, botanicname) FROM stdin;
Moyatabél	Fulfulde	Burkina Faso	Alstonia boonei
Onguie Honguie	Abe	Côte d'Ivoire	Alstonia boonei
Emien Miei	Baule	Côte d'Ivoire	Alstonia boonei
Senuro	Kulango	Côte d'Ivoire	Alstonia boonei
Onyame Dua	Twi	Ghana	Alstonia boonei
Sinu	Ga Adangbe	Ghana	Alstonia boonei
Nyamenlebaka	Nzema	Ghana	Alstonia boonei
Leguere	Fula Pulaar	Guinea	Alstonia boonei
Tiendo	Kissi	Guinea	Alstonia boonei
Zolo	Loma	Guinea	Alstonia boonei
Batera-Foro	Fula Pulaar	Guinea-Bissau	Alstonia boonei
Yung	Dan	Liberia	Alstonia boonei
Peg-nenga	Mossi	Burkina Faso	Acacia nilotica
Baganayiri	Dioula	Burkina Faso	Acacia nilotica
Gaoudi	Fulfulde	Burkina Faso	Acacia nilotica
Odanwoma	Akan	Ghana	Acacia nilotica
Bagana	Bambara	Mali	Acacia nilotica
Bagana	Malinke	Mali	Acacia nilotica
Banin	Dogons	Mali	Acacia nilotica
Bagawura	Hausa	Nigeria	Acacia nilotica
Bagaroua	Hausa	Niger	Acacia nilotica
Baani	Djerma	Niger	Acacia nilotica
Gonaki	Wolof	Senegal	Acacia nilotica
Nep Nep	Serer	Senegal	Acacia nilotica
Gaudi	Pular	Senegal	Acacia nilotica
Gonatu	Kru Guera(Krahn)	Liberia	Alstonia boonei
Ukhu	Edo	Nigeria	Alstonia boonei
Uguwa	Engenni	Nigeria	Alstonia boonei
Gando,Layi	Mossi	Burkina Faso	Allium sativum
Laii	Dioula	Burkina Faso	Allium sativum
Toumé	Fulfulde	Burkina Faso	Allium sativum
Gyene Kankan	Twi	Ghana	Allium sativum
Twèga	Mossi	Burkina Faso	Adansonia digitata
Sira	Dioula	Burkina Faso	Adansonia digitata
Bolde	Fulfulde	Burkina Faso	Adansonia digitata
Odadee	Akan	Ghana	Adansonia digitata
Zira	Bambara	Mali	Adansonia digitata
Sito	Malinke	Mali	Adansonia digitata
Oro	Dogons	Mali	Adansonia digitata
Kouka	Hausa	Niger	Adansonia digitata
Kogna	Djerma	Niger	Adansonia digitata
Ose	Yoruba	Nigeria	Adansonia digitata
Gui	Wolof	Senegal	Adansonia digitata
Bàk	Serer	Senegal	Adansonia digitata
Bu Bak	Diola	Senegal	Adansonia digitata
Kuka	Hausa	Senegal	Adansonia digitata
Sule	Fula	Sierra Leone	Adansonia digitata
Sela	Kono	Sierra Leone	Adansonia digitata
Sida	Madingo	Sierra Leone	Adansonia digitata
Tokala	Moba	Togo	Adansonia digitata
Adidotsi	Ewe	Togo	Adansonia digitata
Todi	Nawdem	Togo	Adansonia digitata
Aya	Ga Adangbe	Ghana	Allium sativum
Tafarmuwa	Hausa	Ghana	Allium sativum
Tumé	Bambara	Mali	Allium sativum
Teskart	Tamachek	Mali	Allium sativum
Tafamuuwaa	Hausa	Nigeria	Allium sativum
Oy Ayon, Ayun	Igbo	Nigeria	Allium sativum
Alubosa, Ayuu	Yoruba	Nigeria	Allium sativum
Laji	Wolof	Senegal	Allium sativum
Layi	Manding Bambara	Senegal	Allium sativum
Ayo	Ewe	Togo	Allium sativum
Ayo	Nima	Togo	Allium sativum
Ayo	Ouatchi	Togo	Allium sativum
Gon-peélga	Mossi	Burkina Faso	Acacia senegal
Patuku	Dioula	Burkina Faso	Acacia senegal
Patuki	Fulfulde	Burkina Faso	Acacia senegal
Kundo	Baule	Côte d'Ivoire	Acacia senegal
Sofia	Sisaala	Ghana	Acacia senegal
Akovia	Hausa	Ghana	Acacia senegal
Patukill	Bambara	Mali	Acacia senegal
Askab	Arabic	Mali	Acacia senegal
Patuki	Noms	Mali	Acacia senegal
Dakwara	Hausa	Nigeria	Acacia senegal
Akkora	Hausa	Niger	Acacia senegal
Verek	Wolof	Senegal	Acacia senegal
Ndongargavod	Serer	Senegal	Acacia senegal
Egbu	Igbo	Nigeria	Alstonia boonei
Ahun	Yoruba	Nigeria	Alstonia boonei
Ti Keung	Banyun	Senegal	Alstonia boonei
Bain	Diola	Senegal	Alstonia boonei
Ataforo	Fula Pulaar	Senegal	Alstonia boonei
Kalo Wulo	Mende	Sierra Leone	Alstonia boonei
Nyami dua	Ewe	Togo	Alstonia boonei
Tonton	Ouatchi	Togo	Alstonia boonei
Siaketekre	Mina	Togo	Alstonia boonei
Bin boulou, Citroneli	Dioula	Burkina Faso	Cymbopogon citratus
Wuluundé	Fulfulde	Burkina Faso	Cymbopogon citratus
Kanyang Yallo	Manding Mandinka	Gambia	Cymbopogon citratus
Ti-Ahaban	Fante	Ghana	Cymbopogon citratus
Ti-Ba	Ga Adangbe	Ghana	Cymbopogon citratus
Tighe	Ewe	Ghana	Cymbopogon citratus
l-Del legag	Konyagi	Guinea	Cymbopogon citratus
Belgata	Crioulo	Guinea-Bissau	Cymbopogon citratus
Bin Boulou	Bambara	Mali	Cymbopogon citratus
Chou kolan	Dioula	Burkina Faso	Ageratum conyzoides
Kikalapurél	Fulfulde	Burkina Faso	Ageratum conyzoides
Kondre	Baule	Côte d'Ivoire	Ageratum conyzoides
Dussuo	Dan	Côte d'Ivoire	Ageratum conyzoides
Maingue	Gagu	Côte d'Ivoire	Ageratum conyzoides
Chikara-Pre	Fula Pulaar	Gambia	Ageratum conyzoides
Hatayajambo	Manding Mandinka	Gambia	Ageratum conyzoides
Adwowakuro	Akyem	Ghana	Ageratum conyzoides
Guakuro	Asante	Ghana	Ageratum conyzoides
Efumomoe	Fante	Ghana	Ageratum conyzoides
Balquiama	Crioulo	Guinea-Bissau	Ageratum conyzoides
Laboel	Fula	Guinea-Bissau	Ageratum conyzoides
Cafi-gna	Senoufo	Mali	Cymbopogon citratus
Myoyaka Makara	Ibibio	Nigeria	Cymbopogon citratus
Achara Ehi	Igbo (Owerri)	Nigeria	Cymbopogon citratus
Boro	Mandinka	Guinea-Bissau	Ageratum conyzoides
Kumba-Dongul	Fula Pulaar	Guinea	Ageratum conyzoides
Omula-Ana	Basa	Liberia	Ageratum conyzoides
Dah Vo	Mano	Liberia	Ageratum conyzoides
Imi esu	Yoruba	Nigeria	Ageratum conyzoides
Ebegho	Edo	Nigeria	Ageratum conyzoides
Ngwa	Igbo	Nigeria	Ageratum conyzoides
Ekerkeda	Diola	Senegal	Ageratum conyzoides
Nun Gu	Manding Bambara	Senegal	Ageratum conyzoides
Gobu	Wolof	Senegal	Ageratum conyzoides
Yandigbene Yani	Kono	Sierra Leone	Ageratum conyzoides
Wet-Ed-Lif	Krio	Sierra Leone	Ageratum conyzoides
Khampu-Na	Susu Dyalonke	Sierra Leone	Ageratum conyzoides
Kho sira	Dioula	Burkina Faso	Alchornea cordifolia
Lahédi	Fulfulde	Burkina Faso	Alchornea cordifolia
Agni	Baule	Côte d'Ivoire	Alchornea cordifolia
N’dzin	Akyé	Côte d'Ivoire	Alchornea cordifolia
Koyira	Malinke	Côte d'Ivoire	Alchornea cordifolia
Ogyamma	Akan	Ghana	Alchornea cordifolia
Egyamma	Fante	Ghana	Alchornea cordifolia
Adangbe-Gboo	Ga	Ghana	Alchornea cordifolia
Kô gira	Bambara	Mali	Alchornea cordifolia
Kogira	Malinke	Mali	Alchornea cordifolia
Holâta, Bulora	Peulh	Mali	Alchornea cordifolia
Bambami	Hausa	Nigeria	Alchornea cordifolia
Ububo	Igbo	Nigeria	Alchornea cordifolia
Ewe Ipa, Esinyin	Yoruba	Nigeria	Alchornea cordifolia
Lah	Wolof	Senegal	Alchornea cordifolia
Purger yéné	Diola	Senegal	Alchornea cordifolia
Ardana, Yira	Serer	Senegal	Alchornea cordifolia
Yisai	Madingo	Sierra Leone	Alchornea cordifolia
Njekoi	Mende	Sierra Leone	Alchornea cordifolia
Bolontha	Susu	Sierra Leone	Alchornea cordifolia
Avovlo	Ewe	Togo	Alchornea cordifolia
Avovlo	Ouatchi	Togo	Alchornea cordifolia
Kyéguelga	Mossi	Burkina Faso	Balanites aegyptiaca
Zèkènè	Dioula	Burkina Faso	Balanites aegyptiaca
Tannê, Yoléteki	Fulfulde	Burkina Faso	Balanites aegyptiaca
Gongo	Dagaare	Ghana	Balanites aegyptiaca
Zèkènè	Bambara	Mali	Balanites aegyptiaca
Mono	Dogons	Mali	Balanites aegyptiaca
Tale	Noms	Mali	Balanites aegyptiaca
Sump	Wolof	Senegal	Balanites aegyptiaca
Model, lol	Serer	Senegal	Balanites aegyptiaca
Hadjlidj	Arabic	Senegal	Balanites aegyptiaca
Konkonlangpag	Gourmanchéma	Togo	Balanites aegyptiaca
Okopakbo	Moba	Togo	Balanites aegyptiaca
Kooko Oba	Yoruba	Nigeria	Cymbopogon citratus
Pei-poto	Bulom (Kim)	Sierra Leone	Cymbopogon citratus
Pu-lumbi	Kono	Sierra Leone	Cymbopogon citratus
Pu-lumbe	Mendu	Sierra Leone	Cymbopogon citratus
Cè kala	Bambara	Senegal	Cymbopogon citratus
Tsigbe	Ewe	Togo	Cymbopogon citratus
Magno Gu Dondialé	Kirma	Burkina Faso	Aloe vera
Sinzé Toro	Manding	Burkina Faso	Aloe vera
Sogobahu	Bambara	Burkina Faso	Aloe vera
Sinzé Toro	Manding	Côte d'Ivoire	Aloe vera
Bamalagba	Maninka	Côte d'Ivoire	Aloe vera
Sereberebe	Akan	Ghana	Aloe schweinfurthi
Nsesareso Abrobe	Brong	Ghana	Aloe schweinfurthi
Balli Nyibi	Fula Fulfulde	Nigeria	Aloe schweinfurthi
Etieerin anago	Yoruba	Nigeria	Aloe schweinfurthi
Hantsar	Hausa	Nigeria	Aloe schweinfurthi
Layi	Bambara	Senegal	Aloe schweinfurthi
Adi adi	Ewe	Togo	Aloe schweinfurthi
Nimbéléké	Senufo Dyimini	Côte d'Ivoire	Aloe vera
Sereberebe	Akan	Ghana	Aloe vera
Nsesareso Abrobe	Brong	Ghana	Aloe vera
Balli Nyibi, Balli Nyiwa	Fula Fulfulde	Nigeria	Aloe vera
Omvi	Gwari	Nigeria	Aloe vera
Zaabuwaa	Hausa	Nigeria	Aloe vera
Etieerin oyinbo	Yoruba	Nigeria	Aloe vera
Sogoba Hu	Fula	Senegal	Aloe vera
Sogoba Bu	Bambara	Senegal	Aloe vera
Kadio kandio	Maninka	Senegal	Aloe vera
Adi adi Gbe	Ewe	Togo	Aloe vera
Dissawede	Basari	Togo	Aloe vera
Sulefadium	Kabiyè	Togo	Aloe vera
Gbehoin	Ouatchi	Togo	Cymbopogon citratus
Fifaglass	Mina	Togo	Cymbopogon citratus
Nyèsinkèn	Fon	Benin	Momordica charantia
Nyèsinkèn	Goun	Benin	Momordica charantia
Akusiribie	Akan	Ghana	Argemone mexicana
Kokosakyi aduro	Twi	Ghana	Argemone mexicana
Bozobo	Bambara	Mali	Argemone mexicana
Aignètawa, Sonkeriai	Dogons	Mali	Argemone mexicana
Naka-taba	Senoufo	Mali	Argemone mexicana
Garabu-mag	Wolof	Senegal	Argemone mexicana
Fambora	Diola	Senegal	Argemone mexicana
Dahatu	Serer	Senegal	Argemone mexicana
Houétchégnon	Adja	Togo	Argemone mexicana
Edjini	Yoruba	Benin	Momordica charantia
Atakluma	Dendi	Benin	Momordica charantia
Njalam fetuhi	Fulfulde	Burkina Faso	Momordica charantia
Sing Biep	Adioukrou	Côte d'Ivoire	Momordica charantia
N'guéné Boué	Guéré	Côte d'Ivoire	Momordica charantia
Nyanyan	Akan	Ghana	Momordica charantia
Kakle	Ewe	Ghana	Momordica charantia
Daddagu	Hausa	Ghana	Momordica charantia
Edjinrin	Yoruba	Nigeria	Momordica charantia
Agnagnran	Ewe	Togo	Momordica charantia
Adounka	Adja	Togo	Momordica charantia
Guéssikan	Mina	Togo	Momordica charantia
Bemebenku	Baatonun	Benin	Bridelia ferruginea
Honsukokué	Gbe Fo	Benin	Bridelia ferruginea
Nago Hira	Yoruba	Benin	Bridelia ferruginea
Ambrianka	Mossi	Burkina Faso	Bridelia ferruginea
Sagoui, Sagwann babini	Dioula	Burkina Faso	Bridelia ferruginea
Kojuteki, Daafi	Fulfulde	Burkina Faso	Bridelia ferruginea
Saba, Sagba	Manding Mandinka	Côte d'Ivoire	Bridelia ferruginea
Nakurugo	Senufo Dyimini	Côte d'Ivoire	Bridelia ferruginea
Opam fufuo	Twi	Ghana	Bridelia ferruginea
Flatsho	Ga Adangbe	Ghana	Bridelia ferruginea
Kisni	Hausa	Ghana	Bridelia ferruginea
Dafi	Fula Pulaar	Guinea	Bridelia ferruginea
Baboni	Manding Mandinka	Guinea	Bridelia ferruginea
Sagba	Mandinka	Guinea	Bridelia ferruginea
Saguan	Bambara	Mali	Bridelia ferruginea
Daafi	Noms	Mali	Bridelia ferruginea
Gnirin-o-tigue	Senoufo	Mali	Bridelia ferruginea
Ira odan, Eepo ira	Yoruba	Nigeria	Bridelia ferruginea
Oha	Ibo	Nigeria	Bridelia ferruginea
Kisni	Hausa	Nigeria	Bridelia ferruginea
Niim	Mossi	Burkina Faso	Azadirachta indica
Nîmyiri	Dioula	Burkina Faso	Azadirachta indica
Tirotiya, Goodji	Fula Fulfulde	Burkina Faso	Azadirachta indica
Djé Ndédzakoè	Akyé	Côte d'Ivoire	Azadirachta indica
Tchitchèndé	Ando	Côte d'Ivoire	Azadirachta indica
Yirinding Kunango	Manding Mandinka	Gambia	Azadirachta indica
Dua Gyane	Twi	Ghana	Azadirachta indica
Liliti	Ewe	Ghana	Azadirachta indica
Dongo Yaro	Hausa	Ghana	Azadirachta indica
Mali yirini	Bambara	Mali	Azadirachta indica
Gnimitigue	Senoufo	Mali	Azadirachta indica
Goo-gay	Dyula	Mali	Azadirachta indica
Dogon Yaro	Hausa	Niger	Azadirachta indica
Méli	Songhai	Niger	Azadirachta indica
Milleize	Djerma	Niger	Azadirachta indica
Dongoyaro	Hausa	Nigeria	Azadirachta indica
Ganya	Kanuri	Nigeria	Azadirachta indica
Dongoyaro	Yoruba	Nigeria	Azadirachta indica
Tubabo toboro	Manding Mandinka	Senegal	Azadirachta indica
Tubabo	Soce	Senegal	Azadirachta indica
Dim dim i buki	Wolof	Senegal	Azadirachta indica
Sabuleti	Ewe	Togo	Azadirachta indica
Kiniti	Mina	Togo	Azadirachta indica
Sablagbe	Adja	Togo	Azadirachta indica
Tholinyi	Susu	Sierra Leone	Bridelia ferruginea
Sindio	Kissi	Sierra Leone	Bridelia ferruginea
Bembeh	Hono	Sierra Leone	Bridelia ferruginea
Akamati	Ewe	Togo	Bridelia ferruginea
N’tchintchi	Bassar	Togo	Bridelia ferruginea
Kolu	Lamba	Togo	Bridelia ferruginea
Alui Okle	Anyi	Côte d'Ivoire	Cryptolepia sanguinolenta
Nibima	Twi	Ghana	Cryptolepia sanguinolenta
Kadze	Ewe	Ghana	Cryptolepia sanguinolenta
Gangaman	Hausa	Ghana	Cryptolepia sanguinolenta
Konit	Banyan	Guinea-Bissau	Cryptolepia sanguinolenta
Fu Lemok	Diola	Guinea-Bissau	Cryptolepia sanguinolenta
Butnacimbore	Vulgar Balanta	Guinea-Bissau	Cryptolepia sanguinolenta
Delboi	Fula Pulaar	Guinea	Cryptolepia sanguinolenta
Uiduloia	Manding Bambara	Guinea	Cryptolepia sanguinolenta
Nombon	Maninka	Guinea	Cryptolepia sanguinolenta
Gangamaa, Gwadda	Hausa	Nigeria	Cryptolepia sanguinolenta
IKpolokoto	Igbo (Ogwashi)	Nigeria	Cryptolepia sanguinolenta
Butnasimbor	Balanta	Senegal	Cryptolepia sanguinolenta
Ahayte Buka Ka	Diola Flup	Senegal	Cryptolepia sanguinolenta
Vidukokoy	Bambara	Senegal	Cryptolepia sanguinolenta
Firabantikpa	Koranko	Sierra Leone	Cryptolepia sanguinolenta
Kpokoyangole	Mende	Sierra Leone	Cryptolepia sanguinolenta
Kedze	Ewe	Togo	Cryptolepia sanguinolenta
Anotsidzen	Ouatchi	Togo	Cryptolepia sanguinolenta
Kadzen	Mina	Togo	Cryptolepia sanguinolenta
Mangana	Diola	Burkina Faso	Morinda lucida
Bronyadua konfroma	Akan	Ghana	Morinda lucida
Nuke	Igbo	Nigeria	Morinda lucida
Oruwo	Yoruba	Nigeria	Morinda lucida
Hojologbo	Mende	Sierra Leone	Morinda lucida
Dzadzaklan	Ewe	Togo	Morinda lucida
Gazingere Binne	Bissa	Burkina Faso	Euphorbia hirta
Dabbirteeki	Fulfulde	Burkina Faso	Euphorbia hirta
Nonone Kuchia	Hausa	Burkina Faso	Euphorbia hirta
Adododo	Baoule	Côte d'Ivoire	Euphorbia hirta
Tao Moa	Gagou	Côte d'Ivoire	Euphorbia hirta
Dadaklan	Ouatchi	Togo	Morinda lucida
Nassara-krou	Bissa	Burkina Faso	Carica papaya
Papaï, Budebalod, Bogfiré	Mossi	Burkina Faso	Carica papaya
Mangdé	Fulfulde	Burkina Faso	Carica papaya
Oloko	Abbey	Côte d'Ivoire	Carica papaya
M’bomou	Akyé	Côte d'Ivoire	Carica papaya
Oflé	Baoule	Côte d'Ivoire	Carica papaya
Papiya	Mandinka	Gambia	Carica papaya
Budi baga	Fula	Gambia	Carica papaya
Papakayo	Wolof	Gambia	Carica papaya
Brofre	Akan	Ghana	Carica papaya
Akpakpa	Ga Adangbe	Ghana	Carica papaya
Adiba	Ewe	Ghana	Carica papaya
Mandje	Bambara	Mali	Carica papaya
Ane sara kambe	Dogons	Mali	Carica papaya
Manli	Senoufo	Mali	Carica papaya
Gwanda, Gwadda	Hausa	Nigeria	Carica papaya
Igi-Ibepè	Yoruba	Nigeria	Carica papaya
Ogede ojo	Ibo	Nigeria	Carica papaya
Adibati	Ewe	Togo	Carica papaya
Adubati	Mina	Togo	Carica papaya
Brofude	Akasselem	Togo	Carica papaya
Papayo	Wolof	Senegal	Carica papaya
Papaya, Papayo	Peulh	Senegal	Carica papaya
Bum papa	Diola	Senegal	Carica papaya
Sida	Mandigo	Sierra Leone	Carica papaya
Fakali	Mende	Sierra Leone	Carica papaya
Sela	Hono	Sierra Leone	Carica papaya
Kinin	Yoruba	Nigeria	Cinchona pubescens
Tsikémachou	Adja	Togo	Morinda lucida
Yoro	Bobo	Burkina Faso	Hibiscus sabdariffa
Follere, pôllê	Fulfulde	Burkina Faso	Hibiscus sabdariffa
Dah wihéni	Diola	Burkina Faso	Hibiscus sabdariffa
Bito ou wegderé	Mossi	Burkina Faso	Hibiscus sabdariffa
Foleray	Fula Pulaar	Gambia	Hibiscus sabdariffa
Dawaso	Manding Mandinka	Gambia	Hibiscus sabdariffa
Bissab	Wolof	Gambia	Hibiscus sabdariffa
Dibemre	Dagbani	Ghana	Hibiscus sabdariffa
Yakuwa	Hausa	Ghana	Hibiscus sabdariffa
Tingyanbam	Konkomba	Ghana	Hibiscus sabdariffa
Yamen	Basari	Guinea	Hibiscus sabdariffa
Folere Ba Di	Fula Pulaar	Guinea	Hibiscus sabdariffa
Yavetyan	Konyagi	Guinea	Hibiscus sabdariffa
Mbatu	Balanta	Guinea-Bissau	Hibiscus sabdariffa
Baguiche	Crioulo	Guinea-Bissau	Hibiscus sabdariffa
Yavetyan	Manding Mandinka	Guinea-Bissau	Hibiscus sabdariffa
Blableg-Ware	Krou Bété	Côte d'Ivoire	Euphorbia hirta
Kakaweadwe	Akan	Ghana	Euphorbia hirta
Notsigbe	Ewe	Ghana	Euphorbia hirta
Aakuba	Nzema	Ghana	Euphorbia hirta
Taquelpolhe	Fula Pulaar	Guinea-Bissau	Euphorbia hirta
To A Gbondo	Mano	Liberia	Euphorbia hirta
Peleguere Djimi	Dogons	Mali	Euphorbia hirta
Dabadabileni	Bambara	Mali	Euphorbia hirta
Emile, irawo'le	Yoruba	Nigeria	Euphorbia hirta
Endamyel	Fula Fulfulde	Nigeria	Euphorbia hirta
Noonon kurciyaa	Hausa	Nigeria	Euphorbia hirta
Makoreselu	Badyara	Senegal	Euphorbia hirta
Ku Tim	Diola Flup	Senegal	Euphorbia hirta
En Engil	Fula Pulaar	Senegal	Euphorbia hirta
Funkele	Limba	Sierra Leone	Euphorbia hirta
Bumbungo	Loko	Sierra Leone	Euphorbia hirta
Beleji	Mende	Sierra Leone	Euphorbia hirta
Anonsikan	Ewe	Togo	Euphorbia hirta
Melandjebe	Akasselem	Togo	Euphorbia hirta
Nostika	Ouatchi	Togo	Euphorbia hirta
Handjibane	Dogons	Mali	Hibiscus sabdariffa
Dah Bileni	Bambara	Mali	Hibiscus sabdariffa
Tangnire	Senoufo	Mali	Hibiscus sabdariffa
Jisima	Dende	Niger	Hibiscus sabdariffa
Jisima	Songhai	Niger	Hibiscus sabdariffa
Dorongu	Fula Fulfulde	Nigeria	Hibiscus sabdariffa
Abin kan	Hausa	Nigeria	Hibiscus sabdariffa
Amukan, Isapa	Yoruba	Nigeria	Hibiscus sabdariffa
Bissap	Vulgar	Senegal	Hibiscus sabdariffa
Folerebadi	Tukulor	Senegal	Hibiscus sabdariffa
Da kumu	Bambara	Senegal	Hibiscus sabdariffa
Satoe	Bulom	Sierra Leone	Hibiscus sabdariffa
Dagbami	Koranko	Sierra Leone	Hibiscus sabdariffa
Sakpa	Krio	Sierra Leone	Hibiscus sabdariffa
Anyegba	Ewe	Togo	Hibiscus sabdariffa
Gnatu	Mina	Togo	Hibiscus sabdariffa
Gnotu	Kabiyè	Togo	Hibiscus sabdariffa
Grengeni, komoni, tanyaro	Diola	Burkina Faso	Hymenocardia acida
Samatahi, gnohi, péléti	Fulfulde	Burkina Faso	Hymenocardia acida
Duakokowa	Akan	Ghana	Hymenocardia acida
Sabrakyi	Brong	Ghana	Hymenocardia acida
Grègnéni	Bambara	Mali	Hymenocardia acida
Diegbè	Malinke	Mali	Hymenocardia acida
Pellitoro	Pular	Mali	Hymenocardia acida
Fintinko	Asante	Ghana	Harrisonia abyssinica
Zhinwuuon Nyegolo	Kpèlè	Guinea	Harrisonia abyssinica
Baingou	Agni	Côte d'Ivoire	Harrisonia abyssinica
Arujere	Hausa	Nigeria	Harrisonia abyssinica
Mama kundu	Kissi	Sierra Leone	Harrisonia abyssinica
Xedja	Ewe	Togo	Harrisonia abyssinica
Hedjan	Mina	Togo	Harrisonia abyssinica
Xedjatsi	Adja	Togo	Harrisonia abyssinica
Enkélèn	Wolof	Senegal	Hymenocardia acida
Kuka	Mossi	Burkina Faso	Khaya senegalensis
Djala	Diola	Burkina Faso	Khaya senegalensis
Kayi, Kayl	Fulfulde	Burkina Faso	Khaya senegalensis
Jala	Malinke	Côte d'Ivoire	Khaya senegalensis
Kuntunkuri	Twi	Ghana	Khaya senegalensis
Okum	Fante	Ghana	Khaya senegalensis
Logo	Ewe	Ghana	Khaya senegalensis
Jala	Bambara	Mali	Khaya senegalensis
Pell	Dogons	Mali	Khaya senegalensis
Kaille	Peulh	Mali	Khaya senegalensis
Oganwo	Yoruba	Nigeria	Khaya senegalensis
Madaci	Hausa	Nigeria	Khaya senegalensis
Ono onu	Ibo	Nigeria	Khaya senegalensis
N'garin	Serer	Senegal	Khaya senegalensis
Hay	Wolof	Senegal	Khaya senegalensis
Bu ririt	Diola	Senegal	Khaya senegalensis
Mahougen	Ewe	Togo	Khaya senegalensis
Mahougani	Ouatchi	Togo	Khaya senegalensis
Lalé	Mossi	Burkina Faso	Lawsonia inermis
Djabi	Diola	Burkina Faso	Lawsonia inermis
Djabe, lêlla	Fulfulde	Burkina Faso	Lawsonia inermis
Zabbela	Dagbani	Ghana	Lawsonia inermis
Lalle	Hausa	Ghana	Lawsonia inermis
Dabé	Bambara	Mali	Lawsonia inermis
Dyabi	Maninka	Mali	Lawsonia inermis
Dyabè	Pular	Mali	Lawsonia inermis
Laali	Yoruba	Nigeria	Lawsonia inermis
Laali	Susu	Senegal	Lawsonia inermis
Fuden	Wolof	Senegal	Lawsonia inermis
Djabi	Malinke	Senegal	Lawsonia inermis
Kwilg wilsaoré	Bobo	Burkina Faso	Lippia multiflora
Kangaliba	Diola	Burkina Faso	Lippia multiflora
Légal café	Fulfulde	Burkina Faso	Lippia multiflora
Amaniena	Anyi	Côte d'Ivoire	Lippia multiflora
Akankoino	Kalango	Côte d'Ivoire	Lippia multiflora
Sonugba Suba	Maninka	Côte d'Ivoire	Lippia multiflora
Usumbolomo	Fula	Gambia	Lippia multiflora
Killiba	Mandinka	Gambia	Lippia multiflora
Mbormbor	Wolof	Gambia	Lippia multiflora
Sre-Nunum	Akan	Ghana	Lippia multiflora
Naasuruu	Ga	Ghana	Lippia multiflora
Afudoti(Afu)	Ewe	Ghana	Lippia multiflora
Bahe	Fula Pulaar	Guinea	Lippia multiflora
Diohuli	Susu	Guinea	Lippia multiflora
Bahe-Bahe	Fula Pulaar	Mali	Lippia multiflora
Gane Ba	Manding Bambara	Mali	Lippia multiflora
Dirisi	Fula Fulfulde	Nigeria	Lippia multiflora
Efinrin-Gogara Fefe	Yoruba	Nigeria	Lippia multiflora
Brege	Balanta	Senegal	Lippia multiflora
Mbalat	Serer	Senegal	Lippia multiflora
Busag	Diola	Senegal	Lippia multiflora
A-Kimbo	Temne	Sierra Leone	Lippia multiflora
Fasau Kliouto-Avudati	Tem	Togo	Lippia multiflora
Nyone	Ewe	Togo	Lippia multiflora
Yiilga	Mossi	Burkina Faso	Mitragyna inermis
Djum	Diola	Burkina Faso	Mitragyna inermis
Kwali, Koli, Kadiolé	Fulfulde	Burkina Faso	Mitragyna inermis
Ila	Dagaare	Ghana	Mitragyna inermis
SKukyamfie	Akan	Ghana	Mitragyna inermis
Akpatenyi	Igbo	Nigeria	Mitragyna inermis
Agbal	Arabic	Senegal	Mitragyna inermis
Lenkati	Ewe	Togo	Mitragyna inermis
Elikpati	Mina	Togo	Mitragyna inermis
Yelowum	Moba	Togo	Mitragyna inermis
Batam-Foro, Do	Manding Mandinka	Guinea-Bissau	Alstonia boonei
\.


--
-- Data for Name: plant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant (botanicname, speciesname, geographic, conservation, description, ethnomedicaluse) FROM stdin;
Abelmoschus esculentus	Abelmoschus esculentus	NULL	NULL	NULL	Fevers, gonorrhoea, dysentery, catarrhal infections,emollient,antispasmodic, tonic.
Abrus precatorius	Abrus precatorius	NULL	NULL	NULL	Colds,cough, convulsion, rheumatism, conjunctivitis,contraceptive,antimicrobials,aphrodisiac,ulcer,anaemia,antidote poison
Abutilon mauritianum	Abutilon mauritianum	NULL	NULL	NULL	Diarrhoea, gonorrhoea,antipyretic,cough,piles
Acacia ataxacantha	Acacia ataxacantha	NULL	NULL	NULL	Dysentery,backache
Acacia auriculiformis	Acacia auriculiformis	NULL	NULL	NULL	Astringent
Acacia sieberiana	Acacia sieberiana	NULL	NULL	NULL	Anti-cancer,antipyretic,astringent,kidney disease,taeniacide
Acalypha fimbriata	Acalypha fimbriata	NULL	NULL	NULL	Syphilis, asthma,,anthelmintics, ulcers,rheumatism, antimicrobial & antifungal
Acalypha godseffiana	Acalypha godseffiana	NULL	NULL	NULL	Skin infection, Antimicrobials
Acalypha hispida	Acalypha hispida	NULL	NULL	NULL	Skin rashes, antimicrobial
Acalypha wilkesiana	Acalypha wilkesiana	NULL	NULL	NULL	Skin rashes,antimicrobials,flatulence,constipation
Acanthospermum hispidum	Acanthospermum hispidum	NULL	NULL	NULL	Yellow Fever ,tuberculosis,stomach disorder,cough,purgative,rheumatism,migraine
Acanthus montanus	Acanthus montanus	NULL	NULL	NULL	Syphilis, cough, emetic, urethral discharge, purgative,boils,anaemia,anthelmintics
Achillea millefolium	Achillea millefolium	NULL	NULL	NULL	Haemostatic,wound,astringent,diaphoretic,piles
Achyranthes aspera	Achyranthes aspera	NULL	NULL	NULL	Stomach disorders, Abortion, diarrhoea, dysentery, skin diseases,Malaria, venereal diseases, haemostatic, cold
Adansonia digitata	Adansonia digitata	NULL	NULL	NULL	Malaria, asthma,diarrhoea, kidney and bladder diseases, demulcent, prophylactic,antihistaminic,skin diseases,caries,antimicrobial.
Adenia cissampeloides	Adenia cissampeloides	NULL	NULL	NULL	Hypertension, nervous disorder, stress, cough, gonorrhoea, antimicrobial.
Adenia venenata	Adenia venenata	NULL	NULL	NULL	Cough, bronchitis,urinary tract infections, fever,stem-pulp is an aphrodisiac, syphilis, gonorrhoea,anagelsic,diuretic,hypertension,fish poison
Adenium Obesum	Adenium Obesum	NULL	NULL	NULL	Wound dressing, ulces, cardiac tonic, venereal diseases.
Adhatoda buchhoizii	Adhatoda buchhoizii	NULL	NULL	NULL	Rheumatism, antiinflammatory, fish poison
Aerva lanata	Aerva lanata	NULL	NULL	NULL	Ulcers, wounds, snake bite, diuretic, purgative, anthelmintic,sore throat,kidney and bladder stones
Afraegle paniculata	Afraegle paniculata	NULL	NULL	NULL	Gastro-intestinal disorders, antispasmodic,skin diseases
Aframomum granum-paradisi	Aframomum granum-paradisi	NULL	NULL	NULL	Anthelmintics
Aframomum melegueta	Aframomum melegueta	NULL	NULL	NULL	Stimulant, smallpox, chicken pox, stimulant,anthelmintics,wounds,coughs,anaemia,rheumatism,measles,malaria,toothache
Aframomum sceptrum	Aframomum sceptrum	NULL	NULL	NULL	Measles,smallpox,lumbago,stimulant.
Afrormosia laxiflora	Afrormosia laxiflora	NULL	NULL	NULL	Intoxicant, headache, body pains,headache,ophthalmia,anticonvulsant,rat ovulation blocked through effect on pituitary gland
Afzelia africana	Afzelia africana	NULL	NULL	NULL	Gonorrhoea, stomach disorders,hernia,lumbago,febrifuge,antiemetic
Agelaea obliqua	Agelaea obliqua	NULL	NULL	NULL	Childbirth (Relaxation of Muscles)
Agelenopsis chevaleri	Agelenopsis chevaleri	NULL	NULL	NULL	Conjunctivitis, ring-worm, impotence, purgative, craw-craw, tooth ache, mumps.
Ageratum conyzoides	Ageratum conyzoides	NULL	NULL	NULL	Wounds, ulcers, craw-craw, digestive disturbance, diarrhoea,emetic,skin diseases,antipyretic,gonorrhoea,sleeping sickness,eye wash
Alafia barteri	Alafia barteri	NULL	NULL	NULL	Sickle cell anaemia,rheumatic pains,toothache,eye infections
Albizia adianthifolia	Albizia adianthifolia	NULL	NULL	NULL	Gonorrhoea,night blindness,piles,anthelmintics,cough
Albizia ferruginea	Albizia ferruginea	NULL	NULL	NULL	Dysentery, constipation,fish poison
Albizia lebbeck	Albizia lebbeck	NULL	NULL	NULL	Astringent, mouthwash, river-blindness, gonorrhoea
Albizia zygia	Albizia zygia	NULL	NULL	NULL	Arthritis,sprain
Alchornea cordifolia	Alchornea cordifolia	NULL	NULL	NULL	Fever, rheumatism,antimicrobials ,diuretic,purgative,toothache,cough,sore,gonorrhoea,insomnia
Alchornea laxiflora	Alchornea laxiflora	NULL	NULL	NULL	Chewing sticks, venereal diseases,emmenagogue,ring worm,antioxidant,(leaves traditional wraps for cola nuts).
Allamanda cathartica	Allamanda cathartica	NULL	NULL	NULL	Antimicrobials,malaria,dysentery,cathartic.
Allanblackia floribunda	Allanblackia floribunda	NULL	NULL	NULL	Malaria, dysentery, toothache, chicken pox small pox, measles
Allium ascalonicum	Allium ascalonicum	NULL	NULL	NULL	Convulsion,dysentery.
Allium cepa	Allium cepa	NULL	NULL	NULL	Cough,diuretic,anthelmintics,skin diseases,weak erection,anti-tumour,rubefacient, throat infection.
Allium sativum	Allium sativum	NULL	NULL	NULL	Fever, coughs, asthma, dilated bronchi.,flatulence,anthelmintic,ringworm,antibiotic,diuretic,emmenagogue,antimicrobials,blood tonic, Malaria.
Allophylus africanus	Allophylus africanus	NULL	NULL	NULL	Diarrhoea, pile, toothache,anthelmintics,venereal diseases,cough
Aloe vera	Aloe vera	NULL	NULL	NULL	Purgative,guineaworms,hair care,skin diseases,wound,diabetes,amenorrhoea,breast cancer,immune booster
Alstonia boonei	Alstonia boonei	NULL	NULL	NULL	Breast development, filaria worms,anthelmintics, antidote, malaria fever, yellow fever,anti-periodic
Alstonia congensis	Alstonia congensis	NULL	NULL	NULL	Malaria, astringent, toothache.
Alternanthera repens	Alternanthera repens	NULL	NULL	NULL	Dysentery, antimicrobials,dysmenorrhea,filariasis,fracture,joint pains
Ficus mucuso	Ficus mucuso	NULL	NULL	NULL	Insomnia
Alternanthera sessilis	Alternanthera sessilis	NULL	NULL	NULL	Astringent, antibacterial, boil, headache, antidote to snake-bite.
Amaralia bignoniflora	Amaralia bignoniflora	NULL	NULL	NULL	Cough, heart burn, rheumatic pain
Amaranthus spinosus	Amaranthus spinosus	NULL	NULL	NULL	Abdominal pain, ulcers, gonorrhoea.,astringent,menorrhagia,diarrhoea,dysentery,eczema
Amaranthus viridis	Amaranthus viridis	NULL	NULL	NULL	Anthelmintics,dysentery,antispasmodic,diuretic,gonorrhoea,eye disease.
Bombax buonopozense	Bombax buonopozense	NULL	NULL	NULL	Stomachache, blood tonic,emmenagogue,emollient
Ambrosia maritima	Ambrosia maritima	NULL	NULL	NULL	Fever, inflammation, Syphilis,hypertension,anti-tumour,stimulant
Anthocleista nobilis	\N	\N	\N	\N	\N
Amorphophallus dracantioides	Amorphophallus dracantioides	NULL	NULL	NULL	Asthma, piles, snakebite remedy, arrow poison
Anacardium occidentale	Anacardium occidentale	NULL	NULL	NULL	Malaria, elephantiasis, leprosy, ringworms,scurvy,diabetes,warts,anthelmintics,typhoid fever,caries.
Ananas comosus	Ananas comosus	NULL	NULL	NULL	Digestive problems,typhoid fever,cough,anthelmintics
Anchomanes difformis	Anchomanes difformis	NULL	NULL	NULL	Diuretics,purgative,gonorrhoea
Andasonia digitata					
Andira inermis	Andira inermis	NULL	NULL	NULL	Skin diseases,anthelmintics
Aneilema hockii	Aneilema hockii	NULL	NULL	NULL	Aphrodislac, female infertility.
Annona muricata	Annona muricata	NULL	NULL	NULL	Fever,dysentery
Annona senegalensis	Annona senegalensis	NULL	NULL	NULL	Cancer, dysentery, cough,venereal diseases,toothache,astringent,anthelmintic,ease labour,eye drops, tumour out growth,anti-bee sting.
Annona squamosa	Annona squamosa	NULL	NULL	NULL	Anaemia, dysentery,abortifacient,ulcer,anti-tumour
Anogeissus leiocarpus	Anogeissus leiocarpus	NULL	NULL	NULL	Antipyretic,taeniacide,skin diseases
Anonidium Manni	Anonidium Manni	NULL	NULL	NULL	Diarrhoea, cough, sores, fever, rheumatism
Anthocleista djalonensis	Anthocleista djalonensis	NULL	NULL	NULL	Skin diseases – rashes and eczema, diabetes,antipyretic,purgative,abdominal pain,impotence
Anthocleista liebrechtsiana	Anthocleista liebrechtsiana	NULL	NULL	NULL	Purgative, skin infection, antimicrobial.
Anthocleista vogelii	Anthocleista vogelii	NULL	NULL	NULL	Antidote for snake bite,purgative
Anthonotha macrophylla	Anthonotha macrophylla	NULL	NULL	NULL	Gonorrhoea, dysentery, diarrhea,yellow fever.
Antiaris africana	Antiaris africana	NULL	NULL	NULL	Epilepsy,lumbago,skin irritant,purgative,nervous disorders
Antidesma venosum	Antidesma venosum	NULL	NULL	NULL	Anthelmintics
Antigonon leptopus	Antigonon leptopus	NULL	NULL	NULL	Antimicrobial.
Antrocaryon micraster	Antrocaryon micraster	NULL	NULL	NULL	General toxic, laxative, cough, stomachae
Apium graveolens	Apium graveolens	NULL	NULL	NULL	Aphrodisiac,emmenagogue,anthelmintics,carminative,antispasmodic,stimulant,diuretic,cough
Arachis hypogea	Arachis hypogea	NULL	NULL	NULL	Oil as solvent ,antimicrobials,insomnia
Areca catechu	Areca catechu	NULL	NULL	NULL	Urinary tract infection, aphrodisiac, anthelmintic, astingent, carminative.
Argemone mexicana	Argemone mexicana	NULL	NULL	NULL	Jaundice, gonorrhoea, skin diseases,diuretics,blennorhoea,tapeworms,abscesses
Argyreia nervosa	Argyreia nervosa	NULL	NULL	NULL	Nervous disorder, skin infection, gonorrhoea, aphrodisiac.
Aristida adscensionis	Aristida adscensionis	NULL	NULL	NULL	Improves lactation
Aristolochia ringens	Aristolochia ringens	NULL	NULL	NULL	Guineaworm, skin diseases,typhoid, sores, antidote to snake poison,emmenagogue,anthelmintics
Artemisia afra	Artemisia afra	NULL	NULL	NULL	Fevers, vermifuge
Artocarpus altilis	Artocarpus altilis	NULL	NULL	NULL	Fevers,astringent,sedative
Asclepias curassavica	Asclepias curassavica	NULL	NULL	NULL	Gastro-intestinal disorders,emetic
Asparagus africana	Asparagus africana	NULL	NULL	NULL	Antimicrobials,sores,kidney diseases,diuretics.
Aspilia africana	Aspilia africana	NULL	NULL	NULL	Haemostatic,cleaning sores, corneal opacities, stomach disorders,tuberculosis,nervous disorders,guinea-worm,gonorrhoea,skin rash.
Asystasia calyciana	Asystasia calyciana	NULL	NULL	NULL	Skin diseases,weak erection,headache,childhood yaws
Asystasia gangetica	Asystasia gangetica	NULL	NULL	NULL	Antidote for snake bite,astringent,antipruritic,piles,urethral discharge,analgesic properties,antifungal,urological disorders
Aulacocalyx jasminiflora	Aulacocalyx jasminiflora	NULL	NULL	NULL	Toothache
Avicennia africana	Avicennia africana	NULL	NULL	NULL	Abortifacient,detergent
Axonopus compressus	Axonopus compressus	NULL	NULL	NULL	Malaria fever, asthma,breast swelling.
Azadirachta indica	Azadirachta indica	NULL	NULL	NULL	Malaria, jaundice,syphilis,anthelmintics, skin disease,eczema,ringworm,emetic,laxative,sore throat
Bacopo monnifera	Bacopo monnifera	NULL	NULL	NULL	Cough, catarrh, bronchitis, diarrhoea.
Balanites aegyptiaca	Balanites aegyptiaca	NULL	NULL	NULL	Anthelmintics, skin diseases,antipyretic,emetic
Bambusa vulgaris	Bambusa vulgaris	NULL	NULL	NULL	Gonorrhoea,abortifacient,a,nthelmintics,emmenagogue,skin rashes of HIV/AIDS
Bandeiraea simplicifolia	Bandeiraea simplicifolia	NULL	NULL	NULL	Urinary disorder, cancerous growth.
Baphia nitida	Baphia nitida	NULL	NULL	NULL	Constipation, skin diseases, venereal diseases,ringworm,enema,flatulence,smallpox
Baphia pubescens	Baphia pubescens	NULL	NULL	NULL	Urinary tract disorders,emetic, antimicrobial.
Barleria opaca	Barleria opaca	NULL	NULL	NULL	Jaundice, hemorrhoids, rheumatism, laxative, snakebite.
Basilicum polysiachyon	Basilicum polysiachyon	NULL	NULL	NULL	 Fever, cough, cold, nasal congestion
Bauhinia rubescens	Bauhinia rubescens	NULL	NULL	NULL	Fever, dysentery.
Bauhinia variegata	Bauhinia variegata	NULL	NULL	NULL	Skin diseases, arthelmintic, syphilis, astringent, alterative.
Berlinia grandiflora	Berlinia grandiflora	NULL	NULL	NULL	Ease labour, gastro-intestinal disorders
Bidens pilosa	Bidens pilosa	NULL	NULL	NULL	Diarrhoea, abdominal disorders,enema, rheumaticism,coughs,anaesthetic,ease labour,antipyretics,caries
Bixa orellana	Bixa orellana	NULL	NULL	NULL	Malaria, fever,astringent,kidney diseases,skin diseases.
Blepharis maderaspatensis	Blepharis maderaspatensis	NULL	NULL	NULL	Snake-bite antidote
Blighia sapida	Blighia sapida	NULL	NULL	NULL	Malaria, migraine, dysentery,ease labour,hypoglycaemic agent,(note that coat is poisonous).
Blighia unijugata	Blighia unijugata	NULL	NULL	NULL	Diabetes,antipyretic,postnatal haemorrhage
Blumea auria	Blumea auria	NULL	NULL	NULL	Antipyretic and gastro-intestinal problem
Blumea perrottetiana	Blumea perrottetiana	NULL	NULL	NULL	 Pains,jaundice,malaria,anthelmintics,ulcer,dysentery
Boerhaavia diffusa	Boerhaavia diffusa	NULL	NULL	NULL	Skin diseases, small pox, jaundice, gonorrhoea,diuretic,asthma,cough,antipyretis, (test for pregnancy, through the itching of palm),scabies,yaws,jaundice
Jubernardia seretii	Jubernardia seretii	NULL	NULL	NULL	Conjunctivitis.
Borassus aethiopum	Borassus aethiopum	NULL	NULL	NULL	Respiratory disorders,asthma,headache
Borreria ocymoides	Borreria ocymoides	NULL	NULL	NULL	Gonorrhoea, astringent, skin infection.
Borreria verticillata	Borreria verticillata	NULL	NULL	NULL	Gonorrohea, skin diseases,dysentery,antibilharzia,abortifacient,diuretics,anti-leprosy
Boscia senegalensis	Boscia senegalensis	NULL	NULL	NULL	Malaria, jaundice, wound, stomachache, aphrodisiac, venereal diseases, diabetes.
Bosqueia anglosensis	Bosqueia anglosensis	NULL	NULL	NULL	Diarrhoea,menorrhagia
Boswellia dalzielii	Boswellia dalzielii	NULL	NULL	NULL	Urinary disorder, antiseptic.
Boswellia spp	Boswellia spp	NULL	NULL	NULL	Anti snake venom
Brassica oleracea var capitata	Brassica oleracea var capitata	NULL	NULL	NULL	Antimicrobial,skin diseases.
Bridelia ferruginea	Bridelia ferruginea	NULL	NULL	NULL	Insomnia,antipyretic, general care in children,diabetes,antibacterials,dysentery,mouth wash,gonorrhoea
Bridelia micrantha	Bridelia micrantha	NULL	NULL	NULL	Laxative, young leaves chewed for headache,migraine.
Brillantaisia nitens	Brillantaisia nitens	NULL	NULL	NULL	Diarrhoea
Brillantaisia patula	Brillantaisia patula	NULL	NULL	NULL	Yaws,diarrhoea,ease labour,dysmenorrhoea,chest pain,convulsion
Brucea antidysenterica	Brucea antidysenterica	NULL	NULL	NULL	Cancer, dysentery
Brunfelsia uniflora	Brunfelsia uniflora	NULL	NULL	NULL	''
Bryophyllum pinnatum	Bryophyllum pinnatum	NULL	NULL	NULL	Cough,diarrhoea,dysentery,wounds,fever,sedatives,diuretic,abscesses,antifungal,epilepsy, antimicrobial, anticancer.
Bryoria africana	Bryoria africana	NULL	NULL	NULL	''
Brysocarpus coccineus	Brysocarpus coccineus	NULL	NULL	NULL	Jaundice, pile, gonorrhoea,venereal disease,impotence,anti-tumour,ulcer
Buchholzia coriacea	Buchholzia coriacea	NULL	NULL	NULL	Antimicrobials, respiratory disorders,dysmenorrhoea, ulcer,fibroid,chest pains,anthelminthics
Burkea africana	Burkea africana	NULL	NULL	NULL	Septic sores, headache,astringent
Bursoma abyssinica	Bursoma abyssinica	NULL	NULL	NULL	''
Butea frondosa	Butea frondosa	NULL	NULL	NULL	Aphorodisiac, astringent, diuretic diabetes, leucorrhoea, antiseptic anthelmintic, cough, cold.
Butyrospermum paradoxum	Butyrospermum paradoxum	NULL	NULL	NULL	Nasal decongestion and cattarhal condition,anthelmintic,hypertension,diuretic.
Caesalpinia bonduc	Caesalpinia bonduc	NULL	NULL	NULL	Fever,anthelmintics,respiratory diseases
Caesalpinia cristata	Caesalpinia cristata	NULL	NULL	NULL	Antipyretic, anthelmintic, astringent, asthma, colic.
Caesalpinia pulcherima	Caesalpinia pulcherima	NULL	NULL	NULL	Purgative,emollient,abortifacient,emmenagogue.
Cajanus cajan	Cajanus cajan	NULL	NULL	NULL	Smallpox,chickenpox,diuretic,laxative,haemostatic,astringent,measles,mouth wash.
Caladium bicolor	Caladium bicolor	NULL	NULL	NULL	Topical application for boils,wound,ulcer,purgative,convulsion
Calapogonium mucunoides	Calapogonium mucunoides	NULL	NULL	NULL	Diarrhoea, skin infection.
Calendula officinalis	Calendula officinalis	NULL	NULL	NULL	Ulcer,astringent
Calliandra haematocephala	Calliandra haematocephala	NULL	NULL	NULL	Antimicrobials
Calliandra portoricensis	Calliandra portoricensis	NULL	NULL	NULL	Fevers,convulsions,breast engogement,stomach disorders,purgative,amenorrhoea,headache,lumbago
Caloncoba echinata	Caloncoba echinata	NULL	NULL	NULL	Skin infections
Caloncoba glauca	Caloncoba glauca	NULL	NULL	NULL	Leprosy, skin lesions,pustular skin eruptions,migraines
Calophyllum inophyllum	Calophyllum inophyllum	NULL	NULL	NULL	Eye infection, migraine, astringent, ulcers, gonorrhoea.
Calotropis procera	Calotropis procera	NULL	NULL	NULL	Diarrhoea, dysentery, elephantiasis, leprosy,chronic eczema,ringworm,cough,diaphoretic,emetic,asthma,abortifacient,convulsion,antipyretic.
Canarium schweinfurthii	Canarium schweinfurthii	NULL	NULL	NULL	Black tongue, round worm, gonorrhoea,stomach disorders
Canavalia ensiformis	Canavalia ensiformis	NULL	NULL	NULL	Antibiotic, antiseptic
Canna indica	Canna indica	NULL	NULL	NULL	Asthma, Malaria
Cannabis sativa	Cannabis sativa	NULL	NULL	NULL	Diarrhoea, sores, migraine, whooping cough,sedative,dandruff,lice,gonorrhea,dyspepsia
Canthium glabriflorum	Canthium glabriflorum	NULL	NULL	NULL	Cough,mental disorders
Capparis thonningii	Capparis thonningii	NULL	NULL	NULL	Fever, headache, mental disorder,aphrodisiac,cough.
Capraria biflora	Capraria biflora	NULL	NULL	NULL	Antifungal agent.
Capsicum annuum	Capsicum annuum	NULL	NULL	NULL	Carminative,stimulant,Vitamin C
Capsicum frutescens	Capsicum frutescens	NULL	NULL	NULL	Fevers, dysentery,stimulant,carminative, malaria, ingredient of some herbal recipes.
Carapa procera	Carapa procera	NULL	NULL	NULL	Purgative, ringworms, boils,rheumatic pains,antipyretic
Cardiospermum halicacabum  .	Cardiospermum halicacabum  .	NULL	NULL	NULL	Skin eruption, piles, rheumatism, syphilitic sores,gonorrhea,ameorrhoea,emetic,nervous disorders
Carica papaya	Carica papaya	NULL	NULL	NULL	Gonorrhoea, syphilis,amoebic dysentery,roundworms,abortifacient,emmenagogue,diabetes,medicinal recipes,papain enzyme as meat tenderizer,convulsion,mental disorder, malaria.
Carissa edulis	Carissa edulis	NULL	NULL	NULL	Expectorant, abortifacient, venereal diseases
Carpha procera	Carpha procera	NULL	NULL	NULL	Febrifuge, anthelmintic, appetizer, antiperiodic, purgative.
Carpodinus dulcis	Carpodinus dulcis	NULL	NULL	NULL	Galactagogure
Carpolobia lutea	Carpolobia lutea	NULL	NULL	NULL	Rheumatism,aphrodisiac,toothache
Casearia barteri	Casearia barteri	NULL	NULL	NULL	Toothache, Oral hygeine
Cassia alata					
Cassia podocarpa					
Cassia sieberiana					
Cassytha filiformis	Cassytha filiformis	NULL	NULL	NULL	Anthelmintics, antimicrobials, antifungal
Casuarina equisetifolia	Casuarina equisetifolia	NULL	NULL	NULL	Antipyretic,salt tolerant tree
Catharanthus roseus	Catharanthus roseus	NULL	NULL	NULL	Diabetes, hypertension, antileukaemic properties, antitumour,dysentery,menorrhagia
Ceiba pentandra	Ceiba pentandra	NULL	NULL	NULL	Diabetes, fever, gonorrhoea,emollient,syphilis,emetic,astringent,demulcent,asthma,diabetes,menorrhagia
Celastrus indica	Celastrus indica	NULL	NULL	NULL	Antimicrobial,anthelmintics,asthma,malaria
Celastrus paniculatus	Celastrus paniculatus	NULL	NULL	NULL	Abortion
Tectonia regia	\N	\N	\N	\N	\N
Croton membranaceus	\N	\N	\N	\N	\N
Celastrus senegalensis	Celastrus senegalensis	NULL	NULL	NULL	Dysentery, oedemas, gonorrhoea, cancer, gastrointestinal troubles,vermifuge,mouth wash,laxative,aphrodisiac.
Celosia argentea	Celosia argentea	NULL	NULL	NULL	Skin diseases, diarrhoea,,antiscorbutic,anthelmintic
Celosia laxa	Celosia laxa	NULL	NULL	NULL	Antiscorbutic, purgative
Celosia trigyna	Celosia trigyna	NULL	NULL	NULL	Anthelmintics,diuretic,astringent,chest pains,emmolient,sore
Celtis mildbraedii	Celtis mildbraedii	NULL	NULL	NULL	Arthritis,fever,dysmenorrhoea.
Centaurea perrottetii	Centaurea perrottetii	NULL	NULL	NULL	Skin infections,fever,malaria,syphilis,ulcer
Centaurea praecox	Centaurea praecox	NULL	NULL	NULL	Stomachic, purgative
Centella asiatica	Centella asiatica	NULL	NULL	NULL	Skin diseases, dysentery, elephantiasis, piles, diuretic.
Centrosema pubescens	Centrosema pubescens	NULL	NULL	NULL	Skin diseases
Cephaelis manni	Cephaelis manni	NULL	NULL	NULL	Wounds, antipyretic, dysentery.
Cercestis afzelii	Cercestis afzelii	NULL	NULL	NULL	Purgative.
Chasmanthera dependens	Chasmanthera dependens	NULL	NULL	NULL	Diuretics,antigonococcal,for management of fractures.
Chenopodium ambrosioides	Chenopodium ambrosioides	NULL	NULL	NULL	 Anthelmintics,emollient,rheumatism, tumour.
Chromolaena odorata	Chromolaena odorata	NULL	NULL	NULL	Antimicrobial, dysentery, headache,malaria fever,toothache,haemostatic,skin diseases.
Chrozophora senegalensis	Chrozophora senegalensis	NULL	NULL	NULL	Astringent, anthelmintics, rheumatism.
Chrysanthellum indicum	Chrysanthellum indicum	NULL	NULL	NULL	Boils, fever, gonorrhoea, jaundice, heart-trouble,insecticide.
Chrysanthemum cinerariae folium	Chrysanthemum cinerariae folium	NULL	NULL	NULL	Fever, wounds, general debility, insecticide.
Chrysobalanus ellipticus	Chrysobalanus ellipticus	NULL	NULL	NULL	Diarrhoea
Chrysophyllum albidum	Chrysophyllum albidum	NULL	NULL	NULL	Fever,stomachaches,antiperiodic
Chrysophyllum americanum					
Cinchona officinalis	Cinchona officinalis	NULL	NULL	NULL	Malaria,anthelmintics, antibacterial.
Cinnamomum Zeyianiam	Cinnamomum Zeyianiam	NULL	NULL	NULL	Aromatic, astringent, typhoid fever, antimicrobial nauseae, vomiting, menorrhagia.
Cissampelos owariensis	Cissampelos owariensis	NULL	NULL	NULL	Lung diseases,emmenagogue,antipyretic,diuretic,skin diseases,blood tonic
Cissus populnea					
Cissus quadrangularis	Cissus quadrangularis	NULL	NULL	NULL	Caries,dysmenorrhoea,urinary disorders
Citrullus colocynthis	Citrullus colocynthis	NULL	NULL	NULL	Antimicrobials,purgative,anthelmintics,head lice,bladder stone,contraceptive.
Citrullus lanatus	Citrullus lanatus	NULL	NULL	NULL	Womb expeller, diuretic, cystitis,  malaria, leucorrhoea, gonorrhoea,hypertension,whitlow.
Citrus aurantifolia	Citrus aurantifolia	NULL	NULL	NULL	Fever, jaundice,antimicrobials abdominal ulcer, gonorrhoea,carminative,hypertensive recipe,flavouring agent,measles,cough,toothache,anthelmintics,scurvy.
Citrus aurantium	Citrus aurantium	NULL	NULL	NULL	Cough, sore throat, stomachache,anthelmintics,malaria,carminative,typhoid fever.
Citrus limon	Citrus limon	NULL	NULL	NULL	Antipyretic,cold,stomachic
Citrus paradisi	Citrus paradisi	NULL	NULL	NULL	Antimicrobials,diabetes,astringent,emollient,demulcent, malaria.
Citrus sinensis	Citrus sinensis	NULL	NULL	NULL	Dysentery, fever, headache,antimicrobial agent,anthelmintics,toothache,antiscorbutic
Clappertonia ficifolia	Clappertonia ficifolia	NULL	NULL	NULL	Cough
Clausena anisata	Clausena anisata	NULL	NULL	NULL	Cough, cold, abdominal pain, asthma, bronchitis,dysentery, arthritis,lumbago,malaria,anthelmintics,laxative,toothache.
Cleidon gaponicum	Cleidon gaponicum	NULL	NULL	NULL	Toothache
Cleistopholis paterns	Cleistopholis paterns	NULL	NULL	NULL	Coughs,anthelmintics,antipyretic,respiratory diseases,tuberculosis,purgative
Cleome ciliata	Cleome ciliata	NULL	NULL	NULL	Earache, convulsions, sores, wounds,boils,anthelmintic,carminative,suppuration.
Cleome gynandra	Cleome gynandra	NULL	NULL	NULL	Rheumatism, headache,disinfectant,earache,neuralgia,anthelmintic,ease labour.
Clerodendrum capitalum	Clerodendrum capitalum	NULL	NULL	NULL	Anthelmintics, dysentry, gonorrhoea.
Clerodendrum paniculatum	Clerodendrum paniculatum	NULL	NULL	NULL	Antipyretic, anthelmintics,venereal diseases, rheumatism,malaria
Clerodendrum umbellatum	Clerodendrum umbellatum	NULL	NULL	NULL	Wounds, cut.
Clerodendrum volubile	Clerodendrum volubile	NULL	NULL	NULL	Venereal diseases, astringent, topical application, vermifuge.
Clitoria ternatea	Clitoria ternatea	NULL	NULL	NULL	Gonorrhoea,purgative,diuretic,ulcer
Cnestis ferruginea	Cnestis ferruginea	NULL	NULL	NULL	Snake bite, eyedrops, migraine, gonorrhoea, madness,laxative,sore throat,pyorrhoea,stabilise pregnancy,oral infections
Cnidoscolus acontifolius	Cnidoscolus acontifolius	NULL	NULL	NULL	Diuretic, antimicrobial
Coccinia barteri	Coccinia barteri	NULL	NULL	NULL	Venereal diseases,skin infections, earache
Coccinia grandis	Coccinia grandis	NULL	NULL	NULL	Depression, venereal diseases, skin infection, antibacterial.
Cochlospermun planchonii	Cochlospermun planchonii	NULL	NULL	NULL	Gonorrhoea,menstrual disorder
Cochlospermun tinctorium	Cochlospermun tinctorium	NULL	NULL	NULL	Jaundice,dysmenorrhoea,gastro-intestinal disorders, vaginal discharge,bilharzia,antimicrobials.
Cocos nucifera	Cocos nucifera	NULL	NULL	NULL	Bronchitis, liver ailments,migraine,emollient, scabies, dysentery,antiseptic,toothache,uterine diseases,hair loss,liver ailment,diuretic,anthelmintic,laxative
Cocparnus pendulus	Cocparnus pendulus	NULL	NULL	NULL	Antipyretic
Coffea arabica	Coffea arabica	NULL	NULL	NULL	Stimulant, rheumatism,diuretic
Coix lacryma-jobi	Coix lacryma-jobi	NULL	NULL	NULL	Diuretic,anthhelmintics,asthma,stimulant,cicatrizant,irregular menstruation,conjunctivitis.
Cola acuminata	Cola acuminata	NULL	NULL	NULL	Stimulant, fever, malaria.
Cola Caricifolia	Cola Caricifolia	NULL	NULL	NULL	Eye infection, Ringworm.
Cola laurifolia	Cola laurifolia	NULL	NULL	NULL	Tooth ache, dysentery, oral hygiene,caries,thrush
Cola millenii	Cola millenii	NULL	NULL	NULL	Ringworms, scabies, gonorrhoea, dysentery,ophthalmia
Cola nitida	Cola nitida	NULL	NULL	NULL	Diarrhoea, stimulant,diuretic,cardiac tonic,eye trouble
Colocasia esculenta	Colocasia esculenta	NULL	NULL	NULL	Anaemia,wounds,rheumatism,poison antidote
Combretum glutinosum	Combretum glutinosum	NULL	NULL	NULL	childhood fevers,milk preservative.
Combretum grandiflous	Combretum grandiflous	NULL	NULL	NULL	jaundice, galactogogue, cholagogues.
Combretum micranthum					
Combretum mucronatum	Combretum mucronatum	NULL	NULL	NULL	Wounds, cough,  dysentery,anthelmintic,antimicrobials,biliousness,antipyretic
Combretum paniculatum	Combretum paniculatum	NULL	NULL	NULL	Jouts pains, black tongue, appetizer, febrifuge.
Combretum racemosum	Combretum racemosum	NULL	NULL	NULL	Black tongue, appetizer, weakness,antipyretic
Commelina diffusa	Commelina diffusa	NULL	NULL	NULL	Yellow fever, oedema, sore, boils,itch,headache,backache,pregnancy promotion
Commiphora africana	Commiphora africana	NULL	NULL	NULL	Whooping cough, bronchitis, stimulant,carminative,demulcent,astringent,expectorant,stimulant,emmanagogue,menorrhoea,leprosy
Connarus africanus	Connarus africanus	NULL	NULL	NULL	Anthelmintic, astriagent
Conyza canadensis	Conyza canadensis	NULL	NULL	NULL	Gonorrhoea, diarrhoea, genital diseases, dysentery, haemostatic, insect repellant, anti-bacterial activity
Conyza sumatrensis	Conyza sumatrensis	NULL	NULL	NULL	Antipyretic,asthma,tuberculosis
Copaifera mildbraedii	Copaifera mildbraedii	NULL	NULL	NULL	Cathartic,diuretic,stimulant
Corchorus olitorus	Corchorus olitorus	NULL	NULL	NULL	Fever, worms, diarrhoea, abscesses,demulcent,antiperiodic,anthelmintic,astringent,asthma
Cordia millenii	Cordia millenii	NULL	NULL	NULL	Fever, cough, stomachache,mild tonic,astringent,toothache
Corynanthe johimbe	Corynanthe johimbe	NULL	NULL	NULL	Hypertension,aphrodisiac, dysmenorrhoea
Corynanthe pachyceras	Corynanthe pachyceras	NULL	NULL	NULL	Mental problems, impotence, anaesthesia,aphrodisiac,antipyretic,local anasthesia,mental problem
Cosmos sulphureus	Cosmos sulphureus	NULL	NULL	NULL	Antimicrobial,wounds,astringent,colourant.
Costus afer	Costus afer	NULL	NULL	NULL	Coughs, diabetes, rheumatic swellings, cuts/sores,diuretic,diabetic,antiarthritic property,malaria,jaundice,gonorrhoea,bilharzia,anti-snake.
Coula edulis	Coula edulis	NULL	NULL	NULL	Dysentery, stomach disorder, skin diseases.
Courbonia virgata	Courbonia virgata	NULL	NULL	NULL	Stimulant,chest pains,cough
Crassocephalum crepidioides	Crassocephalum crepidioides	NULL	NULL	NULL	 Indigestion, colic, flatulence, headache, breast-cancer.
Crassocephalum rubens	Crassocephalum rubens	NULL	NULL	NULL	Earache,carious tooth,breast cancer,stomachache
Craterispermum laurinum	Craterispermum laurinum	NULL	NULL	NULL	Gonorrhoea, schistosomiasis,vermifuge,fever,aphrodisiac,malaria,jaundice,eye trouble
Crateva adansonii	Crateva adansonii	NULL	NULL	NULL	Tonic, stomachache, antipyretic,rubefacient,urinary disorders
Crescentia cujete	Crescentia cujete	NULL	NULL	NULL	Receptacle for herbal medicines
Crinum glaucum	Crinum glaucum	NULL	NULL	NULL	Antimicrobial,purgative,rubefacient,cough,anti-allergic properties,female fertility
Crinum jagus	Crinum jagus	NULL	NULL	NULL	Chronic cough, tuberculosis, rheumatism,emetic,whitlow,anthelmintics,purgative,rubefacient
Crossopteryx febrifuga	Crossopteryx febrifuga	NULL	NULL	NULL	Fever, gastrointestinal&respiratory disorders.
Crotalaria retusa	Crotalaria retusa	NULL	NULL	NULL	Fever, cirrhosis, liver lesions, dysentery,colic,vermifuge
Croton lobatus	Croton lobatus	NULL	NULL	NULL	Guinea worm, convulsions, skin diseases.rheumatic pain, urinary disorder,purgative
Croton penduliflorus	Croton penduliflorus	NULL	NULL	NULL	Constipation,general debility,diuretics,arthritis,purgative,anti-tumour
Croton zambesicus	Croton zambesicus	NULL	NULL	NULL	Piles,gonorrhoea,arthritis,diarrhoea,impotence,
Cryptolepia sanguinolenta	Cryptolepia sanguinolenta	NULL	NULL	NULL	Antipyretic, antibacterial, urinary infections, gastrointestinal disorder, rheumatism.
Cryptostegia grandiflora	Cryptostegia grandiflora	NULL	NULL	NULL	Fungi infection, heart problem.
Cucumeropsis manni	Cucumeropsis manni	NULL	NULL	NULL	Milk laxative
Cucumis melo	Cucumis melo	NULL	NULL	NULL	Fungal diseases, emetic,purgative,gonorrhoea.
Cucumis prophetarum	Cucumis prophetarum	NULL	NULL	NULL	Vermifuge
Cucurbita maxima	Cucurbita maxima	NULL	NULL	NULL	Tapeworm, diuretic, taenicide, otitis,utensils.
Cucurbita pepo	Cucurbita pepo	NULL	NULL	NULL	Urinary complaints, cathartic,taenicide,diuretic,demulcent,anthelmintics,boils,burns,anti-tumour.
Culcasia scandens	Culcasia scandens	NULL	NULL	NULL	Skin disease,anaesthetic,stomachache,pregnancy booster,venereal disease
Curculigo pilosa	Curculigo pilosa	NULL	NULL	NULL	Leaukaemia,gonorrhoea,cough,purgative,astringent,aphrodisiac,demulcent
Curcuma longa	Curcuma longa	NULL	NULL	NULL	Jaundice, eye wash, skin diseases, vermifuge,yellow fever,ringworm,anti-tumour,antimicrobials,carminative,malaria
Cuscuta australis	Cuscuta australis	NULL	NULL	NULL	Laxative, kidney, liver disease, sores,laxative,astringent,anthelmintic,measles
Cyathula prostrata	Cyathula prostrata	NULL	NULL	NULL	Ringworms, scabies, gonorrhoea, dysentery,rheumatism.
Cylicodiscus gabonensis	Cylicodiscus gabonensis	NULL	NULL	NULL	Diarrhoea, dysentery
Cymbopogon citratus	Cymbopogon citratus	NULL	NULL	NULL	Malaria, cough, sprains, lumbago, stomach tonic, stimulant, cold,diaphoretic,diuretic,refrigerant,ringworm
Cynara scolymus	Cynara scolymus	NULL	NULL	NULL	Diuretic, liver diseases, anti-atherosderotic, use as sugar substitute
Cynodon dactylon	Cynodon dactylon	NULL	NULL	NULL	Venereal diseases, astringent, haemostatic, urinary infection, wounds.
Cyperus esculentus	Cyperus esculentus	NULL	NULL	NULL	To induce vomiting,diuretic,anthelmintics,carminative,menstrual disorders.
Cyrtosperma senegalense	Cyrtosperma senegalense	NULL	NULL	NULL	Cough,ease labour,astringent,ulcer,gonorrhoea.
Dacryodes edulis	Dacryodes edulis	NULL	NULL	NULL	Jiggars,skin diseases, acute malaria,anthelmintics,astringent,wounds,clearing pregnancy stretch marks,elephantiasis.
Dalbergia lactea	Dalbergia lactea	NULL	NULL	NULL	Pimples,anthelmintic,ease labour
Dalbergia saxatilis	Dalbergia saxatilis	NULL	NULL	NULL	Cough, small pox, skin lesions, bronchial ailments,toothache
Dalbergiella welwitschii	Dalbergiella welwitschii	NULL	NULL	NULL	Bronchial ailments,purgative,anthelmintic,menstrual disorder.
Daniellia oliveri	Daniellia oliveri	NULL	NULL	NULL	Dysentery, diarrhoea, toothache,urinary infection,astringent,tooth ache
Daniellia thurifera	Daniellia thurifera	NULL	NULL	NULL	Scabies
Datura metel	Datura metel	NULL	NULL	NULL	Ashma,venereal diseases,convulsion.
Datura stramonium	Datura stramonium	NULL	NULL	NULL	Asthma, cough, astringent,aphrodisiac,mental disorders,gonorrhoea,lumbago,neuralgic,insomnia,anodyne,sedative,antispasmodic
Deinbollia pinnata	Deinbollia pinnata	NULL	NULL	NULL	Cough, bronchial asthma.,aphrodisiac
Delonix regia	Delonix regia	NULL	NULL	NULL	Diuretic,anthelmintics,astringent,leucorrhoea
Dennettia tripetala	Dennettia tripetala	NULL	NULL	NULL	Insect repellant,fever,cough,toothache,stimulant
Desmodium adscendens	Desmodium adscendens	NULL	NULL	NULL	Constipation, convulsions, gonorrhoea, syphilis, bronchial asthma,spermcount enhancer.
Desmodium gangeticum	Desmodium gangeticum	NULL	NULL	NULL	Astringent, urinary disorder, broachi infection, fever, chest infection.
Detaruyn nucricaroyn	Detaruyn nucricaroyn	NULL	NULL	NULL	Wounds, ulcers
Dialium guineense	Dialium guineense	NULL	NULL	NULL	Fever, coughs, bronchitis, toothache,astringent, diuretic
Dichapetalum baneri	Dichapetalum baneri	NULL	NULL	NULL	Cough, rheumatism, bachache
Dichapetalum toxicarium	Dichapetalum toxicarium	NULL	NULL	NULL	Jaundice,poisonous to animals,malaria,cardiac asthma
Dichrostachys cinerea	Dichrostachys cinerea	NULL	NULL	NULL	Fever, stomachache, toothache,diuretic,astringent,anthelmintics,scald,sores
Dichrostachys glomerata					
Dicoma sessiliflora	Dicoma sessiliflora	NULL	NULL	NULL	Antipyretic,aphrodisiac,cough,stomachache
Digitaria horizontalis	Digitaria horizontalis	NULL	NULL	NULL	Nervous problem,enhancing memory
Dioclea reflexa	Dioclea reflexa	NULL	NULL	NULL	Asthma,head lice,dandruff,stimulant.
Dioscorea bulbifera	Dioscorea bulbifera	NULL	NULL	NULL	Mystic properties,diarrhoea,dysentery,constipation,anthelmintics,antidote for snake and scorpion venom,coughs,mental problems,diabetes,weak erection,breast enlargement,fever,rheumatism,antimicrobials.
Dioscorea dumetorum	Dioscorea dumetorum	NULL	NULL	NULL	Colic, abdominal, vomiting, analgesic,skin disorders,psychic trouble,malaria,ease labour,anti-bilharzia.
Dioscoreophyllum cumminsii	Dioscoreophyllum cumminsii	NULL	NULL	NULL	Diabetes, obesity, impotence,tonic for debility.
Diospyros canaliculata	Diospyros canaliculata	NULL	NULL	NULL	Leprosy, antimicrobials,anthelmintics,abortifacient,cardiac tonic.
Diospyros mespliforimis	Diospyros mespliforimis	NULL	NULL	NULL	Bilharzia, diarrhoea, antibacterial,anthelmintic,astringent,abortifacient,fertility regulation
Discoglypremna caloneura	Discoglypremna caloneura	NULL	NULL	NULL	Gastrointestinal disorder, catharsis, abortion, purgative.
Dissotis rotundifolia	Dissotis rotundifolia	NULL	NULL	NULL	Venereal diseases, coughs,antimicrobials,conjunctivities,haemostatic,weight control,diuretic,asthma,ulcer.
Dodonaea viscosa	Dodonaea viscosa	NULL	NULL	NULL	Sore throat, diaphoretic, fever.
Dorstenia prorepens	Dorstenia prorepens	NULL	NULL	NULL	Nephrosis,wound,antipyretic,antimicrobials.
Dracaena manni	Dracaena manni	NULL	NULL	NULL	Skin diseases,antimicrobials,stomachache,caries.
Drynaria laurentii	Drynaria laurentii	NULL	NULL	NULL	Venereal diseases.
Drypetes chevalieri	Drypetes chevalieri	NULL	NULL	NULL	Cough,asthma,bronchitis
Drypetes Florabunda	Drypetes Florabunda	NULL	NULL	NULL	Toothache, oral hygiene
Duranta repens	Duranta repens	NULL	NULL	NULL	Anthemintic, insecticide
Dyschoriste perrottetii	Dyschoriste perrottetii	NULL	NULL	NULL	Inflammation, Eye irrigation.
Echinacea purpurea	Echinacea purpurea	NULL	NULL	NULL	Antimicrobial agent.
Eclipta prostrata	Eclipta prostrata	NULL	NULL	NULL	Elephantiasis, fever,cough, skin diseases,oedema,liver ailments,emetic,antiseptic,diarrhoea,convulsion.
Ehretia cymosa	Ehretia cymosa	NULL	NULL	NULL	Amenorrhoea,contraceptive,fevers,convulsion,fracture management
Eichhornia crassipes	Eichhornia crassipes	NULL	NULL	NULL	Skin care,fresh juice for wounds,styptic,goitre,protecting feet as foot wears
Ekebergia  senegalensis	Ekebergia  senegalensis	NULL	NULL	NULL	Rheumatism, insomnia,malaria,antipyretic,blood tonic, chicken box,charred powder of roots for inducing sneezing
Ekebergia capensis	Ekebergia capensis	NULL	NULL	NULL	Fever, epilepsy, haemolytic,sinusitis,purify blood,insomnia, malaria.
Elaeis guineensis	Elaeis guineensis	NULL	NULL	NULL	Malaria, mental disorders,diarrhoea,asthma,measles.
Elaeophorbia drupifera	Elaeophorbia drupifera	NULL	NULL	NULL	Intestinal parasities,fever,measles,purgative,warts,epilepsy,asthma,analgesic,skin diseases.
Elephantapus scaber	Elephantapus scaber	NULL	NULL	NULL	Fever, cough.
Eleusine indica	Eleusine indica	NULL	NULL	NULL	Coughing with bloody sputum,antipyretic,anthelmintics,venereal diseases.
Elytraria marginata	Elytraria marginata	NULL	NULL	NULL	Gonorrhoea, male-impotence, stomache, cough, infertility.
Embelia guineaasis	Embelia guineaasis	NULL	NULL	NULL	Anthelmintic, skin diseases
Embelia schimperi	Embelia schimperi	NULL	NULL	NULL	Antispasmodic, anthelmintic.
Emilia coccinea	Emilia coccinea	NULL	NULL	NULL	Ulcers, craw-craw, abscesses of the breast, yaws, lice, ringworm, febrifuge, syphilis, hernia, gonorrhoea, measles,cough,salad.
Enantia chlorantha	Enantia chlorantha	NULL	NULL	NULL	Typhoid fever,malaria,antimicrobials, jaundice, rickettsia,infective hepatitis,haemostatic,uterus stimulant,ulcer.
Entada africana	Entada africana	NULL	NULL	NULL	Astringent,antimimicrobials, antipyretic, abortifacient,malaria.
Entada gigas	Entada gigas	NULL	NULL	NULL	Diarrhoea,antimicrobial,abdominal pain, abortifacient,convulsion,astringent,charm to ward off evil spirit
Entandrophragma cylindricum	Entandrophragma cylindricum	NULL	NULL	NULL	Diabetes, cough, fever,gastro-intestinal disorders, black tongue,stimulant
Eragrostis tremula	Eragrostis tremula	NULL	NULL	NULL	To improve memory
Eremomastax speciosa	Eremomastax speciosa	NULL	NULL	NULL	Guinea worms,anthelmintic,sores
Erissema psoraleoides	Erissema psoraleoides	NULL	NULL	NULL	Venereal diseases, boils, cuts, eye infection.
Eruatamia coronaria	Eruatamia coronaria	NULL	NULL	NULL	Anthelmintic, skin infection, toothache, eye diseases-ophthalmia.
Eryngium foetidum	Eryngium foetidum	NULL	NULL	NULL	Ulcer, headache, hysteria
Erythrina senegalensis	Erythrina senegalensis	NULL	NULL	NULL	Anthelmintics,cathartic,dysentery,antipyretic,emmenagogue,galactogue
Erythrococca anomala	Erythrococca anomala	NULL	NULL	NULL	Headache, joint pains,earaches,taeniacide.
Cassia occidentalis	\N	\N	\N	\N	\N
Erythrophleum suaveolens	Erythrophleum suaveolens	NULL	NULL	NULL	Chicken pox, gangrenous sores, snake bite,emetic.filarial worm swelling,skin diseases,wound,hypertension,local anaesthetic,sneezing inducer.
Erythroxylum coca	Erythroxylum coca	NULL	NULL	NULL	Local anaesthesia, sedative.
Euadenia trifoliata	Euadenia trifoliata	NULL	NULL	NULL	Tuberculosis,arthritis, otalgia, aphrodisiac, rectal prolapse.
Eucalyptus globulus	Eucalyptus globulus	NULL	NULL	NULL	Nasal congestion, antibacterial, wounds, mouth wash.
Eugenia aromatica	Eugenia aromatica	NULL	NULL	NULL	Toothache, carminative, rubefacient, serving as preservative in herbal recipes.
Eugenia caryophylus					
Eugenia malaccencis	Eugenia malaccencis	NULL	NULL	NULL	Antimicrobial,source for vitamins
Eugenia unifolia	Eugenia unifolia	NULL	NULL	NULL	Antimicrobial.
Eulophia millsoni	Eulophia millsoni	NULL	NULL	NULL	Aphrodisiac
Euphorbia balsamifera	Euphorbia balsamifera	NULL	NULL	NULL	Caries, dysentery
Euphorbia deightonii	Euphorbia deightonii	NULL	NULL	NULL	Woman Sterility
Euphorbia heterophylla	Euphorbia heterophylla	NULL	NULL	NULL	Skin diseases, febrifuges, purgative.
Euphorbia hirta	Euphorbia hirta	NULL	NULL	NULL	Cough, asthma, catarrh, hay-fever,pulmonary ailment,hay fever,amoebic dysentery,conjuctivitis,anthelmintic,aphrodisiac,increase lactation and shape of breast,hypertension,antispasmodic
Euphorbia kamerunica	Euphorbia kamerunica	NULL	NULL	NULL	Topical application to aid umbilical cord drop-off,warts,anthelmintics,purgative
Euphorbia laterifolia	Euphorbia laterifolia	NULL	NULL	NULL	Dermatosis, infertility, anthelmintics constipation, convulsive fevers
Euphorbia unispina	Euphorbia unispina	NULL	NULL	NULL	Antidote for snake bites, fractures,skin diseases,antihelmintics
Evolvulus alsinoides	Evolvulus alsinoides	NULL	NULL	NULL	Diarrhoea,antipyretic,asthma,chronic bronchitis
Eythrococca anomala	Eythrococca anomala	NULL	NULL	NULL	Anthelmintic, headache, rheumatic, pains, earache.
Fagara rubescens	Fagara rubescens	NULL	NULL	NULL	Toothache, headache, backache, general debiity.
Ficus asperifolia	Ficus asperifolia	NULL	NULL	NULL	Wounds, coughs.
Ficus capensis	Ficus capensis	NULL	NULL	NULL	Dysentery, oedema, leprosy, epilepsy, ricketts,emollient,astringent,infertility,increase lactation,respiratory disorders,gonorrhoea.
Ficus elegans	Ficus elegans	NULL	NULL	NULL	Diarrhoea, piles, stomach-ache, constipation, craw-craw.
Ficus exasperata	Ficus exasperata	NULL	NULL	NULL	Stomach disorder, scabies, gonorrhoea, urinary ailments, jaundice,abortifacient,antipyretic.
Ficus thonningii	Ficus thonningii	NULL	NULL	NULL	Wounds,fevers,dysentery
Ficus vallis-choudae	Ficus vallis-choudae	NULL	NULL	NULL	Jaundice, gastro-intestinal disorders,anthelmintic,astringent,skin disorders
Ficus vogelii	Ficus vogelii	NULL	NULL	NULL	Wound, diarrhoea, dysentery, boils
Flabellaria paniculata	Flabellaria paniculata	NULL	NULL	NULL	Wounds, cuts
Flacourtia flavescens	Flacourtia flavescens	NULL	NULL	NULL	Asthma, bronchitis, catarrhal condition,antibacterial,astringent,diaphoretic,antiperiodic,toothache.
Fluerya aestuans	Fluerya aestuans	NULL	NULL	NULL	Liver diseases,diuretic, antipyretic,astringent,piles,haemostatic, burns,hair care, pregnancy booster,expels bladder stone
Flugea virosa					
Funtumia africana	Funtumia africana	NULL	NULL	NULL	Constipation, wounds, boils,weak bladder, jaundice,antipyretic.
Funtumia elastica	Funtumia elastica	NULL	NULL	NULL	Jaundice, piles, impotence,antipyretics.
Galinsoga parviflora	Galinsoga parviflora	NULL	NULL	NULL	Wounds, analgesic
Garcinia afzelii	Garcinia afzelii	NULL	NULL	NULL	Dysentery.aphrodisiac,oral thrush,toothache
Garcinia kola	Garcinia kola	NULL	NULL	NULL	Antimicrobials,dysentery, tumours, bronchitis, cough, fever,toothache, throat and respiratory ailments,liver disorders,headache,evacuant, Anti-cancer.
Garcinia manni	Garcinia manni	NULL	NULL	NULL	Diuretic
Gardenia ternifolia	Gardenia ternifolia	NULL	NULL	NULL	Fever, cough, stomachache, dysentery,skin lesion,emetic
Geophila obvallata	Geophila obvallata	NULL	NULL	NULL	Eye wash, headache, tooth ache, stomachache
Gisekia pharmacioides	Gisekia pharmacioides	NULL	NULL	NULL	Wounds, cut, anthelmintic, purgative
Gladiolus psittacinus	Gladiolus psittacinus	NULL	NULL	NULL	Antigonococcal,dysentery,diarrhoea,mental disorder,constipation,mystic use.
Gloriosa superba	Gloriosa superba	NULL	NULL	NULL	Gonorrhoea, head lice, rheumatism,purgative,antiperiodic,stomachic tonic.
Glossonema boveanum	Glossonema boveanum	NULL	NULL	NULL	Use to increase lactation I pregnant woman.
Glycine max	Glycine max	NULL	NULL	NULL	Laxative
Glycyrrhiza glabra	Glycyrrhiza glabra	NULL	NULL	NULL	Expectorant, bronchitis, sorethroat, demulcent, emollient, alterative.
Glyphaea brevis	Glyphaea brevis	NULL	NULL	NULL	Diarrhoea, fever, respiratory ailment,gonorrhea,wound,toothache,gum infection
Gmelina arborea	Gmelina arborea	NULL	NULL	NULL	Antipyretic,stomach disorder,cough,gonorrhoea,demulcent
Gnidia kraussiana	Gnidia kraussiana	NULL	NULL	NULL	Skin diseases, leprosy, dysentery, diarrhoea, nasal discharge, purgative.
Gomphrena globosa	Gomphrena globosa	NULL	NULL	NULL	Antipyretic,diuretic,astringent,cough,laxative,emmenagogue
Gongronema latifolium	Gongronema latifolium	NULL	NULL	NULL	Sore gums,colic, dyspepsia, anthelmintic.
Gossypium barbadense	Gossypium barbadense	NULL	NULL	NULL	Convulsions, dysentery,asthma,antipyretic,hypertension, ulcers,contraceptive,  relieve menstrual cycle disorders,emmenagogue,abortfacient,ease labour
Gouania longipetala	Gouania longipetala	NULL	NULL	NULL	Gum infection
Greenwayodendron suaveolens	Greenwayodendron suaveolens	NULL	NULL	NULL	Anthelmintics,purgative,ease labour,menorrhagia,weak erection..
Grewia flavescens	Grewia flavescens	NULL	NULL	NULL	Boils, enlarged spleen,aid lactating mother
Grewia pubescens	Grewia pubescens	NULL	NULL	NULL	Dysentery, gastro-intestinal disorder,antidote for snake bite,boils,emollient
Grewia sp	Grewia sp	NULL	NULL	NULL	Religious purpose, mystic, soup with okra-like taste
Grewia venusta	Grewia venusta	NULL	NULL	NULL	Fever, boils, wounds,colic,anti-diarrhoea,ease of labour
Griffonia simplicifolia	Griffonia simplicifolia	NULL	NULL	NULL	Bone-fracture, congestion,sedative,aphrodisiac,appetite suppressant for weight loss.
Jussiaea linifoliio	Jussiaea linifoliio	NULL	NULL	NULL	Malaria.
Guaiacum officinale	Guaiacum officinale	NULL	NULL	NULL	Diuretic, diaphoretic, urinary disorder
Guibourtia copallifera	Guibourtia copallifera	NULL	NULL	NULL	Galactogogue, blood booster, rheumatism, gastro-enteritis, dysentery.
Guiera senegalensis	Guiera senegalensis	NULL	NULL	NULL	Skin infection, fever, diarrhoea, dysentery, syphilis, tonic, increase lactation, prevention of leprosy.
Gymnema sylvestre	Gymnema sylvestre	NULL	NULL	NULL	Diabetes, heart stimulant, snake bite, anti-inflammatory, tonic.
Gynura amplexicanlis	Gynura amplexicanlis	NULL	NULL	NULL	Eye infection, gonorrhoea
Haemanthus multiflorus	Haemanthus multiflorus	NULL	NULL	NULL	Stimulant, cardiac tonic
Haematostaphis barteri	Haematostaphis barteri	NULL	NULL	NULL	Anthelmintic, febrifuge, emetic, tonic,hepatitis, sleeping sickness, diarrhoea.
Haematoxylum compechionum	Haematoxylum compechionum	NULL	NULL	NULL	Astringent, diarrhoea, colouring.
Hannoa klaineana	Hannoa klaineana	NULL	NULL	NULL	Hypertension,carminative,stimulant , fever.
Harpagophytum procumbens					
Harrisonia abyssinica	Harrisonia abyssinica	NULL	NULL	NULL	Stomachache, leprosy, antidote, cancerous tumours,bubonic plague,skin diseases,antipyretic,anthelmintics,insomnia
Harungana madagascariensis	Harungana madagascariensis	NULL	NULL	NULL	Dysentery, piles, trypanosomiasis, fever, cold, jaundice, scabies, haemostatic,emetic,black tongue,urinary fistula,ringworm,jaundice
Hedranthera barteri	Hedranthera barteri	NULL	NULL	NULL	Convulsion,anthelmintics,venereal diseases,cough,anti-tumour
Heeria insignis	Heeria insignis	NULL	NULL	NULL	Anthemintic, aphrodisiac, galactogogue,dysentery,vermifuge
Helianthus annus	Helianthus annus	NULL	NULL	NULL	Diuretic,pulmonary disorders,expectorant
Heliotropium indicum	Heliotropium indicum	NULL	NULL	NULL	Convulsions, cancer, worms ,rectal enema,mouth-wash.
Hexalobus crispiflorus.	Hexalobus crispiflorus.	NULL	NULL	NULL	Gonorrhoea,cough, malaria,
Hibiscus acetosella	Hibiscus acetosella	NULL	NULL	NULL	Dysentery
Hibiscus asper	Hibiscus asper	NULL	NULL	NULL	Cough, wound,diuretics
Hibiscus rosasinensis	Hibiscus rosasinensis	NULL	NULL	NULL	Influenza, cough, asthma, tertiary syphilis, stomach upset,appendicitis,hypertension,oligospermia,antipyretic
Hibiscus sabdariffa	Hibiscus sabdariffa	NULL	NULL	NULL	Diuretic,coughs,dressing wounds,beverage
Hibiscus surattensis	Hibiscus surattensis	NULL	NULL	NULL	Stomachache,mystic uses
Hildegradia barteri	Hildegradia barteri	NULL	NULL	NULL	Epilepsy
Hilleria latifolia	Hilleria latifolia	NULL	NULL	NULL	Breast cancer,urethral discharge,purgative,headache,anthelmintic,skin diseases
Holarrhena floribunda	Holarrhena floribunda	NULL	NULL	NULL	Dysentery, diarrhea, jaundice, fever,astringent,bilious disorder,anthelmintics
Honey					
Hoslundia  opposita	Hoslundia  opposita	NULL	NULL	NULL	Herpes,conjunctivitis,epilepsy,skin diseases,diabetes,jaundice,abdominal pain,antipyretic,haemostatic,antimicrobial, Malaria.
Hybanthus enneaspermus	Hybanthus enneaspermus	NULL	NULL	NULL	Easy and painless child delivery.
Hygrophila auriculala	Hygrophila auriculala	NULL	NULL	NULL	Blennorrhoea, craw-craw, bacteriostatic, diuretic.
Hygrophila auriculata	Hygrophila auriculata	NULL	NULL	NULL	Biennorrhoea, craw-craw, bacteriostatic, diuretic.
Hygrophilia auriculata	Hygrophilia auriculata	NULL	NULL	NULL	Diuretic,skin infections,urinary disorders,antipyretic,demulcent,stomachache
Hymenocardia acida	Hymenocardia acida	NULL	NULL	NULL	Measles, fever, jaundice, coated tongue.
Hymenostegia afzelii	Hymenostegia afzelii	NULL	NULL	NULL	Astringent,toothache,piles,cough
Hyoscyamus niger	Hyoscyamus niger	NULL	NULL	NULL	Antispasmodics, eye-wash, sedative.
Hypoestes forskalei	Hypoestes forskalei	NULL	NULL	NULL	Skin infections
Hypoestes verticillaris	Hypoestes verticillaris	NULL	NULL	NULL	Sore, fever, antiseptic, chest pains.
Hypoxis nyasica	Hypoxis nyasica	NULL	NULL	NULL	Uterine cancer, premenstrual syndrome.
Hyptis suaveloensis	Hyptis suaveloensis	NULL	NULL	NULL	Cough,fevers,wounds,anthelmintic,carminative, malaria.
Icacina tricantha	Icacina tricantha	NULL	NULL	NULL	Rheumatism,aphrodisiac,toothache,anthelmintics,purgative,abortifacient,wound,dermatophytosis.
Impatiens balsamina	Impatiens balsamina	NULL	NULL	NULL	Antiseptic,fungicide.
Impatiens glandulifera	Impatiens glandulifera	NULL	NULL	NULL	topical application on poison ivy rash
Indigofera arrecta	Indigofera arrecta	NULL	NULL	NULL	Diarrhoea, dysentery.
Indigofera macrophylla	Indigofera macrophylla	NULL	NULL	NULL	Whooping cough, bronchitis, piles, ulcers, enlargement of spleen and liver,skin diseases.
Ipomoea asarifolia	Ipomoea asarifolia	NULL	NULL	NULL	Haemorrhage, urinary problem,purgative,syphilis.
Ipomoea batatas	Ipomoea batatas	NULL	NULL	NULL	Boils, wounds, bronchial asthma,purgative,breast swelling,diabetes,antimicrobials.
Ipomoea fistulosa	Ipomoea fistulosa	NULL	NULL	NULL	Toothache, mouthwash.
Ipomoea involucrata	Ipomoea involucrata	NULL	NULL	NULL	Convulsions,purgative,eye drops,asthma,arthritis,antipyretic,yellow fever,filariasis,gynaecological diseases,gonorrhoea.
Ipomoea mauritiana	Ipomoea mauritiana	NULL	NULL	NULL	Rheumatism, asthma, dropsy.
Irvingia gabonensis	Irvingia gabonensis	NULL	NULL	NULL	Spleen Infection.
Isolana campanulata	Isolana campanulata	NULL	NULL	NULL	Bronchial infections, skin diseases, cough, hematuria, fever, bilharzia, tonic, rheumatism
Isolona campanulata	Isolona campanulata	NULL	NULL	NULL	Fever, cough, bitharzu
Jacaranda spp	Jacaranda spp	NULL	NULL	NULL	Venereal diseases, spleen tonic.
Jasminum pauciflonum	Jasminum pauciflonum	NULL	NULL	NULL	Anthelmintic, toothache, diuretic, antifungal wounds, abscess in breast
Jateorhiza macrantha	Jateorhiza macrantha	NULL	NULL	NULL	Antidote to snake bite, ulcers, wounds, cuts, tonic,aphrodisiac
Jateorhiza Palmate	Jateorhiza Palmate	NULL	NULL	NULL	Hypertension, dysentery, anthelmintic, tonic, fever, stomachic
Jatropha curcas	Jatropha curcas	NULL	NULL	NULL	Ringworm, eczema,scabies, fever, guinea worms, herpes,rectal enema,black tongue,whitlow,impotence,irregular menses,convulsion,smallpox
Jatropha gossypiifolia	Jatropha gossypiifolia	NULL	NULL	NULL	Ringworm, ascaris, anti-tumour,malaria,dysentery,dysmenorrhoea.
Jatropha multifida	Jatropha multifida	NULL	NULL	NULL	Coated tongue
Azadiractha indica	\N	\N	\N	\N	\N
Justicia flava	Justicia flava	NULL	NULL	NULL	Fungal skin diseases,malaria,stomach disorder,haematuria
Justicia insularis	Justicia insularis	NULL	NULL	NULL	Measles,smallpox.
Kaempfena nigerica	Kaempfena nigerica	NULL	NULL	NULL	Mental disorder, hallucinogenic agent
Kalanchoe crenata	Kalanchoe crenata	NULL	NULL	NULL	Smallpox, convulsion, gonorrhoea, rheumatism,ear problem, chronic cough, headache,wounds,asthma,palpitation,mental disorder,anthelmintics.
Khaya grandifolia					
Khaya ivorensis	Khaya ivorensis	NULL	NULL	NULL	Malaria, Jaundice,anthelmintic,emetic,emmenagogue,skin diseases,anaemia,arthritis
Khaya senegalensis					
Kigelia africana	Kigelia africana	NULL	NULL	NULL	Kidney disorders, malaria, dysentery, rheumatism,gonorrhoea.,haemorrhage,spleen infection,astringent,leucorrhoea,cough.
Klainedoxa gabonensis	Klainedoxa gabonensis	NULL	NULL	NULL	Measles,yaws,skin diseases,thrush,venereal diseases,chickenpox,toothache,stomachic
Kolobopetalum auriculatum	Kolobopetalum auriculatum	NULL	NULL	NULL	Relieve pains.
Lactuca capensis	Lactuca capensis	NULL	NULL	NULL	Diuretic, constipation.
Lagenaria breviflorus	Lagenaria breviflorus	NULL	NULL	NULL	Purgative, anthelmintics, cathartic,lumbago,diabetes mellitus,smallpox,chickenpox, abortifaecient.
Lagenaria siceraria	Lagenaria siceraria	NULL	NULL	NULL	Anthelmintic properties, chest pains,purgative
Lagerstroemia speciosa	Lagerstroemia speciosa	NULL	NULL	NULL	Antidiabetic,stimulant
Laggera alata	Laggera alata	NULL	NULL	NULL	Fever, rheumatic pains, pneumonia, emmenagogue, tapeworms,convulsion.
Laggera aurita	Laggera aurita	NULL	NULL	NULL	Malaria, Gastro-intestinal disorder, astringent, insect-repellant, convulsion.
Landolphia dulcis	Landolphia dulcis	NULL	NULL	NULL	Rheumatism,cough,kidney diseases
Landolphia owariensis	Landolphia owariensis	NULL	NULL	NULL	Malaria fever, gonorrhoea,vermifuge
Lannea nigritana	Lannea nigritana	NULL	NULL	NULL	Sprains, gout, dysentery, asthma, bruises.rheumatic joint,astringent,neurotic disorders,skin diseases.
Lantana camara	Lantana camara	NULL	NULL	NULL	Fever,antiseptic,antispasmodic,antipyretic
Lasiodiscus mildbraedi	Lasiodiscus mildbraedi	NULL	NULL	NULL	Oral hygiene
Lasiosiphon kraussianus	Lasiosiphon kraussianus	NULL	NULL	NULL	Burns, purgative, snakebite
Launaea taraxacifolia	Launaea taraxacifolia	NULL	NULL	NULL	Yaws, Fracture management.
Lawsonia inermis	Lawsonia inermis	NULL	NULL	NULL	Spermatorrhoea, jaundice, gonorrhoea, leucorrhoea, ulcers, menorrhagia,astringent,skin diseases, malaria.
Lecaniodiscus cupanioides	Lecaniodiscus cupanioides	NULL	NULL	NULL	Fevers,burns,liver abscess,purgative,amenorrhoea,typhoid fever,jaundice,cough, malaria.
Leea guineensis	Leea guineensis	NULL	NULL	NULL	Pregnancy detection,purgative,toothache,gonorrhoea,general weakness.
Leersia hexrandra	Leersia hexrandra	NULL	NULL	NULL	Asthma,bronchitis,chest pains
Leonotis nepetifolia	Leonotis nepetifolia	NULL	NULL	NULL	Wound,skin diseases,emmenagogue,purgative,anthelmintic,tonic
Leptadenia hastata	Leptadenia hastata	NULL	NULL	NULL	Antimicrobials, antispasmodic
Leptochloa coenilescins	Leptochloa coenilescins	NULL	NULL	NULL	Bathing of newborn
Leptogramma pillosiusaila	Leptogramma pillosiusaila	NULL	NULL	NULL	Diabetes, obesity
Leucaena glauea	Leucaena glauea	NULL	NULL	NULL	Stimulant, tonic..
Leucas martinicensis	Leucas martinicensis	NULL	NULL	NULL	Snake antidote
Leucena leucocephala	Leucena leucocephala	NULL	NULL	NULL	Antimicrobial, blood tonic.
Lippia multiflora	Lippia multiflora	NULL	NULL	NULL	Hypertension,cough,antipyretic,jaundice,sleeping sickness
Lobelia molleri	Lobelia molleri	NULL	NULL	NULL	Antispasmodic and antileptic
Lonchocarpus cyanescens	Lonchocarpus cyanescens	NULL	NULL	NULL	Arthritic conditions, sore, mental disorders,boils,anthelmintics,antimicrobial.
Lonchocarpus sericeus	Lonchocarpus sericeus	NULL	NULL	NULL	Convulsion, skin diseases,laxative
Lonicera caprifolum	Lonicera caprifolum	NULL	NULL	NULL	Respiratory disorder, expectorant, liver disorder.
Lophira alata	Lophira alata	NULL	NULL	NULL	Fever, coughs, jaundice, gastrointestinal disorders.
Lovoa trichilioides	Lovoa trichilioides	NULL	NULL	NULL	Yellow fever, cough, stomachache,anthelmintic
Ludwigia suffruticosa	Ludwigia suffruticosa	NULL	NULL	NULL	Purgative,wounds,fevers,anthelmintics,cough
Luffa cylindrica	Luffa cylindrica	NULL	NULL	NULL	Purgative,tonic
Lycopersicon esculentum	Lycopersicon esculentum	NULL	NULL	NULL	Ear-ache, urinary troubles,carminative,fever,boils,fungal infections,antimicrobial.
Lycopodium cernuum	Lycopodium cernuum	NULL	NULL	NULL	Malaria, newborn skin management .
Macaranga barteri	Macaranga barteri	NULL	NULL	NULL	Dysentery, cough, boils, bruises, black tongue,breast engorgement,irregular menstruation,urinary disorder.
Maesa lanceolata	Maesa lanceolata	NULL	NULL	NULL	Antimicrobial
Maesopsis eminii	Maesopsis eminii	NULL	NULL	NULL	Diluretic, emetic, purgative.
Mallotus cordifolia	Mallotus cordifolia	NULL	NULL	NULL	Malaria.
Mallotus oppositifolius	Mallotus oppositifolius	NULL	NULL	NULL	Tapeworms, ringworm, pimples, bruises,astringent,anthelmintic,tonic,haemostatic.
Mammea africana	Mammea africana	NULL	NULL	NULL	Parasitic skin diseases, syphilis,convulsion,dysmenorrhoea..
Mangifera indica	Mangifera indica	NULL	NULL	NULL	Malaria, diarrhoea, diabetes, skin lesions, high blood pressure, haemorrhage,emmenagogue,insomnia,insanity,anthelmintics,antimicrobials,astringent,asthma,cough
Manihot esculenta	Manihot esculenta	NULL	NULL	NULL	Gonorrhoea, purgative,ulcer,eye drop,schistosomiasis,toothache.
Manniophytum fuluum	Manniophytum fuluum	NULL	NULL	NULL	Bronchitis, cough, gonorrhoea, stomacharche.
Mansonia altissima	Mansonia altissima	NULL	NULL	NULL	Constipation, leprosy.,aphrodisiac
Mareya spicata	Mareya spicata	NULL	NULL	NULL	Skin diseases,cough,purgative,antipyretic,abortifacient, tapeworms
Mariscus alternifolius	Mariscus alternifolius	NULL	NULL	NULL	Gonorrhoea, healing wound
Markhamia tomentosa	Markhamia tomentosa	NULL	NULL	NULL	Elephantiasis of scrotum,fevers,oedema,rheumatic pains,thrush, malaria.
Marsdenia abyssinica	Marsdenia abyssinica	NULL	NULL	NULL	Gonorrhoea
Marsderua latifolia	Marsderua latifolia	NULL	NULL	NULL	Heart disease digezstive disorders.
Ocimum gratisimum	\N	\N	\N	\N	\N
Combretum smcathmannii	\N	\N	\N	\N	\N
Massularia acuminata	Massularia acuminata	NULL	NULL	NULL	Aphrodisiac, lumbago, cough, mental sickness.,anticariogenic
Matricaria recutita	Matricaria recutita	NULL	NULL	NULL	Analgesic, diarrhoea, antiinflammatory, antispasmodic
Mauclea vanderguchnii	Mauclea vanderguchnii	NULL	NULL	NULL	Bathing sick child
Maytenus senegalensis					
Meerua crassifolia	Meerua crassifolia	NULL	NULL	NULL	Toothache, oral hygiene.
Melaleuca leucadendron	Melaleuca leucadendron	NULL	NULL	NULL	Rheumatic, gouts, eczema, inflammatory disease of the respiratory tract and UTI colic flatulence.
Melanthera scadens	Melanthera scadens	NULL	NULL	NULL	Haemostatic, inflammation, chicken pox, purgative, cough, sore-throat.
Melanthra brownei	Melanthra brownei	NULL	NULL	NULL	Hemostatic agent, opthalmias, purgative.
Melia azedarach	Melia azedarach	NULL	NULL	NULL	Anti-syphilitic, boils, skin diseases, antihelmintic
Melicia excelsa	Melicia excelsa	NULL	NULL	NULL	Elephantiasis, antiseptic, nausea,rheumatism,insomnia,abdominal pain, malaria.
Mentha piperata	Mentha piperata	NULL	NULL	NULL	Mouth wash,stomachache,chestpains, respiratory infections.
Meptunia oleracea	Meptunia oleracea	NULL	NULL	NULL	Yellow fever
Mesua Ferrea	Mesua Ferrea	NULL	NULL	NULL	Genito-urinary infection, rheumatic pain, skin infetion, dysentery, cough, vomitting, dysentery, tonic.
Mezoneuron benthamianum	Mezoneuron benthamianum	NULL	NULL	NULL	Gonorrhoea, urethral dischage, anthelmintic.
Microdesmis puberula	Microdesmis puberula	NULL	NULL	NULL	Diarrhoea, dysentery,  impotence,enema,wound,eye-drop.
Microglossa abzelii	Microglossa abzelii	NULL	NULL	NULL	Tuberculosis, respiratory disease, cough, sorethroat, arachie.
Microglossa pyrifolia	Microglossa pyrifolia	NULL	NULL	NULL	Anthelmintic, Aphrodistac,Antipyretic, abortifctant, base labour, yellow fever, colds, filariasis, toothache, abortifacient.
Mikania cordata	Mikania cordata	NULL	NULL	NULL	Cough, bronchitis, anthelmintics, lumbago, rheumatic pains,urethritis,diuretic, malaria, conjunctivitis, schistosomiasis, jaundice, small-pox.
Milletia zechiera	Milletia zechiera	NULL	NULL	NULL	Upper respiratory tact diseases, sorethroat, pains.
Millettia thonningii	Millettia thonningii	NULL	NULL	NULL	Fever, cough, respiratory ailment,anthelmintic,ophthalmia
Mimosa pigra	Mimosa pigra	NULL	NULL	NULL	Febrile convulsion
Mimosa pudica	Mimosa pudica	NULL	NULL	NULL	Guinea worms piles, kidney disease,fistula,boils
Mimusops kummel	Mimusops kummel	NULL	NULL	NULL	Antipyretic,astringent, mouth wash,stomachic
Mirabilis jalapa	Mirabilis jalapa	NULL	NULL	NULL	Wounds,purgative
Mitracarpus scaber	Mitracarpus scaber	NULL	NULL	NULL	Fungal diseases,wounds,ulcers
Mitragyna inermis	Mitragyna inermis	NULL	NULL	NULL	Dysentery, leprosy,antipyretic,diuretic,gonorrhoea.
Mitragyna stipulosa	Mitragyna stipulosa	NULL	NULL	NULL	Fever, cough, dysentery, pregnancy diseases,colic,skin diseases,anthelmintics
Mollugo nudicaulis	Mollugo nudicaulis	NULL	NULL	NULL	Whooping cough,vermifuge
Mollugo oppositifolius	Mollugo oppositifolius	NULL	NULL	NULL	Antimicrobial,caries,stomachic,headache
Momordica angustisepala	Momordica angustisepala	NULL	NULL	NULL	Antimicrobial.
Momordica charantia	Momordica charantia	NULL	NULL	NULL	Diabetes, piles, convulsions, jaundice, sore,nervous disorders,diabetic recipe,emetic,night blindness,aphrodisiac,dysmenorrhoea,anthelmintic,antimicrobials
Momordica foetida	Momordica foetida	NULL	NULL	NULL	Diabetes, stomach-ache,laxative,anthelmintic
Mondia whitei	Mondia whitei	NULL	NULL	NULL	Pile, malaria, rubefacient.
Monodora brevipes	Monodora brevipes	NULL	NULL	NULL	Venereal diseases, purgative, urethral stricture.
Monodora myristica	Monodora myristica	NULL	NULL	NULL	Constipation, lice, guinea worm, headache,anaemia,impotence,wounds,arthritis.
Monodora tenuifolia	Monodora tenuifolia	NULL	NULL	NULL	Antihaemorrhage, dysentery, Parasitic skin diseases, toothache.
Monsonia senegalensis	Monsonia senegalensis	NULL	NULL	NULL	Emmenagogue
Morelia senegalensis	Morelia senegalensis	NULL	NULL	NULL	Fever, general debility,fish poison.
Morinda lucida	Morinda lucida	NULL	NULL	NULL	Malaria, diabetes, heart diseases,purgative,emetic,diuretic,jaundice,flatulence, Anti-cancer.
Morinda morindioides	Morinda morindioides	NULL	NULL	NULL	Fever, jaundice, asthma, dysentery,colic,emmenagogue,vermifuge,constipation
Moringa oleifera	Moringa oleifera	NULL	NULL	NULL	Inflammatory diseases, asthma,antipyretic, cough, earache, liver and pancreas diseases, venereal diseases,emetic,anthelmintic,hysteria,diarrhoea,diuretic,catarrhal diseases.
Morus mesozygia	Morus mesozygia	NULL	NULL	NULL	Mystic properties,for bathing newborns,sedative.
Mostuea Thomsoni	Mostuea Thomsoni	NULL	NULL	NULL	Aphrodislac, Use for controlling high blood pressure.
Mucuna pruriens	Mucuna pruriens	NULL	NULL	NULL	Intestinal worms,genito-urinary diseases.
Mucuna sloanei	Mucuna sloanei	NULL	NULL	NULL	Haemorrhoids, diuretics,micturition problems in children,skin diseases.
Mukia maderaspatana	Mukia maderaspatana	NULL	NULL	NULL	Cough,flatulence,aperient, amoebiasis, wound-dressing, toothache,mental disorders, neuralgia.
Mundulea Sericera	Mundulea Sericera	NULL	NULL	NULL	Antiparasitic
Murraya Koenigii	Murraya Koenigii	NULL	NULL	NULL	Dysentery, Fever, diarrhoea, herpes pains, stimulant.
Musa paradisiaca	Musa paradisiaca	NULL	NULL	NULL	Diarrhoea, dysentery, epilepsy, wounds, goiter, gonorrhoea,anaemia, venereal diseases,haemostatic,diabetes,anthelmintics,abortifacient,oligospermia, malaria.
Musa sapientum	Musa sapientum	NULL	NULL	NULL	Jaundice,mental disorders,typhoid fever,diarrhoea, malaria.
Musanga cecropioides	Musanga cecropioides	NULL	NULL	NULL	Tapeworms, dysentery, fevers,anthelmintic,cough
Mussaenda elegans	Mussaenda elegans	NULL	NULL	NULL	Astringent
Myriantus arboreus	Myriantus arboreus	NULL	NULL	NULL	Dysentery,anthelmintics,cough,antitumour
Napoleona imperialis	Napoleona imperialis	NULL	NULL	NULL	Asthma, cough,toothache
Napoleona vogelii	Napoleona vogelii	NULL	NULL	NULL	Diabetes, fever, cough, catarrh.
Nauclea diderrichii	Nauclea diderrichii	NULL	NULL	NULL	Gonorrhoea, antimalaria, appetizer, piles,dyspepsia, rheumatism, dysentery,febrifuge
Nauclea latifolia	Nauclea latifolia	NULL	NULL	NULL	Cough,febrile conditions,thrush,jaundice,piles,emetic,menstrual disorders,stomach disorders,measles,sore
Nauclea pobeguinii					
Nelsonia compestria	Nelsonia compestria	NULL	NULL	NULL	Yellow fever, eye inflammation, diarrhoea, schistosomiasis.
Neostenanthera-myristicifolia	Neostenanthera-myristicifolia	NULL	NULL	NULL	Tumor of the nose, anthelmintic
Nephrolepsis bisserata	Nephrolepsis bisserata	NULL	NULL	NULL	Pregnancy booster,dysmenorrhoea toothache.
Spondianthus preussii	Spondianthus preussii	NULL	NULL	NULL	Poison
Nerium oleander	Nerium oleander	NULL	NULL	NULL	Dysentery,anthelmintics,cough,antitumour,abortifacient,skin diseases,pile.
Nesogordonia papaverifera	Nesogordonia papaverifera	NULL	NULL	NULL	Dysentery, toothache,pregnancy booster.
Newbouldia laevis	Newbouldia laevis	NULL	NULL	NULL	Round worms, elephantiasis, dysentery, malaria, convulsions, migraine,cough,yellow fever, stomach-ache, hernia,infertility, ear-ache.
Nicotiana tabacum	Nicotiana tabacum	NULL	NULL	NULL	Ringworm, cold, convulsions, ulcers, nausea,anthelmintic.
Nymphaea lotus	Nymphaea lotus	NULL	NULL	NULL	Vomiting,astringent,antiseptic,demulcent,sedative,rheumatic pains, Anti-tumour.
Ocimum basilicum	Ocimum basilicum	NULL	NULL	NULL	Gonorrhoea, catarrhal conditions, cough, constipation, dysentery, ringworm,carminative,stimulant,hypertension,anthelmintics,antipyretic,blood tonic.
Ocimum gratissimum	Ocimum gratissimum	NULL	NULL	NULL	Cough, diarrhea, convulsions, fever, cold, bronchitis,colic ,insect repellant,antimicrobials,anthelmintics,hypertension,hypertension,diabetes,piles, Antibacteria.
Olax subscorpioidea	Olax subscorpioidea	NULL	NULL	NULL	Yellow fever, jaundice, guinea worm, venereal diseases,mental disorders,toothache.
Oldelandia corymbosa	Oldelandia corymbosa	NULL	NULL	NULL	Antipyretic, ease labour, nervous disorders,haemostatic, venereal disorders, antidote to snake venom
Olyra latifolia	Olyra latifolia	NULL	NULL	NULL	Anthelmintics,scabies,filariasis,cough,chest pain,enhances fertility
Oncoba spinosa	Oncoba spinosa	NULL	NULL	NULL	Cough, cold, sore throat, wounds
Opilia celtidifolia	Opilia celtidifolia	NULL	NULL	NULL	Anthelmintics,purgative,diuretic.
Opuntia dillenii	Opuntia dillenii	NULL	NULL	NULL	Guinea worms,abscesses, gonorrhoea, asthma, whooping cough,purgative,astringent.
Ouratea flava	Ouratea flava	NULL	NULL	NULL	Laxative,vitamins
Oxalis corniculata	Oxalis corniculata	NULL	NULL	NULL	Fever, dysentery,warts, boils.
Oxyanthus tubiflorus	Oxyanthus tubiflorus	NULL	NULL	NULL	Fever,antiscorbutic,biliousness,warts,opacity,toothache
Pachira glabra	Pachira glabra	NULL	NULL	NULL	Stomach disorders,headache, blood tonic
Pachypodanturum staudtii	Pachypodanturum staudtii	NULL	NULL	NULL	Gastro-intestinal pains, headache, chest pains, verifuge
Palisota hirsuta	Palisota hirsuta	NULL	NULL	NULL	Anaemia, dysentery,cough,toothache,gonorrhoea.
Pallaea schweinfurthii	Pallaea schweinfurthii	NULL	NULL	NULL	Sore gums, mouth cankery.
Pancratium trianthum	Pancratium trianthum	NULL	NULL	NULL	Visual hallucination,convulsion,cold.
Parinari curatellaefolia	Parinari curatellaefolia	NULL	NULL	NULL	Skin infections,antipyretic,anthelmintics,nervous disorders,cough
Parinari macrophylla	Parinari macrophylla	NULL	NULL	NULL	Malaria,skin infections,anthelmintic,antibacterial,cough,purgative,cardiac tonic,eye diseases,astringent.
Parkia biglobosa	Parkia biglobosa	NULL	NULL	NULL	Tonic, wounds, malaria, diabetes,high blood pressure,mental disorders,astringent,intestinal disorders,obesity,anti-tumour.
Paropsia guineansis	Paropsia guineansis	NULL	NULL	NULL	Toothache
Parquetina nigrescens	Parquetina nigrescens	NULL	NULL	NULL	Gonorrhea,skin diseases,menstrual disorders,cardiac tonic,dysentery, Blood tonic.
Passiflora foetida	Passiflora foetida	NULL	NULL	NULL	Hypertension,cough,emmenagogue,antispasmodic,sedative.
Paullinia pinnata	Paullinia pinnata	NULL	NULL	NULL	Sore throat, leprosy, jaundice, menstrual disorder, sore throat, black tongue,ophthalmia,dysentery,haemostatic agent,astringent.aphrodisiac, malaria.
Paulowilhelnua polyspernia	Paulowilhelnua polyspernia	NULL	NULL	NULL	Guineaworm
Pavetta owariensis					
Pedalium murex	Pedalium murex	NULL	NULL	NULL	Gonorrhoea, diuretic, demulcant, spermatorrhoea, dysurin, enlarged spleen.
Penianthus zenicem	Penianthus zenicem	NULL	NULL	NULL	Aphrodisias, wounds, oral hygiene.
Pennisetum purpureum	Pennisetum purpureum	NULL	NULL	NULL	Gastro-intestinal disorders,diuretic,mumps
Pentaclethra macrophylla	Pentaclethra macrophylla	NULL	NULL	NULL	Fever, stomachache, appetizer, general weakness,anthelmintics,sore,jaundice.
Pentadesma butyracea	Pentadesma butyracea	NULL	NULL	NULL	Anthelmintic
Peperomia pellucida	Peperomia pellucida	NULL	NULL	NULL	Convulsions, wounds,mental disorders,hypertension
Pergularia daemia	Pergularia daemia	NULL	NULL	NULL	Rheumatism, intestinal worms, piles, catarrhal diseases,craw-craw,coughs,emmenagogue,smallpox,mental disorder,skin diseases,diarrhoea, eye infection.
Pericopsis laxiflora	Pericopsis laxiflora	NULL	NULL	NULL	Oedema,antitumour.
Persea americana	Persea americana	NULL	NULL	NULL	Hypertension,malaria,insomnia,gastro-intestinal disorders
Petersianthus macrocarpus	Petersianthus macrocarpus	NULL	NULL	NULL	Chronic bronchitis,lumbago,headache.
Petiveria alliacea	Petiveria alliacea	NULL	NULL	NULL	All purpose herb for cancer,antimicrobial,diabetes,stroke,diuretic,sedative,abortifacient,analgesic,anthelmintics,cough,insecticide,snake repellant.
Petroselinum crispum	Petroselinum crispum	NULL	NULL	NULL	Carminative,stimulant,Vitamin C,emmenagogue,asthma,diuretic,antipyretic,conjunctivitis,jaundice.
Phaseolus vulgaris	Phaseolus vulgaris	NULL	NULL	NULL	Antifungal,skin diseases
Phaulopsis falcisepala	Phaulopsis falcisepala	NULL	NULL	NULL	Wounds, skin parasite, laxative, aphrodisiac
Philoxerus vermiculatus	Philoxerus vermiculatus	NULL	NULL	NULL	Hernia pains, fever, inflammation.
Phoenix dactylifera	Phoenix dactylifera	NULL	NULL	NULL	Genito-urinary disorders, cough, asthma, fever, gonorrrhoea,demulcent
Phyllanthus amarus	Phyllanthus amarus	NULL	NULL	NULL	Gonorrhoea, genito-urinary diseases,asthma,diabetes,typhoid fever, jaundice, stomach-ache, dysentery,ringworm, hypertension.
Phyllanthus fraternus					
Phyllanthus muellerianus	Phyllanthus muellerianus	NULL	NULL	NULL	Jaundice, skin diseases,antimicrobials, stomach problems, fever, cough,insomnia,dysentery.
Phyllanthus niruri					
Physalis angulata	Physalis angulata	NULL	NULL	NULL	Fever, asthma, diarrhoea, throat swelling,infertility, malaria.
Physostigma venosum	Physostigma venosum	NULL	NULL	NULL	Glaucoma, antidote to atropine and strychnine poison, contraction of pupils,jiggers,poison.
Phytolacca dodecandra	Phytolacca dodecandra	NULL	NULL	NULL	Bilharzia,purgative,emetic,vermifuge
Picralima nitida	Picralima nitida	NULL	NULL	NULL	Fever, dysmenorrhoea, hypertension, herpes, diabetes,anthelmintics, malaria.
Piliostigma reticulatum	Piliostigma reticulatum	NULL	NULL	NULL	Fever, ulcer, rheumatism, cough, tooth-ache,hookworms,diuretic,diabetes
Piper guineense	Piper guineense	NULL	NULL	NULL	Herbal recipe ingredient, rheumatism,antipyretic, anti-emetic, stomachache, mental illness,anthelmintic,carminative,impotence,antimicrobials,hypertension
Piper nigrum	Piper nigrum	NULL	NULL	NULL	Diuretic, carminative, aromatic, diaphoretic, piles, diarrhoea, boils, Rheumatic, pains, toothache, emmenagogue antiperiodic.
Piper umbellatum	Piper umbellatum	NULL	NULL	NULL	Rheumatism, inflammatory tumours, carmative,diuretic,emmenagogue,pile,urinary disorders
Piptadeniastrum africanum	Piptadeniastrum africanum	NULL	NULL	NULL	Purgative,headache,toothache,enema,cardiac tonic,irregular menstruation,coated tongue.
Pisoria aculeata	Pisoria aculeata	NULL	NULL	NULL	Venereal diseases, rheumatic, pains.
Pistia stratiotes	Pistia stratiotes	NULL	NULL	NULL	Skin rashes, boils, sores,colds
Pleiocarpa pycnantha	Pleiocarpa pycnantha	NULL	NULL	NULL	Angina pectoris, gastrointestinal disorder.
Pleioceras barteri	Pleioceras barteri	NULL	NULL	NULL	Skin diseases,anaemia,abortifacient,irregular menstruation,cystitis,change of foetus position
Plumbago zeylanica	Plumbago zeylanica	NULL	NULL	NULL	Fever, rheumatism, fungal diseases.
Plumeria alba	Plumeria alba	NULL	NULL	NULL	Purgative, antibacterial
Polyalthia suaveolens	Polyalthia suaveolens	NULL	NULL	NULL	Fever
Polygala arenaria	Polygala arenaria	NULL	NULL	NULL	Purgative,astringent,wound cut
Polygonum senegalense	Polygonum senegalense	NULL	NULL	NULL	Small pox
Portulaca oleracea	Portulaca oleracea	NULL	NULL	NULL	Intestinal worms, loa loa, fever, skin diseases,disorders of bladder,kidney,lungs,abscess,antispasmodic,astringent,diuretic.
Premna quadrifolia	Premna quadrifolia	NULL	NULL	NULL	headache, backache, otitis
Prosopis africana	Prosopis africana	NULL	NULL	NULL	Male sterility
Pseudocedrela kotschyi	Pseudocedrela kotschyi	NULL	NULL	NULL	Dysentery, leprosy, general debility.antipyretic,aphrodisiac,haemorrhoids
Psidium guajava	Psidium guajava	NULL	NULL	NULL	Fever, diarrhea, stomach-ache, cough,laxative,dysentery,irregular menstruation, malaria.
Psorospermum febrifugum	Psorospermum febrifugum	NULL	NULL	NULL	Antipyretic,anthelmintics,astringent,skin diseases,anti-tumour,convulsion,ulcer
Psychotria guineensis	Psychotria guineensis	NULL	NULL	NULL	Pyrrhea, cough, amoebic dysentery, boils.
Pteris togoensis	Pteris togoensis	NULL	NULL	NULL	Warts, tumor.
Pterocarpus erinaceus	Pterocarpus erinaceus	NULL	NULL	NULL	Fever, diarrhea, dysentery, ringworm.
Pterocarpus osun	Pterocarpus osun	NULL	NULL	NULL	Asthma, fungal and bacterial skin infections, eczema, acne, candidiasis,antipyretic.
Pterocarpus santalinioides	Pterocarpus santalinioides	NULL	NULL	NULL	Antipyretic,astringent,skin diseases.
Punica granatum	Punica granatum	NULL	NULL	NULL	Astringent, bronchitis, stomachache, fever, urinary tract inflammatun anthelmintic, gall bladder, disorder, ulcer, sore throat.
Pupalia lappacea	Pupalia lappacea	NULL	NULL	NULL	Coughs,skin diseases,syphilis,diarrhoea
Pycnanthus angolensis	Pycnanthus angolensis	NULL	NULL	NULL	Thrush, black tongue, fever, cough, bad breath, anti-bilharzia,lumbago,toothache,rubefacient, Skin infection.
Pyrenacantha staudtii	Pyrenacantha staudtii	NULL	NULL	NULL	Cancer,malaria,threatened abortion,gastrointestinal disorders.
Quassia africana	Quassia africana	NULL	NULL	NULL	Tonic, anthelmintic, enema
Quisqualis indica	Quisqualis indica	NULL	NULL	NULL	Anthelmintic,emetic,aphrodisiac,ulcers,boils
Rabdia nilotica	Rabdia nilotica	NULL	NULL	NULL	Backache,yellow fever,arthritis,tonic
Raphia hookeri	Raphia hookeri	NULL	NULL	NULL	Measles,promotes lactation,extracting agent
Rauvolfia vomitoria	Rauvolfia vomitoria	NULL	NULL	NULL	Hypertension, insomnia, nervous disorder, jaundice, fever, diarrhea, dysentery,scabies,mental disorders,anthelmintics, malaria.
Rauwolfia caffra	Rauwolfia caffra	NULL	NULL	NULL	Abscess, anthelmintic, pneumonia, rheumatism, inflammation
Rhaphiostylis beninensis	Rhaphiostylis beninensis	NULL	NULL	NULL	Mental disorders,eye diseases,purgatve,rheumatism,toothache
Rhigiocarya racemifera	Rhigiocarya racemifera	NULL	NULL	NULL	Sedative, aphrodisiac
Rhynchosia pycnostachy	Rhynchosia pycnostachy	NULL	NULL	NULL	Hallueinogenic,
Ricinodendron heudelotii	Ricinodendron heudelotii	NULL	NULL	NULL	Elephantiasis, appetizer,emollient,purgative,female infertility,antipyretic.
Ricinus communis	Ricinus communis	NULL	NULL	NULL	Itch, ring worm, purgative, flatulence, lumbago,emollient,toothache.
Rinorea dentata	Rinorea dentata	NULL	NULL	NULL	ophthalmia
Ritchiea brachypoda	Ritchiea brachypoda	NULL	NULL	NULL	Aphrodisiac,gonorrhoea,eye infection.
Rothmannia longiflora	Rothmannia longiflora	NULL	NULL	NULL	Fever, filariasis,analgesic,emetic,analgesic
Rothmannia whitfieldii	Rothmannia whitfieldii	NULL	NULL	NULL	Filariasis, dysentery.
Ruellia tuberosa	Ruellia tuberosa	NULL	NULL	NULL	Anthelmintics,bronchitis,local analgesics,fevers, seeds for mystic properties.
Rumex abyssimcus	Rumex abyssimcus	NULL	NULL	NULL	Purgative, anthelmintic.
Rungia grandis	Rungia grandis	NULL	NULL	NULL	Malaria
Rytigynia rubra	Rytigynia rubra	NULL	NULL	NULL	Ulcers of feet, wounds.
Saba florida	Saba florida	NULL	NULL	NULL	Jaundice,venereal diseases,aphrodisiac,improves lactation
Sabicea calycina	Sabicea calycina	NULL	NULL	NULL	Topical application for rheumatism and rheumatism
Saccharum officinarum	Saccharum officinarum	NULL	NULL	NULL	Headache, joint pains,antidote to snake venom..
Salt					
Salvadora persica	Salvadora persica	NULL	NULL	NULL	Carminative, diuretic, anthelmintic, amenorrhoea, tumors, rheumatism.
Samanea dinklagei	Samanea dinklagei	NULL	NULL	NULL	Toothache
Sansevieria liberica	Sansevieria liberica	NULL	NULL	NULL	Diarrhoea, abdominal pains, haemorrhoids, menorrhagia, gonorrhea, eczema, pile, snake bite,impotence,asthma,high blood pressure.
Saphaeranthus senegalensis	Saphaeranthus senegalensis	NULL	NULL	NULL	Fever, toothache, sore-throat, headache, anthelmintic, stomachic.
Sapium ellipticum	Sapium ellipticum	NULL	NULL	NULL	Mouth wash for scurvy.
Sarcocephalus latifolius					
Schlerocarya birrea	Schlerocarya birrea	NULL	NULL	NULL	Astringent, malaria, skin diseases.
Schrobera arborea	Schrobera arborea	NULL	NULL	NULL	Toothache, sore-throat
Schumanniophyton magnificum	Schumanniophyton magnificum	NULL	NULL	NULL	Antisnake
Schwenkia americana	Schwenkia americana	NULL	NULL	NULL	Yellow fever, cough, boils,cardiac tonic
Scleria depressa	Scleria depressa	NULL	NULL	NULL	Coughs,irregular menstruation,haematuria,easing labour,sores
Sclerocarya birrea spp caffra	Sclerocarya birrea spp caffra	NULL	NULL	NULL	Mystic purposes to arrest thief.
Scoparia dulcis	Scoparia dulcis	NULL	NULL	NULL	Diabetes,chest diseases,cough,conjunctivitis,gonorrhoea
Secamone afzelii	Secamone afzelii	NULL	NULL	NULL	Gonorrhoea, cough, catarrhal conditions,purgative,galactatogogue,mystic .
Securidaca longepedunculata	Securidaca longepedunculata	NULL	NULL	NULL	Venereal diseases, rheumatic joints, diabetes,convulsion, fever, anti-inflammatory ,diuretic,vermifuge,purgative,toothache,aphrodisiac,abortifacient.
Securinega virosa	Securinega virosa	NULL	NULL	NULL	Diarrhoea, dysentery,aphrodisiac,astringent,laxative,jaundice,sickle cell anaemia
Senecio abyssinicus	Senecio abyssinicus	NULL	NULL	NULL	Syphilis, yaws,  rheumatism, cuts, skin diseases.
Senecio biafrae	Senecio biafrae	NULL	NULL	NULL	Wound, cough, heart-troubles, tonic, rheumatic, oedemas, allergies.
Senna alata	Senna alata	NULL	NULL	NULL	Skin diseases, dysentery, abortifacent,anthelmintic,itch,ringworm,measles,eczema,bronchitis,black menstruation,venereal diseases, stomach-ache.
Senna arabica	Senna arabica	NULL	NULL	NULL	Cough,asthma,bronchitis,skin diseases,diabetes,urinary disorders,gonorrhoea
Senna fistula	Senna fistula	NULL	NULL	NULL	Astringent, diabetes, liver disorder, purgative.
Senna hirsuta	Senna hirsuta	NULL	NULL	NULL	Antimicrobial, skin infection, purgative.
Senna obtusifolia	Senna obtusifolia	NULL	NULL	NULL	Boils, skin diseases,purgative.
Senna occidentalis	Senna occidentalis	NULL	NULL	NULL	Measles, hypertension,stomachache,haemostatic,purgative,abortifacient,convulsion,dracontiasis,antimicrobials.
Senna podocarpa	Senna podocarpa	NULL	NULL	NULL	Malaria, purgative, venereal diseases, anthelmintic.
Senna sieberiana	Senna sieberiana	NULL	NULL	NULL	Fever,anthelmintics,leprosy,diuretic, elephantiasis, piles, dysentery,antifungal,constipation,venereal diseases.
Senna tora	Senna tora	NULL	NULL	NULL	Abscess,purgative,scabies,ringworm,eczema
Sesamum indicum	Sesamum indicum	NULL	NULL	NULL	Migraine,hypertension, ulcers, piles, purgative, constipation, hair shampoo, chicken pox, respiratory complaints, dysentery,demulcent,abortifacient.
Sesbania grandiflora	Sesbania grandiflora	NULL	NULL	NULL	Fever, sore throat, general debility, emetic
Setaria megaphylla	Setaria megaphylla	NULL	NULL	NULL	Venereal diseases,antipyretic,local anaesthetics,haemostatic,mental disorders
Sida acuta	Sida acuta	NULL	NULL	NULL	Malaria, intestinal worm, ulcer, urinary debility,nervous disease,astringent,antipyretic,boils
Sida cordifolia	Sida cordifolia	NULL	NULL	NULL	Spermotorrhoea,uro-genital diseases, gonorrhoea, piles, rheumatism, hay fever,asthma.
Sida pilosa	Sida pilosa	NULL	NULL	NULL	Diarrhoea, cuts, wounds.
Sida rhombifolia	Sida rhombifolia	NULL	NULL	NULL	Diarrhoea,emollient,wound.
Smeathmannia pubescens	Smeathmannia pubescens	NULL	NULL	NULL	Toothache
Smilax kraussiana	Smilax kraussiana	NULL	NULL	NULL	Ease labour, fever, syphilis, gonorrhoea, skin diseases,ophthalmia,diuretic, malaria.
Solanum aethiopicum	Solanum aethiopicum	NULL	NULL	NULL	Digestive disorders,carminative,sedative,laxative.
Solanum incanum	Solanum incanum	NULL	NULL	NULL	Leprosy, gonorrhoea, cramps, nausea,diuretic,cholagogue,purgative.
Solanum macrocarpon	Solanum macrocarpon	NULL	NULL	NULL	Stomachic
Solanum melongena	Solanum melongena	NULL	NULL	NULL	Diuretic,purgative,venereal diseases
Solanum nigrum	Solanum nigrum	NULL	NULL	NULL	Convulsion, malaria, gonorrhoea, inflammatory swellings, skin diseases, ringworms, boils, heart diseases,tonic, suppuration
Solanum torvum	Solanum torvum	NULL	NULL	NULL	Cough,liver and spleen diseases,improves lactation
Solenostemon monostachyus	Solenostemon monostachyus	NULL	NULL	NULL	Convulsion, tuberculosis, stomachache,carminative.
Sophora occidentalis	Sophora occidentalis	NULL	NULL	NULL	Anthelmintic
Sorghum bicolor	Sorghum bicolor	NULL	NULL	NULL	Malaria,blood tonic,fever
Sorindeia mildbraedii	Sorindeia mildbraedii	NULL	NULL	NULL	Toothache,mouth infections
Spathodea campanulata	Spathodea campanulata	NULL	NULL	NULL	Gonorrhoea, urethral inflammations,ulcer,arthritis, guinea worms, dysentery, antiseptics, oedema, skin eruption.
Sphenocentrum jollyanum	Sphenocentrum jollyanum	NULL	NULL	NULL	Cough, wounds, aphrodisiac,fever,jaundice,breast swelling related to menstrual cycles, malaria.
Spigelia anthelmia	Spigelia anthelmia	NULL	NULL	NULL	Intestinal worms, convulsions
Spilanthes filicaulis	Spilanthes filicaulis	NULL	NULL	NULL	Emetic, analgesic
Spondias mombin	Spondias mombin	NULL	NULL	NULL	Cough, fever, yaws, dizziness, sore throat, cold, gonorrhoea, diarrhea,catarrhal conditions,anthelmintic,emmenagogue,ease labour,diabetes,measles,toothache
Stachytarpheta angustifolia	Stachytarpheta angustifolia	NULL	NULL	NULL	Hypertension,anthelmintics,weak erection,menstrual disorder,venereal diseases
Stachytarpheta indica	Stachytarpheta indica	NULL	NULL	NULL	Dysentery, syphilis, gonorrhoea, catarrhal conditions,emmanagogue,emetic,cough, anthelmintic,antipyretic,diabetes,malaria.
Steganostaenia araltaceae	Steganostaenia araltaceae	NULL	NULL	NULL	Sore eyes
Stephania abyssinica	Stephania abyssinica	NULL	NULL	NULL	Antispasmodic, menorrhagia.vermifuge
Sterculia setigera	Sterculia setigera	NULL	NULL	NULL	Gastro-intestinal disorders, boils, diarrhea, dysentery ,ulcer
Sterculia tragacantha	Sterculia tragacantha	NULL	NULL	NULL	Fever, gonorrhoea, whitlow,convulsion, enema,anthelmintics,astringent, malaria
Sterospermum acuminatissimum	Sterospermum acuminatissimum	NULL	NULL	NULL	Respiratory ailments, venereal diseases, dysentery,toothache
Trichosanthes cucumerina	Trichosanthes cucumerina	NULL	NULL	NULL	Emetic, anthelmintic antiperiodic
Strictocardia beraviensis	Strictocardia beraviensis	NULL	NULL	NULL	Guinea worms,elephantiasis,migraine,arthritis.
Strophanthus gratus	Strophanthus gratus	NULL	NULL	NULL	Heart troubles,cardiac tonic
Strophanthus hispidus	Strophanthus hispidus	NULL	NULL	NULL	Arthritis, stroke, heart failure, rheumatism.
Struchium sparganophora	Struchium sparganophora	NULL	NULL	NULL	Gonorrhoea,astringent,headache,dracontiasis
Strycnos nux-vomica	Strycnos nux-vomica	NULL	NULL	NULL	Constipation, worms,nervous diseases, hysteria, diarrhoea, cholera, dysentery, gastro-intestinal disorders,anaemia,poison.
Stylosanthes erecta	Stylosanthes erecta	NULL	NULL	NULL	Cold, aphrodisiae
Swartzia madagascariensis	Swartzia madagascariensis	NULL	NULL	NULL	Diuretic, laxative
Symphonia globulifera	Symphonia globulifera	NULL	NULL	NULL	Craw-craw, tonic.
Synctisia scabrida	Synctisia scabrida	NULL	NULL	NULL	Diabetes
Synedrella nodiflora	Synedrella nodiflora	NULL	NULL	NULL	Leprosy, cardiac troubles,sores, skin infection.
Synsepalum dulcificum	Synsepalum dulcificum	NULL	NULL	NULL	Diabetes, obesity.
Syzygium guineense	Syzygium guineense	NULL	NULL	NULL	Diabetes, sorethroat, diarrhoea, dysentery.
Tabebuia impetiginosa	Tabebuia impetiginosa	NULL	NULL	NULL	Antimicrobial.
Tabernaemontana pachysiphon	Tabernaemontana pachysiphon	NULL	NULL	NULL	Tertiary syphilis, leprosy, stimulant,aphrodisiac.
Tacca involucrata	Tacca involucrata	NULL	NULL	NULL	Aphrodisiac, rubefascient, general debility.
Taliacoma waraeckei	Taliacoma waraeckei	NULL	NULL	NULL	Control of high blood pressure
Talinum triangulare	Talinum triangulare	NULL	NULL	NULL	Schistosomiasis, scabies, fresh cuts,high blood pressure,anaemia
Tamarindus indica	Tamarindus indica	NULL	NULL	NULL	Fever, inflammatory swellings, boils,vermifuge,astringent,carminative,tonic,diarrhoea,lumbago
Teclea verdromiona	Teclea verdromiona	NULL	NULL	NULL	Conjunctivitis, opthalmia, catarrh, cough, oral hygiene
Tecoma capensis	Tecoma capensis	NULL	NULL	NULL	Gum infection
Tecoma stans	Tecoma stans	NULL	NULL	NULL	Fevers,Antimicrobials, malaria.
Tectona grandis	Tectona grandis	NULL	NULL	NULL	Dyspepsia,headache,skin diseases,anthelmintic,astringent,toothache.
Telfaria occidentalis	Telfaria occidentalis	NULL	NULL	NULL	Convulsion, blood tonic,gastro-intestinal disorders.
Tephrosia densiflora	Tephrosia densiflora	NULL	NULL	NULL	Bilharzia, cough,diuretic,skin diseases,abortifacient.
Terminalia avicennioides	Terminalia avicennioides	NULL	NULL	NULL	Skin diseases,antimicrobial.
Terminalia catappa	Terminalia catappa	NULL	NULL	NULL	Gonorrhoa, ulcers, cough, catarrh,haemoptysis,cholagogue,astringent,cardiac tonic,styptic,diuretic,emollient
Terminalia glaucescens	Terminalia glaucescens	NULL	NULL	NULL	Cough, sorethroat, astringent, ulders, enema, syphilis, oral hygiene.
Terminalia ivorensis	Terminalia ivorensis	NULL	NULL	NULL	Black tongue, constipation, arthritis,diuretic,stomachic
Terminalia macroptera	Terminalia macroptera	NULL	NULL	NULL	Piles, haemostatic, diuretic.
Terminalia schimperiana	Terminalia schimperiana	NULL	NULL	NULL	Diarrhoea, dysentery, ulcers,leucorrhoea, enema, syphilis, cough, sore throat.
Terminalia superba	Terminalia superba	NULL	NULL	NULL	Laxative.
Tetracarpidium conophorum	Tetracarpidium conophorum	NULL	NULL	NULL	Masticatory,giddiness,thrush,anthelmintics,toothache,syphilis,dysentery,antidote to snake bite.
Tetracera alnifolia	Tetracera alnifolia	NULL	NULL	NULL	Rheumatism, backache, gonorrhoea, ricketts, enema,antipyretic,aphrodisiac,diarrhoea,skin diseases,eye trouble.
Tetrapleura tetraptera	Tetrapleura tetraptera	NULL	NULL	NULL	Fractured bones, anticonvulsant, gonorrhoea,fever,asthma,cough,rheumatism,infertility,insomnia,bilharzia,preservative, Malaria.
Tetrochidium didymostemon	Tetrochidium didymostemon	NULL	NULL	NULL	Antipyretic,purgative,thrush,toothache
Thaumatococcus daniellii	Thaumatococcus daniellii	NULL	NULL	NULL	Diabetes,emetic
Theobroma cacao	Theobroma cacao	NULL	NULL	NULL	Stimulant,diuretic,toothache,gingivitis, Blood tonic.
Thespesia populnea	Thespesia populnea	NULL	NULL	NULL	Eczema, skin diseases, astringent, fever, migaine.
Thevetia neriifolia	Thevetia neriifolia	NULL	NULL	NULL	Cardiac disorders, fever, ringworms, wasp bites,measles.
Thonningia sanguinea	Thonningia sanguinea	NULL	NULL	NULL	Cough, bronchitis, dysentery, poison stabilizing pregnancy,anthelmintic
Thunbergia battescombei	Thunbergia battescombei	NULL	NULL	NULL	Respiratory infection, cough.
Tiliacora funifera	Tiliacora funifera	NULL	NULL	NULL	Astringent, cough, irregular menses, tuberculosis, muscle relaxant, oral hygiene
Tinospora bakis					
Tinospora cordifolia	Tinospora cordifolia	NULL	NULL	NULL	Antipeniodic, diuretic, fever, digestion, disorder, fractured bones, cholagogues, emmenagogue, hepatic stimulant
Tithonia diversifolia	Tithonia diversifolia	NULL	NULL	NULL	Skin diseases,typhoid fever,diabetes,amoebiasis,yellow fever, Malaria.
Tragia benthani	Tragia benthani	NULL	NULL	NULL	Abortifacient,skin diseases,analgesic
Treculia africana	Treculia africana	NULL	NULL	NULL	Convulsions, ulcers, carious teeth, coughs,venereal diseases, nervous diseases,malaria,anaemia.
Trema orientalis	Trema orientalis	NULL	NULL	NULL	Fever, cough, bronchitis, dysentery, pneumonia, black tongue, convulsion,jaundice, malaria.
Trephrosia purpurea	Trephrosia purpurea	NULL	NULL	NULL	Cough, skin diseases, astringent, bronchitis, asthma diseases of liver and spleen.
Trianthema portulacastrum	Trianthema portulacastrum	NULL	NULL	NULL	Gonorrhoea, dropsy, emmenagogue, abortifacient,asthma, rheumatism, diuretic,anaemia,vertigo,purgative,wound.
Tribulus terrestris	Tribulus terrestris	NULL	NULL	NULL	Urinary disorders,diuretic, spermatorrhoea, impotence, gonorrhoea,aphrodisiac.
Trichilia emotica	Trichilia emotica	NULL	NULL	NULL	Cough, chest congestion, mouth wash, snake-bite antidote,antipyretic,purgative.
Trichilia heudelotii	Trichilia heudelotii	NULL	NULL	NULL	Wounds, ulcers,purgative,antipyretic,anaemia  cardiac ailments.
Trichilia monadelpha	Trichilia monadelpha	NULL	NULL	NULL	Cough, arthritis, skin ulcer, dysentery, dyspepsia, Anaemia.
Trichilia prieureana	Trichilia prieureana	NULL	NULL	NULL	Gonorrhoea , fever.
Trichodesma africanum	Trichodesma africanum	NULL	NULL	NULL	Fever, sore-throat, stomach ulcer.
Cinnamomun zeylanica	\N	\N	\N	\N	\N
Soy	\N	\N	\N	\N	\N
Triclisia subcordata	Triclisia subcordata	NULL	NULL	NULL	Diabetes, obesity, anaemia, oedema of legs,malaria.
Tridax procumbens	Tridax procumbens	NULL	NULL	NULL	Antipyretic,haemostatic,backache,stomachache
Trigonelia Foenu-graceum	Trigonelia Foenu-graceum	NULL	NULL	NULL	Swellings, leucorrhoea, astringent, throat infection, emmenagogue, emollient
Triumfeta cordifolia	Triumfeta cordifolia	NULL	NULL	NULL	Malaria, laxative
Turrea vogelii	Turrea vogelii	NULL	NULL	NULL	Cough, stomachache, aphrodisiac, whooping cough, impotence,filariasis
Tylophora dahomensis	Tylophora dahomensis	NULL	NULL	NULL	Measles, smallpox, emetic, expecdorant,blood purifier, diphoretic astringent, chronic bnronchitis, skin diseases, syphilis, appetiser,.
Uapaca guineensis	Uapaca guineensis	NULL	NULL	NULL	Cough,anthelmintics,abortifacient,aphrodisiac.
Uncaria africana	Uncaria africana	NULL	NULL	NULL	Cold, cough, catarrh, diarrhoea.
Uncaria talbotii	Uncaria talbotii	NULL	NULL	NULL	Cough, cattarrah, diarrhoea,toothache.
Uraria picta	Uraria picta	NULL	NULL	NULL	Snake-bite, antidotes,aphrodisiac,repositioning foetus intra-uterine.
Urena lobata	Urena lobata	NULL	NULL	NULL	Dysentery,emollient,expectorant
Urginea altissima	Urginea altissima	NULL	NULL	NULL	Influenza, asthma, bronchitis, warts,rheumaticism,abortifacient,emmenagogue
Urtica dioica	Urtica dioica	NULL	NULL	NULL	Antipyretic,astringent,emmenagogue,menstrual disorder,kidney diseases.
Uvaria afzelii	Uvaria afzelii	NULL	NULL	NULL	Infections of liver, kidney, bladder, fever, cough,skin diseases,purgative.
Uvaria chamae	Uvaria chamae	NULL	NULL	NULL	Jaundice, yellow fever,febrifuge,purgative,sores
Vernonia amygdalina	Vernonia amygdalina	NULL	NULL	NULL	Stomachache, itching, ringworms,antimicrobials,nervous diseases, gingivitis, toothache, haemostatic, diabetes, pneumonia, enema, malaria.
Vernonia biafrae	Vernonia biafrae	NULL	NULL	NULL	Malaria, boils, wounds
Vernonia cinerea	Vernonia cinerea	NULL	NULL	NULL	Anthelmintics,skin diseases,dysentery,fever,cough,emollient
Vernonia colorata	Vernonia colorata	NULL	NULL	NULL	Antipyretic,anthelmintics,astringent,skin diseases,gonorrhoea,anaemia,poison antidote
Vernonia guineensis	Vernonia guineensis	NULL	NULL	NULL	Astringent,malaria,male sterility,uro-genital disorders,jaundice,antipyretic,toothache
Vernonia oocephala	Vernonia oocephala	NULL	NULL	NULL	Antipyretic,cough,dysentery,malaria,aphrodisiac,blood tonic
Viscum album	Viscum album	NULL	NULL	NULL	All purpose herbs,for cancer,anaemia,hypertension,diabetes,stroke,emetic,hysteria,amenorrhoea,dysmenorrhoea.
Viscum flavescens	Viscum flavescens	NULL	NULL	NULL	Hypertension,fibroids,dysmenorrhoea,infertility,heart diseases
Vitex cryosocarpa	Vitex cryosocarpa	NULL	NULL	NULL	Loss of libido,improves sperm strength
Vitex doniana	Vitex doniana	NULL	NULL	NULL	Cough, stomach-ache, ringworm, inflammatory swelling of joints, fever, rheumatism, bad breath,diarrhoea,catarrh,sleeping sickness..
Voacanga africana	Voacanga africana	NULL	NULL	NULL	Fever, toothache, cardiac tonic, sores,carious tooth,hypertension,improves mental alertness
Waltheria indica	Waltheria indica	NULL	NULL	NULL	Cough, fever, external haemorrhage, dysentery,toothache,eye-drops, malaria.
Warburgia ugandensis	Warburgia ugandensis	NULL	NULL	NULL	Fever, astringent, cold, joint pains, toothache tonic
Wissadula amplissima	Wissadula amplissima	NULL	NULL	NULL	Convulsions.
Withania somnifera	Withania somnifera	NULL	NULL	NULL	Diurectic, anthelmintic, sore eye, boils, chancre, aphrodisiac, abortifacient, miscarriage ,chest pains, antimicrobial.
Wood fordia uniflora	Wood fordia uniflora	NULL	NULL	NULL	Astringent, menorrhagia, ulcers, wounds
Xeromorphus nilotica	Xeromorphus nilotica	NULL	NULL	NULL	Emetic, expectorant, antispasmodic, dysentery, colic, fever, rheumatism
Ximenia americana	Ximenia americana	NULL	NULL	NULL	Toothache, headache, ulcers, skin diseases, sleeping sickness, mumps, conjunctivitis, eye wash.
Xylopia acutiflora	Xylopia acutiflora	NULL	NULL	NULL	Fever, headache, bronchi infection, colds.
Xylopia quintasii	Xylopia quintasii	NULL	NULL	NULL	Constipation, mouthwash, menorrhoea, gonorrhoea, bronchitis, wound dressing.
Xylopia vilosa	Xylopia vilosa	NULL	NULL	NULL	Cold, fever, embrocation.
Xylopica aethiopica	Xylopica aethiopica	NULL	NULL	NULL	Stomachache, cough, neuralgia,mental disorders, amenorrhoea, bronchitis, antimicrobial activity,carminative,purgative
Xysmalobium heudelotiamum	Xysmalobium heudelotiamum	NULL	NULL	NULL	Emetic, stomachache, bitter tonic.
Zanthoxylum leprieuri	Zanthoxylum leprieuri	NULL	NULL	NULL	Dysentery, colds, cough,malaria,scabies toothache,caries.
Zanthoxylum rubenscens	Zanthoxylum rubenscens	NULL	NULL	NULL	Cancer,cough,toothache,venereal diseases,gastrointestinal disorders
Zanthoxylum zanthoxyloides	Zanthoxylum zanthoxyloides	NULL	NULL	NULL	Venereal diseases, cough,tuberculosis, urinary disorders,cancers,antimicrobials,sickle-cell anaemia,emmenagogue,contraceptive,gonorrhoea,arthritis
Zea mays	Zea mays	NULL	NULL	NULL	Gall bladder stone, urinary troubles, cough,demulcent,diuretic,carminative
Zingiber officinale	Zingiber officinale	NULL	NULL	NULL	Cold, cough, asthma, stimulant, rheumatism, piles, hepatitis, liver diseases,diuretic headache,digestive disorder,breast swelling related to menstrual cycle,anthelmintics,carminative,typhoid fever,obesity, malaria.
Ziziphus mauritiana	Ziziphus mauritiana	NULL	NULL	NULL	Cough,yellow fever,astringent,anthelmintics,conjunctivitis,purgative
Ziziphus spina-christi	Ziziphus spina-christi	NULL	NULL	NULL	Cough,  respiratory problems,astringent,yellow fever.
Acacia nilotica	Acacia nilotica	NULL	NULL	NULL	Skin diseases,fungal infections,insomnia,emollient.
Acacia senegal	Mimosa pudica	NULL	NULL	NULL	
Aloe schweinfurthi	Aloe barteri	NULL	NULL	NULL	Ringworm,anthelmintics,aphrodisiac,amenorrhoea,cough,skin infections,astringent,antitumour,pile,fruits for preventing snake bite,
Cinchona pubescens	\N	\N	\N	\N	\N
Senna alexandrina	\N	\N	\N	\N	\N
Trichilia emetica	\N	\N	\N	\N	\N
Xylopia aethiopica	\N	\N	\N	\N	\N
Zanthoxylum xanthoxyloides	\N	\N	\N	\N	\N
Spirulina platensis	\N	\N	\N	\N	\N
Daucus carota	\N	\N	\N	\N	\N
Cabbage	\N	\N	\N	\N	\N
Emilia sonchifolia	\N	\N	\N	\N	\N
Rauwolfia vomitoria	\N	\N	\N	\N	\N
Hoslundia opposita	\N	\N	\N	\N	\N
Launea taraxacifolia	\N	\N	\N	\N	\N
Saba camorensis	\N	\N	\N	\N	\N
Entandrophragma angolensis	\N	\N	\N	\N	\N
Gossypium arboreum	\N	\N	\N	\N	\N
Ficus cordata	\N	\N	\N	\N	\N
Adenia lobata	\N	\N	\N	\N	\N
Cassia nodosa	\N	\N	\N	\N	\N
Entandophragma angolensis	\N	\N	\N	\N	\N
Catharantus roseus	\N	\N	\N	\N	\N
\.


--
-- Data for Name: plantadversereactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plantadversereactions (botanicname, arcode) FROM stdin;
\.


--
-- Data for Name: plantcomponents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plantcomponents (botanicname, ccname) FROM stdin;
Acacia nilotica	3-beta-acetoxy-17-beta-hydroxyandrost-5-ene
Acacia nilotica	Leucoanthocyanidin
Acacia nilotica	Chlorogenic acid
Acacia nilotica	Arabic acid
Acacia nilotica	Gallic acid
Acacia senegal	Arabic acid
Acacia senegal	Glucuroric acid
Adansonia digitata	Vitamin C
Adansonia digitata	Vitamin A
Adansonia digitata	Linoleic acid
Adansonia digitata	Threonine
Ageratum conyzoides	Conyzorygun
Ageratum conyzoides	Chromene
Ageratum conyzoides	Kaempferol
Ageratum conyzoides	Eugenol
Alchornea cordifolia	Alchornine
Alchornea cordifolia	Cadinol
Alchornea cordifolia	Caryophyllene
Alchornea cordifolia	Endo-alpha-bergamotene
Allium sativum	Allicin
Allium sativum	Ajoene
Allium sativum	Diallyl disulfide
Allium sativum	Diallyl trisulfide
Aloe schweinfurthi	Aloe emodin
Aloe schweinfurthi	Aloin
Aloe schweinfurthi	Isobarbaloin
Aloe schweinfurthi	Anthranol
Aloe vera	Aloe emodin
Aloe vera	Aloin
Aloe vera	Isobarbaloin
Aloe vera	Anthranol
Alstonia boonei	Echitamine
Alstonia boonei	Echitamidine
Alstonia boonei	Lupeol
Alstonia boonei	Beta-amyrin
Alstonia boonei	Ursolic acid
Argemone mexicana	Berberine
Argemone mexicana	Protopine
Argemone mexicana	Allocryptopine
Argemone mexicana	Sanguinarine
Azadirachta indica	Azadirachtin
Azadirachta indica	Gedunin
Balanites aegyptiaca	6-Methyldiosgenin
Balanites aegyptiaca	Balanitin-3
Balanites aegyptiaca	Balanitoside
Bridelia ferruginea	Quercitrin
Bridelia ferruginea	Myricitrin
Carica papaya	Caffeic acid
Carica papaya	Cotinine
Carica papaya	Benzyl glucosinolate
Carica papaya	Campesterol
Carica papaya	Myosmine
Carica papaya	Carpaine
Cinchona pubescens	Quinine
Cinchona pubescens	Quinidine
Cinchona pubescens	Cinchonine
Cinchona pubescens	Cinchonidine
Cryptolepia sanguinolenta	Cryptolepine
Cryptolepia sanguinolenta	Hydroxycryptolepine
Cryptolepia sanguinolenta	Cryptoheptine
Cryptolepia sanguinolenta	Quindoline
Cymbopogon citratus	Citronellal
Cymbopogon citratus	Camphene
Cymbopogon citratus	Citral
Cymbopogon citratus	Geraniol
Euphorbia hirta	Quercitin
Euphorbia hirta	Phorbol
Euphorbia hirta	Rutin
Euphorbia hirta	Quercetin
Mitragyna stipulosa	Ursolic acid
Mitragyna stipulosa	Quinovic acid
Mitragyna stipulosa	Zygophyloside A
Mitragyna stipulosa	Zygophyloside B
Harrisonia abyssinica	Obacunone
Harrisonia abyssinica	Friedelanone
Hibiscus sabdariffa	Protocatechuic acid
Hibiscus sabdariffa	Hibiscus acid
Hymenocardia acida	Betulinic acid
Hymenocardia acida	Lupeol
Khaya senegalensis	Aesculetin
Khaya senegalensis	Scoparone
Khaya senegalensis	Methyl angolensate
Khaya senegalensis	Khayalenoid E
Lawsonia inermis	Lawsone
Lawsonia inermis	Laxathone 1
Lawsonia inermis	Gallic acid
Lawsonia inermis	Esculetin
Lawsonia inermis	Scopoletin
Lawsonia inermis	Lacoumarin
Lippia multiflora	Linalool
Lippia multiflora	Myrtenol
Lippia multiflora	Limonoid
Lippia multiflora	Terpineol
Mitragyna inermis	Inermiside I
Mitragyna inermis	Inermiside II
Mitragyna inermis	Uncarine
Mitragyna inermis	Rotundifoline
Momordica charantia	Momordicin
Momordica charantia	Charantin
Momordica charantia	Viclue
Momordica charantia	Momorcharin
Morinda lucida	Ursolic
Morinda lucida	Damnacanthal
Morinda lucida	3-hydroxy-1-methoxy-2-methylanthraquinone
Morinda lucida	2-hydroxy-1-methoxy-3-methylanthraquinone
Moringa oleifera	4-(4'-O-acetyl-a-L-rhamnosyloxy) benzyl isothiocyanate
Moringa oleifera	4-(a-L-rahmnopyranosyloxy) benzyl isothiocyanate
Moringa oleifera	4-(a-l-rhamnopyranosyloxy) benzyl glucosinolate
Moringa oleifera	Pterygospermin
Moringa oleifera	Benzyl isothiocyanate
Moringa oleifera	Niazimicin
Ocimum basilicum	Cuminaldehyde
Ocimum basilicum	Anethole
Ocimum basilicum	Limonene
Ocimum basilicum	Estragole
Ocimum basilicum	Methyl cinnamate
Ocimum basilicum	4-methoxycinnamaldehyde
Ocimum gratissimum	Thymol
Ocimum gratissimum	Camphor
Ocimum gratissimum	Eugenol
Ocimum gratissimum	Caryophyllene
Phyllanthus niruri	Securinine
Phyllanthus niruri	Phyllanthin
Phyllanthus niruri	Hypophyllanthin
Phyllanthus niruri	Methyl salicylate
Phytolacca dodecandra	Phytolaccoside B
Phytolacca dodecandra	Bayogenin
Phytolacca dodecandra	Oleanolic acid
Phytolacca dodecandra	Hederagenin
Pterocarpus erinaceus	Afromosin
Pterocarpus erinaceus	Friedelin
Pterocarpus erinaceus	Lupeol
Pterocarpus erinaceus	Pterocarpin
Pterocarpus erinaceus	Epicatechin
Rauvolfia vomitoria	Alstonine
Rauvolfia vomitoria	Rescinnamine
Rauvolfia vomitoria	Serpentine
Rauvolfia vomitoria	Reserpine
Sarcocephalus latifolius	Nauclefidine
Sarcocephalus latifolius	Naucletine
Schlerocarya birrea	Valencene
Schlerocarya birrea	Alloaromadendrene epoxide
Schlerocarya birrea	Epi-alpha-selinene
Schlerocarya birrea	14-Hydroxy-alpha-humulene
Scoparia dulcis	Scopadulin
Scoparia dulcis	Scopadulcic acid B
Scoparia dulcis	Scoparic acid
Scoparia dulcis	Scopadulcic acid A
Securidaca longepedunculata	Sinapic acid
Securidaca longepedunculata	2-hydroxy-6-methoxy benzoic acid methyl ester
Securidaca longepedunculata	Racine alkaloids
Securidaca longepedunculata	Methyl-2-hydroxy-6-methoxybenzoate
Senna alata	Emodin
Senna alata	Chrysophanol
Senna alata	Emodin-8-glucose
Senna alata	Franguilin A
Senna alata	Anthraquinone
Senna alata	Anthranol
Senna alata	Senoside A
Senna alata	Senoside B
Senna alata	Chrysophanic acid anthrone
Senna alexandrina	Chrysophanic acid anthrone
Senna alexandrina	Senoside B
Senna alexandrina	Senoside A
Senna alexandrina	Anthranol
Senna alexandrina	Franguilin A
Senna alexandrina	Emodin-8-glucose
Senna alexandrina	Chrysophanol
Senna alexandrina	Anthraquinone
Senna alexandrina	Emodin
Senna podocarpa	Emodin
Senna podocarpa	Anthraquinone
Senna podocarpa	Chrysophanol
Senna podocarpa	Emodin-8-glucose
Senna podocarpa	Franguilin A
Senna podocarpa	Anthranol
Senna podocarpa	Senoside A
Senna podocarpa	Chrysophanic acid anthrone
Senna podocarpa	Senoside B
Spondias mombin	Allo-hydroxycitric acid
Spondias mombin	Chlorogenic acid
Spondias mombin	Geraniin
Spondias mombin	Zeaxanthin
Tetrapleura tetraptera	Mimosine
Tetrapleura tetraptera	Aridanin
Tetrapleura tetraptera	2, 2', 4'-trihydroxychalcone
Tetrapleura tetraptera	2', 3, 4, 4'-tetrahydroxychalcone
Tetrapleura tetraptera	4', 5, 7-trihydroxyflavanone
Tinospora bakis	Palmatine
Tinospora bakis	Tinosporafuranol
Tinospora bakis	Tinosporide
Vernonia amygdalina	Vernodalol
Vernonia amygdalina	Vernolepin
Vernonia amygdalina	Vernolide
Vernonia colorata	Vernolide
Vernonia colorata	Vernodalol
Vernonia colorata	Vernodalin
Vernonia colorata	Vernonioside D
Zanthoxylum zanthoxyloides	Nitidine chloride
Zanthoxylum zanthoxyloides	Fagaronine
Zanthoxylum zanthoxyloides	Fagaridine
Zanthoxylum zanthoxyloides	Skimmianine
Zanthoxylum zanthoxyloides	Berberine
Zingiber officinale	Zingiberine
Zingiber officinale	6-Gingerol
\.


--
-- Data for Name: plantcontraindications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plantcontraindications (botanicname, cicode) FROM stdin;
Acacia senegal	194
Adansonia digitata	194
Ageratum conyzoides	63
Alchornea cordifolia	121
Allium sativum	165
Allium sativum	196
Allium sativum	83
Allium sativum	160
Allium sativum	121
Allium sativum	198
Allium sativum	175
Allium sativum	199
Aloe schweinfurthi	200
Aloe schweinfurthi	201
Aloe schweinfurthi	48
Aloe schweinfurthi	202
Aloe schweinfurthi	203
Aloe schweinfurthi	204
Aloe schweinfurthi	205
Aloe schweinfurthi	206
Aloe schweinfurthi	144
Aloe schweinfurthi	1
Aloe vera	1
Aloe vera	144
Aloe vera	206
Aloe vera	205
Aloe vera	204
Aloe vera	202
Aloe vera	203
Aloe vera	48
Aloe vera	201
Aloe vera	200
Alstonia boonei	121
Alstonia boonei	144
Alstonia boonei	1
Argemone mexicana	144
Argemone mexicana	207
Azadirachta indica	144
Azadirachta indica	1
Azadirachta indica	208
Azadirachta indica	209
Azadirachta indica	210
Azadirachta indica	207
Balanites aegyptiaca	209
Bridelia ferruginea	209
Bridelia ferruginea	210
Bridelia ferruginea	207
Bridelia ferruginea	211
Carica papaya	144
Carica papaya	1
Carica papaya	212
Carica papaya	213
Cryptolepia sanguinolenta	144
Cryptolepia sanguinolenta	214
Cryptolepia sanguinolenta	215
Cymbopogon citratus	144
Cymbopogon citratus	1
Euphorbia hirta	1
Euphorbia hirta	144
Euphorbia hirta	210
Euphorbia hirta	207
Euphorbia hirta	216
Euphorbia hirta	217
Mitragyna stipulosa	1
Mitragyna stipulosa	144
Hibiscus sabdariffa	144
Hibiscus sabdariffa	1
Hibiscus sabdariffa	121
Hymenocardia acida	218
Khaya senegalensis	219
Lawsonia inermis	121
Lippia multiflora	210
Lippia multiflora	144
Lippia multiflora	1
Lippia multiflora	212
Lippia multiflora	220
Mitragyna inermis	208
Momordica charantia	144
Momordica charantia	221
Morinda lucida	211
Moringa oleifera	211
Ocimum basilicum	144
Ocimum basilicum	121
Ocimum gratissimum	121
Phyllanthus niruri	209
Phyllanthus niruri	212
Phyllanthus niruri	222
Phyllanthus niruri	223
Phytolacca dodecandra	1
Phytolacca dodecandra	144
Rauvolfia vomitoria	212
Rauvolfia vomitoria	223
Rauvolfia vomitoria	194
Sarcocephalus latifolius	144
Sarcocephalus latifolius	48
Sarcocephalus latifolius	224
Sarcocephalus latifolius	225
Sclerocarya birrea spp caffra	209
Scoparia dulcis	209
Scoparia dulcis	144
Scoparia dulcis	210
Scoparia dulcis	207
Scoparia dulcis	208
Scoparia dulcis	226
Scoparia dulcis	227
Securidaca longepedunculata	144
Securidaca longepedunculata	121
Securidaca longepedunculata	222
Senna alata	1
Senna alata	144
Senna alata	194
Senna alata	219
Senna alata	204
Senna alata	228
Senna alata	229
Senna alata	230
Senna alexandrina	144
Senna alexandrina	229
Senna alexandrina	200
Senna alexandrina	232
Senna alexandrina	233
Senna alexandrina	234
Senna occidentalis	144
Senna occidentalis	212
Senna occidentalis	220
Senna podocarpa	144
Senna podocarpa	1
Senna podocarpa	200
Senna podocarpa	229
Senna podocarpa	232
Senna podocarpa	233
Senna podocarpa	234
Sorghum bicolor	235
Borreria verticillata	236
Spondias mombin	144
Spondias mombin	237
Tetrapleura tetraptera	238
Tinospora bakis	144
Vernonia amygdalina	144
Vernonia amygdalina	1
Vernonia amygdalina	211
Vernonia amygdalina	215
Vernonia amygdalina	239
Vernonia colorata	1
Vernonia colorata	144
Vernonia colorata	215
Vernonia colorata	239
Zanthoxylum zanthoxyloides	211
\.


--
-- Data for Name: plantpart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plantpart (partname) FROM stdin;
Aerial part
All
Bark
Bud
Bulb
Chalice
Exudate
Flowers
Fruit
fruit pulp
Gel
Internal bark
Juice
Latex
Leaves
Nuts
Ripe fruit
Root
Root bark
Rootstock
Sap
Seds
Seeds
silk corn
Stem
Stem bark
Stem twig
Tubers
Twigs
Unripe fruit
whole plant
wood
Young leaves
NULL
Cotyledons
Rhizome
Aerial parts
\.


--
-- Data for Name: plantsinrecipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plantsinrecipe (recipecode, botanicname, partname, quantity) FROM stdin;
1.Rx	Cryptolepia sanguinolenta	Root	40.00
1.Rx	Cymbopogon citratus	Leaves	20.00
1.Rx	Khaya senegalensis	Internal bark	20.00
1.Rx	Moringa oleifera	Leaves	20.00
10.Rx	Alchornea cordifolia	Leaves	25.00
10.Rx	Bridelia ferruginea	Leaves	50.00
10.Rx	Ocimum gratissimum	Leaves	25.00
11.Rx	Adansonia digitata	Stem bark	25.00
11.Rx	Alchornea cordifolia	Leaves	25.00
11.Rx	Bridelia ferruginea	Leaves	50.00
12.Rx	Mondia whitei	Root	25.00
12.Rx	Paullinia pinnata	Root	25.00
12.Rx	Sida acuta	Root	25.00
12.Rx	Sphenocentrum jollyanum	Root	25.00
13.Rx	Bombax buonopozense	Stem	25.00
13.Rx	Mondia whitei	Root	25.00
13.Rx	Paullinia pinnata	Root	25.00
13.Rx	Sphenocentrum jollyanum	Root	25.00
14.Rx	Cissus populnea	Stem	25.00
14.Rx	Mondia whitei	Root	25.00
14.Rx	Paullinia pinnata	Root	25.00
14.Rx	Zea mays	silk corn	25.00
15.Rx	Aframomum melegueta	Seeds	30.00
15.Rx	Hymenocardia acida	Leaves	30.00
15.Rx	Zanthoxylum zanthoxyloides	Stem bark	20.00
15.Rx	Zingiber officinale	Rootstock	20.00
16.Rx	Paullinia pinnata	Root	60.00
16.Rx	Piper guineense	Seeds	20.00
16.Rx	Zanthoxylum zanthoxyloides	Stem bark	20.00
17.Rx	Alstonia boonei	Stem bark	15.00
17.Rx	Cassia sieberiana	Stem bark	55.00
17.Rx	Trichilia monadelpha	Stem bark	30.00
18.Rx	Azadirachta indica	Leaves	50.00
18.Rx	Capsicum frutescens	Fruit	10.00
18.Rx	Cassia sieberiana	Stem bark	40.00
19.Rx	Cassia sieberiana	Stem bark	25.00
19.Rx	Ficus exasperata	Stem bark	25.00
19.Rx	Paullinia pinnata	Root	50.00
2.Rx	Cassia alata	Leaves	15.00
2.Rx	Cryptolepia sanguinolenta	Root	40.00
2.Rx	Cymbopogon citratus	Leaves	15.00
2.Rx	Khaya senegalensis	Internal bark	15.00
2.Rx	Moringa oleifera	Leaves	15.00
20.Rx	Adansonia digitata	Stem bark	20.00
20.Rx	Maytenus senegalensis	Leaves	20.00
20.Rx	Zanthoxylum zanthoxyloides	Stem bark	30.00
21.Rx	Balanites aegyptiaca	Stem bark	40.00
21.Rx	Harpagophytum procumbens	Root	30.00
21.Rx	Securidaca longepedunculata	Root	30.00
22.Rx	Harungana madagascariensis	Stem bark	20.00
22.Rx	Khaya senegalensis	Internal bark	40.00
22.Rx	Zanthoxylum zanthoxyloides	Root	40.00
23.Rx	Carica papaya	Unripe fruit	50.00
23.Rx	Sorghum bicolor	Leaves	50.00
24.Rx	Andasonia digitata	Stem bark	20.00
24.Rx	Sorghum bicolor	Leaves	20.00
24.Rx	Zanthoxylum zanthoxyloides	Root	60.00
25.Rx	Bridelia ferruginea	Stem bark	60.00
25.Rx	Momordica charantia	Leaves	20.00
25.Rx	Tetrapleura tetraptera	Fruit	20.00
26.Rx	Morinda lucida	Stem bark	50.00
26.Rx	Scoparia dulcis	Leaves	25.00
26.Rx	Vernonia amygdalina	Leaves	25.00
27.Rx	Hymenocardia acida	Stem bark	40.00
27.Rx	Sclerocarya birrea spp caffra	Stem bark	40.00
27.Rx	Tetrapleura tetraptera	Fruit	20.00
28.Rx	Bridelia ferruginea	Leaves	30.00
28.Rx	Moringa oleifera	Leaves	30.00
28.Rx	Spathodea campanulata	Stem bark	40.00
29.Rx	Moringa oleifera	Leaves	40.00
29.Rx	Sclerocarya birrea spp caffra	Stem bark	60.00
3.Rx	Cymbopogon citratus	Leaves	15.00
3.Rx	Khaya senegalensis	Internal bark	15.00
3.Rx	Morinda lucida	Stem bark	40.00
3.Rx	Moringa oleifera	Leaves	15.00
3.Rx	Psidium guajava	Leaves	15.00
30.Rx	Moringa oleifera	Leaves	30.00
30.Rx	Sclerocarya birrea spp caffra	Stem bark	40.00
30.Rx	Scoparia dulcis	Stem bark	30.00
31.Rx	Khaya grandifolia	Internal bark	10.00
31.Rx	Phyllanthus niruri	Leaves	20.00
31.Rx	Rauvolfia vomitoria	Root	60.00
31.Rx	Scoparia dulcis	Stem bark	10.00
32.Rx	Allium sativum	Bulb	20.00
32.Rx	Lippia multiflora	Leaves	20.00
32.Rx	Momordica charantia	Leaves	40.00
32.Rx	Tetrapleura tetraptera	Fruit	20.00
33.Rx	Allium sativum	Bulb	20.00
33.Rx	Hibiscus sabdariffa	Chalice	40.00
33.Rx	Moringa oleifera	Leaves	20.00
33.Rx	Phyllanthus niruri	Leaves	20.00
34.Rx	Allium sativum	Bulb	30.00
34.Rx	Hymenocardia acida	Leaves	50.00
34.Rx	Moringa oleifera	Leaves	20.00
35.Rx	Combretum mucronatum	Leaves	40.00
35.Rx	Hibiscus sabdariffa	Chalice	40.00
35.Rx	Lippia multiflora	Leaves	20.00
36.Rx	Aloe vera	Leaves	20.00
36.Rx	Eugenia aromatica	Bud	20.00
36.Rx	Garcinia kola	Seeds	30.00
36.Rx	Picralima nitida	Seeds	30.00
37.Rx	Cassia podocarpa	Leaves	30.00
37.Rx	Eugenia aromatica	Bud	20.00
37.Rx	Picralima nitida	Seeds	30.00
37.Rx	Xylopica aethiopica	Fruit	20.00
38.Rx	Khaya senegalensis	Bark	30.00
38.Rx	Nauclea latifolia	Root	50.00
38.Rx	Xylopica aethiopica	Fruit	15.00
38.Rx	Zingiber officinale	Rootstock	5.00
39.Rx	Abrus precatorius	Leaves	40.00
39.Rx	Euphorbia hirta	Aerial part	40.00
39.Rx	Honey	All	20.00
4.Rx	Cryptolepia sanguinolenta	Root	40.00
4.Rx	Cymbopogon citratus	Leaves	15.00
4.Rx	Khaya senegalensis	Internal bark	15.00
4.Rx	Moringa oleifera	Leaves	15.00
4.Rx	Psidium guajava	Leaves	15.00
40.Rx	Allium sativum	Bulb	70.00
40.Rx	Honey	All	20.00
40.Rx	Zingiber officinale	Rootstock	10.00
41.Rx	Abrus precatorius	Leaves	60.00
41.Rx	Euphorbia hirta	Leaves	30.00
41.Rx	Tetrapleura tetraptera	Fruit	10.00
42.Rx	Crossopteryx febrifuga	Leaves	30.00
42.Rx	Euphorbia hirta	Leaves	30.00
42.Rx	Waltheria indica	Leaves	40.00
43.Rx	Balanites aegyptiaca	Stem bark	40.00
43.Rx	Carica papaya	Seeds	60.00
44.Rx	Carica papaya	Seeds	40.00
44.Rx	Citrus aurantifolia	Leaves	30.00
44.Rx	Vernonia amygdalina	Leaves	30.00
45.Rx	Carica papaya	Leaves	20.00
45.Rx	Pavetta owariensis	Stem bark	80.00
46.Rx	Adansonia digitata	Stem bark	10.00
46.Rx	Aframomum melegueta	Seeds	70.00
46.Rx	Dichrostachys glomerata	Stem	20.00
47.Rx	Khaya senegalensis	Stem bark	50.00
47.Rx	Solanum torvum	Fruit	20.00
47.Rx	Sorghum bicolor	Leaves	30.00
48.Rx	Alchornea cordifolia	Leaves	30.00
48.Rx	Alstonia boonei	Stem bark	30.00
48.Rx	Hoslundia  opposita	Leaves	40.00
49.Rx	Alchornea cordifolia	Leaves	20.00
49.Rx	Aloe vera	Gel	35.00
49.Rx	Eugenia caryophylus	Bud	5.00
49.Rx	Vernonia amygdalina	Leaves	40.00
5.Rx	Azadirachta indica	Leaves	20.00
5.Rx	Lippia multiflora	Leaves	15.00
5.Rx	Ocimum gratissimum	Leaves	15.00
5.Rx	Sarcocephalus latifolius	Stem bark	50.00
50.Rx	Cymbopogon citratus	Leaves	20.00
50.Rx	Hibiscus sabdariffa	Chalice	20.00
50.Rx	Lippia multiflora	Leaves	60.00
51.Rx	Azadirachta indica	Leaves	30.00
51.Rx	Hoslundia  opposita	Leaves	30.00
51.Rx	Lippia multiflora	Leaves	40.00
52.Rx	Allium cepa	Bulb	50.00
52.Rx	Azadirachta indica	Leaves	30.00
52.Rx	Honey	All	20.00
53.Rx	Aloe vera	Gel	20.00
53.Rx	Cassia alata	Leaves	70.00
53.Rx	Plumbago zeylanica	Leaves	10.00
54.Rx	Acalypha wilkesiana	Leaves	40.00
54.Rx	Aloe vera	Gel	20.00
54.Rx	Cassia alata	Leaves	40.00
55.Rx	Cryptolepia sanguinolenta	Root	40.00
55.Rx	Spathodea campanulata	Stem bark	30.00
55.Rx	Spondias mombin	Stem bark	20.00
55.Rx	Xylopica aethiopica	Fruit	10.00
56.Rx	Alchornea cordifolia	Leaves	30.00
56.Rx	Plumbago zeylanica	Leaves	5.00
56.Rx	Salt	All	5.00
56.Rx	Xylopica aethiopica	Fruit	30.00
56.Rx	Zanthoxylum zanthoxyloides	Bark	30.00
57.Rx	Alchornea cordifolia	Leaves	20.00
57.Rx	Aloe vera	Gel	20.00
57.Rx	Cassia alata	Leaves	60.00
58.Rx	Ocimum gratissimum	Leaves	30.00
58.Rx	Zingiber officinale	Rootstock	70.00
59.Rx	Zingiber officinale	Rootstock	100.00
6.Rx	Argemone mexicana	Leaves	40.00
6.Rx	Azadirachta indica	Leaves	20.00
6.Rx	Vernonia colorata	Leaves	40.00
60.Rx	Cochlospermun tinctorium	Rootstock	30.00
60.Rx	Combretum mucronatum	Leaves	20.00
60.Rx	Entada africana	Root	30.00
60.Rx	Phyllanthus amarus	Leaves	20.00
61.Rx	Cochlospermun tinctorium	Rootstock	60.00
61.Rx	Tinospora bakis	Rootstock	40.00
62.Rx	Chrysophyllum americanum	Flowers	20.00
62.Rx	Cochlospermun tinctorium	Rootstock	20.00
62.Rx	Combretum micranthum	Leaves	20.00
62.Rx	Entada africana	Root	20.00
62.Rx	Phyllanthus amarus	Aerial part	20.00
63.Rx	Launaea taraxacifolia	Leaves	40.00
63.Rx	Momordica charantia	Leaves	15.00
63.Rx	Phyllanthus fraternus	Leaves	40.00
63.Rx	Zingiber officinale	Rootstock	5.00
64.Rx	Alchornea cordifolia	Leaves	50.00
64.Rx	Euphorbia hirta	Aerial part	20.00
64.Rx	Flugea virosa	Leaves	30.00
65.Rx	Euphorbia hirta	Aerial part	20.00
65.Rx	Flugea virosa	Leaves	30.00
65.Rx	Tetrapleura tetraptera	Fruit	50.00
66.Rx	Bridelia ferruginea	Leaves	50.00
66.Rx	Momordica charantia	Leaves	25.00
66.Rx	Trichilia monadelpha	Bark	20.00
66.Rx	Zingiber officinale	Rootstock	5.00
67.Rx	Borreria verticillata	Leaves	20.00
67.Rx	Spondias mombin	Stem bark	30.00
67.Rx	Ximenia americana	Root bark	40.00
67.Rx	Zanthoxylum zanthoxyloides	Root bark	10.00
7.Rx	Azadirachta indica	Leaves	30.00
7.Rx	Cochlospermun tinctorium	Leaves	20.00
7.Rx	Nauclea pobeguinii	Root	40.00
7.Rx	Vernonia colorata	Leaves	10.00
8.Rx	Cochlospermun tinctorium	Leaves	20.00
8.Rx	Guiera senegalensis	Leaves	30.00
8.Rx	Mitragyna inermis	Stem bark	40.00
8.Rx	Sorghum bicolor	Leaves	10.00
9.Rx	Alchornea cordifolia	Leaves	25.00
9.Rx	Ocimum gratissimum	Leaves	50.00
9.Rx	Psidium guajava	Leaves	25.00
20.Rx	Trichilia emetica	Stem bark	30.00
75.Rx	Trichilia emetica	Stem bark	50.00
101.Rx	Gossypium arboreum	Leaves	50.00
68.Rx	Harrisonia abyssinica	Stem bark	40.00
68.Rx	Borreria verticillata	Seeds	20.00
68.Rx	Acacia nilotica	Fruit	20.00
68.Rx	Zanthoxylum zanthoxyloides	NULL	10.00
69.Rx	Afrormosia laxiflora	Leaves	40.00
69.Rx	Moringa oleifera	Leaves	40.00
69.Rx	Guiera senegalensis	Leaves	20.00
70.Rx	Maytenus senegalensis	Leaves	30.00
70.Rx	Trichilia emetica	Stem bark	30.00
70.Rx	Alchornea cordifolia	Leaves	20.00
70.Rx	Ocimum basilicum	NULL	20.00
71.Rx	Ximenia americana	Stem bark	50.00
71.Rx	Nauclea latifolia	Root	40.00
71.Rx	Xylopia aethiopica	Fruit	10.00
72.Rx	Zanthoxylum xanthoxyloides	Root bark	30.00
72.Rx	Guiera senegalensis	Leaves	30.00
72.Rx	Moringa oleifera	Leaves	20.00
72.Rx	Spirulina platensis	Leaves	20.00
73.Rx	Adansonia digitata	Stem bark	20.00
73.Rx	Zanthoxylum xanthoxyloides	Root	20.00
73.Rx	Momordica charantia	Leaves	20.00
73.Rx	Phyllanthus niruri	Leaves	20.00
73.Rx	Alstonia boonei	Stem bark	20.00
74.Rx	Daucus carota	Root	50.00
74.Rx	Aloe vera	Juice	40.00
74.Rx	Allium sativum	Bulb	10.00
75.Rx	Azadirachta indica	Leaves	50.00
76.Rx	Cassia podocarpa	Leaves	50.00
76.Rx	Combretum mucronatum	Stem bark	50.00
77.Rx	Aloe vera	NULL	25.00
77.Rx	Euphorbia hirta	Leaves	25.00
77.Rx	Momordica charantia	Leaves	25.00
77.Rx	Ximenia americana	NULL	25.00
78.Rx	Aloe vera	Leaves	25.00
78.Rx	Euphorbia hirta	Leaves	25.00
78.Rx	Momordica charantia	Leaves	25.00
78.Rx	Musa sapientum	Fruit	25.00
79.Rx	Musa sapientum	Unripe fruit	50.00
79.Rx	Honey	NULL	30.00
79.Rx	Cabbage	Leaves	20.00
80.Rx	Vernonia amygdalina	Leaves	40.00
80.Rx	Emilia sonchifolia	Leaves	20.00
80.Rx	Citrus aurantifolia	Leaves	20.00
80.Rx	Momordica charantia	Leaves	10.00
80.Rx	Allium sativum	Bulb	10.00
81.Rx	Cola nitida	Cotyledons	50.00
81.Rx	Aframomum melegueta	Seeds	40.00
81.Rx	Zingiber officinale	Rhizome	10.00
82.Rx	Ageratum conyzoides	Leaves	40.00
82.Rx	Zanthoxylum xanthoxyloides	Bark	40.00
82.Rx	Cassia alata	NULL	20.00
83.Rx	Azadirachta indica	Leaves	60.00
83.Rx	Eugenia caryophylus	Bulb	20.00
83.Rx	Ocimum basilicum	Leaves	20.00
84.Rx	Rauwolfia vomitoria	Root	50.00
84.Rx	Lippia multiflora	Leaves	20.00
84.Rx	Hoslundia opposita	Leaves	20.00
84.Rx	Zingiber officinale	Rhizome	5.00
84.Rx	Xylopia aethiopica	Leaves	5.00
85.Rx	Launea taraxacifolia	Leaves	45.00
85.Rx	Moringa oleifera	Leaves	45.00
85.Rx	Cinnamomun zeylanica	Leaves	5.00
85.Rx	Soy	NULL	5.00
86.Rx	Soy	NULL	30.00
86.Rx	Moringa oleifera	Leaves	20.00
86.Rx	Launea taraxacifolia	Leaves	20.00
86.Rx	Cinnamomun zeylanica	NULL	10.00
87.Rx	Cassia occidentalis	Leaves	40.00
87.Rx	Phyllanthus fraternus	Leaves	30.00
87.Rx	Azadiractha indica	Leaves	20.00
87.Rx	Moringa oleifera	Leaves	10.00
88.Rx	Ocimum gratisimum	Leaves	40.00
88.Rx	Heliotropium indicum	Leaves	30.00
88.Rx	Cymbopogon citratus	Leaves	20.00
88.Rx	Allium sativum	Bulb	10.00
89.Rx	Ocimum gratisimum	Leaves	40.00
89.Rx	Heliotropium indicum	Leaves	30.00
89.Rx	Cymbopogon citratus	Leaves	20.00
89.Rx	Allium sativum	Bulb	10.00
90.Rx	Phyllanthus fraternus	Leaves	40.00
90.Rx	Zea mays	silk corn	20.00
90.Rx	Citrus aurantifolia	Leaves	20.00
90.Rx	Phaseolus vulgaris	Seeds	20.00
91.Rx	Desmodium adscendens	Leaves	50.00
91.Rx	Euphorbia hirta	Leaves	30.00
91.Rx	Zingiber officinale	Rhizome	10.00
91.Rx	Allium sativum	Bulb	10.00
92.Rx	Alchornea cordifolia	Leaves	40.00
92.Rx	Euphorbia hirta	Leaves	20.00
92.Rx	Bridelia ferruginea	Leaves	20.00
92.Rx	Combretum smcathmannii	Leaves	20.00
93.Rx	Albizia lebbeck	Stem bark	40.00
93.Rx	Cassia sieberiana	Stem bark	30.00
93.Rx	Zanthoxylum xanthoxyloides	Stem bark	30.00
94.Rx	Saba camorensis	Stem bark	70.00
94.Rx	Entandrophragma angolensis	Leaves	20.00
94.Rx	Cyperus esculentus	Root	10.00
95.Rx	Viscum album	Leaves	40.00
95.Rx	Mangifera indica	Leaves	20.00
95.Rx	Anthocleista nobilis	Leaves	20.00
95.Rx	Phyllanthus fraternus	Leaves	20.00
96.Rx	Adansonia digitata	Stem bark	40.00
96.Rx	Tectonia regia	Leaves	30.00
96.Rx	Croton membranaceus	Root	30.00
97.Rx	Parkia biglobosa	Stem bark	40.00
97.Rx	Zanthoxylum xanthoxyloides	Stem bark	40.00
97.Rx	Spathodea campanulata	Stem bark	20.00
99.Rx	Harungana madagascariensis	Leaves	40.00
99.Rx	Bridelia ferruginea	Leaves	20.00
99.Rx	Euphorbia hirta	Leaves	20.00
100.Rx	Blighia sapida	Leaves	40.00
100.Rx	Aloe vera	Gel	30.00
100.Rx	Ocimum basilicum	Leaves	30.00
101.Rx	Lippia multiflora	Leaves	25.00
101.Rx	Hoslundia opposita	Leaves	25.00
102.Rx	Bidens pilosa	Leaves	40.00
102.Rx	Rauwolfia vomitoria	Root	30.00
102.Rx	Alchornea cordifolia	Leaves	30.00
103.Rx	Ficus cordata	Stem bark	50.00
103.Rx	Spathodea campanulata	Stem bark	45.00
103.Rx	Zingiber officinale	Rhizome	5.00
104.Rx	Adenia lobata	Leaves	60.00
104.Rx	Alchornea cordifolia	Leaves	30.00
104.Rx	Plumbago zeylanica	Leaves	10.00
105.Rx	Cassia nodosa	Leaves	40.00
105.Rx	Cassia alata	Leaves	30.00
105.Rx	Hoslundia opposita	Leaves	30.00
106.Rx	Saba camorensis	Aerial parts	60.00
106.Rx	Cassia sieberiana	Stem bark	30.00
106.Rx	Trichilia monadelpha	Stem bark	10.00
107.Rx	Entandophragma angolensis	Stem bark	50.00
107.Rx	Cassia sieberiana	Stem bark	20.00
107.Rx	Trichilia monadelpha	Stem bark	20.00
107.Rx	Morinda lucida	Leaves	10.00
108.Rx	Morinda lucida	Leaves	60.00
108.Rx	Tectonia regia	Leaves	30.00
108.Rx	Phyllanthus fraternus	Leaves	20.00
108.Rx	Catharantus roseus	Leaves	20.00
\.


--
-- Data for Name: planttherapeuticactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planttherapeuticactions (tacode, botanicname) FROM stdin;
\.


--
-- Data for Name: planttherapeuticindications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planttherapeuticindications (ticode, botanicname) FROM stdin;
1	Monsonia senegalensis
3	Acacia ataxacantha
3	Albizia ferruginea
3	Alternanthera repens
3	Celastrus senegalensis
3	Citrus sinensis
3	Coula edulis
3	Daniellia oliveri
3	Ficus capensis
3	Garcinia afzelii
3	Grewia pubescens
3	Harungana madagascariensis
3	Hibiscus acetosella
3	Holarrhena floribunda
3	Macaranga barteri
3	Mitragyna inermis
3	Murraya Koenigii
3	Myriantus arboreus
3	Nerium oleander
3	Nesogordonia papaverifera
3	Pseudocedrela kotschyi
3	Stachytarpheta indica
3	Urena lobata
3	Zanthoxylum leprieuri
4	Abelmoschus esculentus
5	Abelmoschus esculentus
5	Bombax buonopozense
5	Caesalpinia pulcherima
5	Ceiba pentandra
5	Chenopodium ambrosioides
5	Citrus paradisi
5	Cocos nucifera
5	Ficus capensis
5	Glycyrrhiza glabra
5	Grewia pubescens
5	Ricinodendron heudelotii
5	Ricinus communis
5	Sida rhombifolia
5	Terminalia catappa
5	Trigonelia Foenu-graceum
5	Urena lobata
5	Vernonia cinerea
6	Abrus precatorius
6	Microglossa pyrifolia
6	Pistia stratiotes
6	Xylopia acutiflora
6	Zanthoxylum leprieuri
7	Adenia venenata
7	Allium cepa
7	Amaralia bignoniflora
7	Bacopo monnifera
7	Bryophyllum pinnatum
7	Canthium glabriflorum
7	Citrus aurantium
7	Clappertonia ficifolia
7	Clausena anisata
7	Cleistopholis paterns
7	Costus afer
7	Cyrtosperma senegalense
7	Dalbergia saxatilis
7	Deinbollia pinnata
7	Dichapetalum baneri
7	Drypetes chevalieri
7	Eleusine indica
7	Euphorbia hirta
7	Hibiscus asper
7	Hyptis suaveloensis
7	Mikania cordata
7	Mukia maderaspatana
7	Nauclea latifolia
7	Ocimum gratissimum
7	Oncoba spinosa
7	Pupalia lappacea
7	Scleria depressa
7	Senna arabica
7	Solanum torvum
7	Sphenocentrum jollyanum
7	Spondias mombin
7	Terminalia glaucescens
7	Thonningia sanguinea
7	Trephrosia purpurea
7	Trichilia emotica
7	Trichilia monadelpha
7	Uapaca guineensis
7	Uncaria talbotii
7	Vitex doniana
7	Waltheria indica
7	Ziziphus mauritiana
7	Ziziphus spina-christi
7	Abrus precatorius
7	Abutilon mauritianum
7	Acanthospermum hispidum
7	Acanthus montanus
7	Adenia cissampeloides
7	Aframomum melegueta
7	Albizia adianthifolia
7	Alchornea cordifolia
7	Allium sativum
7	Allophylus africanus
7	Ananas comosus
7	Annona senegalensis
7	Anonidium Manni
7	Antrocaryon micraster
7	Apium graveolens
7	Basilicum polysiachyon
7	Bidens pilosa
7	Boerhaavia diffusa
7	Butea frondosa
7	Calotropis procera
7	Cannabis sativa
7	Capparis thonningii
7	Citrus aurantifolia
7	Combretum mucronatum
7	Commiphora africana
7	Cordia millenii
7	Courbonia virgata
7	Crinum glaucum
7	Crinum jagus
7	Curculigo pilosa
7	Cymbopogon citratus
7	Datura stramonium
7	Dennettia tripetala
7	Dialium guineense
7	Dicoma sessiliflora
7	Dioscorea bulbifera
7	Dissotis rotundifolia
7	Eclipta prostrata
7	Elephantapus scaber
7	Elytraria marginata
7	Emilia coccinea
7	Entandrophragma cylindricum
7	Ficus asperifolia
7	Garcinia kola
7	Gardenia ternifolia
7	Gmelina arborea
7	Gomphrena globosa
7	Hedranthera barteri
7	Hibiscus rosasinensis
7	Hibiscus sabdariffa
7	Hymenostegia afzelii
7	Indigofera macrophylla
7	Isolana campanulata
7	Isolona campanulata
7	Kalanchoe crenata
7	Kigelia africana
7	Landolphia dulcis
7	Lecaniodiscus cupanioides
7	Lippia multiflora
7	Lophira alata
7	Lovoa trichilioides
7	Ludwigia suffruticosa
7	Macaranga barteri
7	Mangifera indica
7	Manniophytum fuluum
7	Mareya spicata
7	Massularia acuminata
7	Melanthera scadens
7	Mesua Ferrea
7	Microglossa abzelii
7	Millettia thonningii
7	Mitragyna stipulosa
7	Mollugo nudicaulis
7	Moringa oleifera
7	Musanga cecropioides
7	Myriantus arboreus
7	Napoleona imperialis
7	Napoleona vogelii
7	Nerium oleander
7	Newbouldia laevis
7	Ocimum basilicum
7	Olyra latifolia
7	Opuntia dillenii
7	Palisota hirsuta
7	Parinari curatellaefolia
7	Parinari macrophylla
7	Passiflora foetida
7	Pergularia daemia
7	Petiveria alliacea
7	Phoenix dactylifera
7	Phyllanthus muellerianus
7	Piliostigma reticulatum
7	Psidium guajava
7	Psychotria guineensis
7	Pycnanthus angolensis
7	Schwenkia americana
7	Scoparia dulcis
7	Secamone afzelii
7	Senecio biafrae
7	Stachytarpheta indica
7	Teclea verdromiona
7	Tephrosia densiflora
7	Terminalia catappa
7	Terminalia schimperiana
7	Tetrapleura tetraptera
7	Thunbergia battescombei
7	Tiliacora funifera
7	Treculia africana
7	Trema orientalis
7	Turrea vogelii
7	Uncaria africana
7	Uvaria afzelii
7	Vernonia cinerea
7	Vernonia oocephala
7	Xylopica aethiopica
7	Zanthoxylum leprieuri
7	Zanthoxylum rubenscens
7	Zanthoxylum zanthoxyloides
7	Zea mays
7	Zingiber officinale
7	Aloe schweinfurthi
8	Allium ascalonicum
8	Gossypium barbadense
8	Hedranthera barteri
8	Heliotropium indicum
8	Ipomoea involucrata
8	Lonchocarpus sericeus
8	Peperomia pellucida
8	Solanum nigrum
8	Solenostemon monostachyus
8	Telfaria occidentalis
8	Treculia africana
8	Wissadula amplissima
8	Abrus precatorius
8	Brillantaisia patula
8	Caladium bicolor
8	Calliandra portoricensis
8	Calotropis procera
8	Carica papaya
8	Cleome ciliata
8	Croton lobatus
8	Datura metel
8	Desmodium adscendens
8	Eclipta prostrata
8	Ehretia cymosa
8	Entada gigas
8	Jatropha curcas
8	Kalanchoe crenata
8	Laggera alata
8	Laggera aurita
8	Mammea africana
8	Mimosa pigra
8	Momordica charantia
8	Newbouldia laevis
8	Nicotiana tabacum
8	Ocimum gratissimum
8	Pancratium trianthum
8	Psorospermum febrifugum
8	Securidaca longepedunculata
8	Senna occidentalis
8	Spigelia anthelmia
8	Sterculia tragacantha
8	Trema orientalis
9	Adhatoda buchhoizii
9	Carpolobia lutea
9	Cleome gynandra
9	Ekebergia  senegalensis
9	Icacina tricantha
9	Ipomoea mauritiana
9	Landolphia dulcis
9	Pergularia daemia
9	Piper umbellatum
9	Tetracera alnifolia
9	Abrus precatorius
9	Acalypha fimbriata
9	Acanthospermum hispidum
9	Aframomum melegueta
9	Alchornea cordifolia
9	Anonidium Manni
9	Barleria opaca
9	Cardiospermum halicacabum  .
9	Chenopodium ambrosioides
9	Chrozophora senegalensis
9	Clerodendrum paniculatum
9	Coffea arabica
9	Colocasia esculenta
9	Crinum jagus
9	Cryptolepia sanguinolenta
9	Cyathula prostrata
9	Dichapetalum baneri
9	Dioscorea bulbifera
9	Gloriosa superba
9	Guibourtia copallifera
9	Isolana campanulata
9	Kalanchoe crenata
9	Kigelia africana
9	Melicia excelsa
9	Nauclea diderrichii
9	Piliostigma reticulatum
9	Piper guineense
9	Plumbago zeylanica
9	Rauwolfia caffra
9	Rhaphiostylis beninensis
9	Sabicea calycina
9	Salvadora persica
9	Senecio abyssinicus
9	Sida cordifolia
9	Strophanthus hispidus
9	Tetrapleura tetraptera
9	Trianthema portulacastrum
9	Vitex doniana
9	Xeromorphus nilotica
9	Zingiber officinale
10	Agelenopsis chevaleri
10	Jubernardia seretii
10	Teclea verdromiona
10	Abrus precatorius
10	Coix lacryma-jobi
10	Hoslundia  opposita
10	Mikania cordata
10	Petroselinum crispum
10	Scoparia dulcis
10	Ximenia americana
10	Ziziphus mauritiana
11	Abrus precatorius
11	Citrullus colocynthis
11	Ehretia cymosa
11	Gossypium barbadense
11	Zanthoxylum zanthoxyloides
12	Acalypha godseffiana
12	Allamanda cathartica
12	Asparagus africana
12	Buchholzia coriacea
12	Calliandra haematocephala
12	Citrullus colocynthis
12	Citrus paradisi
12	Garcinia kola
12	Leptadenia hastata
12	Tecoma stans
12	Abrus precatorius
12	Acalypha wilkesiana
12	Alchornea cordifolia
12	Allium sativum
12	Alternanthera repens
12	Arachis hypogea
12	Cassytha filiformis
12	Citrus aurantifolia
12	Cochlospermun tinctorium
12	Combretum mucronatum
12	Curcuma longa
12	Dioscorea bulbifera
12	Diospyros canaliculata
12	Dissotis rotundifolia
12	Dorstenia prorepens
12	Dracaena manni
12	Enantia chlorantha
12	Ipomoea batatas
12	Mangifera indica
12	Momordica charantia
12	Ocimum gratissimum
12	Phyllanthus muellerianus
12	Piper guineense
12	Senna occidentalis
12	Vernonia amygdalina
12	Zanthoxylum zanthoxyloides
13	Apium graveolens
13	Eulophia millsoni
13	Massularia acuminata
13	Ritchiea brachypoda
13	Tacca involucrata
13	Abrus precatorius
13	Adenia venenata
13	Areca catechu
13	Argyreia nervosa
13	Boscia senegalensis
13	Capparis thonningii
13	Carpolobia lutea
13	Celastrus senegalensis
13	Corynanthe johimbe
13	Corynanthe pachyceras
13	Craterispermum laurinum
13	Curculigo pilosa
13	Datura stramonium
13	Deinbollia pinnata
13	Dicoma sessiliflora
13	Euadenia trifoliata
13	Euphorbia hirta
13	Garcinia afzelii
13	Griffonia simplicifolia
13	Heeria insignis
13	Icacina tricantha
13	Jateorhiza macrantha
13	Mansonia altissima
13	Momordica charantia
13	Paullinia pinnata
13	Phaulopsis falcisepala
13	Pseudocedrela kotschyi
13	Quisqualis indica
13	Rhigiocarya racemifera
13	Saba florida
13	Securidaca longepedunculata
13	Securinega virosa
13	Sphenocentrum jollyanum
13	Tabernaemontana pachysiphon
13	Tetracera alnifolia
13	Tribulus terrestris
13	Turrea vogelii
13	Uapaca guineensis
13	Uraria picta
13	Vernonia oocephala
13	Withania somnifera
13	Aloe schweinfurthi
14	Aerva lanata
14	Calendula officinalis
14	Emilia coccinea
14	Eryngium foetidum
14	Rytigynia rubra
14	Abrus precatorius
14	Acalypha fimbriata
14	Ageratum conyzoides
14	Amaranthus spinosus
14	Annona squamosa
14	Blumea perrottetiana
14	Brysocarpus coccineus
14	Buchholzia coriacea
14	Caladium bicolor
14	Calophyllum inophyllum
14	Centaurea perrottetii
14	Citrus aurantifolia
14	Clitoria ternatea
14	Cyrtosperma senegalense
14	Detaruyn nucricaroyn
14	Dissotis rotundifolia
14	Enantia chlorantha
14	Gossypium barbadense
14	Indigofera macrophylla
14	Jateorhiza macrantha
14	Lawsonia inermis
14	Manihot esculenta
14	Mitracarpus scaber
14	Nicotiana tabacum
14	Piliostigma reticulatum
14	Psorospermum febrifugum
14	Punica granatum
14	Quisqualis indica
14	Sesamum indicum
14	Sida acuta
14	Spathodea campanulata
14	Sterculia setigera
14	Terminalia catappa
14	Terminalia schimperiana
14	Treculia africana
14	Trichilia heudelotii
14	Trichilia monadelpha
14	Trichodesma africanum
14	Wood fordia uniflora
14	Ximenia americana
15	Annona squamosa
15	Colocasia esculenta
15	Palisota hirsuta
15	Trichilia monadelpha
15	Abrus precatorius
15	Acanthus montanus
15	Aframomum melegueta
15	Alafia barteri
15	Khaya ivorensis
15	Monodora myristica
15	Musa paradisiaca
15	Pleioceras barteri
15	Securinega virosa
15	Strycnos nux-vomica
15	Talinum triangulare
15	Treculia africana
15	Trianthema portulacastrum
15	Trichilia heudelotii
15	Triclisia subcordata
15	Vernonia colorata
15	Viscum album
15	Zanthoxylum zanthoxyloides
16	Abrus precatorius
17	Abutilon mauritianum
17	Allophylus africanus
17	Anonidium Manni
17	Bidens pilosa
17	Bosqueia anglosensis
17	Brillantaisia nitens
17	Calapogonium mucunoides
17	Calotropis procera
17	Cannabis sativa
17	Chrysobalanus ellipticus
17	Cola nitida
17	Cylicodiscus gabonensis
17	Entada gigas
17	Evolvulus alsinoides
17	Ficus elegans
17	Glyphaea brevis
17	Indigofera arrecta
17	Microdesmis puberula
17	Musa paradisiaca
17	Sansevieria liberica
17	Securinega virosa
17	Sida pilosa
17	Sida rhombifolia
17	Terminalia schimperiana
17	Achyranthes aspera
17	Adansonia digitata
17	Ageratum conyzoides
17	Amaranthus spinosus
17	Bacopo monnifera
17	Brillantaisia patula
17	Bryophyllum pinnatum
17	Celosia argentea
17	Conyza canadensis
17	Corchorus olitorus
17	Croton zambesicus
17	Daniellia oliveri
17	Dioscorea bulbifera
17	Diospyros mespliforimis
17	Eclipta prostrata
17	Elaeis guineensis
17	Ficus vogelii
17	Gladiolus psittacinus
17	Gnidia kraussiana
17	Grewia venusta
17	Guiera senegalensis
17	Haematostaphis barteri
17	Haematoxylum compechionum
17	Mangifera indica
17	Matricaria recutita
17	Moringa oleifera
17	Murraya Koenigii
17	Musa sapientum
17	Nelsonia compestria
17	Pergularia daemia
17	Physalis angulata
17	Piper nigrum
17	Pupalia lappacea
17	Strycnos nux-vomica
17	Syzygium guineense
17	Tamarindus indica
17	Tetracera alnifolia
17	Uncaria africana
17	Uncaria talbotii
17	Vitex doniana
19	Croton zambesicus
19	Terminalia macroptera
19	Abutilon mauritianum
19	Achillea millefolium
19	Albizia adianthifolia
19	Amorphophallus dracantioides
19	Asystasia gangetica
19	Cardiospermum halicacabum  .
19	Centella asiatica
19	Ficus elegans
19	Fluerya aestuans
19	Funtumia elastica
19	Harungana madagascariensis
19	Hymenostegia afzelii
19	Indigofera macrophylla
19	Mimosa pudica
19	Momordica charantia
19	Nauclea diderrichii
19	Nauclea latifolia
19	Ocimum gratissimum
19	Pergularia daemia
19	Piper nigrum
19	Senna sieberiana
19	Sesamum indicum
19	Sida cordifolia
19	Zingiber officinale
20	Rabdia nilotica
20	Acacia ataxacantha
20	Commelina diffusa
20	Fagara rubescens
20	Premna quadrifolia
20	Tetracera alnifolia
20	Tridax procumbens
21	Acacia auriculiformis
21	Albizia lebbeck
21	Alternanthera sessilis
21	Chrozophora senegalensis
21	Desmodium gangeticum
21	Entada africana
21	Haematoxylum compechionum
21	Hymenostegia afzelii
21	Mussaenda elegans
21	Punica granatum
21	Schlerocarya birrea
21	Senna fistula
21	Tiliacora funifera
21	Vernonia guineensis
21	Wood fordia uniflora
21	Acacia sieberiana
21	Achillea millefolium
21	Alstonia congensis
21	Amaranthus spinosus
21	Annona senegalensis
21	Artocarpus altilis
21	Asystasia gangetica
21	Bauhinia variegata
21	Bixa orellana
21	Borreria ocymoides
21	Burkea africana
21	Butea frondosa
21	Caesalpinia cristata
21	Cajanus cajan
21	Calendula officinalis
21	Calophyllum inophyllum
21	Ceiba pentandra
21	Celosia trigyna
21	Cinnamomum Zeyianiam
21	Citrus paradisi
21	Clerodendrum volubile
21	Commiphora africana
21	Corchorus olitorus
21	Cordia millenii
21	Cosmos sulphureus
21	Curculigo pilosa
21	Cuscuta australis
21	Cynodon dactylon
21	Cyrtosperma senegalense
21	Dacryodes edulis
21	Daniellia oliveri
21	Datura stramonium
21	Delonix regia
21	Dialium guineense
21	Dichrostachys cinerea
21	Diospyros mespliforimis
21	Entada gigas
21	Ficus capensis
21	Ficus vallis-choudae
21	Flacourtia flavescens
21	Fluerya aestuans
21	Gomphrena globosa
21	Holarrhena floribunda
21	Kigelia africana
21	Laggera aurita
21	Lannea nigritana
21	Lawsonia inermis
21	Mallotus oppositifolius
21	Mangifera indica
21	Mimusops kummel
21	Nymphaea lotus
21	Opuntia dillenii
21	Parinari macrophylla
21	Parkia biglobosa
21	Paullinia pinnata
21	Polygala arenaria
21	Portulaca oleracea
21	Psorospermum febrifugum
21	Pterocarpus santalinioides
21	Securinega virosa
21	Sida acuta
21	Sterculia tragacantha
21	Struchium sparganophora
21	Tamarindus indica
21	Tectona grandis
21	Terminalia catappa
21	Terminalia glaucescens
21	Thespesia populnea
21	Trephrosia purpurea
21	Trigonelia Foenu-graceum
21	Tylophora dahomensis
21	Urtica dioica
21	Vernonia colorata
21	Warburgia ugandensis
21	Ziziphus mauritiana
21	Ziziphus spina-christi
21	Aloe schweinfurthi
22	Andira inermis
22	Anthocleista djalonensis
22	Asystasia calyciana
22	Bauhinia variegata
22	Boerhaavia diffusa
22	Celosia argentea
22	Centella asiatica
22	Centrosema pubescens
22	Dracaena manni
22	Euphorbia heterophylla
22	Gnidia kraussiana
22	Mareya spicata
22	Pleioceras barteri
22	Senna alata
22	Terminalia avicennioides
22	Tithonia diversifolia
22	Achyranthes aspera
22	Adansonia digitata
22	Afraegle paniculata
22	Ageratum conyzoides
22	Allium cepa
22	Aloe vera
22	Anogeissus leiocarpus
22	Argemone mexicana
22	Aristolochia ringens
22	Balanites aegyptiaca
22	Baphia nitida
22	Bixa orellana
22	Borreria verticillata
22	Brassica oleracea var capitata
22	Chromolaena odorata
22	Cissampelos owariensis
22	Coula edulis
22	Croton lobatus
22	Curcuma longa
22	Dacryodes edulis
22	Eclipta prostrata
22	Elaeophorbia drupifera
22	Embelia guineaasis
22	Erythrophleum suaveolens
22	Euphorbia unispina
22	Harrisonia abyssinica
22	Hilleria latifolia
22	Hoslundia  opposita
22	Indigofera macrophylla
22	Isolana campanulata
22	Justicia flava
22	Khaya ivorensis
22	Klainedoxa gabonensis
22	Lannea nigritana
22	Lawsonia inermis
22	Leonotis nepetifolia
22	Lonchocarpus sericeus
22	Mammea africana
22	Melia azedarach
22	Mitragyna stipulosa
22	Monodora tenuifolia
22	Mucuna sloanei
22	Nerium oleander
22	Parquetina nigrescens
22	Pergularia daemia
22	Phaseolus vulgaris
22	Phyllanthus muellerianus
22	Portulaca oleracea
22	Psorospermum febrifugum
22	Pterocarpus santalinioides
22	Pupalia lappacea
22	Schlerocarya birrea
22	Senecio abyssinicus
22	Senna arabica
22	Senna obtusifolia
22	Smilax kraussiana
22	Solanum nigrum
22	Tectona grandis
22	Tephrosia densiflora
22	Tetracera alnifolia
22	Thespesia populnea
22	Tragia benthani
22	Trephrosia purpurea
22	Tylophora dahomensis
22	Uvaria afzelii
22	Vernonia cinerea
22	Vernonia colorata
22	Ximenia americana
23	Acacia sieberiana
23	Garcinia kola
23	Morinda lucida
24	Acacia sieberiana
24	Asparagus africana
24	Bixa orellana
24	Landolphia dulcis
24	Mimosa pudica
24	Urtica dioica
25	Acalypha fimbriata
25	Acanthus montanus
25	Ambrosia maritima
25	Senecio abyssinicus
25	Adenia venenata
25	Azadirachta indica
25	Bauhinia variegata
25	Carica papaya
25	Ceiba pentandra
25	Centaurea perrottetii
25	Desmodium adscendens
25	Emilia coccinea
25	Guiera senegalensis
25	Hibiscus rosasinensis
25	Ipomoea asarifolia
25	Mammea africana
25	Pupalia lappacea
25	Smilax kraussiana
25	Stachytarpheta indica
25	Tabernaemontana pachysiphon
25	Terminalia glaucescens
25	Terminalia schimperiana
25	Tetracarpidium conophorum
25	Tylophora dahomensis
26	Amorphophallus dracantioides
26	Canna indica
26	Datura stramonium
26	Dioclea reflexa
26	Flacourtia flavescens
26	Leersia hexrandra
26	Napoleona imperialis
26	Pterocarpus osun
26	Acalypha fimbriata
26	Adansonia digitata
26	Allium sativum
26	Axonopus compressus
26	Boerhaavia diffusa
26	Borassus aethiopum
26	Caesalpinia cristata
26	Calotropis procera
26	Ceiba pentandra
26	Celastrus indica
26	Clausena anisata
26	Coix lacryma-jobi
26	Conyza sumatrensis
26	Corchorus olitorus
26	Deinbollia pinnata
26	Desmodium adscendens
26	Dichapetalum toxicarium
26	Dissotis rotundifolia
26	Drypetes chevalieri
26	Elaeis guineensis
26	Elaeophorbia drupifera
26	Euphorbia hirta
26	Evolvulus alsinoides
26	Gossypium barbadense
26	Hibiscus rosasinensis
26	Ipomoea batatas
26	Ipomoea involucrata
26	Ipomoea mauritiana
26	Kalanchoe crenata
26	Lannea nigritana
26	Mangifera indica
26	Morinda morindioides
26	Moringa oleifera
26	Opuntia dillenii
26	Petroselinum crispum
26	Phoenix dactylifera
26	Phyllanthus amarus
26	Physalis angulata
26	Sansevieria liberica
26	Senna arabica
26	Sida cordifolia
26	Tetrapleura tetraptera
26	Trephrosia purpurea
26	Trianthema portulacastrum
26	Urginea altissima
26	Zingiber officinale
27	Acalypha hispida
27	Acalypha wilkesiana
27	Pistia stratiotes
27	Bambusa vulgaris
28	Acalypha wilkesiana
28	Allium sativum
28	Baphia nitida
28	Crassocephalum crepidioides
28	Melaleuca leucadendron
28	Morinda lucida
28	Mukia maderaspatana
28	Ricinus communis
29	Acalypha wilkesiana
29	Albizia ferruginea
29	Dioscorea bulbifera
29	Euphorbia laterifolia
29	Ficus elegans
29	Gladiolus psittacinus
29	Lactuca capensis
29	Morinda morindioides
29	Ocimum basilicum
29	Senna sieberiana
29	Sesamum indicum
29	Terminalia ivorensis
29	Baphia nitida
29	Croton penduliflorus
29	Desmodium adscendens
29	Funtumia africana
29	Mansonia altissima
29	Monodora myristica
29	Strycnos nux-vomica
29	Xylopia quintasii
30	Acanthospermum hispidum
30	Alstonia boonei
30	Anthonotha macrophylla
30	Curcuma longa
30	Ipomoea involucrata
30	Microglossa pyrifolia
30	Newbouldia laevis
30	Rabdia nilotica
30	Tithonia diversifolia
30	Uvaria chamae
30	Ziziphus mauritiana
30	Ziziphus spina-christi
30	Commelina diffusa
30	Lovoa trichilioides
30	Meptunia oleracea
30	Nelsonia compestria
30	Olax subscorpioidea
30	Schwenkia americana
31	Euadenia trifoliata
31	Microglossa abzelii
31	Acanthospermum hispidum
31	Aspilia africana
31	Cleistopholis paterns
31	Conyza sumatrensis
31	Crinum jagus
31	Solenostemon monostachyus
31	Tiliacora funifera
31	Zanthoxylum zanthoxyloides
32	Achyranthes aspera
32	Ficus exasperata
32	Pachira glabra
32	Acanthospermum hispidum
32	Afzelia africana
32	Aspilia africana
32	Calliandra portoricensis
32	Canarium schweinfurthii
32	Coula edulis
32	Gmelina arborea
32	Justicia flava
32	Nauclea latifolia
33	Sesamum indicum
33	Acanthospermum hispidum
33	Blighia sapida
33	Bridelia micrantha
33	Caloncoba glauca
33	Calophyllum inophyllum
33	Cannabis sativa
33	Cnestis ferruginea
33	Cocos nucifera
33	Newbouldia laevis
33	Strictocardia beraviensis
34	Acanthus montanus
34	Asystasia gangetica
34	Hilleria latifolia
36	Aframomum granum-paradisi
36	Amaranthus viridis
36	Antidesma venosum
36	Balanites aegyptiaca
36	Cassytha filiformis
36	Celosia trigyna
36	Chenopodium ambrosioides
36	Clerodendrum capitalum
36	Erythrina senegalensis
36	Greenwayodendron suaveolens
36	Olyra latifolia
36	Opilia celtidifolia
36	Ruellia tuberosa
36	Vernonia cinerea
36	Acalypha fimbriata
36	Acanthus montanus
36	Aframomum melegueta
36	Albizia adianthifolia
36	Allium cepa
36	Allophylus africanus
36	Alstonia boonei
36	Anacardium occidentale
36	Ananas comosus
36	Andira inermis
36	Apium graveolens
36	Aristolochia ringens
36	Azadirachta indica
36	Blumea perrottetiana
36	Caesalpinia bonduc
36	Celastrus indica
36	Chrozophora senegalensis
36	Cinchona officinalis
36	Citrullus colocynthis
36	Citrus aurantifolia
36	Citrus aurantium
36	Citrus sinensis
36	Clausena anisata
36	Cleistopholis paterns
36	Clerodendrum paniculatum
36	Crinum jagus
36	Cucurbita pepo
36	Cyperus esculentus
36	Dacryodes edulis
36	Delonix regia
36	Dichrostachys cinerea
36	Dioscorea bulbifera
36	Diospyros canaliculata
36	Eleusine indica
36	Euphorbia kamerunica
36	Euphorbia laterifolia
36	Harrisonia abyssinica
36	Hedranthera barteri
36	Holarrhena floribunda
36	Icacina tricantha
36	Kalanchoe crenata
36	Lagenaria breviflorus
36	Lonchocarpus cyanescens
36	Ludwigia suffruticosa
36	Mangifera indica
36	Mikania cordata
36	Mitragyna stipulosa
36	Musa paradisiaca
36	Myriantus arboreus
36	Nerium oleander
36	Ocimum basilicum
36	Ocimum gratissimum
36	Parinari curatellaefolia
36	Pentaclethra macrophylla
36	Petiveria alliacea
36	Picralima nitida
36	Psorospermum febrifugum
36	Rauvolfia vomitoria
36	Senna sieberiana
36	Stachytarpheta angustifolia
36	Sterculia tragacantha
36	Tetracarpidium conophorum
36	Uapaca guineensis
36	Vernonia colorata
36	Zingiber officinale
36	Ziziphus mauritiana
36	Aloe schweinfurthi
37	Achillea millefolium
37	Aspilia africana
37	Melanthera scadens
37	Achyranthes aspera
37	Cajanus cajan
37	Chromolaena odorata
37	Conyza canadensis
37	Cynodon dactylon
37	Dissotis rotundifolia
37	Enantia chlorantha
37	Fluerya aestuans
37	Harungana madagascariensis
37	Hoslundia  opposita
37	Mallotus oppositifolius
37	Musa paradisiaca
37	Oldelandia corymbosa
37	Paullinia pinnata
37	Senna occidentalis
37	Setaria megaphylla
37	Terminalia macroptera
37	Tridax procumbens
37	Vernonia amygdalina
38	Adenium Obesum
38	Ageratum conyzoides
38	Cephaelis manni
38	Clerodendrum umbellatum
38	Combretum mucronatum
38	Detaruyn nucricaroyn
38	Ficus asperifolia
38	Ficus thonningii
38	Ficus vogelii
38	Flabellaria paniculata
38	Galinsoga parviflora
38	Gisekia pharmacioides
38	Leonotis nepetifolia
38	Mirabilis jalapa
38	Phaulopsis falcisepala
38	Senecio biafrae
38	Trichilia heudelotii
38	Achillea millefolium
38	Aerva lanata
38	Aframomum melegueta
38	Aloe vera
38	Boscia senegalensis
38	Bryophyllum pinnatum
38	Caladium bicolor
38	Chrysanthemum cinerariae folium
38	Cleome ciliata
38	Colocasia esculenta
38	Cosmos sulphureus
38	Cynodon dactylon
38	Dacryodes edulis
38	Dorstenia prorepens
38	Eichhornia crassipes
38	Erythrophleum suaveolens
38	Eucalyptus globulus
38	Funtumia africana
38	Glyphaea brevis
38	Grewia venusta
38	Hibiscus asper
38	Hibiscus sabdariffa
38	Hyptis suaveloensis
38	Icacina tricantha
38	Ipomoea batatas
38	Jasminum pauciflonum
38	Jateorhiza macrantha
38	Kalanchoe crenata
38	Ludwigia suffruticosa
38	Mariscus alternifolius
38	Microdesmis puberula
38	Mitracarpus scaber
38	Monodora myristica
38	Mukia maderaspatana
38	Musa paradisiaca
38	Oncoba spinosa
38	Parkia biglobosa
38	Penianthus zenicem
38	Peperomia pellucida
38	Polygala arenaria
38	Rytigynia rubra
38	Sida pilosa
38	Sida rhombifolia
38	Sphenocentrum jollyanum
38	Trianthema portulacastrum
38	Vernonia biafrae
38	Wood fordia uniflora
38	Xylopia quintasii
39	Achyranthes aspera
39	Adansonia digitata
39	Allanblackia floribunda
39	Allium sativum
39	Alstonia congensis
39	Anacardium occidentale
39	Axonopus compressus
39	Azadirachta indica
39	Bixa orellana
39	Blighia sapida
39	Boscia senegalensis
39	Canna indica
39	Cinchona officinalis
39	Cymbopogon citratus
39	Elaeis guineensis
39	Jussiaea linifoliio
39	Hoslundia  opposita
39	Khaya ivorensis
39	Laggera aurita
39	Landolphia owariensis
39	Lycopodium cernuum
39	Mallotus cordifolia
39	Mangifera indica
39	Morinda lucida
39	Parinari macrophylla
39	Rungia grandis
39	Senna podocarpa
39	Sida acuta
39	Sorghum bicolor
39	Tetrapleura tetraptera
39	Tithonia diversifolia
39	Triumfeta cordifolia
39	Vernonia biafrae
39	Aframomum melegueta
39	Allamanda cathartica
39	Alstonia boonei
39	Blumea perrottetiana
39	Capsicum frutescens
39	Carica papaya
39	Celastrus indica
39	Centaurea perrottetii
39	Chromolaena odorata
39	Citrullus lanatus
39	Citrus aurantium
39	Citrus paradisi
39	Clausena anisata
39	Clerodendrum paniculatum
39	Cola acuminata
39	Costus afer
39	Craterispermum laurinum
39	Curcuma longa
39	Dacryodes edulis
39	Dichapetalum toxicarium
39	Dioscorea dumetorum
39	Ekebergia  senegalensis
39	Ekebergia capensis
39	Enantia chlorantha
39	Entada africana
39	Hexalobus crispiflorus.
39	Hyptis suaveloensis
39	Jatropha gossypiifolia
39	Justicia flava
39	Kigelia africana
39	Lawsonia inermis
39	Lecaniodiscus cupanioides
39	Markhamia tomentosa
39	Melicia excelsa
39	Mikania cordata
39	Mondia whitei
39	Musa paradisiaca
39	Musa sapientum
39	Nauclea diderrichii
39	Newbouldia laevis
39	Parkia biglobosa
39	Paullinia pinnata
39	Persea americana
39	Physalis angulata
39	Picralima nitida
39	Psidium guajava
39	Pyrenacantha staudtii
39	Rauvolfia vomitoria
39	Schlerocarya birrea
39	Smilax kraussiana
39	Solanum nigrum
39	Sphenocentrum jollyanum
39	Stachytarpheta indica
39	Sterculia tragacantha
39	Tecoma stans
39	Treculia africana
39	Trema orientalis
39	Triclisia subcordata
39	Vernonia amygdalina
39	Vernonia guineensis
39	Vernonia oocephala
39	Waltheria indica
39	Zanthoxylum leprieuri
39	Zingiber officinale
41	Cissus quadrangularis
41	Euphorbia balsamifera
41	Adansonia digitata
41	Anacardium occidentale
41	Bidens pilosa
41	Cola laurifolia
41	Dracaena manni
41	Mollugo oppositifolius
41	Zanthoxylum leprieuri
42	Adenia venenata
42	Ambrosia maritima
42	Butyrospermum paradoxum
42	Catharanthus roseus
42	Citrullus lanatus
42	Erythrophleum suaveolens
42	Euphorbia hirta
42	Gossypium barbadense
42	Hibiscus rosasinensis
42	Ocimum basilicum
42	Ocimum gratissimum
42	Peperomia pellucida
42	Phyllanthus amarus
42	Picralima nitida
42	Piper guineense
42	Senna occidentalis
42	Sesamum indicum
42	Viscum album
42	Voacanga africana
42	Adenia cissampeloides
42	Corynanthe johimbe
42	Hannoa klaineana
42	Jateorhiza Palmate
42	Lippia multiflora
42	Passiflora foetida
42	Persea americana
42	Rauvolfia vomitoria
42	Stachytarpheta angustifolia
42	Viscum flavescens
43	Adenia venenata
43	Bacopo monnifera
43	Clausena anisata
43	Cocos nucifera
43	Commiphora africana
43	Dialium guineense
43	Drypetes chevalieri
43	Evolvulus alsinoides
43	Flacourtia flavescens
43	Garcinia kola
43	Glycyrrhiza glabra
43	Indigofera macrophylla
43	Leersia hexrandra
43	Manniophytum fuluum
43	Mikania cordata
43	Ocimum gratissimum
43	Petersianthus macrocarpus
43	Punica granatum
43	Ruellia tuberosa
43	Senna alata
43	Senna arabica
43	Thonningia sanguinea
43	Trema orientalis
43	Trephrosia purpurea
43	Urginea altissima
43	Xylopia quintasii
43	Xylopica aethiopica
44	Adenia cissampeloides
45	Adenia cissampeloides
45	Antiaris africana
45	Argyreia nervosa
45	Aspilia africana
45	Cardiospermum halicacabum  .
45	Momordica charantia
45	Oldelandia corymbosa
45	Parinari curatellaefolia
45	Rauvolfia vomitoria
46	Barleria opaca
47	Adenia venenata
48	Adenium Obesum
48	Xylopia quintasii
49	Aerva lanata
49	Anthocleista vogelii
49	Asystasia gangetica
49	Cnestis ferruginea
49	Erythrophleum suaveolens
49	Euphorbia unispina
49	Grewia pubescens
49	Gymnema sylvestre
49	Jateorhiza macrantha
49	Sansevieria liberica
49	Tetracarpidium conophorum
49	Aloe schweinfurthi
50	Aerva lanata
50	Azadirachta indica
50	Citrus aurantium
50	Cnestis ferruginea
50	Dodonaea viscosa
50	Oncoba spinosa
50	Paullinia pinnata
50	Punica granatum
50	Sesbania grandiflora
50	Spondias mombin
50	Terminalia schimperiana
52	Aerva lanata
55	Aframomum melegueta
55	Alafia barteri
55	Alchornea cordifolia
55	Allanblackia floribunda
55	Allophylus africanus
55	Alstonia congensis
55	Annona senegalensis
55	Aulacocalyx jasminiflora
55	Carpolobia lutea
55	Casearia barteri
55	Chromolaena odorata
55	Citrus aurantifolia
55	Citrus sinensis
55	Clausena anisata
55	Cleidon gaponicum
55	Cocos nucifera
55	Cordia millenii
55	Dalbergia saxatilis
55	Daniellia oliveri
55	Dennettia tripetala
55	Dialium guineense
55	Dichrostachys cinerea
55	Drypetes Florabunda
55	Eruatamia coronaria
55	Eugenia aromatica
55	Fagara rubescens
55	Flacourtia flavescens
55	Garcinia afzelii
55	Garcinia kola
55	Glyphaea brevis
55	Hymenostegia afzelii
55	Icacina tricantha
55	Ipomoea fistulosa
55	Jasminum pauciflonum
55	Klainedoxa gabonensis
55	Leea guineensis
55	Manihot esculenta
55	Meerua crassifolia
55	Microglossa pyrifolia
55	Monodora tenuifolia
55	Mukia maderaspatana
55	Napoleona imperialis
55	Nephrolepsis bisserata
55	Nesogordonia papaverifera
55	Olax subscorpioidea
55	Oxyanthus tubiflorus
55	Palisota hirsuta
55	Paropsia guineansis
55	Piper nigrum
55	Piptadeniastrum africanum
55	Pycnanthus angolensis
55	Rhaphiostylis beninensis
55	Ricinus communis
55	Samanea dinklagei
55	Saphaeranthus senegalensis
55	Schrobera arborea
55	Securidaca longepedunculata
55	Smeathmannia pubescens
55	Sorindeia mildbraedii
55	Spondias mombin
55	Sterospermum acuminatissimum
55	Tectona grandis
55	Tetracarpidium conophorum
55	Tetrochidium didymostemon
55	Theobroma cacao
55	Uncaria talbotii
55	Vernonia amygdalina
55	Vernonia guineensis
55	Voacanga africana
55	Waltheria indica
55	Warburgia ugandensis
55	Ximenia americana
55	Zanthoxylum leprieuri
55	Zanthoxylum rubenscens
56	Aframomum sceptrum
56	Afzelia africana
56	Antiaris africana
56	Calliandra portoricensis
56	Clausena anisata
56	Cymbopogon citratus
56	Datura stramonium
56	Lagenaria breviflorus
56	Massularia acuminata
56	Mikania cordata
56	Petersianthus macrocarpus
56	Pycnanthus angolensis
56	Ricinus communis
56	Tamarindus indica
57	Afrormosia laxiflora
58	Afrormosia laxiflora
58	Alternanthera sessilis
58	Asystasia calyciana
58	Borassus aethiopum
58	Bridelia micrantha
58	Burkea africana
58	Calliandra portoricensis
58	Capparis thonningii
58	Chromolaena odorata
58	Citrus sinensis
58	Cleome gynandra
58	Commelina diffusa
58	Crassocephalum crepidioides
58	Eryngium foetidum
58	Erythrococca anomala
58	Eythrococca anomala
58	Fagara rubescens
58	Garcinia kola
58	Geophila obvallata
58	Hilleria latifolia
58	Kalanchoe crenata
58	Mollugo oppositifolius
58	Monodora myristica
58	Pachira glabra
58	Pachypodanturum staudtii
58	Petersianthus macrocarpus
58	Piptadeniastrum africanum
58	Premna quadrifolia
58	Saccharum officinarum
58	Saphaeranthus senegalensis
58	Struchium sparganophora
58	Tectona grandis
58	Ximenia americana
58	Xylopia acutiflora
58	Zingiber officinale
59	Afrormosia laxiflora
60	Abrus precatorius
60	Agelenopsis chevaleri
60	Jubernardia seretii
60	Coix lacryma-jobi
60	Hoslundia  opposita
60	Mikania cordata
60	Petroselinum crispum
60	Scoparia dulcis
60	Teclea verdromiona
60	Ximenia americana
60	Ziziphus mauritiana
61	Agelenopsis chevaleri
61	Ageratum conyzoides
61	Emilia coccinea
61	Ficus elegans
61	Hygrophila auriculala
61	Hygrophila auriculata
61	Pergularia daemia
61	Symphonia globulifera
62	Ageratum conyzoides
62	Lippia multiflora
62	Vitex doniana
62	Ximenia americana
64	Acacia ataxacantha
64	Aframomum melegueta
64	Afrormosia laxiflora
64	Agelenopsis chevaleri
64	Alafia barteri
64	Alchornea cordifolia
64	Allanblackia floribunda
64	Allophylus africanus
64	Alstonia congensis
64	Alternanthera sessilis
64	Bombax buonopozense
64	Annona senegalensis
64	Asystasia calyciana
64	Aulacocalyx jasminiflora
64	Borassus aethiopum
64	Boscia senegalensis
64	Bridelia micrantha
64	Burkea africana
64	Calliandra portoricensis
64	Capparis thonningii
64	Carpolobia lutea
64	Casearia barteri
64	Chromolaena odorata
64	Chrysophyllum albidum
64	Citrus aurantifolia
64	Citrus aurantium
64	Citrus sinensis
64	Clausena anisata
64	Cleidon gaponicum
64	Cleome ciliata
64	Cleome gynandra
64	Coccinia barteri
64	Cocos nucifera
64	Cola laurifolia
64	Commelina diffusa
64	Cordia millenii
64	Crassocephalum crepidioides
64	Crassocephalum rubens
64	Crateva adansonii
64	Culcasia scandens
64	Dalbergia saxatilis
64	Daniellia oliveri
64	Dennettia tripetala
64	Dialium guineense
64	Dichapetalum baneri
64	Dichrostachys cinerea
64	Dicoma sessiliflora
64	Dracaena manni
64	Drypetes Florabunda
64	Elytraria marginata
64	Eruatamia coronaria
64	Eryngium foetidum
64	Erythrococca anomala
64	Eugenia aromatica
64	Eythrococca anomala
64	Fagara rubescens
64	Ficus elegans
64	Flacourtia flavescens
64	Garcinia afzelii
64	Garcinia kola
64	Gardenia ternifolia
64	Geophila obvallata
64	Glyphaea brevis
64	Harrisonia abyssinica
64	Hibiscus surattensis
64	Hilleria latifolia
64	Hygrophilia auriculata
64	Hymenostegia afzelii
64	Icacina tricantha
64	Ipomoea fistulosa
64	Jasminum pauciflonum
64	Kalanchoe crenata
64	Klainedoxa gabonensis
64	Leea guineensis
64	Lovoa trichilioides
64	Lycopersicon esculentum
64	Manihot esculenta
64	Meerua crassifolia
64	Mentha piperata
64	Microglossa pyrifolia
64	Mollugo oppositifolius
64	Momordica foetida
64	Monodora myristica
64	Monodora tenuifolia
64	Moringa oleifera
64	Mukia maderaspatana
64	Napoleona imperialis
64	Nephrolepsis bisserata
64	Nesogordonia papaverifera
64	Newbouldia laevis
64	Olax subscorpioidea
64	Oxyanthus tubiflorus
64	Pachira glabra
64	Pachypodanturum staudtii
64	Palisota hirsuta
64	Paropsia guineansis
64	Pentaclethra macrophylla
64	Petersianthus macrocarpus
64	Phyllanthus amarus
64	Piliostigma reticulatum
64	Piper guineense
64	Piper nigrum
64	Piptadeniastrum africanum
64	Premna quadrifolia
64	Psidium guajava
64	Punica granatum
64	Pycnanthus angolensis
64	Rabdia nilotica
64	Rhaphiostylis beninensis
64	Ricinus communis
64	Saccharum officinarum
64	Samanea dinklagei
64	Saphaeranthus senegalensis
64	Schrobera arborea
64	Securidaca longepedunculata
64	Senna alata
64	Senna occidentalis
64	Smeathmannia pubescens
64	Solenostemon monostachyus
64	Sorindeia mildbraedii
64	Spondias mombin
64	Sterospermum acuminatissimum
64	Struchium sparganophora
64	Tectona grandis
64	Tetracarpidium conophorum
64	Tetracera alnifolia
64	Tetrochidium didymostemon
64	Theobroma cacao
64	Tridax procumbens
64	Turrea vogelii
64	Uncaria talbotii
64	Vernonia amygdalina
64	Vernonia guineensis
64	Vitex doniana
64	Voacanga africana
64	Waltheria indica
64	Warburgia ugandensis
64	Ximenia americana
64	Xylopia acutiflora
64	Xylopica aethiopica
64	Xysmalobium heudelotiamum
64	Zanthoxylum leprieuri
64	Zanthoxylum rubenscens
64	Zingiber officinale
65	Ambrosia maritima
65	Dyschoriste perrottetii
65	Melanthera scadens
65	Nelsonia compestria
65	Philoxerus vermiculatus
65	Rauwolfia caffra
65	Spathodea campanulata
66	Abelmoschus esculentus
66	Acanthospermum hispidum
66	Adenia venenata
66	Alchornea cordifolia
66	Allium sativum
66	Alstonia boonei
66	Ambrosia maritima
66	Anacardium occidentale
66	Ananas comosus
66	Annona muricata
66	Anonidium Manni
66	Anthonotha macrophylla
66	Artemisia afra
66	Artocarpus altilis
66	Axonopus compressus
66	Basilicum polysiachyon
66	Bauhinia rubescens
66	Bixa orellana
66	Bryophyllum pinnatum
66	Caesalpinia bonduc
66	Calliandra portoricensis
66	Capparis thonningii
66	Capsicum frutescens
66	Ceiba pentandra
66	Celtis mildbraedii
66	Centaurea perrottetii
66	Chromolaena odorata
66	Chrysanthellum indicum
66	Chrysanthemum cinerariae folium
66	Chrysophyllum albidum
66	Cinnamomum Zeyianiam
66	Citrus aurantifolia
66	Citrus aurantium
66	Citrus sinensis
66	Cola acuminata
66	Combretum glutinosum
66	Commelina diffusa
66	Corchorus olitorus
66	Cordia millenii
66	Craterispermum laurinum
66	Crossopteryx febrifuga
66	Crotalaria retusa
66	Curcuma longa
66	Dennettia tripetala
66	Desmodium gangeticum
66	Dialium guineense
66	Dichrostachys cinerea
66	Dioscorea bulbifera
66	Dodonaea viscosa
66	Eclipta prostrata
66	Ehretia cymosa
66	Ekebergia capensis
66	Elaeophorbia drupifera
66	Elephantapus scaber
66	Enantia chlorantha
66	Entandrophragma cylindricum
66	Euphorbia hirta
66	Euphorbia laterifolia
66	Ficus thonningii
66	Garcinia kola
66	Gardenia ternifolia
66	Glyphaea brevis
66	Grewia venusta
66	Guiera senegalensis
66	Hannoa klaineana
66	Harungana madagascariensis
66	Holarrhena floribunda
66	Hymenocardia acida
66	Hypoestes verticillaris
66	Hyptis suaveloensis
66	Ipomoea involucrata
66	Isolana campanulata
66	Isolona campanulata
66	Jateorhiza Palmate
66	Jatropha curcas
66	Laggera alata
66	Landolphia owariensis
66	Lantana camara
66	Lecaniodiscus cupanioides
66	Lophira alata
66	Lovoa trichilioides
66	Ludwigia suffruticosa
66	Lycopersicon esculentum
66	Markhamia tomentosa
66	Meptunia oleracea
66	Microglossa pyrifolia
66	Millettia thonningii
66	Mitragyna stipulosa
66	Morelia senegalensis
66	Morinda morindioides
66	Murraya Koenigii
66	Musa sapientum
66	Musanga cecropioides
66	Napoleona vogelii
66	Nelsonia compestria
66	Newbouldia laevis
66	Ocimum gratissimum
66	Olax subscorpioidea
66	Oxalis corniculata
66	Oxyanthus tubiflorus
66	Pentaclethra macrophylla
66	Philoxerus vermiculatus
66	Phoenix dactylifera
66	Phyllanthus amarus
66	Phyllanthus muellerianus
66	Physalis angulata
66	Picralima nitida
66	Piliostigma reticulatum
66	Plumbago zeylanica
66	Polyalthia suaveolens
66	Portulaca oleracea
66	Psidium guajava
66	Pterocarpus erinaceus
66	Punica granatum
66	Pycnanthus angolensis
66	Rabdia nilotica
66	Rauvolfia vomitoria
66	Rothmannia longiflora
66	Ruellia tuberosa
66	Saphaeranthus senegalensis
66	Schwenkia americana
66	Securidaca longepedunculata
66	Senna sieberiana
66	Sesbania grandiflora
66	Sida cordifolia
66	Smilax kraussiana
66	Sorghum bicolor
66	Sphenocentrum jollyanum
66	Spondias mombin
66	Sterculia tragacantha
66	Tamarindus indica
66	Tecoma stans
66	Tetrapleura tetraptera
66	Thespesia populnea
66	Thevetia neriifolia
66	Tinospora cordifolia
66	Tithonia diversifolia
66	Trema orientalis
66	Trichilia prieureana
66	Trichodesma africanum
66	Uvaria afzelii
66	Uvaria chamae
66	Vernonia cinerea
66	Vitex doniana
66	Voacanga africana
66	Waltheria indica
66	Warburgia ugandensis
66	Xeromorphus nilotica
66	Xylopia acutiflora
66	Xylopia vilosa
66	Zingiber officinale
66	Ziziphus mauritiana
66	Ziziphus spina-christi
67	Alafia barteri
67	Securinega virosa
68	Aloe vera
68	Anacardium occidentale
68	Anthocleista djalonensis
68	Blighia unijugata
68	Boscia senegalensis
68	Bridelia ferruginea
68	Butea frondosa
68	Carica papaya
68	Catharanthus roseus
68	Ceiba pentandra
68	Citrus paradisi
68	Costus afer
68	Dioscorea bulbifera
68	Dioscoreophyllum cumminsii
68	Entandrophragma cylindricum
68	Gymnema sylvestre
68	Hoslundia  opposita
68	Ipomoea batatas
68	Lagenaria breviflorus
68	Leptogramma pillosiusaila
68	Mangifera indica
68	Momordica charantia
68	Momordica foetida
68	Morinda lucida
68	Musa paradisiaca
68	Napoleona vogelii
68	Ocimum gratissimum
68	Parkia biglobosa
68	Petiveria alliacea
68	Phyllanthus amarus
68	Picralima nitida
68	Piliostigma reticulatum
68	Scoparia dulcis
68	Securidaca longepedunculata
68	Senna arabica
68	Senna fistula
68	Spondias mombin
68	Stachytarpheta indica
68	Synctisia scabrida
68	Synsepalum dulcificum
68	Syzygium guineense
68	Thaumatococcus daniellii
68	Tithonia diversifolia
68	Triclisia subcordata
68	Vernonia amygdalina
68	Viscum album
70	Aframomum melegueta
70	Aframomum sceptrum
70	Allanblackia floribunda
70	Cajanus cajan
70	Citrus aurantifolia
70	Cuscuta australis
70	Elaeis guineensis
70	Elaeophorbia drupifera
70	Emilia coccinea
70	Hymenocardia acida
70	Justicia insularis
70	Klainedoxa gabonensis
70	Nauclea latifolia
70	Raphia hookeri
70	Senna alata
70	Senna occidentalis
70	Spondias mombin
70	Thevetia neriifolia
70	Tylophora dahomensis
18	Acacia nilotica
7	Acacia nilotica
65	Acacia nilotica
17	Acacia nilotica
57	Acacia nilotica
7	Acacia senegal
3	Acacia senegal
17	Acacia senegal
\.


--
-- Data for Name: plantusageprecaution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plantusageprecaution (botanicname, precautioncode, observations) FROM stdin;
\.


--
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe (recipecode) FROM stdin;
1.Rx
10.Rx
100.Rx
101.Rx
102.Rx
103.Rx
104.Rx
105.Rx
106.Rx
107.Rx
108.Rx
11.Rx
12.Rx
13.Rx
14.Rx
15.Rx
16.Rx
17.Rx
18.Rx
19.Rx
2.Rx
20.Rx
21.Rx
22.Rx
23.Rx
24.Rx
25.Rx
26.Rx
27.Rx
28.Rx
29.Rx
3.Rx
30.Rx
31.Rx
32.Rx
33.Rx
34.Rx
35.Rx
36.Rx
37.Rx
38.Rx
39.Rx
4.Rx
40.Rx
41.Rx
42.Rx
43.Rx
44.Rx
45.Rx
46.Rx
47.Rx
48.Rx
49.Rx
5.Rx
50.Rx
51.Rx
52.Rx
53.Rx
54.Rx
55.Rx
56.Rx
57.Rx
58.Rx
59.Rx
6.Rx
60.Rx
61.Rx
62.Rx
63.Rx
64.Rx
65.Rx
66.Rx
67.Rx
68.Rx
69.Rx
7.Rx
70.Rx
71.Rx
72.Rx
73.Rx
74.Rx
75.Rx
76.Rx
77.Rx
78.Rx
79.Rx
8.Rx
80.Rx
81.Rx
82.Rx
83.Rx
84.Rx
85.Rx
86.Rx
87.Rx
88.Rx
89.Rx
9.Rx
90.Rx
91.Rx
92.Rx
93.Rx
94.Rx
95.Rx
96.Rx
97.Rx
98.Rx
99.Rx

\.


--
-- Data for Name: recipeadversereactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipeadversereactions (arcode, recipecode) FROM stdin;
\.


--
-- Data for Name: recipecontraindications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipecontraindications (recipecode, cicode) FROM stdin;
1.Rx	1
1.Rx	144
1.Rx	195
1.Rx	215
2.Rx	1
2.Rx	144
2.Rx	195
2.Rx	215
3.Rx	208
4.Rx	1
4.Rx	144
4.Rx	195
4.Rx	215
5.Rx	1
5.Rx	144
5.Rx	225
6.Rx	144
6.Rx	1
7.Rx	1
7.Rx	144
7.Rx	208
8.Rx	1
8.Rx	144
8.Rx	208
9.Rx	1
9.Rx	144
9.Rx	208
10.Rx	1
10.Rx	144
10.Rx	210
10.Rx	208
11.Rx	1
11.Rx	144
11.Rx	210
11.Rx	208
12.Rx	223
12.Rx	208
13.Rx	223
13.Rx	208
14.Rx	223
14.Rx	208
15.Rx	223
15.Rx	208
16.Rx	223
16.Rx	208
17.Rx	1
17.Rx	144
17.Rx	221
18.Rx	1
18.Rx	144
18.Rx	208
19.Rx	1
19.Rx	144
19.Rx	208
20.Rx	1
20.Rx	144
20.Rx	208
21.Rx	1
21.Rx	144
21.Rx	208
22.Rx	1
22.Rx	144
22.Rx	208
23.Rx	1
23.Rx	144
23.Rx	208
24.Rx	1
24.Rx	144
24.Rx	208
25.Rx	1
25.Rx	144
25.Rx	208
26.Rx	1
26.Rx	144
26.Rx	208
27.Rx	1
27.Rx	144
27.Rx	218
28.Rx	1
28.Rx	144
28.Rx	208
29.Rx	1
29.Rx	144
29.Rx	208
30.Rx	1
30.Rx	144
30.Rx	208
30.Rx	209
10.Rx	195
11.Rx	195
24.Rx	195
21.Rx	195
18.Rx	195
22.Rx	195
17.Rx	195
19.Rx	195
20.Rx	195
25.Rx	195
28.Rx	195
5.Rx	195
26.Rx	195
27.Rx	195
6.Rx	195
8.Rx	195
7.Rx	195
9.Rx	195
31.Rx	1
31.Rx	144
31.Rx	218
31.Rx	223
32.Rx	1
32.Rx	144
32.Rx	221
33.Rx	1
33.Rx	144
33.Rx	208
34.Rx	218
35.Rx	1
35.Rx	144
35.Rx	208
36.Rx	1
36.Rx	144
36.Rx	208
37.Rx	1
37.Rx	144
37.Rx	208
38.Rx	144
38.Rx	48
38.Rx	224
38.Rx	225
39.Rx	1
39.Rx	144
39.Rx	195
39.Rx	216
40.Rx	1
40.Rx	144
40.Rx	195
40.Rx	208
40.Rx	83
41.Rx	1
41.Rx	144
41.Rx	195
41.Rx	216
42.Rx	1
42.Rx	144
42.Rx	195
42.Rx	216
43.Rx	1
43.Rx	144
43.Rx	195
43.Rx	208
44.Rx	1
44.Rx	144
44.Rx	195
44.Rx	208
45.Rx	1
45.Rx	144
45.Rx	195
45.Rx	208
46.Rx	1
46.Rx	144
46.Rx	195
46.Rx	208
47.Rx	1
47.Rx	144
47.Rx	235
48.Rx	1
48.Rx	144
48.Rx	208
50.Rx	1
50.Rx	144
50.Rx	208
51.Rx	1
51.Rx	144
51.Rx	208
52.Rx	1
52.Rx	144
52.Rx	208
55.Rx	1
55.Rx	144
55.Rx	195
55.Rx	215
56.Rx	1
56.Rx	144
56.Rx	195
56.Rx	211
56.Rx	221
58.Rx	215
58.Rx	213
59.Rx	215
59.Rx	213
60.Rx	1
60.Rx	144
60.Rx	195
61.Rx	1
61.Rx	144
61.Rx	195
62.Rx	1
62.Rx	144
62.Rx	195
63.Rx	1
63.Rx	144
63.Rx	195
64.Rx	1
64.Rx	144
64.Rx	195
65.Rx	1
65.Rx	144
65.Rx	195
66.Rx	1
66.Rx	144
66.Rx	195
66.Rx	208
67.Rx	1
67.Rx	144
67.Rx	215
68.Rx	1
68.Rx	144
69.Rx	1
69.Rx	144
69.Rx	208
70.Rx	208
71.Rx	208
72.Rx	1
72.Rx	144
72.Rx	195
73.Rx	1
73.Rx	144
73.Rx	195
75.Rx	1
75.Rx	144
75.Rx	195
75.Rx	208
76.Rx	1
76.Rx	144
76.Rx	195
77.Rx	1
77.Rx	144
77.Rx	195
77.Rx	231
78.Rx	1
78.Rx	144
78.Rx	195
78.Rx	231
79.Rx	1
79.Rx	144
79.Rx	195
80.Rx	1
80.Rx	144
80.Rx	215
80.Rx	208
81.Rx	1
81.Rx	144
81.Rx	215
81.Rx	208
82.Rx	1
82.Rx	144
82.Rx	63
83.Rx	1
83.Rx	144
83.Rx	195
83.Rx	208
84.Rx	1
84.Rx	144
84.Rx	223
87.Rx	1
87.Rx	144
87.Rx	223
88.Rx	238
89.Rx	208
90.Rx	208
91.Rx	1
91.Rx	144
91.Rx	208
92.Rx	208
93.Rx	208
94.Rx	208
95.Rx	208
96.Rx	208
97.Rx	208
99.Rx	208
100.Rx	208
101.Rx	208
102.Rx	208
103.Rx	1
103.Rx	144
105.Rx	208
106.Rx	215
107.Rx	208
108.Rx	208
\.


--
-- Data for Name: recipetherapeuticindication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipetherapeuticindication (recipecode, ticode) FROM stdin;
1.Rx	39
10.Rx	3
10.Rx	17
100.Rx	101
101.Rx	102
102.Rx	103
103.Rx	104
104.Rx	105
104.Rx	106
105.Rx	107
106.Rx	108
107.Rx	109
108.Rx	110
11.Rx	3
11.Rx	17
12.Rx	63
13.Rx	63
14.Rx	63
15.Rx	63
16.Rx	63
17.Rx	64
17.Rx	65
18.Rx	64
18.Rx	65
19.Rx	64
19.Rx	65
2.Rx	39
20.Rx	64
20.Rx	65
21.Rx	64
21.Rx	65
22.Rx	67
23.Rx	67
24.Rx	67
25.Rx	68
26.Rx	68
27.Rx	68
28.Rx	68
29.Rx	68
3.Rx	39
30.Rx	68
31.Rx	42
32.Rx	42
33.Rx	42
34.Rx	42
35.Rx	42
36.Rx	46
37.Rx	46
38.Rx	46
39.Rx	26
4.Rx	39
40.Rx	26
41.Rx	26
42.Rx	26
43.Rx	69
44.Rx	69
45.Rx	69
46.Rx	69
47.Rx	15
48.Rx	70
49.Rx	70
5.Rx	39
50.Rx	71
51.Rx	71
52.Rx	71
53.Rx	72
54.Rx	72
55.Rx	73
56.Rx	73
57.Rx	73
58.Rx	74
58.Rx	75
59.Rx	74
59.Rx	75
6.Rx	39
60.Rx	76
61.Rx	76
62.Rx	76
63.Rx	76
64.Rx	77
65.Rx	77
66.Rx	78
67.Rx	79
68.Rx	79
69.Rx	80
7.Rx	39
70.Rx	81
71.Rx	82
72.Rx	83
73.Rx	83
74.Rx	83
75.Rx	84
76.Rx	29
77.Rx	85
78.Rx	85
79.Rx	85
8.Rx	39
80.Rx	86
81.Rx	87
82.Rx	47
83.Rx	88
84.Rx	89
85.Rx	90
86.Rx	90
87.Rx	91
88.Rx	92
89.Rx	93
9.Rx	3
9.Rx	17
90.Rx	51
91.Rx	94
92.Rx	95
93.Rx	31
94.Rx	96
95.Rx	97
96.Rx	98
97.Rx	99
99.Rx	100
\.


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.species (speciesname, familyname) FROM stdin;
Abelmoschus esculentus	Malvaceae
Abrus precatorius	Leguminosae
Abutilon mauritianum	Malvaceae
Acacia ataxacantha	Mimosaceae
Acacia auriculiformis	Leguminosae
Acacia nilotica	Mimosaceae
Acacia sieberiana	Mimosaceae
Acalypha fimbriata	Euphorbiaceae
Acalypha godseffiana	Euphorbiaceae
Acalypha hispida	Euphorbiaceae
Acalypha wilkesiana	Euphorbiaceae
Acanthospermum hispidum	Compositae
Acanthus montanus	Acanthacease
Achillea millefolium	Compositae
Achyranthes aspera	Amaranthaceae
Adansonia digitata	Bombacaceae
Adenia cissampeloides	Passifloraceae
Adenia venenata	Passifloraceae
Adenium Obesum	Apoynaceae
Adhatoda buchhoizii	Acanthaceae
Aerva lanata	Amaranthaceae
Afraegle paniculata	Rutaceae
Aframomum granum-paradisi	Zingiberaceae
Aframomum melegueta	Zingiberaceae
Aframomum sceptrum	Zingiberaceae
Afrormosia laxiflora	Leguminosae
Afzelia africana	Leguminosae
Agelaea obliqua	Connaraceae
Agelenopsis chevaleri	Olacaceae
Ageratum conyzoides	Compositae
Alafia barteri	Apocynaceae
Albizia adianthifolia	Leguminosae
Albizia ferruginea	Leguminosae
Albizia lebbeck	Leguminosae
Albizia zygia	Leguminosae
Alchornea cordifolia	Euphorbiaceae
Alchornea laxiflora	Euphorbiaceae
Allamanda cathartica	Apocynaceae
Allanblackia floribunda	Guttiferae
Allium ascalonicum	Liliaceae
Allium cepa	Liliaceae
Allium sativum	Liliaceae
Allophylus africanus	Sapindaceae
Aloe barteri	Liliaceae
Aloe vera	Liliaceae
Alstonia boonei	Apocynaceae
Alstonia congensis	Apocynaceae
Alternanthera repens	Amaranthaceae
Alternanthera sessilis	Amaranthaceae
Amaralia bignoniflora	Rubiaceae
Amaranthus spinosus	Amaranthaceae
Amaranthus viridis	Amaranthaceae
Ambrosia maritima	Compositae
Amorphophallus dracantioides	Anacardiaceae
Anacardium occidentale	Anacardaceae
Ananas comosus	Bromeliaceae
Anchomanes difformis	Araceae
Andira inermis	Araceae
Aneilema hockii	Commelinaceae
Annona muricata	Annonaceae
Annona senegalensis	Annonaceae
Annona squamosa	Annonaceae
Anogeissus leiocarpus	Combretaceae
Anonidium Manni	Annonaceae
Anthocleista djalonensis	Loganiaceae
Anthocleista liebrechtsiana	Loganiaceae
Anthocleista vogelii	Loganiaceae
Anthonotha macrophylla	Leguminosae
Antiaris africana	Moraceae
Antidesma venosum	Euphorbiaceae
Antigonon leptopus	Polygonaceae
Antrocaryon micraster	Anacardiaceae
Apium graveolens	Apiaceae
Arachis hypogea	Leguminosae
Areca catechu	Palmae
Argemone mexicana	Papaveraceae
Argyreia nervosa	Convolvulaceae
Aristida adscensionis	Poaceae
Aristolochia ringens	Aristolochiaceae
Artemisia afra	Compositae
Artocarpus altilis	Moraceae
Asclepias curassavica	Asclepiadaceae
Asparagus africana	Liliaceae
Aspilia africana	Compositae
Asystasia calyciana	Acanthaceae
Asystasia gangetica	Acanthaceae
Aulacocalyx jasminiflora	Rubiaceae
Avicennia africana	Avicenniaceae
Axonopus compressus	Poaceae
Azadirachta indica	Meliaceae
Bacopo monnifera	Scrophulariaceae
Balanites aegyptiaca	Zygophyllaceae
Bambusa vulgaris	Poaceae
Bandeiraea simplicifolia	Leguminosae
Baphia nitida	Papilionaceae
Baphia pubescens	Papilionaceae
Barleria opaca	Acanthaceae
Basilicum polysiachyon	Labiatae
Bauhinia rubescens	Caesalpiniaceae
Bauhinia variegata	Caesalpiniaceae
Berlinia grandiflora	Caesalpiniaceae
Bidens pilosa	Compositae
Bixa orellana	Bixaceae
Blepharis maderaspatensis	Acanthaceae
Blighia sapida	Sapindaceae
Blighia unijugata	Sapindaceae
Blumea auria	Compositae
Blumea perrottetiana	Compositae
Boerhaavia diffusa	Nyctaginaceae
Bombax buonopozense	Bombaceae
Borassus aethiopum	Palmae
Borreria ocymoides	Rubiaceae
Borreria verticillata	Rubiaceae
Boscia senegalensis	Capparidaceae
Bosqueia anglosensis	Moraceae
Boswellia dalzielii	Burseraceae
Boswellia spp	Burseraceae
Brassica oleracea var capitata	Cruciferae
Bridelia ferruginea	Euphorbiaceae
Bridelia micrantha	Euphorbiaceae
Brillantaisia nitens	Acanthaceae
Brillantaisia patula	Acanthaceae
Brucea antidysenterica	Simaroubaceae
Brunfelsia uniflora	Solanaceae
Bryophyllum pinnatum	Crassulaceae
Bryoria africana	Cucurbitaceae
Brysocarpus coccineus	Connaraceae
Buchholzia coriacea	Sterculiaceae
Burkea africana	Caesalpiniaceae
Bursoma abyssinica	Melianthaceae
Butea frondosa	Papilionaceae
Butyrospermum paradoxum	Sapotaceae
Caesalpinia bonduc	Leguminosae
Caesalpinia cristata	Caesalpiniaceae
Caesalpinia pulcherima	Leguminosae
Cajanus cajan	Leguminosae
Caladium bicolor	Araceae
Calapogonium mucunoides	Leguminosae
Calendula officinalis	Compositae
Calliandra haematocephala	Leguminosae
Calliandra portoricensis	Leguminosae
Caloncoba echinata	Flacourtiaceae
Caloncoba glauca	Flacourtiaceae
Calophyllum inophyllum	Guttiferae
Calotropis procera	Asclepiadaceae
Canarium schweinfurthii	Burseraceae
Canavalia ensiformis	Leguminosae
Canna indica	Cannaceae
Cannabis sativa	Cannabinaceae
Canthium glabriflorum	Rubiaceae
Capparis thonningii	Cappararaceae
Capraria biflora	Scrophulariaceae
Capsicum annuum	Solanaceae
Capsicum frutescens	Solanaceae
Carapa procera	Meliaceae
Cardiospermum halicacabum  .	Sapindaceae
Carica papaya	Caricaceae
Carissa edulis	Apocynaeae Bagozaki
Carpha procera	Cyperaceae
Carpodinus dulcis	Apocynacee
Carpolobia lutea	Polygalaceae
Casearia barteri	Samydaceae
Cassytha filiformis	Lauraceae
Casuarina equisetifolia	Casuarinaceae
Catharanthus roseus	Apocynaceae
Ceiba pentandra	Bombacaceae
Celastrus indica	Celastraceae
Celastrus paniculatus	Celastraceae
Celastrus senegalensis	Celastraceae
Celosia argentea	Amaranthaceae
Celosia laxa	Amaranthaceae
Celosia trigyna	Amaranthaceae
Celtis mildbraedii	Ulmaceae
Centaurea perrottetii	Compositae
Centaurea praecox	Compositae
Centella asiatica	Umbelliferae
Centrosema pubescens	Leguminosae
Cephaelis manni	Rubiaceae
Cercestis afzelii	Araceae
Chasmanthera dependens	Menispermaceae
Chenopodium ambrosioides	Chenopodiaceae
Chromolaena odorata	Compositae
Chrozophora senegalensis	Euphorbiaceae
Chrysanthellum indicum	Compositae
Chrysanthemum cinerariae folium	Compositae
Chrysobalanus ellipticus	Roseaceae
Chrysophyllum albidum	Sapotaceae
Cinchona officinalis	Rubiaceae
Cinnamomum Zeyianiam	Lauraceae
Cissampelos owariensis	Menispermaceae
Cissus quadrangularis	Vitaceae
Citrullus colocynthis	Cucurbitaceae
Citrullus lanatus	Cucurbitaceae
Citrus aurantifolia	Rutaceae
Citrus aurantium	Rutaceae
Citrus limon	Rutaceae
Citrus paradisi	Rutaceae
Citrus sinensis	Rutaceae
Clappertonia ficifolia	Malvaceae
Clausena anisata	Rutaceae
Cleidon gaponicum	Euphorbiaceae
Cleistopholis paterns	Annonaceae
Cleome ciliata	Capparaceae
Cleome gynandra	Capparaceae
Clerodendrum capitalum	Verbenaceae
Clerodendrum paniculatum	Verbenaceae
Clerodendrum umbellatum	Verbenaceae
Clerodendrum volubile	Verbenaceae
Clitoria ternatea	Leguminosae
Cnestis ferruginea	Connaraceae
Cnidoscolus acontifolius	Euphorbiaceae
Coccinia barteri	Cucurbitaceae
Coccinia grandis	Cucurbitaceae
Cochlospermun planchonii	Cochlospermaceae
Cochlospermun tinctorium	Cochlospermaceae
Cocos nucifera	Palmae
Cocparnus pendulus	Menispermaceae
Coffea arabica	Rubiaceae
Coix lacryma-jobi	Poaceae
Cola acuminata	Sterculiaceae
Cola Caricifolia	Sterculiaceae
Cola laurifolia	Sterculiaceae
Cola millenii	Sterculiaceae
Cola nitida	Sterculiaceae
Colocasia esculenta	Araceae
Combretum glutinosum	Combretaceae
Combretum grandiflous	Combretaceae
Combretum mucronatum	Combretaceae
Combretum paniculatum	Combretaceae
Combretum racemosum	Combretaceae
Commelina diffusa	Commelinaceae
Commiphora africana	Burseraceae
Connarus africanus	Connaraceae
Conyza canadensis	Compositae
Conyza sumatrensis	Compositae
Copaifera mildbraedii	Leguminosae
Corchorus olitorus	Tiliaceae
Cordia millenii	Boraginaceae
Corynanthe johimbe	Rubiaceae
Corynanthe pachyceras	Rubiaceae
Cosmos sulphureus	Asteraceae
Costus afer	Zingiberaceae
Coula edulis	Olacaceae
Courbonia virgata	Capparaceae
Crassocephalum crepidioides	Compositae
Crassocephalum rubens	Compositae
Craterispermum laurinum	Rubiaceae
Crateva adansonii	Capparaceae
Crescentia cujete	Bignoniaceae
Crinum glaucum	Amaryllidaceae
Crinum jagus	Amaryllidaceae
Crossopteryx febrifuga	Rubiaceae
Crotalaria retusa	Leguminosae
Croton lobatus	Euphorbiaceae
Croton penduliflorus	Euphorbiaceae
Croton zambesicus	Euphorbiaceae
Cryptolepia sanguinolenta	Periplocaceae
Cryptostegia grandiflora	Apocynaceae
Cucumeropsis manni	Cucurbitaceae
Cucumis melo	Cucurbitaceae
Cucumis prophetarum	Cucurbitaceae
Cucurbita maxima	Cucurbitaceae
Cucurbita pepo	Cucurbitaceae
Culcasia scandens	Araceae
Curculigo pilosa	Hypoxidaceae
Curcuma longa	Zingiberaceae
Cuscuta australis	Convolvulaceae
Cyathula prostrata	Amaranthaceae
Cylicodiscus gabonensis	Leguminosae
Cymbopogon citratus	Poaceae
Cynara scolymus	Compositlae
Cynodon dactylon	Graminae
Cyperus esculentus	Cyperaceae
Cyrtosperma senegalense	Araceae
Dacryodes edulis	Burseraceae
Dalbergia lactea	Leguminosae
Dalbergia saxatilis	Leguminosae
Dalbergiella welwitschii	Leguminosae
Daniellia oliveri	Leguminosae
Daniellia thurifera	Leguminosae
Datura metel	Solanaceae
Datura stramonium	Solanaceae
Deinbollia pinnata	Sapindaceae
Delonix regia	Leguminosae
Dennettia tripetala	Annonaceae
Desmodium adscendens	Leguminosae
Desmodium gangeticum	Leguminosae
Detaruyn nucricaroyn	Leguminosae
Dialium guineense	Leguminosae
Dichapetalum baneri	Chailletiaceae
Dichapetalum toxicarium	Dichapetalaceae
Dichrostachys cinerea	Leguminosae
Dicoma sessiliflora	Compositae
Digitaria horizontalis	Poaceae
Dioclea reflexa	Leguminosae
Dioscorea bulbifera	Discoreaceae
Dioscorea dumetorum	Dioscoreaceae
Dioscoreophyllum cumminsii	Mennispermaceae
Diospyros canaliculata	Ebenaceae
Diospyros mespliforimis	Ebenaceae
Discoglypremna caloneura	Euphorbiaceae
Dissotis rotundifolia	Melastomataceae
Dodonaea viscosa	Sapindaceae
Dorstenia prorepens	Moraceae
Dracaena manni	Dracaenaceae
Drynaria laurentii	Polypodiaceae
Drypetes chevalieri	Euphorbiaceae
Drypetes Florabunda	Euphorbiaceae
Duranta repens	Verbenaecae
Dyschoriste perrottetii	Acanthaceae
Echinacea purpurea	Compositae
Eclipta prostrata	Compositae
Ehretia cymosa	Boraginaceae
Eichhornia crassipes	Pontederiaceae
Ekebergia  senegalensis	Meliaceae
Ekebergia capensis	Meliaceae
Elaeis guineensis	Palmae
Elaeophorbia drupifera	Euphorbiaceae
Elephantapus scaber	Compositae
Eleusine indica	Poaceae
Elytraria marginata	Acanthaceae
Embelia guineaasis	Myrsinaceae
Embelia schimperi	Myrsinaceae
Emilia coccinea	Compositae
Enantia chlorantha	Annonaceae
Entada africana	Leguminosae
Entada gigas	Mimosaceae
Entandrophragma cylindricum	Meliaceae
Eragrostis tremula	Poaceae
Eremomastax speciosa	Acanthaceae
Erissema psoraleoides	Leguminosae
Eruatamia coronaria	Apocynaceae
Eryngium foetidum	Umbelliferae
Erythrina senegalensis	Leguminosae
Erythrococca anomala	Euphorbiaceae
Erythrophleum suaveolens	Leguminosae
Erythroxylum coca	Erythroxylaceae
Euadenia trifoliata	Capparaceae
Eucalyptus globulus	Myrtaceae
Eugenia aromatica	Myrtaceae
Eugenia malaccencis	Myrtaceae
Eugenia unifolia	Myrtaceae
Eulophia millsoni	Orchidaceae
Euphorbia balsamifera	Euphorbiaceae
Euphorbia deightonii	Euphorbiaceae
Euphorbia heterophylla	Euphorbiaceae
Euphorbia hirta	Euphorbiaceae
Euphorbia kamerunica	Euphorbiaceae
Euphorbia laterifolia	Euphorbiaceae
Euphorbia unispina	Euphorbiaceae
Evolvulus alsinoides	Convolvulaceae
Eythrococca anomala	Euphorbiaceae
Fagara rubescens	Rutaceae
Ficus asperifolia	Moraceae
Ficus capensis	Moraceae
Ficus elegans	Moraceae
Ficus exasperata	Moraceae
Ficus mucuso	Moraceae
Ficus thonningii	Moraceae
Ficus vallis-choudae	Moraceae
Ficus vogelii	Moraceae
Flabellaria paniculata	Malpighiaceae
Flacourtia flavescens	Flacourtiaceae
Fluerya aestuans	Urticaceae
Funtumia africana	Apocynaceae
Funtumia elastica	Apocynaceae
Galinsoga parviflora	Compositae
Garcinia afzelii	Guttiferae
Garcinia kola	Guttiferae
Garcinia manni	Guttferae
Gardenia ternifolia	Rubiaceae
Geophila obvallata	Rubiaceae
Gisekia pharmacioides	Molluginaceae
Gladiolus psittacinus	Iridaceae
Gloriosa superba	Liliaceae
Glossonema boveanum	Asclepiadaceae
Glycine max	Leguminosae
Glycyrrhiza glabra	Leguminosae
Glyphaea brevis	Tiliaceae
Gmelina arborea	Verbenaceae
Gnidia kraussiana	Thymelaeceae
Gomphrena globosa	Amaranthaceae
Gongronema latifolium	Asclepiadaceae
Gossypium barbadense	Malvaceae
Gouania longipetala	Rhamnaceae
Greenwayodendron suaveolens	Annonaceae
Grewia flavescens	Tiliaceae
Grewia pubescens	Tiliaceae
Grewia sp	Tiliaceae
Grewia venusta	Tiliaceae
Griffonia simplicifolia	Leguminosae
Guaiacum officinale	Zygophyllaceae
Guibourtia copallifera	Leguminosae
Guiera senegalensis	Combretaceae
Gymnema sylvestre	Asclepiadaceae
Gynura amplexicanlis	Asteraceae
Haemanthus multiflorus	Amaryllidaceae
Haematostaphis barteri	Anacardiaceae
Haematoxylum compechionum	Leguminosae
Hannoa klaineana	Simaroubaceae
Harrisonia abyssinica	Simaroubaceae
Harungana madagascariensis	Hypericaceae
Hedranthera barteri	Apocynaceae
Heeria insignis	Anaradiaceae
Helianthus annus	Compositae
Heliotropium indicum	Boraginaceae
Hexalobus crispiflorus.	Annonaceae
Hibiscus acetosella	Malvaceae
Hibiscus asper	Malvaceae
Hibiscus rosasinensis	Malvaceae
Hibiscus sabdariffa	Malvaceae
Hibiscus surattensis	Malvaceae
Hildegradia barteri	Sterculiaceae
Hilleria latifolia	Phytolaccaceae
Holarrhena floribunda	Apocynaceae
Hoslundia  opposita	Labiatae
Hybanthus enneaspermus	Violaceae
Hygrophila auriculala	Acanthaceae
Hygrophila auriculata	Acanthaceae
Hygrophilia auriculata	Acanthaceae
Hymenocardia acida	Hymenocardiacae
Hymenostegia afzelii	Leguminosae
Hyoscyamus niger	Solanaceae
Hypoestes forskalei	Acanthaceae
Hypoestes verticillaris	Acanthaceae
Hypoxis nyasica	Hypoxodaceae
Hyptis suaveloensis	Labiatae
Icacina tricantha	Icacinaceae
Impatiens balsamina	Balsaminaceae
Impatiens glandulifera	Balsaminaceae
Indigofera arrecta	Leguminosae
Indigofera macrophylla	Leguminosae
Ipomoea asarifolia	Convolvulaceae
Ipomoea batatas	Convolvulaceae
Ipomoea fistulosa	Convulvulaceae
Ipomoea involucrata	Convolvulaceae
Ipomoea mauritiana	Convolvulaceae
Irvingia gabonensis	Irvingiaceae
Isolana campanulata	Anacardiaceae
Isolona campanulata	Annonaceae
Jacaranda spp	Bignoniaceae
Jasminum pauciflonum	
Jateorhiza macrantha	Menispermaceae
Jateorhiza Palmate	Menispermaceae
Jatropha curcas	Euphorbiaceae
Jatropha gossypiifolia	Euphorbiaceae
Jatropha multifida	Euphorbiaceae
Jubernardia seretii	Legumonosae
Jussiaea linifoliio	Onagraceae
Justicia flava	Acanthaceae
Justicia insularis	Acanthaceae
Kaempfena nigerica	Zingiberaceae
Kalanchoe crenata	Crassulaceae
Khaya ivorensis	Meliaceae
Kigelia africana	Bignoniaceae
Klainedoxa gabonensis	Irvingiaceae
Kolobopetalum auriculatum	Menispermaceae
Lactuca capensis	Compositae
Lagenaria breviflorus	Cucurbitaceae
Lagenaria siceraria	Cucurbitaceae
Lagerstroemia speciosa	Lythraceae
Laggera alata	Compositae
Laggera aurita	Compositae
Landolphia dulcis	Apocynaceae
Landolphia owariensis	Apocynaceae
Lannea nigritana	Anacardaceae
Lantana camara	Verbenaceae
Lasiodiscus mildbraedi	Rhamnaceae
Lasiosiphon kraussianus	Thymeloceae
Launaea taraxacifolia	Compositae
Lawsonia inermis	Lythraceae
Lecaniodiscus cupanioides	Sapindaceae
Leea guineensis	Leeaceae
Leersia hexrandra	Poaceae
Leonotis nepetifolia	Labiatae
Leptadenia hastata	Rubiaceae
Leptochloa coenilescins	Poaceae
Leptogramma pillosiusaila	Thelyptoidacea
Leucaena glauea	Leguminosae
Leucas martinicensis	Labiatae
Leucena leucocephala	Leguminosae
Lippia multiflora	Verbenaceae
Lobelia molleri	Lobeliaceae
Lonchocarpus cyanescens	Leguminosae
Lonchocarpus sericeus	Leguminosae
Lonicera caprifolum	Caprifoliaceae
Lophira alata	Ochnaceae
Lovoa trichilioides	Meliaceae
Ludwigia suffruticosa	Onagraceae
Luffa cylindrica	Cucurbitaceae
Lycopersicon esculentum	Solanaceae
Lycopodium cernuum	Lycopodiaceae
Macaranga barteri	Euphorbiaceae
Maesa lanceolata	Myrsinaceae
Maesopsis eminii	Rhomnaceae
Mallotus cordifolia	Euphorbiaceae
Mallotus oppositifolius	Euphorbiaceae
Mammea africana	Guttiferae
Mangifera indica	Anacardaceae
Manihot esculenta	Euphorbiaceae
Manniophytum fuluum	Euphorbiaceae
Mansonia altissima	Sterculiaceae
Mareya spicata	Euphorbiaceae
Mariscus alternifolius	Cyperaceae
Markhamia tomentosa	Bignoniaceae
Marsdenia abyssinica	Ascelepiadaceae
Marsderua latifolia	Asclepiadaceae
Massularia acuminata	Rubiaceae
Matricaria recutita	Compositae
Mauclea vanderguchnii	Rubiaceae
Meerua crassifolia	Capparidaceae
Melaleuca leucadendron	Myrtaceae
Melanthera scadens	Compositae
Melanthra brownei	Compositae
Melia azedarach	Meliaceae
Melicia excelsa	Meliaceae
Mentha piperata	Lamiaceae
Meptunia oleracea	Leguminosae
Mesua Ferrea	Guttiferae
Mezoneuron benthamianum	Leguminosae
Microdesmis puberula	Euphorbiaceae
Microglossa abzelii	Compositae
Microglossa pyrifolia	Compositae
Mikania cordata	Compositae
Milletia zechiera	Legumonsae
Millettia thonningii	Leguminosae
Mimosa pigra	Mimosaceae
Mimosa pudica	Mimosaceae
Mimusops kummel	Sapotaceae
Mirabilis jalapa	Nyctaginaceae
Mitracarpus scaber	Rubiaceae
Mitragyna inermis	Rubiaceae
Mitragyna stipulosa	Rubiaceae
Mollugo nudicaulis	Molluginaceae
Mollugo oppositifolius	Molluginaceae
Momordica angustisepala	Cucurbitaceae
Momordica charantia	Cucurbitaceae
Momordica foetida	Cucurbitaceae
Mondia whitei	Periplocaceae
Monodora brevipes	Annonaceae
Monodora myristica	Annonaceae
Monodora tenuifolia	Anacardiaceae
Monsonia senegalensis	Geraniaceae
Morelia senegalensis	Rubiaceae
Morinda lucida	Rubiaceae
Morinda morindioides	Rubiaceae
Moringa oleifera	Moringaceae
Morus mesozygia	Moraceae
Mostuea Thomsoni	Loganlaceae
Mucuna pruriens	Leguminosae
Mucuna sloanei	Leguminosae
Mukia maderaspatana	Cucurbitaceae
Mundulea Sericera	Leguminosae
Murraya Koenigii	Rultaceae
Musa paradisiaca	Musaceae
Musa sapientum	Musaceae
Musanga cecropioides	Moraceae
Mussaenda elegans	Rubiaceae
Myriantus arboreus	Moraceae
Napoleona imperialis	Lecythidaceae
Napoleona vogelii	Lecythidaceae
Nauclea diderrichii	Rubiaceae
Nauclea latifolia	Rubiaceae
Nelsonia compestria	Acanthaceae
Neostenanthera-myristicifolia	Annonaceae
Nephrolepsis bisserata	Nephrolepidaceae
Nerium oleander	Apocynaceae
Nesogordonia papaverifera	Sterculiaceae
Newbouldia laevis	Bignoniaceae
Nicotiana tabacum	Solanaceae
Nymphaea lotus	Nymphaeceae
Ocimum basilicum	Labiatae
Ocimum gratissimum	Labiatae
Olax subscorpioidea	Olacaceae
Oldelandia corymbosa	Rubiaceae
Olyra latifolia	Poaceae
Oncoba spinosa	Flacourtiaceae
Opilia celtidifolia	Opiliaceae
Opuntia dillenii	Cactaceae
Ouratea flava	Ochnaceae
Oxalis corniculata	Oxalidaceae
Oxyanthus tubiflorus	Rubiaceae
Pachira glabra	Bombacaceae
Pachypodanturum staudtii	Annonaceae
Palisota hirsuta	Commelinaceae
Pallaea schweinfurthii	Adeantaceae
Pancratium trianthum	Liliaceae
Parinari curatellaefolia	Rosaceae
Parinari macrophylla	Rosaceae
Parkia biglobosa	Leguminosae
Paropsia guineansis	Passsfloraceae
Parquetina nigrescens	Periplocaceae
Passiflora foetida	Passifloraceae
Paullinia pinnata	Sapindaceae
Paulowilhelnua polyspernia	Acantuaceae
Pedalium murex	Pedialiaceae
Penianthus zenicem	Menispermaceae
Pennisetum purpureum	Poaceae
Pentaclethra macrophylla	Leguminosae
Pentadesma butyracea	Guttiferae
Peperomia pellucida	Piperaceae
Pergularia daemia	Asclepiadaceae
Pericopsis laxiflora	Leguminosae
Persea americana	Lauraceae
Petersianthus macrocarpus	Lecythidaceae
Petiveria alliacea	Phytolaccaceae
Petroselinum crispum	Apiaceae
Phaseolus vulgaris	Leguminosae
Phaulopsis falcisepala	Acanthaceae
Philoxerus vermiculatus	Amaranthaceae
Phoenix dactylifera	Palmae
Phyllanthus amarus	Euphorbiaceae
Phyllanthus muellerianus	Euphorbiaceae
Physalis angulata	Solanaceae
Physostigma venosum	Leguminosae
Phytolacca dodecandra	Phytolaccaceae
Picralima nitida	Apocynaceae
Piliostigma reticulatum	Leguminosae
Piper guineense	Piperaceae
Piper nigrum	Piperaceae
Piper umbellatum	Piperaceae
Piptadeniastrum africanum	Leguminosae
Pisoria aculeata	Neyctaginaceae
Pistia stratiotes	Araceae
Pleiocarpa pycnantha	Apocynaceae
Pleioceras barteri	Apocynaceae
Plumbago zeylanica	Plumbaginaceae
Plumeria alba	Apocynaceae
Polyalthia suaveolens	Annonaceae
Polygala arenaria	Polygalaceae
Polygonum senegalense	Polygonaceae
Portulaca oleracea	Portulacaceae
Premna quadrifolia	Verbenaceae
Prosopis africana	Leguminosae
Pseudocedrela kotschyi	Meliaceae
Psidium guajava	Myrtaceae
Psorospermum febrifugum	Guttiferae
Psychotria guineensis	Rubiaceae
Pteris togoensis	Adiantaceae
Pterocarpus erinaceus	Leguminosae
Pterocarpus osun	Leguminosae
Pterocarpus santalinioides	Leguminosae
Punica granatum	Puriaceae
Pupalia lappacea	Amaranthaceae
Pycnanthus angolensis	Myristicaceae
Pyrenacantha staudtii	Icacinaceae
Quassia africana	Simaroubaceae
Quisqualis indica	Combretaceae
Rabdia nilotica	Rubiaceae
Raphia hookeri	Palmae
Rauvolfia vomitoria	Apocynaceae
Rauwolfia caffra	Anacardiaceae
Rhaphiostylis beninensis	Icacinaceae
Rhigiocarya racemifera	Menispermaceae
Rhynchosia pycnostachy	Leguminosae
Ricinodendron heudelotii	Euphorbiaceae
Ricinus communis	Euphorbiaceae
Rinorea dentata	Violaceae
Ritchiea brachypoda	Capparaceae
Rothmannia longiflora	Rubiaceae
Rothmannia whitfieldii	Rubiaceae
Ruellia tuberosa	Acanthaceae
Rumex abyssimcus	Polygonaceae
Rungia grandis	Acanthaceae
Rytigynia rubra	Rubiaceae
Saba florida	Apocynaceae
Sabicea calycina	Rubiaceae
Saccharum officinarum	Poaceae
Salvadora persica	Salvadoraceae
Samanea dinklagei	Leguminosae
Sansevieria liberica	Agavaceae
Saphaeranthus senegalensis	Compositae
Sapium ellipticum	Euphorbiaceae
Schlerocarya birrea	Aracandiaceae
Schrobera arborea	Oleaceae
Schumanniophyton magnificum	Rubiaceae
Schwenkia americana	Solanaceae
Scleria depressa	Cyperaceae
Sclerocarya birrea spp caffra	Euphorbiaceae
Scoparia dulcis	Scrophulariaceae
Secamone afzelii	Asclepiadaceae
Securidaca longepedunculata	Polygalaceae
Securinega virosa	Euphorbiaceae
Senecio abyssinicus	Compositae
Senecio biafrae	Compositae
Senna alata	Leguminosae(Caesalpiniaceae)
Senna arabica	Leguminosae(Caesalpiniaceae)
Senna fistula	Leguminosae
Senna hirsuta	Leguminosae
Senna obtusifolia	Leguminosae(Caesalpiniaceae)
Senna occidentalis	Leguminosae
Senna podocarpa	Leguminosae
Senna sieberiana	Leguminosae (Caesalpiniaceae)
Senna tora	Leguminosae (Caesalpiniaceae)
Sesamum indicum	Pedaliaceae
Sesbania grandiflora	Leguminosae
Setaria megaphylla	Poaceae
Sida acuta	Malvaceae
Sida cordifolia	Malvaceae
Sida pilosa	Malvaceae
Sida rhombifolia	Malvaceae
Smeathmannia pubescens	Passifloraceae
Smilax kraussiana	Smilacaceae
Solanum aethiopicum	Solanaceae
Solanum incanum	Solanaceae
Solanum macrocarpon	Solanaceae
Solanum melongena	Solanaceae
Solanum nigrum	Solanaceae
Solanum torvum	Solanaceae
Solenostemon monostachyus	Labiatae
Sophora occidentalis	Leguminosae
Sorghum bicolor	Poaceae
Sorindeia mildbraedii	Anacardaceae
Spathodea campanulata	Bignoniaceae
Sphenocentrum jollyanum	Menispermaceae
Spigelia anthelmia	Loganiaceae
Spilanthes filicaulis	Compositae
Spondianthus preussii	Euphorbiaceae
Spondias mombin	Anacardaceae
Stachytarpheta angustifolia	Verbenaceae
Stachytarpheta indica	Verbenaceae
Steganostaenia araltaceae	Umbelliferae
Stephania abyssinica	Menispermaceae
Sterculia setigera	Sterculiaceae
Sterculia tragacantha	Sterculiaceae
Sterospermum acuminatissimum	Bignoniaceae
Strictocardia beraviensis	Convolvulaceae
Strophanthus gratus	Apocynaceae
Strophanthus hispidus	Apocynaceae
Struchium sparganophora	Compositae
Strycnos nux-vomica	Loganiaceae
Stylosanthes erecta	Loganiaceae
Swartzia madagascariensis	Leguminosae
Symphonia globulifera	Guttiferae
Synctisia scabrida	Menispermaceae
Synedrella nodiflora	Compositae
Synsepalum dulcificum	Sapotaceae
Syzygium guineense	Myrtaceae
Tabebuia impetiginosa	Bignoniaceae
Tabernaemontana pachysiphon	Apocynaceae
Tacca involucrata	Taccacaceae
Taliacoma waraeckei	Menispermaceae
Talinum triangulare	Portulacaceae
Tamarindus indica	Leguminosae
Teclea verdromiona	Rutaceae
Tecoma capensis	Bignonlacea
Tecoma stans	Bignoniaceae
Tectona grandis	Verbenaceae
Telfaria occidentalis	Cucurbitaceae
Tephrosia densiflora	Leguminosae
Terminalia avicennioides	Combretaceae
Terminalia catappa	Combretaceae
Terminalia glaucescens	Combretaceae
Terminalia ivorensis	Combretaceae
Terminalia macroptera	Combretaceae
Terminalia schimperiana	Combretaceae
Terminalia superba	Combretaceae
Tetracarpidium conophorum	Euphorbiaceae
Tetracera alnifolia	Dilleniaceae
Tetrapleura tetraptera	Leguminosae
Tetrochidium didymostemon	Euphorbiaceae
Thaumatococcus daniellii	Marantaceae
Theobroma cacao	Sterculiaceae
Thespesia populnea	Malvaceae
Thevetia neriifolia	Apocynaceae
Thonningia sanguinea	Balanophoraceae
Thunbergia battescombei	Acanthaceae
Tiliacora funifera	Menispermaceae
Tinospora cordifolia	Menispermaceae
Tithonia diversifolia	Asteraceae
Tragia benthani	Euphorbiaceae
Treculia africana	Moraceae
Trema orientalis	Ulmaceae
Trephrosia purpurea	Leguminosae
Trianthema portulacastrum	Ficoidaceae
Tribulus terrestris	Zygophyllaceae
Trichilia emotica	Meliaceae
Trichilia heudelotii	Meliaceae
Trichilia monadelpha	Meliaceae
Trichilia prieureana	Meliaceae
Trichodesma africanum	Boraginaceae
Trichosanthes cucumerina	Cucurbitaceae
Triclisia subcordata	Menispermaceae
Tridax procumbens	Compositae
Trigonelia Foenu-graceum	Leguminosae
Triumfeta cordifolia	Tiliaceae
Turrea vogelii	Meliaceae
Tylophora dahomensis	Asclepidiaceae
Uapaca guineensis	Euphorbiaceae
Uncaria africana	Rubiaceae
Uncaria talbotii	Rubiaceae
Uraria picta	Leguminosae
Urena lobata	Malvaceae
Urginea altissima	Liliaceae
Urtica dioica	Urticaceae
Uvaria afzelii	Annonaceae
Uvaria chamae	Annonaceae
Vernonia amygdalina	Compositae
Vernonia biafrae	Compositae
Vernonia cinerea	Compositae
Vernonia colorata	Compositae
Vernonia guineensis	Compositae
Vernonia oocephala	Compositae
Viscum album	Loranthaceae
Viscum flavescens	Loranthaceae
Vitex cryosocarpa	Verbenaceae
Vitex doniana	Verbenaceae
Voacanga africana	Apocynaceae
Waltheria indica	Sterculiaceae
Warburgia ugandensis	Canellaceae
Wissadula amplissima	Malvaceae
Withania somnifera	Solanaceae
Wood fordia uniflora	Lythraceae
Xeromorphus nilotica	Rubiaceae
Ximenia americana	Olacaceae
Xylopia acutiflora	Anacardiaceae
Xylopia quintasii	Anacardiaceae
Xylopia vilosa	Anacardiaceae
Xylopica aethiopica	Annonaceae
Xysmalobium heudelotiamum	Asclopiadaceae
Zanthoxylum leprieuri	Rutaceae
Zanthoxylum rubenscens	Rutaceae
Zanthoxylum zanthoxyloides	Rutaceae
Zea mays	Poaceae
Zingiber officinale	Zingiberaceae
Ziziphus mauritiana	Rhamnaceae
Ziziphus spina-christi	Rhamnaceae
	
\.


--
-- Data for Name: specimen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specimen (specimencode, countryname, botanicname) FROM stdin;
\.


--
-- Data for Name: therapeuticactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.therapeuticactions (tacode, taname) FROM stdin;
\.


--
-- Data for Name: therapeuticindication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.therapeuticindication (ticode, tiname) FROM stdin;
53	afraegle paniculata
15	anaemia
18	infection
1	emmenagogue
3	dysentery
4	catarrhal infections
5	emollient
6	colds
7	cough
8	convulsion
9	rheumatism
10	conjunctivitis
11	contraceptive
12	antimicrobials
13	aphrodisiac
14	ulcer
16	antidote poison
17	diarrhoea
19	piles
20	backache
21	astringent
22	skin diseases
23	anti-cancer
25	syphilis
26	asthma
27	skin rashes
30	yellow fever
31	tuberculosis
32	stomach disorder
33	migraine
36	anthelmintics
37	haemostatic
38	wound
39	malaria
41	caries
42	hypertension
43	bronchitis
44	stress
112	dermatitis
45	nervous disorder
48	wound dressing
52	bladder stones
60	conjunctivitis
61	craw craw
24	kidney disease
28	flatulence
29	constipation
34	urethral discharge
46	hemorrhoid
47	urinary tract infections
49	snake bite
50	sore throat
51	kidney stones
55	toothache
56	lumbago
57	body pains
58	headache
59	rat ovulation blocked through effect on pituitary gland
62	sleeping sickness
63	erectile dysfunction
68	diabetes
69	parasitosis
70	measles
71	insomnia
73	candidiasis
74	nauseae
75	vomiting
76	hepatitis
79	microbial infections
80	symptoms of menopause
81	dysmenorrhea
82	female infertility
84	buruli ulcer
85	stomach ulcer
86	breast cancer
88	bad breath
89	schizophrenia
92	sinusitis
93	stroke
94	allergic rhinitis
95	gonorrhea
96	azoospermia
103	boils
104	gastroesophageal reflux
109	osteoarthritis
110	liver cancer
64	ache
91	alcoholism
66	fever
67	sickle cell anaemia
72	fungal skin infections
77	prostate
78	prostate cancer
83	HIV/AIDS
87	depression
90	malnutrition
97	liver cirrhosis
98	benign prostatic hyperplasia
99	sexually transmitted infections
100	oligospermia
101	otitis media
102	mental disorders
105	gingivitis
106	stomatitis
107	eczema
111	bacterial skin infections
108	rheumatoid
65	inflammation
\.


--
-- Data for Name: tmp_nameindialect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tmp_nameindialect (name, dialectname, countryname, botanicname) FROM stdin;
\.


--
-- Data for Name: usageprecaution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usageprecaution (precautioncode, precautiondescription) FROM stdin;
\.


--
-- Name: adversereactions pk_adversereactions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adversereactions
    ADD CONSTRAINT pk_adversereactions PRIMARY KEY (arcode);


--
-- Name: chimicalcomponent pk_chimicalcomponent; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chimicalcomponent
    ADD CONSTRAINT pk_chimicalcomponent PRIMARY KEY (ccname);


--
-- Name: contraindications pk_contraindications; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contraindications
    ADD CONSTRAINT pk_contraindications PRIMARY KEY (cicode);


--
-- Name: country pk_country; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT pk_country PRIMARY KEY (countryname);


--
-- Name: dialect pk_dialect; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dialect
    ADD CONSTRAINT pk_dialect PRIMARY KEY (dialectname);


--
-- Name: family pk_family; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family
    ADD CONSTRAINT pk_family PRIMARY KEY (familyname);


--
-- Name: nameindialect pk_nameindialect; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nameindialect
    ADD CONSTRAINT pk_nameindialect PRIMARY KEY (dialectname, countryname, botanicname);


--
-- Name: plant pk_plant; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant
    ADD CONSTRAINT pk_plant PRIMARY KEY (botanicname);


--
-- Name: plantadversereactions pk_plantadversereactions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantadversereactions
    ADD CONSTRAINT pk_plantadversereactions PRIMARY KEY (botanicname, arcode);


--
-- Name: plantcomponents pk_plantcomponents; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantcomponents
    ADD CONSTRAINT pk_plantcomponents PRIMARY KEY (botanicname, ccname);


--
-- Name: plantcontraindications pk_plantcontraindications; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantcontraindications
    ADD CONSTRAINT pk_plantcontraindications PRIMARY KEY (botanicname, cicode);


--
-- Name: plantpart pk_plantpart; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantpart
    ADD CONSTRAINT pk_plantpart PRIMARY KEY (partname);


--
-- Name: plantsinrecipe pk_plantsinrecipe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantsinrecipe
    ADD CONSTRAINT pk_plantsinrecipe PRIMARY KEY (recipecode, botanicname, partname);


--
-- Name: planttherapeuticactions pk_planttherapeuticactions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planttherapeuticactions
    ADD CONSTRAINT pk_planttherapeuticactions PRIMARY KEY (tacode, botanicname);


--
-- Name: planttherapeuticindications pk_planttherapeuticindications; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planttherapeuticindications
    ADD CONSTRAINT pk_planttherapeuticindications PRIMARY KEY (ticode, botanicname);


--
-- Name: plantusageprecaution pk_plantusageprecaution; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantusageprecaution
    ADD CONSTRAINT pk_plantusageprecaution PRIMARY KEY (botanicname, precautioncode);


--
-- Name: recipe pk_recipe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT pk_recipe PRIMARY KEY (recipecode);


--
-- Name: recipeadversereactions pk_recipeadversereactions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipeadversereactions
    ADD CONSTRAINT pk_recipeadversereactions PRIMARY KEY (arcode, recipecode);


--
-- Name: recipecontraindications pk_recipecontraindications; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipecontraindications
    ADD CONSTRAINT pk_recipecontraindications PRIMARY KEY (recipecode, cicode);


--
-- Name: recipetherapeuticindication pk_recipetherapeuticindication; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipetherapeuticindication
    ADD CONSTRAINT pk_recipetherapeuticindication PRIMARY KEY (recipecode, ticode);


--
-- Name: species pk_species; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT pk_species PRIMARY KEY (speciesname);


--
-- Name: specimen pk_specimen; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specimen
    ADD CONSTRAINT pk_specimen PRIMARY KEY (specimencode);


--
-- Name: therapeuticactions pk_therapeuticactions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.therapeuticactions
    ADD CONSTRAINT pk_therapeuticactions PRIMARY KEY (tacode);


--
-- Name: therapeuticindication pk_therapeuticindication; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.therapeuticindication
    ADD CONSTRAINT pk_therapeuticindication PRIMARY KEY (ticode);


--
-- Name: usageprecaution pk_usageprecaution; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usageprecaution
    ADD CONSTRAINT pk_usageprecaution PRIMARY KEY (precautioncode);


--
-- Name: index_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_1 ON public.plant USING btree (botanicname);


--
-- Name: index_10; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_10 ON public.species USING btree (speciesname);


--
-- Name: index_11; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_11 ON public.family USING btree (familyname);


--
-- Name: index_118; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_118 ON public.planttherapeuticindications USING btree (ticode, botanicname);


--
-- Name: index_12; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_12 ON public.contraindications USING btree (cicode);


--
-- Name: index_13; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_13 ON public.adversereactions USING btree (arcode);


--
-- Name: index_14; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_14 ON public.recipe USING btree (recipecode);


--
-- Name: index_15; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_15 ON public.plantpart USING btree (partname);


--
-- Name: index_16; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_16 ON public.therapeuticactions USING btree (tacode);


--
-- Name: index_17; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_17 ON public.therapeuticindication USING btree (ticode);


--
-- Name: index_18; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_18 ON public.planttherapeuticactions USING btree (tacode, botanicname);


--
-- Name: index_19; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_19 ON public.plantadversereactions USING btree (botanicname, arcode);


--
-- Name: index_2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_2 ON public.chimicalcomponent USING btree (ccname);


--
-- Name: index_20; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_20 ON public.plantcontraindications USING btree (botanicname, cicode);


--
-- Name: index_21; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_21 ON public.recipetherapeuticindication USING btree (recipecode, ticode);


--
-- Name: index_22; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_22 ON public.recipeadversereactions USING btree (arcode, recipecode);


--
-- Name: index_23; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_23 ON public.recipecontraindications USING btree (recipecode, cicode);


--
-- Name: index_24; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_24 ON public.plantsinrecipe USING btree (recipecode, botanicname, partname);


--
-- Name: index_3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_3 ON public.nameindialect USING btree (dialectname, countryname, botanicname);


--
-- Name: index_4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_4 ON public.specimen USING btree (specimencode);


--
-- Name: index_5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_5 ON public.usageprecaution USING btree (precautioncode);


--
-- Name: index_6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_6 ON public.country USING btree (countryname);


--
-- Name: index_7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_7 ON public.dialect USING btree (dialectname);


--
-- Name: index_8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_8 ON public.plantcomponents USING btree (botanicname, ccname);


--
-- Name: index_9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_9 ON public.plantusageprecaution USING btree (botanicname, precautioncode);


--
-- Name: tmp_nameindialect fk_nameindi_reference_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmp_nameindialect
    ADD CONSTRAINT fk_nameindi_reference_country FOREIGN KEY (countryname) REFERENCES public.country(countryname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: nameindialect fk_nameindi_reference_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nameindialect
    ADD CONSTRAINT fk_nameindi_reference_country FOREIGN KEY (countryname) REFERENCES public.country(countryname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: tmp_nameindialect fk_nameindi_reference_dialect; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmp_nameindialect
    ADD CONSTRAINT fk_nameindi_reference_dialect FOREIGN KEY (dialectname) REFERENCES public.dialect(dialectname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: nameindialect fk_nameindi_reference_dialect; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nameindialect
    ADD CONSTRAINT fk_nameindi_reference_dialect FOREIGN KEY (dialectname) REFERENCES public.dialect(dialectname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: tmp_nameindialect fk_nameindi_reference_plant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmp_nameindialect
    ADD CONSTRAINT fk_nameindi_reference_plant FOREIGN KEY (botanicname) REFERENCES public.plant(botanicname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: nameindialect fk_nameindi_reference_plant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nameindialect
    ADD CONSTRAINT fk_nameindi_reference_plant FOREIGN KEY (botanicname) REFERENCES public.plant(botanicname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: plant fk_plant_reference_species; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant
    ADD CONSTRAINT fk_plant_reference_species FOREIGN KEY (speciesname) REFERENCES public.species(speciesname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: plantadversereactions fk_plantadv_reference_adverser; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantadversereactions
    ADD CONSTRAINT fk_plantadv_reference_adverser FOREIGN KEY (arcode) REFERENCES public.adversereactions(arcode) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: plantadversereactions fk_plantadv_reference_plant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantadversereactions
    ADD CONSTRAINT fk_plantadv_reference_plant FOREIGN KEY (botanicname) REFERENCES public.plant(botanicname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: plantcomponents fk_plantcom_reference_chimical; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantcomponents
    ADD CONSTRAINT fk_plantcom_reference_chimical FOREIGN KEY (ccname) REFERENCES public.chimicalcomponent(ccname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: plantcomponents fk_plantcom_reference_plant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantcomponents
    ADD CONSTRAINT fk_plantcom_reference_plant FOREIGN KEY (botanicname) REFERENCES public.plant(botanicname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: plantcontraindications fk_plantcon_reference_contrain; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantcontraindications
    ADD CONSTRAINT fk_plantcon_reference_contrain FOREIGN KEY (cicode) REFERENCES public.contraindications(cicode) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: plantcontraindications fk_plantcon_reference_plant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantcontraindications
    ADD CONSTRAINT fk_plantcon_reference_plant FOREIGN KEY (botanicname) REFERENCES public.plant(botanicname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: plantsinrecipe fk_plantsin_reference_plant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantsinrecipe
    ADD CONSTRAINT fk_plantsin_reference_plant FOREIGN KEY (botanicname) REFERENCES public.plant(botanicname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: plantsinrecipe fk_plantsin_reference_plantpar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantsinrecipe
    ADD CONSTRAINT fk_plantsin_reference_plantpar FOREIGN KEY (partname) REFERENCES public.plantpart(partname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: plantsinrecipe fk_plantsin_reference_recipe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantsinrecipe
    ADD CONSTRAINT fk_plantsin_reference_recipe FOREIGN KEY (recipecode) REFERENCES public.recipe(recipecode) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: planttherapeuticactions fk_plantthe_reference_plant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planttherapeuticactions
    ADD CONSTRAINT fk_plantthe_reference_plant FOREIGN KEY (botanicname) REFERENCES public.plant(botanicname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: planttherapeuticindications fk_plantthe_reference_plant1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planttherapeuticindications
    ADD CONSTRAINT fk_plantthe_reference_plant1 FOREIGN KEY (botanicname) REFERENCES public.plant(botanicname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: planttherapeuticactions fk_plantthe_reference_therapeu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planttherapeuticactions
    ADD CONSTRAINT fk_plantthe_reference_therapeu FOREIGN KEY (tacode) REFERENCES public.therapeuticactions(tacode) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: planttherapeuticindications fk_plantthe_reference_therapeu1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planttherapeuticindications
    ADD CONSTRAINT fk_plantthe_reference_therapeu1 FOREIGN KEY (ticode) REFERENCES public.therapeuticindication(ticode) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: plantusageprecaution fk_plantusa_reference_plant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantusageprecaution
    ADD CONSTRAINT fk_plantusa_reference_plant FOREIGN KEY (botanicname) REFERENCES public.plant(botanicname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: plantusageprecaution fk_plantusa_reference_usagepre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantusageprecaution
    ADD CONSTRAINT fk_plantusa_reference_usagepre FOREIGN KEY (precautioncode) REFERENCES public.usageprecaution(precautioncode) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: recipeadversereactions fk_recipead_reference_adverser; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipeadversereactions
    ADD CONSTRAINT fk_recipead_reference_adverser FOREIGN KEY (arcode) REFERENCES public.adversereactions(arcode) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: recipeadversereactions fk_recipead_reference_recipe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipeadversereactions
    ADD CONSTRAINT fk_recipead_reference_recipe FOREIGN KEY (recipecode) REFERENCES public.recipe(recipecode) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: recipecontraindications fk_recipeco_reference_contrain; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipecontraindications
    ADD CONSTRAINT fk_recipeco_reference_contrain FOREIGN KEY (cicode) REFERENCES public.contraindications(cicode) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: recipecontraindications fk_recipeco_reference_recipe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipecontraindications
    ADD CONSTRAINT fk_recipeco_reference_recipe FOREIGN KEY (recipecode) REFERENCES public.recipe(recipecode) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: recipetherapeuticindication fk_recipeth_reference_recipe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipetherapeuticindication
    ADD CONSTRAINT fk_recipeth_reference_recipe FOREIGN KEY (recipecode) REFERENCES public.recipe(recipecode) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: recipetherapeuticindication fk_recipeth_reference_therapeu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipetherapeuticindication
    ADD CONSTRAINT fk_recipeth_reference_therapeu FOREIGN KEY (ticode) REFERENCES public.therapeuticindication(ticode) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: species fk_species_reference_family; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT fk_species_reference_family FOREIGN KEY (familyname) REFERENCES public.family(familyname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: specimen fk_specimen_reference_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specimen
    ADD CONSTRAINT fk_specimen_reference_country FOREIGN KEY (countryname) REFERENCES public.country(countryname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: specimen fk_specimen_reference_plant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specimen
    ADD CONSTRAINT fk_specimen_reference_plant FOREIGN KEY (botanicname) REFERENCES public.plant(botanicname) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

