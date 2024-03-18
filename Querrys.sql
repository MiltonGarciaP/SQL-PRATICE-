
-- Consulta para todos los equipos
SELECT EntradasAccesiblesParaTodos, MayorDesafioLIDOM, FrecuenciaAsistencia, FuturoBeisbolInvernal, EquipoFavorito, COUNT(EquipoFavorito) AS Cantidad
FROM mi_tabla
GROUP BY EntradasAccesiblesParaTodos, MayorDesafioLIDOM, FrecuenciaAsistencia, FuturoBeisbolInvernal, EquipoFavorito;



-- Consulta para el licey 

SELECT EntradasAccesiblesParaTodos, MayorDesafioLIDOM, FrecuenciaAsistencia, FuturoBeisbolInvernal, COUNT(EquipoFavorito) AS Cantidad
FROM mi_tabla
WHERE EquipoFavorito = 'Tigres del Licey' 
GROUP BY EntradasAccesiblesParaTodos, MayorDesafioLIDOM, FrecuenciaAsistencia, FuturoBeisbolInvernal;

-- Consulta para el escogido 

SELECT EntradasAccesiblesParaTodos, MayorDesafioLIDOM, FrecuenciaAsistencia, FuturoBeisbolInvernal,  COUNT(EquipoFavorito) AS Cantidad
FROM mi_tabla
WHERE EquipoFavorito = 'Leones del Escogido'
GROUP BY EntradasAccesiblesParaTodos, MayorDesafioLIDOM, FrecuenciaAsistencia, FuturoBeisbolInvernal;

-- Consulta para la aguilas
 SELECT EntradasAccesiblesParaTodos, MayorDesafioLIDOM, FrecuenciaAsistencia, FuturoBeisbolInvernal, COUNT(EquipoFavorito) AS Cantidad
FROM mi_tabla
WHERE EquipoFavorito = '+üguilas Cibae+¦as'
GROUP BY EntradasAccesiblesParaTodos, MayorDesafioLIDOM, FrecuenciaAsistencia, FuturoBeisbolInvernal;


-- Consulta para el licey vs escogido

SELECT EntradasAccesiblesParaTodos, MayorDesafioLIDOM, FrecuenciaAsistencia, FuturoBeisbolInvernal,EquipoFavorito,COUNT(EquipoFavorito) AS Cantidad
FROM mi_tabla
WHERE EquipoFavorito = 'Tigres del Licey' or EquipoFavorito = 'Leones del Escogido'
GROUP BY EntradasAccesiblesParaTodos, MayorDesafioLIDOM, FrecuenciaAsistencia, FuturoBeisbolInvernal,EquipoFavorito;

-- Consulta para el licey vs aguilas

SELECT EntradasAccesiblesParaTodos, MayorDesafioLIDOM, FrecuenciaAsistencia, FuturoBeisbolInvernal,EquipoFavorito ,COUNT(EquipoFavorito) AS Cantidad
FROM mi_tabla
WHERE EquipoFavorito = 'Tigres del Licey' or EquipoFavorito = '+üguilas Cibae+¦as'
GROUP BY EntradasAccesiblesParaTodos, MayorDesafioLIDOM, FrecuenciaAsistencia, FuturoBeisbolInvernal,EquipoFavorito;


-- Consulta para el escogido vs aguilas 

SELECT EntradasAccesiblesParaTodos, MayorDesafioLIDOM, FrecuenciaAsistencia, FuturoBeisbolInvernal, EquipoFavorito ,COUNT(EquipoFavorito) AS Cantidad
FROM mi_tabla
WHERE EquipoFavorito = 'Leones del Escogido' or EquipoFavorito = '+üguilas Cibae+¦as'
GROUP BY EntradasAccesiblesParaTodos, MayorDesafioLIDOM, FrecuenciaAsistencia, FuturoBeisbolInvernal,EquipoFavorito;



