-- Role: bot_parser
-- DROP ROLE bot_parser;

CREATE ROLE bot_parser WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  ENCRYPTED PASSWORD 'md5d142c14431a374714f3dad02ef1f5842';

COMMENT ON ROLE bot_parser IS 'for parsing data by SparkStreaming';