/* Insert data into territory table */
INSERT INTO TERRITORY(TER_NAME,TER_TYPE)
SELECT DISTINCT TERNAME,TERTYPENAME
FROM ZNO_TABLE 
WHERE NOT EXISTS (SELECT 1 FROM TERRITORY WHERE TER_NAME = TERNAME AND TER_TYPE =TERTYPENAME);

INSERT INTO TERRITORY(TER_NAME,TER_TYPE)
SELECT DISTINCT UKRPTTERNAME,NULL
FROM ZNO_TABLE
WHERE UKRPTTERNAME IS NOT NULL 
AND NOT EXISTS (SELECT 1 FROM TERRITORY WHERE TER_NAME = UKRPTTERNAME);

INSERT INTO TERRITORY(TER_NAME,TER_TYPE)
SELECT DISTINCT HISTPTTERNAME,NULL
FROM ZNO_TABLE
WHERE HISTPTTERNAME IS NOT NULL 
AND NOT EXISTS (SELECT 1 FROM TERRITORY WHERE TER_NAME = HISTPTTERNAME);

INSERT INTO TERRITORY(TER_NAME,TER_TYPE)
SELECT DISTINCT MATHPTTERNAME,NULL
FROM ZNO_TABLE
WHERE MATHPTTERNAME IS NOT NULL 
AND NOT EXISTS (SELECT 1 FROM TERRITORY WHERE TER_NAME = MATHPTTERNAME);

INSERT INTO TERRITORY(TER_NAME,TER_TYPE)
SELECT DISTINCT PHYSPTTERNAME,NULL
FROM ZNO_TABLE
WHERE PHYSPTTERNAME IS NOT NULL 
AND NOT EXISTS (SELECT 1 FROM TERRITORY WHERE TER_NAME = PHYSPTTERNAME);

INSERT INTO TERRITORY(TER_NAME,TER_TYPE)
SELECT DISTINCT CHEMPTTERNAME,NULL
FROM ZNO_TABLE
WHERE CHEMPTTERNAME IS NOT NULL 
AND NOT EXISTS (SELECT 1 FROM TERRITORY WHERE TER_NAME = CHEMPTTERNAME);

INSERT INTO TERRITORY(TER_NAME,TER_TYPE)
SELECT DISTINCT BIOPTTERNAME,NULL
FROM ZNO_TABLE
WHERE BIOPTTERNAME IS NOT NULL 
AND NOT EXISTS (SELECT 1 FROM TERRITORY WHERE TER_NAME = BIOPTTERNAME);

INSERT INTO TERRITORY(TER_NAME,TER_TYPE)
SELECT DISTINCT GEOPTTERNAME,NULL
FROM ZNO_TABLE
WHERE GEOPTTERNAME IS NOT NULL 
AND NOT EXISTS (SELECT 1 FROM TERRITORY WHERE TER_NAME = GEOPTTERNAME);

INSERT INTO TERRITORY(TER_NAME,TER_TYPE)
SELECT DISTINCT ENGPTTERNAME,NULL
FROM ZNO_TABLE
WHERE ENGPTTERNAME IS NOT NULL 
AND NOT EXISTS (SELECT 1 FROM TERRITORY WHERE TER_NAME = ENGPTTERNAME);

INSERT INTO TERRITORY(TER_NAME,TER_TYPE)
SELECT DISTINCT FRAPTTERNAME,NULL
FROM ZNO_TABLE
WHERE FRAPTTERNAME IS NOT NULL 
AND NOT EXISTS (SELECT 1 FROM TERRITORY WHERE TER_NAME = FRAPTTERNAME);

INSERT INTO TERRITORY(TER_NAME,TER_TYPE)
SELECT DISTINCT DEUPTTERNAME,NULL
FROM ZNO_TABLE
WHERE DEUPTTERNAME IS NOT NULL 
AND NOT EXISTS (SELECT 1 FROM TERRITORY WHERE TER_NAME = DEUPTTERNAME);

