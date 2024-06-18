DROP SCHEMA IF EXISTS colleges CASCADE; 
CREATE SCHEMA colleges; 
SET SCHEMA 'colleges'; 



-- Création de la table _region
CREATE TABLE _region (
    code_region VARCHAR(20) PRIMARY KEY,
    libelle_region VARCHAR(20)
);

-- Création de la table _academie
CREATE TABLE _academie (
    code_academie INT PRIMARY KEY,
    lib_academie VARCHAR(20)
);
ALTER TABLE _academie
ADD CONSTRAINT fk_academie_region FOREIGN KEY (code_region) REFERENCES _region(code_region);


-- Création de la table _departement
CREATE TABLE _departement (
    code_du_departement VARCHAR(20) PRIMARY KEY,
    nom_departement VARCHAR(20)
);
ALTER TABLE _departement
ADD CONSTRAINT fk_departement_academie FOREIGN KEY (code_academie) REFERENCES _academie(code_academie);

-- Création de la table _etablissement
CREATE TABLE _etablissement (
    uai VARCHAR(20) PRIMARY KEY,
    nom_etablissement VARCHAR(20),
    secteur VARCHAR(20),
    code_postal VARCHAR(20),
    latitude FLOAT,
    longitude FLOAT
);
ALTER TABLE _etablissement
ADD CONSTRAINT fk_etablissement_departement FOREIGN KEY (code_du_departement) REFERENCES _departement(code_du_departement);
ADD CONSTRAINT fk_etablissement_commune FOREIGN KEY (code_insee_de_la_commune) REFERENCES _commune(code_insee_de_la_commune);
ADD CONSTRAINT fk_etablissement_type FOREIGN KEY (code_nature) REFERENCES _type(code_nature);
ADD CONSTRAINT fk_etablissement_quartier_prioritaire FOREIGN KEY (code_quartier_prioritaire) REFERENCES _quartier_prioritaire(code_quartier_prioritaire);

-- Création de la table _commune
CREATE TABLE _commune (
    code_insee_de_la_commune VARCHAR(20) PRIMARY KEY,
    nom_de_la_commune VARCHAR(20)
);

-- Création de la table _type
CREATE TABLE _type (
    code_nature VARCHAR(20) PRIMARY KEY,
    libelle_nature VARCHAR(20)
);

-- Création de la table _quartier_prioritaire
CREATE TABLE _quartier_prioritaire (
    code_quartier_prioritaire VARCHAR(20) PRIMARY KEY,
    nom_quartier_prioritaire VARCHAR(20)
);

-- Création de la table _caracteristiques_tout_etablissement
CREATE TABLE _caracteristiques_tout_etablissement (
    effectifs INT,
    ips FLOAT,
    ecart_type_de_l_ips FLOAT,
    ep VARCHAR(20)
);
ALTER TABLE _caracteristiques_tout_etablissement
ADD CONSTRAINT fk_caracteristiques_tout_etablissement_etablissement FOREIGN KEY (uai) REFERENCES _etablissement(uai);

-- Création de la table _annee
CREATE TABLE _annee (
    annee_scolaire VARCHAR(20) PRIMARY KEY
);

-- Création de la table _caracteristiques_college
CREATE TABLE _caracteristiques_college (
    uai VARCHAR(20),
    annee_scolaire VARCHAR(20),
    nbre_eleves_hors_segpa_hors_ulis INT,
    nbre_eleves_segpa INT,
    nbre_eleves_ulis INT
);


-- Création de la table _classe
CREATE TABLE _classe (
    id_classe VARCHAR(20) PRIMARY KEY
);

-- Création de la table _caracteristiques_selon_classe
CREATE TABLE _caracteristiques_selon_classe (
    uai VARCHAR(20),
    annee_scolaire VARCHAR(20),
    id_classe VARCHAR(20),
    nbre_eleves_hors_segpa_hors_ulis_selon_niveau INT,
    nbre_eleves_segpa_selon_niveau INT,
    nbre_eleves_ulis_selon_niveau INT,
    effectif_filles INT,
    effectif_garcons INT
);





