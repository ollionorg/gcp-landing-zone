import os
from google.cloud import storage
from google.cloud import bigquery
import datetime

# Variables required to execute script
#

current_datetime = datetime.datetime.now()
timestamp = current_datetime.strftime("%Y-%m-%d_%H-%M-%S")

DOMAIN = os.environ["ORG_DOMAIN_NAME"]
BUCKET_NAME = os.environ["BUCKET_NAME"]
FOLDER_NAME = os.environ["PARENT_FOLDER"]
OUTPUT_BLOB_NAME = f"cto_groups_monthly_report_{timestamp}.csv"


def fetch_cto_build_group(request):
    # Create a BigQuery client
    try:
        client = bigquery.Client()

        # Your BigQuery SQL query
        query = f"""SELECT * FROM `operations_logs.cloudaudit_googleapis_com_activity` WHERE logName = 
        "folders/{FOLDER_NAME}/logs/cloudaudit.googleapis.com%2Factivity" AND 
        protopayload_auditlog.methodName="SetIamPolicy" AND CONTAINS_SUBSTR(protopayload_auditlog.requestJson, 
        "group:cto_build_group@{DOMAIN}") OR CONTAINS_SUBSTR(protopayload_auditlog.requestJson, 
        "group:cto_security_build_group@{DOMAIN}") OR CONTAINS_SUBSTR(protopayload_auditlog.requestJson, 
        "group:cto_elevated_security_build_group@{DOMAIN}") OR CONTAINS_SUBSTR(protopayload_auditlog.requestJson, 
        "group:cto_security_operations_group@{DOMAIN}") OR CONTAINS_SUBSTR(protopayload_auditlog.requestJson, 
        "group:cto_elevated_security_operations_group@{DOMAIN}") OR CONTAINS_SUBSTR(protopayload_auditlog.requestJson, 
        "group:cto_operations_group@{DOMAIN}") OR CONTAINS_SUBSTR(protopayload_auditlog.requestJson, 
        "group:cto_core_networking_operations_group@{DOMAIN}") OR CONTAINS_SUBSTR(protopayload_auditlog.requestJson, 
        "group:cto_user_management_operations_group@{DOMAIN}") OR CONTAINS_SUBSTR(protopayload_auditlog.requestJson, 
        "group:cto_audit_compliance_operations_group@{DOMAIN}") AND TIMESTAMP_TRUNC(timestamp, DAY) = TIMESTAMP(DATE(
        CURRENT_DATETIME()))"""
        # Execute the query
        query_job = client.query(query)
        # Fetch query results
        results = query_job.result()
        # Export the BigQuery results to a Google Cloud Storage bucket
        storage_client = storage.Client()
        bucket = storage_client.bucket(BUCKET_NAME)
        blob = bucket.blob(OUTPUT_BLOB_NAME)
        blob.upload_from_string(results.to_dataframe().to_csv(index=False), content_type="text/csv")
        return "Report saved to " + BUCKET_NAME + " successfully!"
    except Exception as e:
        return str(e)