INSERT INTO TERRITORY(TER_NAME,TER_TYPE)
SELECT DISTINCT SPAPTTERNAME,NULL
FROM ZNO_TABLE
WHERE SPAPTTERNAME IS NOT NULL 
AND NOT EXISTS (SELECT 1 FROM TERRITORY WHERE TER_NAME = SPAPTTERNAME);

/*Insert data into location table*/

INSERT INTO Location(REGION,AREA,TERRITORY)
SELECT DISTINCT REGNAME,AREANAME,TERNAME
FROM ZNO_TABLE 
WHERE NOT EXISTS (SELECT 1 FROM Location WHERE REGION = REGNAME AND AREA=AREANAME and TERRITORY = TERNAME);

INSERT INTO Location(REGION,AREA,TERRITORY)
SELECT DISTINCT UKRPTREGNAME,UKRPTAREANAME,UKRPTTERNAME
FROM ZNO_TABLE
WHERE NOT EXISTS (SELECT 1 FROM Location WHERE REGION = UKRPTREGNAME AND AREA=UKRPTAREANAME and TERRITORY = UKRPTTERNAME);

INSERT INTO Location(REGION,AREA,TERRITORY)
SELECT DISTINCT HISTPTREGNAME,HISTPTAREANAME,HISTPTTERNAME
FROM ZNO_TABLE
WHERE NOT EXISTS (SELECT 1 FROM Location WHERE REGION = HISTPTREGNAME AND AREA=HISTPTAREANAME and TERRITORY = HISTPTTERNAME);

INSERT INTO Location(REGION,AREA,TERRITORY)
SELECT DISTINCT MATHPTREGNAME,MATHPTAREANAME,MATHPTTERNAME
FROM ZNO_TABLE
WHERE NOT EXISTS (SELECT 1 FROM Location WHERE REGION = MATHPTREGNAME AND AREA=MATHPTAREANAME and TERRITORY = MATHPTTERNAME);

INSERT INTO Location(REGION,AREA,TERRITORY)
SELECT DISTINCT PHYSPTREGNAME,PHYSPTAREANAME,PHYSPTTERNAME
FROM ZNO_TABLE
WHERE NOT EXISTS (SELECT 1 FROM Location WHERE REGION = PHYSPTREGNAME AND AREA=PHYSPTAREANAME and TERRITORY = PHYSPTTERNAME);

INSERT INTO Location(REGION,AREA,TERRITORY)
SELECT DISTINCT CHEMPTREGNAME,CHEMPTAREANAME,CHEMPTTERNAME
FROM ZNO_TABLE
WHERE NOT EXISTS (SELECT 1 FROM Location WHERE REGION = CHEMPTREGNAME AND AREA=CHEMPTAREANAME and TERRITORY = CHEMPTTERNAME);

INSERT INTO Location(REGION,AREA,TERRITORY)
SELECT DISTINCT BIOPTREGNAME,BIOPTAREANAME,BIOPTTERNAME
FROM ZNO_TABLE
WHERE NOT EXISTS (SELECT 1 FROM Location WHERE REGION = BIOPTREGNAME AND AREA=BIOPTAREANAME and TERRITORY = BIOPTTERNAME);

INSERT INTO Location(REGION,AREA,TERRITORY)
SELECT DISTINCT GEOPTREGNAME,GEOPTAREANAME,GEOPTTERNAME
FROM ZNO_TABLE
WHERE NOT EXISTS (SELECT 1 FROM Location WHERE REGION = GEOPTREGNAME AND AREA=GEOPTAREANAME and TERRITORY = GEOPTTERNAME);

INSERT INTO Location(REGION,AREA,TERRITORY)
SELECT DISTINCT ENGPTREGNAME,ENGPTAREANAME,ENGPTTERNAME
FROM ZNO_TABLE
WHERE NOT EXISTS (SELECT 1 FROM Location WHERE REGION = ENGPTREGNAME AND AREA=ENGPTAREANAME and TERRITORY = ENGPTTERNAME);

