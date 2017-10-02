# GCP Billing

## GCP Setup

Create a dataset for the billing and BigQuery audit logs. Go to the Google Cloud Platform console, and select BigQuery, or go to https://bigquery.cloud.google.com/. Click the drop down next to the project name and select Create New Dataset, set a location and click OK.
*Optional: We recommend setting up a new GCP Project, purely for this purpose*

## Setting up the Billing Export

To setup a billing export to BigQuery do the following:

1. Go to the Google Cloud Platform console and select billing
2. Choose the appropriate billing account (if you have more than one) using Manage billing accounts
3. Click Billing Export > BigQuery export
4. Select the Project and Dataset you created earlier
5. Click Enable BigQuery export

Billing data will now be exported to your dataset at regular intervals. The Billing export table is date partitioned, and will incur a small data storage charge.