SELECT 
    ROW_NUMBER() OVER (ORDER BY FECHA) AS ID,
    FECHA as 'Fecha',
    CASE PROVINCIA
        WHEN 1 THEN 'DISTRITO NACIONAL'
        WHEN 2 THEN 'AZUA'
        WHEN 3 THEN 'BAHORUCO'
        WHEN 4 THEN 'BARAHONA'
        WHEN 5 THEN 'DAJABON'
        WHEN 6 THEN 'DUARTE'
        WHEN 7 THEN 'ELIAS PI�A'
        WHEN 8 THEN 'EL SEIBO'
        WHEN 9 THEN 'ESPAILLAT'
        WHEN 10 THEN 'INDEPENDENCIA'
        WHEN 11 THEN 'LA ALTAGRACIA'
        WHEN 12 THEN 'LA ROMANA'
        WHEN 13 THEN 'LA VEGA'
        WHEN 14 THEN 'MARIA TRINIDAD SANCHEZ'
        WHEN 15 THEN 'MONTE CRISTI'
        WHEN 16 THEN 'PEDERNALES'
        WHEN 17 THEN 'PERAVIA'
        WHEN 18 THEN 'PUERTO PLATA'
        WHEN 19 THEN 'SALCEDO'
        WHEN 20 THEN 'SAMANA'
        WHEN 21 THEN 'SAN CRISTOBAL'
        WHEN 22 THEN 'SAN JUAN'
        WHEN 23 THEN 'SAN PEDRO DE MACORIS'
        WHEN 24 THEN 'SANCHEZ RAMIREZ'
        WHEN 25 THEN 'SANTIAGO'
        WHEN 26 THEN 'SANTIAGO RODRIGUEZ'
        WHEN 27 THEN 'VALVERDE'
        WHEN 28 THEN 'MONSE�OR NOUEL'
        WHEN 29 THEN 'MONTE PLATA'
        WHEN 30 THEN 'HATO MAYOR'
        WHEN 31 THEN 'SAN JOSE DE OCOA'
        WHEN 32 THEN 'SANTO DOMINGO'
        ELSE 'Otro'  
    END AS 'Provincias',
    EDAD as 'EDAD',
     CASE EFT_ULT_NIVEL_ALCANZADO
        WHEN 1 THEN 'PREPRIMARIO'
        WHEN 2 THEN 'PRIMARIO'
        WHEN 3 THEN 'SECUNDARIO'
        WHEN 4 THEN 'VOCACIONAL'
        WHEN 5 THEN 'UNIVERSITARIO'
        WHEN 6 THEN 'POSTUNIVERSITARIO'
        WHEN 7 THEN 'NINGUNO'
        ELSE 'Otro'  
    END AS 'Nivel Academico',
    EFT_TIEMPO_LAB_ANOS AS 'TIEMPO LABORANDO EN A�OS',
    CASE ESTADO_CIVIL
        WHEN 1 THEN 'UNION LIBRE'
        WHEN 2 THEN 'CASADO'
        WHEN 3 THEN 'DIVORCIADO'
        WHEN 4 THEN 'SEPARADO'
        WHEN 5 THEN 'VIUDO'
        WHEN 6 THEN 'SOLTERO'
        ELSE 'Otro'
    END AS 'Estado Civil',
    ING_MEN as 'Ingreso Mensual',
    CASE SEGURIDAD_SOCIAL
        WHEN 0 THEN 'SI'
        WHEN 1 THEN 'NO'
        ELSE 'Otro'  
    END AS 'Seguridad Social',
   CASE ZONA
        WHEN 0 THEN 'URBANA'
        WHEN 1 THEN 'RURAL'
        ELSE 'Otro'  
    END AS 'ZONA',
    CASE GENERO
        WHEN 1 THEN 'HOMBRE'
        WHEN 2 THEN 'MUJER'
        ELSE 'Otro'  
    END AS 'Genero',
    CASE JEFE
        WHEN 1 THEN 'JEFE'
        WHEN 2 THEN 'ESPOSA'
        WHEN 3 THEN 'HIJO'
        WHEN 4 THEN 'FIJASTRO'
        WHEN 5 THEN 'NIETO'
        WHEN 6 THEN 'YERNO O NUERA'
        WHEN 7 THEN 'PADRE, MADRE'
        WHEN 8 THEN 'SUEGRO'
        WHEN 9 THEN 'HERMANO'
        WHEN 10 THEN 'ABUELO'
        WHEN 11 THEN 'OTRO PARIENTE'
        WHEN 12 THEN 'NO PARIENTE'
        ELSE 'Otro' 
    END AS 'JEFE',
	CASE LEE_ESCR
	    WHEN 1 THEN 'Si'
        WHEN 2 THEN 'No'
		END AS 'Sabe leer y escribir',
	 CASE OCUP_GRU
	    WHEN 1 THEN 'EMPLEADO GOBIERNO GENERAL'
        WHEN 2 THEN 'EMPLEADO DE EMPRESA PUBLICA'
		WHEN 3 THEN 'EMPLEADO EMPRESA PRIVADA'
		WHEN 4 THEN 'POR CUENTA PROPIA PROFESIONAL'
		WHEN 5 THEN 'POR CUENTA PROPIA NO PROFESIONAL'
		WHEN 6 THEN 'PATRON'
		WHEN 7 THEN 'AYUDANTE FAM. O NO FAM. NO REMUNERADO'
		WHEN 8 THEN 'SERVICIO DOMESTICO'
		WHEN 9 THEN 'No tiene ocupacion'
		END AS 'Sabe leer y escribir'
FROM BD_LIMPIA
WHERE JEFE IS NOT NULL;




SELECT * FROM BD_Limpia