INSERT INTO Location(REGION,AREA,TERRITORY)
SELECT DISTINCT FRAPTREGNAME,FRAPTAREANAME,FRAPTTERNAME
FROM ZNO_TABLE
WHERE NOT EXISTS (SELECT 1 FROM Location WHERE REGION = FRAPTREGNAME AND AREA=FRAPTAREANAME and TERRITORY = FRAPTTERNAME);

INSERT INTO Location(REGION,AREA,TERRITORY)
SELECT DISTINCT DEUPTREGNAME,DEUPTAREANAME,DEUPTTERNAME
FROM ZNO_TABLE
WHERE NOT EXISTS (SELECT 1 FROM Location WHERE REGION = DEUPTREGNAME AND AREA=DEUPTAREANAME and TERRITORY = DEUPTTERNAME);

INSERT INTO Location(REGION,AREA,TERRITORY)
SELECT DISTINCT SPAPTREGNAME,SPAPTAREANAME,SPAPTTERNAME
FROM ZNO_TABLE
WHERE NOT EXISTS (SELECT 1 FROM Location WHERE REGION = SPAPTREGNAME AND AREA=SPAPTAREANAME and TERRITORY = SPAPTTERNAME);

/*Insert data into institution table*/

INSERT INTO INSTITUTION(INSTITUTION_NAME,PARENT_NAME,INST_TYPE,LOCATION_ID)
SELECT DISTINCT
	Z.EONAME,
	Z.EOPARENT,
	Z.EOTYPENAME,
	L.LOCATION_ID
FROM ZNO_TABLE Z
LEFT JOIN LOCATION L ON Z.EOREGNAME = L.REGION
AND Z.EOTERNAME = L.TERRITORY
AND Z.EOAREANAME = L.AREA
WHERE Z.EONAME IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM INSTITUTION WHERE Z.EONAME=INSTITUTION_NAME);

INSERT INTO INSTITUTION(INSTITUTION_NAME,PARENT_NAME,INST_TYPE,LOCATION_ID)   
SELECT DISTINCT
        Z.UKRPTNAME,
        NULL,
        NULL,
        L.LOCATION_ID
FROM ZNO_TABLE Z
LEFT JOIN LOCATION L ON Z.UKRPTREGNAME = L.REGION
AND Z.UKRPTTERNAME = L.TERRITORY
AND Z.UKRPTAREANAME = L.AREA
WHERE Z.UKRPTNAME IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM INSTITUTION WHERE Z.UKRPTNAME=INSTITUTION_NAME);


INSERT INTO INSTITUTION(INSTITUTION_NAME,PARENT_NAME,INST_TYPE,LOCATION_ID)
SELECT DISTINCT
        Z.HISTPTNAME,
        NULL,
        NULL,
        L.LOCATION_ID
FROM ZNO_TABLE Z
LEFT JOIN LOCATION L ON Z.HISTPTREGNAME = L.REGION
AND Z.HISTPTTERNAME = L.TERRITORY
AND Z.HISTPTAREANAME = L.AREA
WHERE Z.HISTPTNAME IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM INSTITUTION WHERE Z.HISTPTNAME=INSTITUTION_NAME);


INSERT INTO INSTITUTION(INSTITUTION_NAME,PARENT_NAME,INST_TYPE,LOCATION_ID)
SELECT DISTINCT
        Z.MATHPTNAME,
        NULL,
        NULL,
        L.LOCATION_ID
FROM ZNO_TABLE Z
LEFT JOIN LOCATION L ON Z.MATHPTREGNAME = L.REGION
AND Z.MATHPTTERNAME = L.TERRITORY
AND Z.MATHPTAREANAME = L.AREA
WHERE Z.MATHPTNAME IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM INSTITUTION WHERE Z.MATHPTNAME=INSTITUTION_NAME);


