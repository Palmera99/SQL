set SERVEROUTPUT on;

CREATE OR REPLACE PACKAGE package_nombre IS
  PROCEDURE modificar_torre(p_id IN NUMBER, p_nuevo_valor IN VARCHAR2);
  FUNCTION contar_modificaciones RETURN NUMBER;
END package_nombre;

/


CREATE OR REPLACE PACKAGE BODY package_nombre IS
  -- Función que cuenta las modificaciones en la tabla_origen
  FUNCTION contar_modificaciones RETURN NUMBER IS
    cantidad_modificaciones NUMBER := 0;
  BEGIN
    SELECT COUNT(*) INTO cantidad_modificaciones FROM unidad_interna;
    RETURN cantidad_modificaciones;
  END contar_modificaciones;

  -- Procedimiento para modificar la columna torre de la tabla_origen
  PROCEDURE modificar_torre(p_id IN NUMBER, p_nuevo_valor IN VARCHAR2) IS
  BEGIN
    UPDATE unidad_interna SET num_torre = p_nuevo_valor WHERE id_unidad = p_id;
  END modificar_torre;
END package_nombre;
/
-- Trigger que agrega datos a otra tabla y muestra un mensaje cuando se elimina, agrega o modifica datos
  CREATE OR REPLACE TRIGGER trigger_nombre
  AFTER INSERT OR UPDATE OR DELETE ON unidad_interna
  FOR EACH ROW
DECLARE
BEGIN
  IF INSERTING THEN
    INSERT INTO h_unidad_interna (id_unidad , nombre_unidad, DESCRIPCION_UNIDAD, NUM_TORRE, fecha_modificacion) 
    VALUES (:new.id_unidad, :new.nombre_unidad, :new.DESCRIPCION_UNIDAD, :new.NUM_TORRE, sysdate );
    dbms_output.put_line('Se ha agregado un registro a la tabla_origen');
  ELSIF UPDATING THEN
    INSERT INTO h_unidad_interna (id_unidad , nombre_unidad, DESCRIPCION_UNIDAD, NUM_TORRE, fecha_modificacion) 
    VALUES (:new.id_unidad, :new.nombre_unidad, :new.DESCRIPCION_UNIDAD, :new.NUM_TORRE, sysdate );
    dbms_output.put_line('Se ha modificado un registro de la tabla_origen');
  ELSIF DELETING THEN
    dbms_output.put_line('Se ha eliminado un registro de la tabla_origen');
  END IF;
END trigger_nombre;
