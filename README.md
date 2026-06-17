# Retail Store Relational Database Analytics Engine (SQL)

## 📌 Business Case Overview
An growing e-commerce retail enterprise required a robust relational database assessment to audit transaction workflows, isolate operational inefficiencies, and clean customer interaction schemas.

Serving as the Database Analytics Lead, I engineered and executed a comprehensive analytical suite consisting of **30 progressive relational queries** mapping across four core operational entities: `Customers`, `Products`, `Orders`, and `Order_Items`.

---

## 🏗️ Database Schema Architecture
The analytical backend maps across a structured relational layout handling data integrity rules seamlessly:
* `Customers`: Operational account profiles, registration timestamps, and communication fields.
* `Products`: Inventory catalog segments, localized cost margins, and safety stock levels.
* `Orders`: High-level transaction mapping, status identifiers, and aggregate metrics.
* `Order_Items`: Deep-tier transactional logs detailing purchase volumes and explicit price-per-unit metrics.

---

## 🔬 Core Analytical Matrix & Query Highlights

The investigation is deployed systematically across progressive structural layers:

### 1. Advanced Enterprise Aggregations
* **Objective:** Audit macroscopic revenue metrics and active transactional engagement rates.
* **Logic Highlight:** Utilizing safe metric tracking (`COUNT(DISTINCT customer_id)`) to calculate absolute user retention and isolating target high-velocity items with an average product pricing ceiling above $1,500.

### 2. Multi-Table Relational JOINs
* **Objective:** Bridge relational divides between customer profiles, operational order tags, and inventory items.
* **Logic Highlight:** Combining transactional records with product category data to isolate cross-selling behavior and calculate customer lifetime values (LTV).

### 3. Complex Correlated Subqueries
* **Objective:** Identify hyper-specific operational anomalies and high-value customer actions.
* **Logic Highlight:** Writing correlated lookups to extract orders where the total transactional dollar value exceeded that specific customer's lifetime historical average, and using `NOT EXISTS` conditional logic to pinpoint dead inventory lines (products that have never been ordered) for clearance decisions.

---

## 💡 Key Strategic Database Insights
* **Dead Stock Identification:** Successfully isolated dormant inventory profiles utilizing subquery screening. Deactivating these dead stock lines or liquidating them immediately reclaims valuable physical warehouse space.
* **High-Value Target Profiling:** Automated the extraction of maximum transaction thresholds per customer. This enables the marketing department to instantly target high-ceiling buyers for high-margin electronic product rollouts.
* **User Purchase Penetration:** Running anti-join check scripts confirmed that zero active customer profiles possess empty order counts, proving a healthy, high-intent user conversion funnel.

---

## 📁 Repository Structure
* `retail-store-analytics.sql`: The complete structured production script categorized clearly by difficulty tiers from foundational lookups to optimization subqueries.