INSERT INTO INSTITUTION(INSTITUTION_NAME,PARENT_NAME,INST_TYPE,LOCATION_ID)
SELECT DISTINCT
        Z.PHYSPTNAME,
        NULL,
        NULL,
        L.LOCATION_ID
FROM ZNO_TABLE Z
LEFT JOIN LOCATION L ON Z.PHYSPTREGNAME = L.REGION
AND Z.PHYSPTTERNAME = L.TERRITORY
AND Z.PHYSPTAREANAME = L.AREA
WHERE Z.PHYSPTNAME IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM INSTITUTION WHERE Z.PHYSPTNAME=INSTITUTION_NAME);


INSERT INTO INSTITUTION(INSTITUTION_NAME,PARENT_NAME,INST_TYPE,LOCATION_ID)
SELECT DISTINCT
        Z.CHEMPTNAME,
        NULL,
        NULL,
        L.LOCATION_ID
FROM ZNO_TABLE Z
LEFT JOIN LOCATION L ON Z.CHEMPTREGNAME = L.REGION
AND Z.CHEMPTTERNAME = L.TERRITORY
AND Z.CHEMPTAREANAME = L.AREA
WHERE Z.CHEMPTNAME IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM INSTITUTION WHERE Z.CHEMPTNAME=INSTITUTION_NAME);


INSERT INTO INSTITUTION(INSTITUTION_NAME,PARENT_NAME,INST_TYPE,LOCATION_ID)
SELECT DISTINCT
        Z.BIOPTNAME,
        NULL,
        NULL,
        L.LOCATION_ID
FROM ZNO_TABLE Z
LEFT JOIN LOCATION L ON Z.BIOPTREGNAME = L.REGION
AND Z.BIOPTTERNAME = L.TERRITORY
AND Z.BIOPTAREANAME = L.AREA
WHERE Z.BIOPTNAME IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM INSTITUTION WHERE Z.BIOPTNAME=INSTITUTION_NAME);


INSERT INTO INSTITUTION(INSTITUTION_NAME,PARENT_NAME,INST_TYPE,LOCATION_ID)
SELECT DISTINCT
        Z.GEOPTNAME,
        NULL,
        NULL,
        L.LOCATION_ID
FROM ZNO_TABLE Z
LEFT JOIN LOCATION L ON Z.GEOPTREGNAME = L.REGION
AND Z.GEOPTTERNAME = L.TERRITORY
AND Z.GEOPTAREANAME = L.AREA
WHERE Z.GEOPTNAME IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM INSTITUTION WHERE Z.GEOPTNAME=INSTITUTION_NAME);


INSERT INTO INSTITUTION(INSTITUTION_NAME,PARENT_NAME,INST_TYPE,LOCATION_ID)
SELECT DISTINCT
        Z.ENGPTNAME,
        NULL,
        NULL,
        L.LOCATION_ID
FROM ZNO_TABLE Z
LEFT JOIN LOCATION L ON Z.ENGPTREGNAME = L.REGION
AND Z.ENGPTTERNAME = L.TERRITORY
AND Z.ENGPTAREANAME = L.AREA
WHERE Z.ENGPTNAME IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM INSTITUTION WHERE Z.ENGPTNAME=INSTITUTION_NAME);


INSERT INTO INSTITUTION(INSTITUTION_NAME,PARENT_NAME,INST_TYPE,LOCATION_ID)
SELECT DISTINCT
        Z.FRAPTNAME,
        NULL,
        NULL,
        L.LOCATION_ID
FROM ZNO_TABLE Z
LEFT JOIN LOCATION L ON Z.FRAPTREGNAME = L.REGION
AND Z.FRAPTTERNAME = L.TERRITORY
AND Z.FRAPTAREANAME = L.AREA
WHERE Z.FRAPTNAME IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM INSTITUTION WHERE Z.FRAPTNAME=INSTITUTION_NAME);


