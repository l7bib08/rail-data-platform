SELECT code_uic_complet, nom_gare, 2024 AS annee, total_voyageurs_2024 AS total_voyageurs
FROM raw_frequentation

UNION ALL

SELECT code_uic_complet, nom_gare, 2023 AS annee, total_voyageurs_2023 AS total_voyageurs
FROM raw_frequentation

UNION ALL

SELECT code_uic_complet, nom_gare, 2022 AS annee, total_voyageurs_2022 AS total_voyageurs
FROM raw_frequentation

UNION ALL

SELECT code_uic_complet, nom_gare, 2021 AS annee, total_voyageurs_2021 AS total_voyageurs
FROM raw_frequentation

UNION ALL

SELECT code_uic_complet, nom_gare, 2020 AS annee, total_voyageurs_2020 AS total_voyageurs
FROM raw_frequentation

UNION ALL

SELECT code_uic_complet, nom_gare, 2019 AS annee, total_voyageurs_2019 AS total_voyageurs
FROM raw_frequentation

UNION ALL

SELECT code_uic_complet, nom_gare, 2018 AS annee, total_voyageurs_2018 AS total_voyageurs
FROM raw_frequentation

UNION ALL

SELECT code_uic_complet, nom_gare, 2017 AS annee, totalvoyageurs2017 AS total_voyageurs
FROM raw_frequentation

UNION ALL

SELECT code_uic_complet, nom_gare, 2016 AS annee, total_voyageurs_2016 AS total_voyageurs
FROM raw_frequentation

UNION ALL

SELECT code_uic_complet, nom_gare, 2015 AS annee, total_voyageurs_2015 AS total_voyageurs
FROM raw_frequentation