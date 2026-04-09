# 💸 Expense Management System

## 📌 Overview

This project is an **Expense Management System** designed to help users efficiently track, update, and analyze their expenses.
It features a **Streamlit frontend** for an interactive user experience and a **FastAPI backend** for handling data operations.

The system allows users to not only manage their expenses but also gain meaningful insights through visual analytics.

---

## ✨ Key Features

### ➕ Add / Update Expenses

* Add new expense entries with details such as amount, category, and date
* Update or modify existing records
* Maintain an organized and editable expense log

### 📊 Analytics by Category

* View expenses grouped by categories (e.g., Food, Travel, Bills)
* Identify spending patterns across different categories
* Helps in better budgeting and cost control

### 📅 Analytics by Month

* Track monthly spending trends
* Compare expenses across different months
* Useful for monitoring financial habits over time

---

## 🧩 Project Structure

```
/frontend      → Streamlit application (UI)
/backend       → FastAPI server (API & logic)
/tests         → Test cases
requirements.txt → Dependencies
README.md      → Project documentation
```

---

## ⚙️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/expense-management-system.git
cd expense-management-system
```

### 2. Install Dependencies

```bash
pip install -r requirements.txt
```

### 3. Run the FastAPI Server

```bash
uvicorn server.server:app --reload
```

### 4. Run the Streamlit App

```bash
streamlit run frontend/app.py
```

---

## 🚀 How to Use

1. Open the Streamlit app in your browser
2. Navigate through the three main tabs:

   * **Add/Update** → Manage your expenses
   * **Analytics by Category** → View category-wise insights
   * **Analytics by Month** → Analyze monthly trends
3. Interact with charts and data to understand your spending

---

## 🛠 Tech Stack

* **Frontend:** Streamlit
* **Backend:** FastAPI
* **Language:** Python

---

## 📈 Future Improvements

* User authentication
* Export reports (PDF/CSV)
* Budget setting and alerts
* Advanced visual dashboards