INSERT INTO INSTITUTION(INSTITUTION_NAME,PARENT_NAME,INST_TYPE,LOCATION_ID)
SELECT DISTINCT
        Z.DEUPTNAME,
        NULL,
        NULL,
        L.LOCATION_ID
FROM ZNO_TABLE Z
LEFT JOIN LOCATION L ON Z.DEUPTREGNAME = L.REGION
AND Z.DEUPTTERNAME = L.TERRITORY
AND Z.DEUPTAREANAME = L.AREA
WHERE Z.DEUPTNAME IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM INSTITUTION WHERE Z.DEUPTNAME=INSTITUTION_NAME);


INSERT INTO INSTITUTION(INSTITUTION_NAME,PARENT_NAME,INST_TYPE,LOCATION_ID)
SELECT DISTINCT
        Z.SPAPTNAME,
        NULL,
        NULL,
        L.LOCATION_ID
FROM ZNO_TABLE Z
LEFT JOIN LOCATION L ON Z.SPAPTREGNAME = L.REGION
AND Z.SPAPTTERNAME = L.TERRITORY
AND Z.SPAPTAREANAME = L.AREA
WHERE Z.SPAPTNAME IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM INSTITUTION WHERE Z.SPAPTNAME=INSTITUTION_NAME);


/*Insert data into person table*/

INSERT INTO PERSON(PERSON_ID,BIRTH,SEX,INSTITUTION_ID,STUDENT_TYPE,CLASS_PROFILE,CLASS_LANG,LOCATION_ID)
SELECT DISTINCT
	Z.OUTID,
	Z.BIRTH,
	Z.SEXTYPENAME,
	I.INSTITUTION_ID,
	Z.REGTYPENAME,
	Z.CLASSPROFILENAME,
	Z.CLASSLANGNAME,
	L.LOCATION_ID
FROM ZNO_TABLE Z
LEFT JOIN LOCATION L ON Z.REGNAME = L.REGION
AND Z.TERNAME = L.TERRITORY
AND Z.AREANAME = L.AREA
LEFT JOIN INSTITUTION I ON Z.EONAME = I.INSTITUTION_NAME
AND Z.EOPARENT = I.PARENT_NAME
WHERE NOT EXISTS (SELECT 1 FROM PERSON WHERE OUTID=PERSON_ID)
ON CONFLICT (PERSON_ID) DO NOTHING;

/*Insert data into znoresult table*/

INSERT INTO ZNORESULT(PERSON_ID,TEST_NAME,TEST_STATUS,TEST_INSTITUTION,
                                          BALL100, BALL12, BALL, ADAPT_SCALE,DPA_LEVEL,EXAM_YEAR,TEST_LANG)
SELECT
        S.PERSON_ID,
		Z.UKRTEST,
        Z.UKRTESTSTATUS,
        I.INSTITUTION_ID,
        Z.UKRBALL100,
        Z.UKRBALL12, 
        Z.UKRBALL, 
        Z.UKRADAPTSCALE,
        NULL,
        Z.EXAMYEAR,
        NULL

FROM ZNO_TABLE Z
LEFT JOIN PERSON S ON S.PERSON_ID = Z.OUTID
LEFT JOIN INSTITUTION I ON Z.UKRPTNAME = I.INSTITUTION_NAME;



INSERT INTO ZNORESULT(PERSON_ID,TEST_NAME,TEST_STATUS,TEST_INSTITUTION,
                                          BALL100, BALL12, BALL, ADAPT_SCALE,DPA_LEVEL,EXAM_YEAR,TEST_LANG)
SELECT
        S.PERSON_ID,
		Z.HISTTEST,
        Z.HISTTESTSTATUS,
        I.INSTITUTION_ID,
        Z.HISTBALL100,
        Z.HISTBALL12,
        Z.HISTBALL,
        NULL,
        NULL,
        Z.EXAMYEAR,
        Z.HISTLANG

