--Alterar la sesion para modificar
alter session set "_oracle_script"= true;

--Creacion de Usuario
create USER user_test IDENTIFIED by lollol;

--asignacion de permisos para conexion
grant connect, RESOURCE to user_test;

--se otorga permisos para conectarse por medio del comando
grant create session to user_test;

--Permisos para seleccionar, insertar y actualizar
grant select, insert, update on funcionario to user_test;

--insercion de datos a la tabla FUNCIONARIO
INSERT INTO  funcionario (RUT_FUNCIONARIO, nombre_funcionario, mail_funcionario, fecha_nacimiento)
VALUES ('20049728-7', 'HECTOR DIAZ', 'HECTOR@GMAIL.COM', '25/04/99');

INSERT INTO  funcionario (RUT_FUNCIONARIO, nombre_funcionario, mail_funcionario, fecha_nacimiento)
VALUES ('16713373-8', 'MARIA JESUS', 'MARIA@GMAIL.COM', '30/04/87');

INSERT INTO  funcionario (RUT_FUNCIONARIO, nombre_funcionario, mail_funcionario, fecha_nacimiento)
VALUES ('10758785-2', 'RENE MUÑOZ', 'RENE@GMAIL.COM', '24/04/69');

INSERT INTO  funcionario (RUT_FUNCIONARIO, nombre_funcionario, mail_funcionario, fecha_nacimiento)
VALUES ('13769524-8', 'KAREN BRAVO', 'KAREN@GMAIL.COM', '03/09/80');

INSERT INTO  funcionario (RUT_FUNCIONARIO, nombre_funcionario, mail_funcionario, fecha_nacimiento)
VALUES ('22987452-3', 'BENJAMIN CONTRERAS', 'BENJAMIN@GMAIL.COM', '13/05/2015');

--quitar permisos de actualizacion
revoke update on system.funcionario from user_test;

--actualizar datos 
update funcionario set nombre_funcionario = 'PEDRO PALOMO', mail_funcionario = 'pedro@gmail.com' where rut_funcionario = '20049728-7';
update funcionario set nombre_funcionario = 'PATRICIA PALOMO', mail_funcionario = 'patricia@gmail.com' where rut_funcionario = '16713373-8';
update funcionario set nombre_funcionario = 'EDMUNDO PALOMO', mail_funcionario = 'EDMUNDO@gmail.com' where rut_funcionario = '10758785-2';