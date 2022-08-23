-- Table: wikipedia.wiki_raw_approach_1
-- DROP TABLE wikipedia.wiki_raw_approach_1;

CREATE TABLE IF NOT EXISTS wikipedia.wiki_raw_approach_1
(
    title character varying COLLATE pg_catalog."default",
    username character varying COLLATE pg_catalog."default" NOT NULL,
    bot boolean,
    domain character varying COLLATE pg_catalog."default",
    parsedcomment character varying COLLATE pg_catalog."default",
    date_publish timestamp without time zone NOT NULL,
    date_create timestamp without time zone
) PARTITION BY RANGE (date_create);

ALTER TABLE wikipedia.wiki_raw_approach_1
    OWNER to admin;

REVOKE ALL ON TABLE wikipedia.wiki_raw_approach_1 FROM bot_parser;

GRANT ALL ON TABLE wikipedia.wiki_raw_approach_1 TO admin;

GRANT DELETE, INSERT, SELECT, UPDATE ON TABLE wikipedia.wiki_raw_approach_1 TO bot_parser;

-- Index: domain_inx_1
-- DROP INDEX wikipedia.domain_inx_1;

CREATE INDEX domain_inx_1
    ON wikipedia.wiki_raw_approach_1 USING btree
    (title COLLATE pg_catalog."default" ASC NULLS LAST)
;
-- Index: user_inx_1
-- DROP INDEX wikipedia.user_inx_1;

CREATE INDEX user_inx_1
    ON wikipedia.wiki_raw_approach_1 USING btree
    (username COLLATE pg_catalog."default" ASC NULLS LAST)
;

-- Partitions SQL

CREATE TABLE IF NOT EXISTS wikipedia.wiki_raw_approach_1_1900 PARTITION OF wikipedia.wiki_raw_approach_1
    DEFAULT;

ALTER TABLE wikipedia.wiki_raw_approach_1_1900
    OWNER to admin;
CREATE TABLE IF NOT EXISTS wikipedia.wiki_raw_approach_1_202208 PARTITION OF wikipedia.wiki_raw_approach_1
    FOR VALUES FROM ('2022-08-01 00:00:00') TO ('2022-08-31 23:59:59');

ALTER TABLE wikipedia.wiki_raw_approach_1_202208
    OWNER to admin;
CREATE TABLE IF NOT EXISTS wikipedia.wiki_raw_approach_1_202209 PARTITION OF wikipedia.wiki_raw_approach_1
    FOR VALUES FROM ('2022-09-01 00:00:00') TO ('2022-09-30 23:59:59');

ALTER TABLE wikipedia.wiki_raw_approach_1_202209
    OWNER to admin;