FROM ZNO_TABLE Z
LEFT JOIN PERSON S ON S.PERSON_ID = Z.OUTID
LEFT JOIN INSTITUTION I ON Z.HISTPTNAME = I.INSTITUTION_NAME;



INSERT INTO ZNORESULT(PERSON_ID,TEST_NAME,TEST_STATUS,TEST_INSTITUTION,
                                          BALL100, BALL12, BALL, ADAPT_SCALE,DPA_LEVEL,EXAM_YEAR,TEST_LANG)
SELECT
        S.PERSON_ID,
		Z.MATHTEST,
        Z.MATHTESTSTATUS,
        I.INSTITUTION_ID,
        Z.MATHBALL100,
        Z.MATHBALL12,
        Z.MATHBALL,
        NULL,
        NULL,
        Z.EXAMYEAR,
        Z.MATHLANG

FROM ZNO_TABLE Z
LEFT JOIN PERSON S ON S.PERSON_ID = Z.OUTID
LEFT JOIN INSTITUTION I ON Z.MATHPTNAME = I.INSTITUTION_NAME;



INSERT INTO ZNORESULT(PERSON_ID,TEST_NAME,TEST_STATUS,TEST_INSTITUTION,
                                          BALL100, BALL12, BALL, ADAPT_SCALE,DPA_LEVEL,EXAM_YEAR,TEST_LANG)
SELECT
        S.PERSON_ID,
		Z.PHYSTEST,
        Z.PHYSTESTSTATUS,
        I.INSTITUTION_ID,
        Z.PHYSBALL100,
        Z.PHYSBALL12,
        Z.PHYSBALL,
        NULL,
        NULL,
        Z.EXAMYEAR,
        Z.PHYSLANG

FROM ZNO_TABLE Z
LEFT JOIN PERSON S ON S.PERSON_ID = Z.OUTID
LEFT JOIN INSTITUTION I ON Z.PHYSPTNAME = I.INSTITUTION_NAME;



INSERT INTO ZNORESULT(PERSON_ID,TEST_NAME,TEST_STATUS,TEST_INSTITUTION,
                                          BALL100, BALL12, BALL, ADAPT_SCALE,DPA_LEVEL,EXAM_YEAR,TEST_LANG)
SELECT
        S.PERSON_ID,
		Z.CHEMTEST,
        Z.CHEMTESTSTATUS,
        I.INSTITUTION_ID,
        Z.CHEMBALL100,
        Z.CHEMBALL12,
        Z.CHEMBALL,
        NULL,
        NULL,
        Z.EXAMYEAR,
        Z.CHEMLANG

FROM ZNO_TABLE Z
LEFT JOIN PERSON S ON S.PERSON_ID = Z.OUTID
LEFT JOIN INSTITUTION I ON Z.CHEMPTNAME = I.INSTITUTION_NAME;



INSERT INTO ZNORESULT(PERSON_ID,TEST_NAME,TEST_STATUS,TEST_INSTITUTION,
                                          BALL100, BALL12, BALL, ADAPT_SCALE,DPA_LEVEL,EXAM_YEAR,TEST_LANG)
SELECT
        S.PERSON_ID,
		Z.BIOTEST,
        Z.BIOTESTSTATUS,
        I.INSTITUTION_ID,
        Z.BIOBALL100,
        Z.BIOBALL12,
        Z.BIOBALL,
        NULL,
        NULL,
        Z.EXAMYEAR,
        Z.BIOLANG

FROM ZNO_TABLE Z
LEFT JOIN PERSON S ON S.PERSON_ID = Z.OUTID
LEFT JOIN INSTITUTION I ON Z.BIOPTNAME = I.INSTITUTION_NAME;



INSERT INTO ZNORESULT(PERSON_ID,TEST_NAME,TEST_STATUS,TEST_INSTITUTION,
                                          BALL100, BALL12, BALL, ADAPT_SCALE,DPA_LEVEL,EXAM_YEAR,TEST_LANG)
