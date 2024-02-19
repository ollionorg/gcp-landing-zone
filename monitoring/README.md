# CTO Monthly Groups Report Generator

This script fetches data from BigQuery regarding CTO group activities and exports the results to a CSV file stored in Google Cloud Storage.

## Prerequisites

- Python 3.x installed.
- Access to Google Cloud Platform with permissions to read from BigQuery and write to Cloud Storage.
- Required Python libraries: `google-cloud-storage`, `google-cloud-bigquery`.

## Configuration

Before running the script, ensure the following variables are properly configured:

- `ORG_DOMAIN_NAME`: The domain name associated with your organization.
- `BUCKET_NAME`: The name of the Google Cloud Storage bucket where the report will be stored.
- `PARENT_FOLDER`: The parent folder where logs are stored.
  
## Usage

1. Ensure the script prerequisites are met.
2. Set the required environment variables mentioned in the configuration.
3. Run the script `fetch_cto_build_group.py`.
4. The generated report will be saved to the specified Google Cloud Storage bucket.

## Script Details

- `fetch_cto_build_group(request)`: Function to fetch CTO group activities from BigQuery.
- `query`: SQL query to retrieve relevant data from BigQuery.
- `results.to_dataframe().to_csv()`: Converts query results to a CSV format.
- The CSV file is then uploaded to the specified Google Cloud Storage bucket.

## Error Handling

- The script includes basic error handling to catch and return exceptions encountered during execution.

## Note

Ensure proper IAM permissions are set for accessing BigQuery and Cloud Storage resources.
