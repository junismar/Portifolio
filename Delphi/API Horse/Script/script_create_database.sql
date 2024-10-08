CREATE TABLE TAB_CLIENTE (
    ID_CLIENTE INT NOT NULL PRIMARY KEY,
    NOME       VARCHAR(100),
    EMAIL      VARCHAR(100),
    FONE       VARCHAR(50)
);

 
CREATE GENERATOR GEN_CLIENTE_ID;

CREATE TRIGGER TR_CLIENTE FOR TAB_CLIENTE
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
    NEW.ID_CLIENTE =GEN_ID(GEN_CLIENTE_ID, 1);
END
