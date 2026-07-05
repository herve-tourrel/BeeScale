-- ===========================================================
-- BeeScale
-- Initialisation de la base SQLite
--
-- Version : 0.1.0
-- Auteur  : Hervé Tourrel & ChatGPT
-- Date    : 2026
-- ===========================================================

PRAGMA foreign_keys = ON;

---------------------------------------------------------------
-- TABLE DES RUCHES
---------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ruches (

    ruche TEXT PRIMARY KEY,

    nom TEXT,

    emplacement TEXT,

    type TEXT,

    commentaire TEXT,

    premiere_reception TEXT,

    derniere_reception TEXT,

    firmware TEXT,

    actif INTEGER DEFAULT 1

);

---------------------------------------------------------------
-- TABLE DES MESURES
---------------------------------------------------------------

CREATE TABLE IF NOT EXISTS mesures (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    ruche TEXT NOT NULL,

    date_balise TEXT NOT NULL,

    date_reception TEXT NOT NULL,

    poids REAL,

    temperature REAL,

    batterie REAL,

    signal INTEGER,

    firmware TEXT,

    FOREIGN KEY (ruche)
        REFERENCES ruches(ruche)

);

---------------------------------------------------------------
-- INDEX
---------------------------------------------------------------

CREATE INDEX IF NOT EXISTS idx_mesures_ruche
ON mesures(ruche);

CREATE INDEX IF NOT EXISTS idx_mesures_date
ON mesures(date_balise);

CREATE INDEX IF NOT EXISTS idx_mesures_ruche_date
ON mesures(ruche,date_balise);