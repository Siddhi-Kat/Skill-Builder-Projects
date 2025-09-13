## 📊 Netflix Power BI Dashboard
### 📌 Project Overview

Through this Netflix dashboard, I practiced data cleaning, transformation, and storytelling in Power BI — turning raw data into insights about Netflix’s content trends. The project helped me strengthen my skills in working with messy datasets and designing interactive dashboards that highlight meaningful patterns.

### 🔎 Summarized Analysis

- Content Growth: Rapid increase in Netflix’s library after 2015, with TV shows catching up to movies.
- Country Insights: The USA leads in content production, followed by India and the UK.
- Genre Popularity: Dramas and Comedies dominate across both movies and TV shows.
- Audience Targeting: Majority of content falls under TV-MA and TV-14, showing Netflix’s focus on mature and young adult audiences.

### 🗂 Dataset

Source: Netflix Movies and TV Shows Dataset on Kaggle\
Size: 8,807 records (titles) with metadata about Netflix Movies & TV Shows.\
Columns in the Dataset:

- show_id – Unique identifier for each title
- type – Whether the entry is a Movie or TV Show
- title – Name of the Movie/TV Show
- director – Director(s) of the title
- cast – Main cast members
- country – Country of origin
- date_added – Date when the title was added to Netflix
- release_year – Year of release
- rating – Content rating (e.g., TV-MA, PG, R)
- duration – Duration (minutes for movies, number of seasons for TV shows)
- listed_in – Genre(s) or categories assigned to the title
- description – Short summary of the title

### 🛠 Project Process

Data Collection

Imported the Netflix Movies & TV Shows dataset from Kaggle into Power BI.\
https://www.kaggle.com/datasets/shivamb/netflix-shows

Data Cleaning & Transformation

- Removed duplicates and handled missing values.
- Standardized Date Added and Duration columns.
- Performed unpivoting to eliminate multi-valued attributes and convert the dataset into First Normal Form (1NF).

Data Modeling
- Built relationships between tables.
- Created separate relational tables for Cast, Directors, and Description using Show ID as a key for my single view titile page

Dashboard Design
- Designed interactive visuals: bar charts, maps, pie charts, and line charts.
- Enabled a detail page where selecting one title displays all related information (cast, director, description, and other attributes).
- Applied conditional formatting to highlight trends and patterns.

