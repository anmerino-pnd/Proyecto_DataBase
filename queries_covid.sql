UPDATE registros
SET pais_nacionalidad =
    CASE
        WHEN pais_nacionalidad LIKE '%MÃ©xico%' THEN REPLACE(pais_nacionalidad, 'MÃ©xico', 'México')
        WHEN pais_nacionalidad LIKE '%AmÃ©rica%' THEN REPLACE(pais_nacionalidad, 'AmÃ©rica', 'América')
        WHEN pais_nacionalidad LIKE '%TaiwÃ¡n%' THEN REPLACE(pais_nacionalidad, 'TaiwÃ¡n', 'Taiwán')
        WHEN pais_nacionalidad LIKE '%EspaÃ±a%' THEN REPLACE(pais_nacionalidad, 'EspaÃ±a', 'España')
        WHEN pais_nacionalidad LIKE '%JapÃ³n%' THEN REPLACE(pais_nacionalidad, 'JapÃ³n', 'Japón')
        WHEN pais_nacionalidad LIKE '%RepÃºblica%' THEN REPLACE(pais_nacionalidad, 'RepÃºblica', 'República')
        WHEN pais_nacionalidad LIKE '%CanadÃ¡%' THEN REPLACE(pais_nacionalidad, 'CanadÃ¡', 'Canadá')
        WHEN pais_nacionalidad LIKE '%GabÃ³n%' THEN REPLACE(pais_nacionalidad, 'GabÃ³n', 'Gabón')  
        WHEN pais_nacionalidad LIKE '%HaitÃ­%' THEN REPLACE(pais_nacionalidad, 'HaitÃ­', 'Haití')
        WHEN pais_nacionalidad LIKE '%BretaÃ±a%' THEN REPLACE(pais_nacionalidad, 'BretaÃ±a', 'Bretaña')
        WHEN pais_nacionalidad LIKE '%IrÃ¡n%' THEN REPLACE(pais_nacionalidad, 'IrÃ¡n', 'Irán')
        WHEN pais_nacionalidad LIKE '%PerÃº%' THEN REPLACE(pais_nacionalidad, 'PerÃº', 'Perú')
        WHEN pais_nacionalidad LIKE '%PanamÃ¡%' THEN REPLACE(pais_nacionalidad, 'PanamÃ¡', 'Panamá')
        ELSE pais_nacionalidad
    END;

drop table if exists origen;
CREATE TABLE origen (
    CLAVE INT PRIMARY KEY NOT NULL,
    DESCRIPCION VARCHAR(255) NOT NULL,
    UNIQUE (Clave));
INSERT INTO origen (CLAVE, DESCRIPCION)
VALUES (1, 'USMER'),
	   (2, 'FUERA DE USMER'),
       (99, 'NO ESPECIFICADO');

drop table if exists sector;
CREATE TABLE sector (
    CLAVE INT PRIMARY KEY NOT NULL,
    DESCRIPCION VARCHAR(255) NOT NULL,
    UNIQUE (Clave));
INSERT INTO sector (CLAVE, DESCRIPCION)
VALUES (1, 'CRUZ ROJA'),
	   (2, 'DIF'),
       (3, 'ESTATAL'),
       (4, 'IMSS'),
       (5, 'IMSS-BIENESTAR'),
       (6, 'ISSSTE'),
       (7, 'MUNICIPAL'),
       (8, 'PEMEX'),
       (9, 'PRIVADA'),
       (10, 'SEDENA'),
       (11, 'SEMAR'),
       (12, 'SSA'),
       (13, 'UNIVERSITARIO'),
       (99, 'NO ESPECIFICADO');

drop table if exists sexo;
CREATE TABLE sexo (
    CLAVE INT PRIMARY KEY NOT NULL,
    DESCRIPCION VARCHAR(255) NOT NULL,
    UNIQUE (Clave));
INSERT INTO sexo (CLAVE, DESCRIPCION)
VALUES (1, 'MUJER'),
	   (2, 'HOMBRE'),
       (99, 'NO ESPECIFICADO');
       
