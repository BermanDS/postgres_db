-- SCHEMA: wikipedia
-- DROP SCHEMA wikipedia ;

CREATE SCHEMA wikipedia
    AUTHORIZATION admin;

GRANT ALL ON SCHEMA wikipedia TO admin;
GRANT ALL ON SCHEMA wikipedia TO bot_parser;