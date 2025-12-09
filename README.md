# 📌 Northwind – Analyse Supply Chain & Recommandation

**Projet Neo4j – Gestion de Chaîne Logistique & Recommandation Produit**

---

## 🎯 Objectif du projet

L'objectif de ce projet est d'analyser la chaîne logistique d'une entreprise d'import-export (Northwind) en utilisant une base de données orientée graphes Neo4j.

Le projet permet :
- de visualiser les relations entre Produits, Fournisseurs, et Catégories
- d'effectuer des analyses de dépendance fournisseurs
- de réaliser des recommandations de produits
- d'explorer la structure de la chaîne d'approvisionnement

---

## 📦 Données utilisées

Les données proviennent du dataset **Northwind**, un classique des bases de données.

Trois tables ont été converties en graphes Neo4j :
- **Products** : nom, prix, identifiant, catégorie, fournisseur
- **Categories** : nom, description
- **Suppliers** : nom, pays

Ces données sont chargées directement depuis les URL publiques de Neo4j.

---

## 🧱 Modélisation du Graphe

Le graphe utilise trois types de nœuds :
- `Product`
- `Category`
- `Supplier`

Et deux relations principales :
- `(:Product)-[:PART_OF]->(:Category)`
- `(:Supplier)-[:SUPPLIES]->(:Product)`

Cette modélisation permet de reconstruire la chaîne logistique :

```
Supplier → Product → Category
```

---

## 🛠️ Étapes du projet

### 1. Préparation de la base Neo4j
- Création d'une nouvelle base dans Neo4j Desktop
- Ajout des contraintes d'unicité
- Importation des trois fichiers CSV

### 2. Construction automatique du graphe
- Création des nœuds Produits, Catégories et Fournisseurs
- Création des relations entre ces nœuds

### 3. Analyses effectuées

#### ✔ Analyse 1 — Catalogue d'une catégorie
Lister les produits d'une catégorie ainsi que leurs fournisseurs.

#### ✔ Analyse 2 — Risque Supply Chain
Identifier les fournisseurs qui dominent le catalogue.

#### ✔ Analyse 3 — Recommandation de produits
Proposer des produits similaires à un produit donné, dans la même catégorie.

#### ✔ Analyse 4 — Analyse de prix
Calculer les prix moyens par catégorie pour comprendre le positionnement prix.

---

## 📊 Résultats & Visualisations

Les principaux résultats visuels incluent :
- la structure du graphe (Produits ↔ Catégories ↔ Fournisseurs)
- les catégories les plus chères
- les fournisseurs les plus dominants
- les suggestions de produits similaires

Ces visuels sont disponibles dans le dossier `/images`.

## 🚀 Exécution du projet

Pour reproduire le projet :

1. Installer **Neo4j Desktop**
2. Créer une nouvelle base
3. Ouvrir **Neo4j Browser**
4. Lancer les requêtes d'analyse si souhaité