drop table if exists tipo_paciente;
CREATE TABLE tipo_paciente (
    CLAVE INT PRIMARY KEY NOT NULL,
    DESCRIPCION VARCHAR(255) NOT NULL,
    UNIQUE (Clave));
INSERT INTO tipo_paciente (CLAVE, DESCRIPCION)
VALUES (1, 'AMBULATORIO'),
	   (2, 'HOSPITALIZADO'),
       (99, 'NO ESPECIFICADO');

drop table if exists si_no;
CREATE TABLE si_no (
    CLAVE INT PRIMARY KEY NOT NULL,
    DESCRIPCION VARCHAR(255) NOT NULL,
    UNIQUE (Clave));
INSERT INTO si_no (CLAVE, DESCRIPCION)
VALUES (1, 'SI'),
	   (2, 'NO'),
       (97, 'NO APLICA'),
       (98, 'SE IGNORA'),
       (99, 'NO ESPECIFICADO');

drop table if exists nacionalidad;
CREATE TABLE nacionalidad (
    CLAVE INT PRIMARY KEY NOT NULL,
    DESCRIPCION VARCHAR(255) NOT NULL,
    UNIQUE (Clave));
INSERT INTO nacionalidad (CLAVE, DESCRIPCION)
VALUES (1, 'MEXICANA'),
	   (2, 'EXTRANJERA'),
       (99, 'NO ESPECIFICADO');

drop table if exists resultado_lab;
CREATE TABLE resultado_lab (
    CLAVE INT PRIMARY KEY NOT NULL,
    DESCRIPCION VARCHAR(255) NOT NULL,
    UNIQUE (Clave));
INSERT INTO resultado_lab (CLAVE, DESCRIPCION)
VALUES (1, 'POSITIVO A SARS-COV-2'),
	   (2, 'NO POSITIVO A SARS-COV-2'),
       (3, 'RESULTADO PENDIENTE'),
       (4, 'RESULTADO NO ADECUADO'),
       (97, 'NO APLICA (CASO SIN MUESTRA)');
       
drop table if exists resultado_antigeno;
CREATE TABLE resultado_antigeno (
    CLAVE INT PRIMARY KEY NOT NULL,
    DESCRIPCION VARCHAR(255) NOT NULL,
    UNIQUE (Clave));
INSERT INTO resultado_antigeno (CLAVE, DESCRIPCION)
VALUES (1, 'POSITIVO A SARS-COV-2'),
	   (2, 'NEGATIVO A SARS-COV-2'),
       (97, 'NO APLICA (CASO SIN MUESTRA)');

drop table if exists clasificacion_final;
CREATE TABLE clasificacion_final (
    CLAVE INT PRIMARY KEY NOT NULL,
    DESCRIPCION VARCHAR(255) NOT NULL,
    UNIQUE (Clave));
INSERT INTO clasificacion_final (CLAVE, DESCRIPCION)
VALUES (1, 'CASO DE COVID-19 CONFIRMADO POR ASOCIACIÓN CLÍNICA EPIDEMIOLÓGICA'),
	   (2, 'CASO DE COVID-19 CONFIRMADO POR COMITÉ DE  DICTAMINACIÓN'),
       (3, 'CASO DE SARS-COV-2  CONFIRMADO'),
       (4, 'INVÁLIDO POR LABORATORIO'),
       (5, 'NO REALIZADO POR LABORATORIO'),
       (6, 'CASO SOSPECHOSO'),
       (7, 'NEGATIVO A SARS-COV-2');

drop table if exists entidades;
CREATE TABLE entidades (
    CLAVE_ENTIDAD INT PRIMARY KEY NOT NULL,
    ENTIDAD_FEDERATIVA VARCHAR(255) NOT NULL,
    ABREVIATURA VARCHAR(255) NOT NULL,
    UNIQUE (CLAVE_ENTIDAD));
