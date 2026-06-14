# Zepto-Inventory-Analytics-Using-MySQL 🛒📊

## 📌 Project Overview
This project focuses on analyzing an inventory dataset from **Zepto**, a leading Quick-Commerce (Q-Commerce) platform that promises 10-minute grocery deliveries. In Q-Commerce, managing stock availability, optimizing warehouse shelf space, and balancing aggressive discount strategies are critical to staying profitable.

Using **MySQL**, I acted as a Data analyst to uncover **operational inefficiencies**, **track high-risk out-of-stock items**, and **calculate the total financial value** tied up in inventory.

---

## 🛠️ Tech Stack & Database Schema
*   **Database Engine:** MySQL (Workbench 8.0)
*   **Key SQL Concepts Used:** Aggregations (`SUM`, `AVG`, `COUNT`), Logical Filters (`CASE WHEN`, `LIKE`, `IN`), Grouping & Sorting (`GROUP BY`, `ORDER BY`).

### Database Table Structure
The dataset was sourced from [Kaggle](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv) and was originally scraped from Zepto’s official product listings. It mimics the real-world e-commerce inventory system.

Each row represents a unique ID for a product. Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility – exactly how real catalog data looks.

🧾 Columns:

id: Unique identifier for each product entry (Synthetic Primary Key)

name: Product name as it appears on the app

category: Product category like Fruits, Snacks, Beverages, etc.

mrp: Maximum Retail Price (originally in paise, converted to ₹)

discountPercent: Discount applied on MRP

discountedSellingPrice: Final price after discount (also converted to ₹)

availableQuantity: Units available in inventory

weightInGms: Product weight in grams

outOfStock: Boolean flag indicating stock availability

quantity: Number of units per package (mixed with grams for loose produce)

### Step-by-Step Implementation

### 1. Setting Up the Database
I imported the Csv file in my MySQL workbench

*(Note: The raw data stores prices in **paise** instead of Rupees—like 2500 instead of 25.00—to keep the calculations accurate.)*

### 2. 🔍 Data Exploration
Counted the total number of records in the dataset

Viewed a sample of the dataset to understand structure and content

Checked for null values across all columns

Identified distinct product categories available in the dataset

Compared in-stock vs out-of-stock product counts

Detected products present multiple times, representing different IDs

### 3. 🧹 Data Exploration & Cleaning
Before writing any fancy queries, I did a basic health check on the data:

Removing Trash Data: Deleted broken rows where the price or MRP was recorded as zero.

Currency Conversion:Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability


### 4. 📊 Business Insights

**A. Found top 10 best-value products based on discount percentage**

Business Goal: Identify our most aggressively discounted items to track which products are driving the biggest clearance promotions.

**B. Identified high-MRP products that are currently out of stock**

Business Goal: Spot expensive, high-ticket items that are out of stock so the warehouse can reorder them immediately before we lose major revenue.

**C. Estimated potential revenue for each product category**

Business Goal: Calculate the total financial value tied up in our current inventory to see which categories hold the most capital.

**D. Filtered expensive products (MRP > ₹500) with minimal discount**

Business Goal: Isolate premium products that are selling at near-full price to evaluate where we are maintaining our highest profit margins.

**E. Ranked top 5 categories offering highest average discounts**

Business Goal: Find out which 5 product categories rely the most on heavy discounts to attract customers and drive sales volume.

**F. Calculated price per gram to identify value-for-money products**

Business Goal: Measure the cost-per-gram for items to pinpoint which specific products offer customers the absolute best value for their money.

**G. Grouped products based on weight into Low, Medium, and Bulk categories**

Business Goal: Segment our inventory into clear weight brackets to help the stores organize their shelves and prevent delivery riders from being overloaded.

**H. Measured total inventory weight per product category**

Business Goal: Calculate the total physical weight of all stock combined per category to help logistics teams plan storage capacity and supply shipments.

**I. Packaging Strategy (Bulk Bundles vs. Single Items)**

Business Goal: Determine if Zepto offers sweeter discount incentives on bulk "Multipacks/Bundles" compared to individual single items.

## 🚀 How to Run This Project

1. Copy the code from `schema.sql` and run it in MySQL Workbench to create the database and table.
2. Import the `zepto1.csv` dataset using the **Table Data Import Wizard**. *(Note: If you hit a mapping error on the MRP column, just toggle the target column dropdown to 'Data dropped' and back to 'mrp' to reset it).*
3. Open `Zepto_inventory_analysis_.sql` and run any of the business queries to see the results!

## 📬 Connect with Me

Thanks for checking out my project! If you have any questions or feedback about my project, feel free to reach out:
* **GitHub:** [suminderkaur][(https://github.com/suminderkaur)]
* **LinkedIn:** [Suminder Kaur][(https://www.linkedin.com/in/suminder-kaur-a55b031a6/)]
