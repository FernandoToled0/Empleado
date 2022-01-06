/****** Script para el comando SelectTopNRows de SSMS  ******/
SELECT apellidos FROM empleado;
SELECT apellidos FROM empleado group by apellidos;
select * from empleado where apellidos like '%Perez%';
select * from empleado where apellidos like '%Perez%' or apellidos like '%Lopez%';
select dpi, nombre, apellidos, nombre_depto from empleado as a inner join departamento as b on a.cod_depto=b.codigo_departamento where nombre_depto = 'CONTABILIDAD';
select dpi, nombre, apellidos, nombre_depto from empleado as a inner join departamento as b on a.cod_depto=b.codigo_departamento where nombre_depto IN ('CONTABILIDAD','GERENCIA');
select * from empleado where left(apellidos,1) = 'p';
select nombre_depto, sum(presupuesto) as Presupuesto_Total from empleado as a inner join departamento as b on a.cod_depto=b.codigo_departamento group by nombre_depto;
select nombre_depto, count(*) as empleados_departamento from empleado as a inner join departamento as b on a.cod_depto=b.codigo_departamento group by nombre_depto
select dpi, nombre, apellidos, a.cod_depto, nombre_depto, presupuesto from empleado as a inner join departamento as b on a.cod_depto=b.codigo_departamento;
select Concat(nombre,' ',apellidos) as Nombre_Completo, nombre_depto, presupuesto from empleado as a inner join departamento as b on a.cod_depto=b.codigo_departamento order by apellidos desc;
select nombre,apellidos from empleado as a inner join departamento as b on a.cod_depto=b.codigo_departamento where presupuesto > 60000;
declare @media int = (SELECT avg(presupuesto) FROM departamento)
select nombre_depto from departamento where presupuesto > @media;
select nombre_depto, count(a.cod_depto) as Empleados from empleado as a inner join departamento as b on a.cod_depto=b.codigo_departamento group by nombre_depto having count(a.cod_depto) > 2;

--insert into departamento (codigo_departamento, nombre_depto, presupuesto) values('11','Control de Calidad','40000')
--insert into empleado (dpi, nombre, apellidos, cod_depto) values('28948238','Esther','Vásquez','11')