INSERT INTO entidades (CLAVE_ENTIDAD, ENTIDAD_FEDERATIVA, ABREVIATURA)
VALUES (01, 'AGUASCALIENTES', 'AS'),
	   (02, 'BAJA CALIFORNIA', 'BC'),
       (03, 'BAJA CALIFORNIA SUR', 'BS'),
       (04, 'CAMPECHE', 'CC'),
       (05, 'COAHUILA DE ZARAGOZA', 'CL'),
       (06, 'COLIMA', 'CM'),
       (07, 'CHIAPAS', 'CS'),
       (08, 'CHIHUAHUA', 'CH'),
       (09, 'CIUDAD DE MÉXICO', 'DF'),
       (10, 'DURANGO', 'DG'),
       (11, 'GUANAJUATO', 'GT'),
       (12, 'GUERRERO', 'GR'),
       (13, 'HIDALGO', 'HG'),
       (14, 'JALISCO', 'JC'),
       (15, 'MÉXICO', 'MC'),
       (16, 'MICHOACÁN DE OCAMPO', 'MN'),
       (17, 'MORELOS', 'MS'),
       (18, 'NAYARIT', ''),
       (19, 'NUEVO LEÓN', 'NL'),
       (20, 'OAXACA', 'OC'),
       (21, 'PUEBLA', 'PL'),
       (22, 'QUERÉTARO', 'QT'),
       (23, 'QUINTANA ROO', 'QR'),
       (24, 'SAN LUIS POTOSÍ', 'SP'),
       (25, 'SINALOA', 'SL'),
       (26, 'SONORA', 'SR'),
       (27, 'TABASCO', 'TC'),
       (28, 'TAMAULIPAS', 'TS'),
       (29, 'TLAXCALA', 'TL'),
       (30, 'VERACRUZ DE IGNACIO DE LA LLAVE', 'VZ'),
       (31, 'YUCATÁN', 'YN'),
       (32, 'ZACATECAS', 'ZS'),
       (36, 'ESTADOS UNIDOS MEXICANOS', 'EUM'),
       (97, 'NO APLICA', 'NA'),
       (98, 'SE IGNORA', 'SI'),
       (99, 'NO ESPECIFICADO', 'NE');
       
-- Datos MÁS relevantes para la persona que quiera ver esta Base de Datos
DELIMITER //
DROP VIEW IF EXISTS registros_vista;
CREATE VIEW registros_vista AS
SELECT 
FECHA_INGRESO, SEXO, EDAD, ENTIDAD_NAC, ENTIDAD_RES, MUNICIPIO_RES, PAIS_NACIONALIDAD, FECHA_DEF, SECTOR, 
TIPO_PACIENTE, INTUBADO, NEUMONIA, EMBARAZO, HABLA_LENGUA_INDIG, INDIGENA, DIABETES, EPOC, ASMA, INMUSUPR,
 HIPERTENSION, OTRA_COM, CARDIOVASCULAR, OBESIDAD, RENAL_CRONICA, TABAQUISMO, OTRO_CASO, TOMA_MUESTRA_LAB,
 RESULTADO_LAB, TOMA_MUESTRA_ANTIGENO, RESULTADO_ANTIGENO, CLASIFICACION_FINAL, MIGRANTE, UCI
FROM registros; //

DELIMITER //
DROP PROCEDURE IF EXISTS indigenas_por_estado;
CREATE PROCEDURE indigenas_por_estado() 
BEGIN
	SELECT en.ENTIDAD_FEDERATIVA as Entidad,
	SUM(case when re.sexo = 1 then 1 else 0 end) as Mujeres,
	SUM(case when re.sexo = 2 then 1 else 0 end) as Hombres,
	SUM(case when re.indigena = 1 and sexo = 1 then 1 else 0 end) as 'Mujeres Indigenas',
	SUM(case when re.indigena = 1 and sexo = 2 then 1 else 0 end) as 'Hombres Indigenas',
	count(*) as 'Total por Estado'
	FROM registros_vista re, entidades en
	WHERE re.ENTIDAD_RES = en.CLAVE_ENTIDAD
	GROUP BY ENTIDAD_FEDERATIVA
	ORDER BY Entidad;
END //

