WITH frequentation_unpivot AS (

    SELECT code_uic_complet, nom_gare, date_ingestion, 2024 AS annee, total_voyageurs_2024 AS total_voyageurs
    FROM raw_frequentation

    UNION ALL

    SELECT code_uic_complet, nom_gare, date_ingestion, 2023 AS annee, total_voyageurs_2023 AS total_voyageurs
    FROM raw_frequentation

    UNION ALL

    SELECT code_uic_complet, nom_gare, date_ingestion, 2022 AS annee, total_voyageurs_2022 AS total_voyageurs
    FROM raw_frequentation

    UNION ALL

    SELECT code_uic_complet, nom_gare, date_ingestion, 2021 AS annee, total_voyageurs_2021 AS total_voyageurs
    FROM raw_frequentation

    UNION ALL

    SELECT code_uic_complet, nom_gare, date_ingestion, 2020 AS annee, total_voyageurs_2020 AS total_voyageurs
    FROM raw_frequentation

    UNION ALL

    SELECT code_uic_complet, nom_gare, date_ingestion, 2019 AS annee, total_voyageurs_2019 AS total_voyageurs
    FROM raw_frequentation

    UNION ALL

    SELECT code_uic_complet, nom_gare, date_ingestion, 2018 AS annee, total_voyageurs_2018 AS total_voyageurs
    FROM raw_frequentation

    UNION ALL

    SELECT code_uic_complet, nom_gare, date_ingestion, 2017 AS annee, totalvoyageurs2017 AS total_voyageurs
    FROM raw_frequentation

    UNION ALL

    SELECT code_uic_complet, nom_gare, date_ingestion, 2016 AS annee, total_voyageurs_2016 AS total_voyageurs
    FROM raw_frequentation

    UNION ALL

    SELECT code_uic_complet, nom_gare, date_ingestion, 2015 AS annee, total_voyageurs_2015 AS total_voyageurs
    FROM raw_frequentation
)

, frequentation_avec_rang AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY code_uic_complet, annee
            ORDER BY date_ingestion DESC
        ) AS rang
    FROM frequentation_unpivot
)

SELECT *
FROM frequentation_avec_rang
WHERE rang = 1