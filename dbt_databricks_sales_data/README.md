📌 Project Overview
The goal of this project is to transform raw data into a modular, well-tested, and documented data warehouse using dbt Core. While the tutorial uses Databricks, the logic and project structure are designed to be adapter-agnostic (Snowflake, BigQuery, etc.).

🛠 Features & Concepts Covered
- Project Setup: Environment configuration using uv for package management.
- dbt Models: Implementation of modular data layers (Bronze/Silver/Gold architecture).
- Sources & Seeds: Managing raw data sources and loading CSV files via dbt seeds.
- Data Testing: - Generic Tests: Ensuring uniqueness, non-null values, and accepted values.
- Singular Tests: Custom SQL-based business logic validations.
- Macros & Jinja: Dynamic SQL generation using Jinja templating and reusable macros.
- Snapshots: Implementing SCD Type 2 (Slowly Changing Dimensions) to track historical data changes.
- Packages: Integration of external dbt packages (e.g., dbt_utils).
- CI/CD: Automated deployment workflows using GitHub Actions.

📂 Project Structure
├── models/           # Transformation logic (Staging, Intermediate, Marts)
├── seeds/            # Static data files (CSVs)
├── snapshots/        # SCD Type 2 logic
├── macros/           # Reusable Jinja functions
├── tests/            # Custom data quality tests
├── dbt_project.yml   # Project configuration
└── profiles.yml      # Connection settings (Ignored by Git for security)