DELIMITER //
DROP PROCEDURE IF EXISTS casos_tipo_paciente;
CREATE PROCEDURE casos_tipo_paciente()
BEGIN
	SELECT en.ENTIDAD_FEDERATIVA AS 'ESTADO', ti.DESCRIPCION AS 'TIPO DE PACIENTE', COUNT(*) AS 'TOTAL DE CASOS'
	FROM registros_vista re, tipo_paciente ti, entidades en
	WHERE re.ENTIDAD_RES = en.CLAVE_ENTIDAD
	AND re.TIPO_PACIENTE = ti.CLAVE
	GROUP BY en.ENTIDAD_FEDERATIVA , ti.DESCRIPCION
	ORDER BY en.ENTIDAD_FEDERATIVA;
END // 

DELIMITER // 
DROP PROCEDURE IF EXISTS PacientesMenores_x_Estado;
CREATE PROCEDURE PacientesMenores_x_Estado (IN idEstado INT)
READS SQL DATA
BEGIN
	SELECT mu.MUNICIPIO AS 'Municipio de Residencia',
    COUNT(re.MUNICIPIO_RES) AS Casos
	FROM registros_vista re, municipios mu
	WHERE mu.CLAVE_MUNICIPIO = re.MUNICIPIO_RES
	AND mu.CLAVE_ENTIDAD = re.ENTIDAD_RES
	AND re.ENTIDAD_RES = idEstado
	AND re.EDAD < 18
	GROUP BY mu.MUNICIPIO
    ORDER BY mu.MUNICIPIO;
END //

DELIMITER // 
DROP PROCEDURE IF EXISTS PacientesMayores_x_Estado;
CREATE PROCEDURE PacientesMayores_x_Estado (IN idEstado INT)
READS SQL DATA
BEGIN
	SELECT mu.MUNICIPIO AS 'Municipio de Residencia',
    COUNT(re.MUNICIPIO_RES) AS Casos
	FROM registros_vista re, municipios mu
	WHERE mu.CLAVE_MUNICIPIO = re.MUNICIPIO_RES
	AND mu.CLAVE_ENTIDAD = re.ENTIDAD_RES
	AND re.ENTIDAD_RES = idEstado
	AND re.EDAD >= 60
	GROUP BY mu.MUNICIPIO
    ORDER BY mu.MUNICIPIO;
END //

DELIMITER // 
DROP PROCEDURE IF EXISTS defunciones_x_edad;
CREATE PROCEDURE defunciones_x_edad()
BEGIN
	SELECT en.ENTIDAD_FEDERATIVA as 'ESTADO',
	SUM(case when re.edad <18 then 1 else 0 end) as 'Menores de edad',
	SUM(case when re.edad between 18 and 59 then 1 else 0 end) as 'Mayores de edad',
	SUM(case when re.edad >= 60 then 1 else 0 end) as 'Adultos mayores',
	count(*) as 'Total de defunciones'
	FROM registros_vista re, entidades en	
	WHERE re.FECHA_DEF not like '%9999-99-99%'
	AND re.ENTIDAD_RES = en.CLAVE_ENTIDAD
	GROUP BY en.ENTIDAD_FEDERATIVA
	ORDER BY en.ENTIDAD_FEDERATIVA;
END //


DELIMITER //
DROP FUNCTION IF EXISTS casos_sexo;
CREATE FUNCTION casos_sexo (sexo_id int) RETURNS int
DETERMINISTIC
begin
	DECLARE sexo_count int;
	SELECT count(*) as 'Numero de casos' into sexo_count from registros_vista where sexo = sexo_id;
    RETURN sexo_count;
end//

DELIMITER //
DROP FUNCTION IF EXISTS id_entidad;
CREATE FUNCTION id_entidad(nombre_entidad varchar(255)) returns int
deterministic
begin
	DECLARE id_ent int;
    SELECT CLAVE_ENTIDAD into id_ent from registros_vista re, entidades en where en.ENTIDAD_FEDERATIVA = nombre_entidad
    GROUP BY CLAVE_ENTIDAD;
    RETURN id_ent ;
end//