SELECT
        S.PERSON_ID,
		Z.GEOTEST,
        Z.GEOTESTSTATUS,
        I.INSTITUTION_ID,
        Z.GEOBALL100,
        Z.GEOBALL12,
        Z.GEOBALL,
        NULL,
        NULL,
        Z.EXAMYEAR,
        Z.GEOLANG

FROM ZNO_TABLE Z
LEFT JOIN PERSON S ON S.PERSON_ID = Z.OUTID
LEFT JOIN INSTITUTION I ON Z.GEOPTNAME = I.INSTITUTION_NAME;



INSERT INTO ZNORESULT(PERSON_ID,TEST_NAME,TEST_STATUS,TEST_INSTITUTION,
                                          BALL100, BALL12, BALL, ADAPT_SCALE,DPA_LEVEL,EXAM_YEAR,TEST_LANG)
SELECT
        S.PERSON_ID,
		Z.ENGTEST,
        Z.ENGTESTSTATUS,
        I.INSTITUTION_ID,
        Z.ENGBALL100,
        Z.ENGBALL12,
        Z.ENGBALL,
        NULL,
        Z.ENGDPALEVEL,
        Z.EXAMYEAR,
        NULL

FROM ZNO_TABLE Z
LEFT JOIN PERSON S ON S.PERSON_ID = Z.OUTID
LEFT JOIN INSTITUTION I ON Z.ENGPTNAME = I.INSTITUTION_NAME;



INSERT INTO ZNORESULT(PERSON_ID,TEST_NAME,TEST_STATUS,TEST_INSTITUTION,
                                          BALL100, BALL12, BALL, ADAPT_SCALE,DPA_LEVEL,EXAM_YEAR,TEST_LANG)
SELECT
        S.PERSON_ID,
		Z.FRATEST,
        Z.FRATESTSTATUS,
        I.INSTITUTION_ID,
        Z.FRABALL100,
        Z.FRABALL12,
        Z.FRABALL,
        NULL,
        Z.FRADPALEVEL,
        Z.EXAMYEAR,
        NULL

FROM ZNO_TABLE Z
LEFT JOIN PERSON S ON S.PERSON_ID = Z.OUTID
LEFT JOIN INSTITUTION I ON Z.FRAPTNAME = I.INSTITUTION_NAME;



INSERT INTO ZNORESULT(PERSON_ID,TEST_NAME,TEST_STATUS,TEST_INSTITUTION,
                                          BALL100, BALL12, BALL, ADAPT_SCALE,DPA_LEVEL,EXAM_YEAR,TEST_LANG)
SELECT
        S.PERSON_ID,
		Z.DEUTEST,
        Z.DEUTESTSTATUS,
        I.INSTITUTION_ID,
        Z.DEUBALL100,
        Z.DEUBALL12,
        Z.DEUBALL,
        NULL,
        Z.DEUDPALEVEL,
        Z.EXAMYEAR,
        NULL

FROM ZNO_TABLE Z
LEFT JOIN PERSON S ON S.PERSON_ID = Z.OUTID
LEFT JOIN INSTITUTION I ON Z.DEUPTNAME = I.INSTITUTION_NAME;



INSERT INTO ZNORESULT(PERSON_ID,TEST_NAME,TEST_STATUS,TEST_INSTITUTION,
                                          BALL100, BALL12, BALL, ADAPT_SCALE,DPA_LEVEL,EXAM_YEAR,TEST_LANG)
SELECT
        S.PERSON_ID,
		Z.SPATEST,
        Z.SPATESTSTATUS,
        I.INSTITUTION_ID,
        Z.SPABALL100,
        Z.SPABALL12,
        Z.SPABALL,
        NULL,
        Z.SPADPALEVEL,
        Z.EXAMYEAR,
        NULL

FROM ZNO_TABLE Z
LEFT JOIN PERSON S ON S.PERSON_ID = Z.OUTID
LEFT JOIN INSTITUTION I ON Z.SPAPTNAME = I.INSTITUTION_NAME;

