### **Problem**

You’ve been hired as a **Junior Data Analyst** for **Amazavr**, a leading online retailer that sells a wide range of products across categories like **Electronics**, **Clothing**, **Home Goods**, **Beauty**, and **Sports**. With a global customer base and thousands of daily transactions, efficient inventory management is crucial for maintaining profitability and customer satisfaction.

<aside>

Your team is busy with several tasks, so your manager has asked you to **pick one research project from the backlog** and complete the analysis for that task. You need to choose **one** **area** of research to focus on. You can’t work on all three at once, so pick one topic and stick with it.

- **Sales Performance**
    
    Sales performance analysis usually means identifying which products are driving the most revenue. You can determine the top 3 best-selling products based on sales figures and assess the overall performance of different product categories. By calculating the average sales value for each category, you can identify which categories contribute the most to overall sales, helping the business make informed decisions about inventory and marketing efforts.
    
- **Stock Management**
    
    Stock management analysis usually involves ensuring that inventory levels are optimized to meet demand without overstocking. You can identify products that are below their reorder level and need restocking, preventing stockouts. Additionally, by calculating the total value of inventory for each product, you can assess the financial impact of the current stock, which is crucial for cash flow and purchasing decisions.
    
- **Supplier Analysis**
    
    Supplier analysis usually means evaluating the performance and reliability of the suppliers a company works with. By determining which suppliers contribute the highest revenue from their products, you can identify key partners and assess their overall value to the business. Additionally, calculating the number of unique suppliers gives you an understanding of the company’s supplier diversity and potential risks in the supply chain.
    
</aside>

---

### Data

You will be working with **inventory and sales data** from **March 2023 to October 2024.** The data includes details about products, suppliers, sales, stock levels, and prices, along with other important business metrics.

- **Description of data**
    
    
    | **Column Name** | **Description** | **Data Type** |
    | --- | --- | --- |
    | `Product ID` | Unique identifier for the product. | String |
    | `Product Name` | Name of the product. | String |
    | `Category` | Product category. | String |
    | `Supplier` | Supplier of the product. | String |
    | `Month` | Month and year of the record. | String (Date) |
    | `Unit Price` | Price per unit of the product. | Float |
    | `Stock Quantity` | Total units available in stock. | Integer |
    | `Monthly Sales` | Number of units sold in the month. | Integer |
    | `Monthly Revenue` | Revenue generated from monthly sales. | Float |
    | `Discount %` | Discount applied to the product. | Float |
    | `Reorder Level` | Minimum stock level to trigger reorder. | Integer |
    | `Shelf Life (Days)` | Average shelf life of the product in days. | Integer |
    | `Storage Cost per Unit` | Cost to store one unit of the product. | Float |
    | `Supplier Dependency` | Dependency on the supplier as a percentage. | Integer (%) |
    | `Units Defective` | Number of defective units detected. | Integer |

---

### **Required Steps (100 Points Total)**

- **1. Research Plan & Approach (10 Points)**
    - Develop a clear, detailed plan outlining your research objectives and analytical approach.
    - Describe the key steps you will take to analyze the dataset, including any assumptions and methodologies.
    - It can just be a plan in written format with questions you’d like to check. Save it in .pdf format.

**Python Part**
Next 2 steps should be done in Python Notebook.

- **2. Data Preprocessing & Exploratory Data Analysis (20 Points)**
    - Identify and resolve all data quality issues, including duplicates, missing values, and inconsistencies.
    - Conduct a comprehensive exploratory data analysis (EDA) to understand the dataset’s structure and uncover key trends.
    - Provide a summary of data cleaning steps and initial insights.
- **3. Main Research on chosen area (30 Points)**
    - Perform a thorough analysis using Python to answer key business questions related to stock levels, sales trends, and supplier performance.
    - ⚠️ Note: You need to choose one area of research from the **Problem** section and focus your analysis on that area only. Analysing all three areas won't earn you extra points and may actually lower your score.
    - Ensure your code is well-documented and reproducible.
    - Submit a complete Jupyter notebook with your analysis, **comments and recommendations**
- **4. Tableau Dashboard (30 Points)**
    - Create an interactive Tableau dashboard to visualize key insights from your analysis.
    - The dashboard should be user-friendly and visually appealing and **reflect your area of research**
    - Publish dashboard to Tableau Public and share the link with us.
- **5. Report  (10 Points)**
    - Prepare a concise **1-page** report summarizing your key conclusions and actionable recommendations.
    - It can be a PowerPoint, pdf, Google Slides or any other type of presentation.

---

### Optional Steps (20-30 points each)

- **SQL practice (20 points)**
    - Create a list of questions related to your research topic that can be solved using SQL. The questions should align with the scope of your chosen area of research. Write queries to answer them.
    - **Question Example**
        
        *What is the total revenue generated from each product category in the month of March 2023?*
        
        This can be calculated by summing the `Monthly_Revenue` for each category, grouped by `Category` and filtered by the `Month` (March 2023). Here's an example SQL query that could answer this:
        
        ```sql
        sql
        SELECT
            Category,
            SUM(Monthly_Revenue) AS Total_Revenue
        FROM
            retail_data
        WHERE
            Month = '01-03-2023'
        GROUP BY
            Category;
        
        ```
        
    - For this task, come up with **5** queries like the one above.
    - You can upload the CSV file to any Database Management System (such as DBeaver) and use any SQL dialect to complete the task. Then save your queries as .sql file  or in separate .ipynb
- **Usage of ML algorithms (30 points )**
    - You may use machine learning in your main research, but the choice of ML techniques should be justified based on the area of research and the specific problems you're aiming to solve.

You can choose to complete none, one, or both of the optional steps.

---

### Deliverables

To submit the test assignment, create a Google Drive folder and name it **YourName_DA_Test_mm/yyyy**

(where *mm* is the month and *yyyy i*s the year of submission).

Inside the folder, please include:

- **For Required steps**
    - plan of research in **.pdf**
    - .ipynb notebook with Data Preprocessing, EDA, **Main Research and conclusions+recommendations**
    - **report file** in any format
    - .txt with link to dashboard.

- **For Optional steps**
    - .sql or .ipynb with SQL queries for **SQL practice**
    - If you had ML as an optional step, it should be just included as a separate section in the main **.ipynb notebook**
