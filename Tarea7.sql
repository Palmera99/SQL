set SERVEROUTPUT on;

create or replace PACKAGE ACTIVIDAD_TIPOS_BLOQUES as
    FUNCTION CONTAR_MODIFICACIONES RETURN NUMBER;
    PROCEDURE MODIFICAR_TORRE;
end ACTIVIDAD_TIPOS_BLOQUES;

CREATE OR REPLACE PACKAGE BODY ACTIVIDAD_TIPOS_BLOQUES AS
    PROCEDURE modificar_torre (
        p_id          IN unidad_interna.id_unidad%TYPE,
        p_nuevatorre  IN unidad_interna.num_torre%TYPE,
        ph_id         IN h_unidad_interna.id_unidad%TYPE,
        ph_nuevatorre IN h_unidad_interna.num_torre%TYPE
    ) IS
    BEGIN
        UPDATE unidad_interna
        SET
            num_torre = p_nuevatorre
        WHERE
            id_unidad = p_id;

        UPDATE h_unidad_interna
        SET
            num_torre = ph_nuevatorre
        WHERE
            id_unidad = ph_id;

        COMMIT;
    END;
        
 trigger tgr_unidad AFTER
    INSERT OR UPDATE OR DELETE ON unidad_interna
    FOR EACH ROW BEGIN
    IF inserting THEN
        dbms_output.put_line('Se ha insertado un registro en tabla_origen.');
    ELSIF updating THEN
        dbms_output.put_line('Se ha actualizado un registro en tabla_origen.');
    ELSIF deleting THEN
        dbms_output.put_line('Se ha eliminado un registro de tabla_origen.');
    END IF;

    INSERT INTO h_unidad_interna (
        nombre_unidad,
        descripcion_unidad,
        num_torre,
        fecha_modificacion
    ) VALUES (
        :new.nombre_unidad,
        :new.descripcion_unidad,
        :new.num_torre,
        sysdate
    );

END tgr_unidad;
    
 
END actividad_tipos_bloques;

ALTER TABLE H_UNIDAD_INTERNA RENAME COLUMN COLUMN1 TO NOMBRE_UNIDAD;