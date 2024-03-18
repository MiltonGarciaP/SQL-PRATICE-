CREATE TABLE mi_tabla ( 
 ID INT , 
 HoraInicio Ɵme,
 HoraFinalizacion TIME, 
 Tiempo float, 
 EquipoFavorito VARCHAR(MAX), 
 MayorDesafioLIDOM VARCHAR(MAX), 
 EntradasAccesiblesParaTodos VARCHAR(MAX), 
 CausaBajaAsistencia VARCHAR(MAX), 
 FrecuenciaAsistencia VARCHAR(MAX), 
 FuturoBeisbolInvernal VARCHAR(MAX), 
 MoƟvacionAsisƟrLIDOM VARCHAR(MAX),
 MejorasExperienciaLIDOM VARCHAR(MAX), 
 SaƟsfaccionGesƟonLIDOM VARCHAR(MAX),
 OpinionGesƟonLIDOM VARCHAR(MAX),
 RazonNoAsistenciaLIDOM VARCHAR(MAX), 
 SugerenciasMejorarBeisbolDominicano VARCHAR(MAX) 
); 
-- Habilitar el comando BULK INSERT 
EXEC sp_configure 'Ad Hoc Distributed Queries', 1; 
RECONFIGURE; 
-- Realizar la importación 
BULK INSERT mi_tabla 
FROM 'C:\Users\DELL\Desktop\Archivos de milton\ITLA\Ciencia de Datos\Trabajos 
Itla\1.Primer Cuatrimestre\Introduccion a la Ciencia de Datos\LIMPIEZA DE DATOS\DATOS 
LIMPIOS2 .csv' 
WITH ( 
 FIELDTERMINATOR = ',', 
 ROWTERMINATOR = '\n', 
 FIRSTROW = 2 -- Para omiƟr la primera fila si es un encabezado 
);