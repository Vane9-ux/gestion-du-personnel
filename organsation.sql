CREATE DATABASE ORGANSATION;


CREATE TABLE Personnel(
    id_personnel INT PRIMARY KEY,
    id_manager INT,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    date_naissance DATE,
    adresse VARCHAR(255),
    telephone VARCHAR(15),
    email VARCHAR(100),
    poste VARCHAR(100),
    competences_techniques TEXT,
    technologies TEXT,           
    diplome VARCHAR(255),
    experience INTEGER,
    date_embauche DATE,
    salaire DECIMAL(10, 2),
    type_contrat VARCHAR(50),
    statut VARCHAR(50),
    projets_en_cours TEXT,      
    evaluation_performance TEXT,
    horaire_travail VARCHAR(50),
    lieu_travail VARCHAR(100),
    langues_parlees TEXT
);

CREATE TABLE CV(
    id_cv INT PRIMARY KEY,
    id_candidat INT,             
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(100),
    telephone VARCHAR(15),
    adresse VARCHAR(255),
    date_naissance DATE,
    resume_professionnel TEXT,
    formation VARCHAR(255),
    competences_techniques TEXT,
    langages_programmation TEXT,
    technologies_ou_outils TEXT,
    experiences_professionnelles TEXT,
    projets TEXT,
    certifications TEXT,
    competences_non_techniques TEXT,
    langues_parlees TEXT,
    disponibilite VARCHAR(100),
    situation_professionnelle VARCHAR(100),
    portfolio_url VARCHAR(255),
    photo_url VARCHAR(255),
    publications TEXT,
    recompenses TEXT
);

CREATE TABLE Lettre_Motivation (
    id_lettre_motivation INT PRIMARY KEY,
    id_candidat INT,
    date_soumission DATE,
    objet VARCHAR(255),
    contenu TEXT,
    poste_cible VARCHAR(255),
    entreprise_nom VARCHAR(255),
    responsable_recrutement VARCHAR(255),
    type_candidature VARCHAR(50),
    format_lettermotivation VARCHAR(50),
    statut_lettermotivation VARCHAR(50),
    reponse_recruteur VARCHAR(255),
    score INT,
    langue VARCHAR(50),
    pieces_jointes TEXT,
    format_soumission VARCHAR(50),
    commentaires_recruteur TEXT,
    delai_reponse DATE,
    entretien_planifie BOOLEAN,
    personnalisation BOOLEAN
);

CREATE TABLE Departement (
    id_departement INT PRIMARY KEY,
    nom_departement VARCHAR(100),
    responsable VARCHAR(100),
    budget DECIMAL(10, 2),
    nombre_employes INT,
    date_creation DATE,
    localisation VARCHAR(100),
    objectifs TEXT,
    statut VARCHAR(50)
);

CREATE TABLE Gestionnaire (
    gestionnaire_id INT PRIMARY KEY AUTO_INCREMENT,  -- Identifiant unique pour chaque gestionnaire
    prenom VARCHAR(50),                              -- Pr�nom du gestionnaire
    nom VARCHAR(50),                                 -- Nom du gestionnaire
    email VARCHAR(100),                              -- Adresse email du gestionnaire
    entreprise_id INT,                               -- Identifiant de l'entreprise (li� � la table des entreprises, si applicable)
    date_embauche DATE                                -- Date d'embauche du gestionnaire
);


CREATE TABLE candidat (
    candidat_id INT PRIMARY KEY AUTO_INCREMENT,      -- Identifiant unique pour chaque candidat
    prenom VARCHAR(50),                              -- Pr�nom du candidat
    nom VARCHAR(50),                                 -- Nom du candidat
    email VARCHAR(100),                              -- Adresse email du candidat
    numero_telephone VARCHAR(15),                    -- Num�ro de t�l�phone du candidat
    gestionnaire_id INT,                             -- Identifiant du gestionnaire responsable (cl� �trang�re vers Gestionnaire)
    date_postulation DATE                            -- Date de la postulation du candidat
);
CREATE TABLE Entreprise (
    entreprise_id INT PRIMARY KEY AUTO_INCREMENT,   -- Identifiant unique pour chaque entreprise
    nom_entreprise VARCHAR(100),                     -- Nom de l'entreprise
    adresse VARCHAR(255),                            -- Adresse de l'entreprise
    email_contact VARCHAR(100),                      -- Adresse email pour contacter l'entreprise
    telephone_contact VARCHAR(20),                   -- Num�ro de t�l�phone pour contacter l'entreprise
    date_creation DATE,                              -- Date de cr�ation de l'entreprise
    secteur_activite VARCHAR(100)                    -- Secteur d'activit� de l'entreprise
);


-- Contrainte pour la table Personnel
ALTER TABLE Personnel ADD CONSTRAINT fk_Personnel_Gestionnaire FOREIGN KEY (id_Gestionnaire) REFERENCES Gestionnaire(id_Gestionnaire) ON DELETE CASCADE ON UPDATE CASCADE;

-- Contrainte pour la table CV
ALTER TABLE CV ADD CONSTRAINT fk_candidat_Cv FOREIGN KEY (id_candidat) REFERENCES candidat(id_candidat) ON DELETE CASCADE ON UPDATE CASCADE;

-- Contrainte pour la table Lettre_Motivation
ALTER TABLE Lettre_Motivation ADD CONSTRAINT fk_candidat_Lettre_motivation FOREIGN KEY (id_candidat) REFERENCES candidat(id_candidat) ON DELETE CASCADE ON UPDATE CASCADE;

-- Exemple d'insertion pour les tables Manager et candidat
INSERT INTO Gestionnaire (id_manager) VALUES (1), (2), (3);
INSERT INTO candidat (id_candidat) VALUES (1), (2), (3);
