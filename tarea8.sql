--Alterar la sesion para modificar
alter session set "_oracle_script"= true;

--Creacion de Usuario
create USER user_test IDENTIFIED by lollol;

--asignacion de permisos para conexion
grant connect, RESOURCE to user_test;

--se otorga permisos para conectarse por medio del comando
grant create session to user_test;

grant select, insert, update on funcionario to user_test;

--insercion de datos a la tab