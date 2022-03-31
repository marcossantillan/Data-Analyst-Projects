--CREAMOS LA BD
Create database Universidad;

--ACTIVAMSO SU USO
Use Universidad

--CREAMOS EL ESQUEMA
Create schema base1;

--CREAMOS LA TABLA ESTUDIANTE
Create table base1.Estudiantes(
Legajo_Estudiante varchar (100) not null primary key,
DNI_Estudiante int, 
Nombre varchar(100),
Apellido varchar (100),
Domicilio varchar (100))

--CREAMOS LA TABLA PROFESOR
Create table base1.Profesor(
Legajo_Profesor varchar (100) not null primary key,
DNI_Profesor int,
Nombre varchar(100),
Apellido varchar (100)
) 

--CREAMOS LA TABLA ASIGNATURA (CON SUS CLAVES FORÁNEAS)
Create table base1.Asignatura(
Id_Asignatura varchar(100) not null primary key,
Nombre_Asignatura varchar(100),
Legajo_Profesor varchar(100) not null,
Legajo_Estudiante varchar(100) not null,
FOREIGN KEY (Legajo_Profesor) REFERENCES base1.Profesor(Legajo_Profesor),
FOREIGN KEY (Legajo_Estudiante) REFERENCES base1.Estudiantes(Legajo_Estudiante)
) 

--CON ALTER AGREGAMOS UN CAMPO A LA TABLA ESTUDIANTE

alter table base1.Asignatura
add FOREIGN KEY (Legajo_Estudiante) REFERENCES base1.Estudiantes(Legajo_Estudiante)


--CAMBIAR EL NOMBRE DE UN CAMPO
sp_rename 'Estudiante.Nombre', 'Name';

--ELIMINAR UNA COLUMNA

alter table Estudiante 
drop column Domicilio;

select * from base1.Asignatura;

alter table base1.Profesor drop column Domicilio;

select * from base1.Profesor

EXEC sp_rename 'base1.Profesor.Name ', 'Nombre', 'COLUMN';

DROP DATABASE Universidad
