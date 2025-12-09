#Créer les contraintes (Indispensable)

CREATE CONSTRAINT FOR (p:Product) REQUIRE p.productID IS UNIQUE;
CREATE CONSTRAINT FOR (c:Category) REQUIRE c.categoryID IS UNIQUE;
CREATE CONSTRAINT FOR (s:Supplier) REQUIRE s.supplierID IS UNIQUE;


// 1. Charger les Catégories
LOAD CSV WITH HEADERS FROM "https://data.neo4j.com/northwind/categories.csv" AS row
MERGE (c:Category {categoryID: row.categoryID})
SET c.categoryName = row.categoryName, c.description = row.description;

// 2. Charger les Fournisseurs
LOAD CSV WITH HEADERS FROM "https://data.neo4j.com/northwind/suppliers.csv" AS row
MERGE (s:Supplier {supplierID: row.supplierID})
SET s.companyName = row.companyName, s.country = row.country;

// 3. Charger les Produits
LOAD CSV WITH HEADERS FROM "https://data.neo4j.com/northwind/products.csv" AS row
MERGE (p:Product {productID: row.productID})
SET p.productName = row.productName, p.unitPrice = toFloat(row.unitPrice);


LOAD CSV WITH HEADERS FROM "https://data.neo4j.com/northwind/products.csv" AS row
MATCH (p:Product {productID: row.productID})
MATCH (c:Category {categoryID: row.categoryID})
MATCH (s:Supplier {supplierID: row.supplierID})
MERGE (p)-[:PART_OF]->(c)
MERGE (s)-[:SUPPLIES]->(p);


MATCH (s:Supplier)-[:SUPPLIES]->(p:Product)-[:PART_OF]->(c:Category)
WHERE c.categoryName = 'Produce'
RETURN s.companyName AS Fournisseur, p.productName AS Produit, p.unitPrice AS Prix
ORDER BY Prix DESC;


MATCH (s:Supplier)-[:SUPPLIES]->(p:Product)
RETURN s.companyName, count(p) as Nb_Produits
ORDER BY Nb_Produits DESC
LIMIT 5;

MATCH (p:Product {productName: "Tofu"})-[:PART_OF]->(c:Category)<-[:PART_OF]-(otherP:Product)
WHERE otherP <> p
RETURN otherP.productName AS Suggestion, otherP.unitPrice AS Prix
ORDER BY Prix ASC;

MATCH (p:Product)-[:PART_OF]->(c:Category)
RETURN c.categoryName, avg(p.unitPrice) AS Prix_Moyen
ORDER BY Prix_Moyen DESC;