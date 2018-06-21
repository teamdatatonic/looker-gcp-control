connection: "bq_metrics"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: bq_metrics_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bq_metrics_default_datagroup

explore: cloudaudit_googleapis_com_activity_20180621 {
  join: cloudaudit_googleapis_com_activity_20180621__resource {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621.resource}]) as cloudaudit_googleapis_com_activity_20180621__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__resource__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Resource Labels"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__resource.labels}]) as cloudaudit_googleapis_com_activity_20180621__resource__labels ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__http_request {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Http Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621.http_request}]) as cloudaudit_googleapis_com_activity_20180621__http_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__source_location {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Source Location"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621.source_location}]) as cloudaudit_googleapis_com_activity_20180621__source_location ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__operation {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Operation"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621.operation}]) as cloudaudit_googleapis_com_activity_20180621__operation ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__request_metadata {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Request Metadata"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog.request_metadata}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__request_metadata ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__request_metadata__request_attributes__headers {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Request Metadata Request Attributes Headers"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__request_metadata__request_attributes.headers}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__request_metadata__request_attributes__headers ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__request_metadata__request_attributes {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Request Metadata Request Attributes"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__request_metadata.request_attributes}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__request_metadata__request_attributes ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__request_metadata__request_attributes__auth {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Request Metadata Request Attributes Auth"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__request_metadata__request_attributes.auth}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__request_metadata__request_attributes__auth ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__authentication_info {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Authentication Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog.authentication_info}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__authentication_info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__authorization_info {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Authorization Info"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog.authorization_info}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__authorization_info ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__authorization_info__resource_attributes {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Authorization Info Resource Attributes"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__authorization_info.resource_attributes}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__authorization_info__resource_attributes ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__authorization_info__resource_attributes__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Authorization Info Resource Attributes Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__authorization_info__resource_attributes.labels}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__authorization_info__resource_attributes__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_google_protobuf_struct {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata Google Protobuf Struct"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog.servicedata_google_protobuf_struct}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_google_protobuf_struct ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621.protopayload_auditlog}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__resource_location {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Resource Location"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog.resource_location}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__resource_location ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_list_request {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset List Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.dataset_list_request}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_list_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__view {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Response Resource View"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource.view}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__view ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Response Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response.resource}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Response Resource Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource.encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__table_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Response Resource Table Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource.table_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__table_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__info {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Response Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource.info}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Response Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__info.labels}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_read_events {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Data Read Events"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.table_data_read_events}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_read_events ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_read_events__table_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Data Read Events Table Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_read_events.table_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_read_events__table_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_query_response}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job.job_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status__additional_errors {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Status Additional Errors"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status.additional_errors}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status__additional_errors ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Status"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job.job_status}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status__error {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Status Error"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status.error}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status__error ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics__referenced_views {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Statistics Referenced Views"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics.referenced_views}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics__referenced_views ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Statistics"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job.job_statistics}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics__reservation_usage {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Statistics Reservation Usage"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics.reservation_usage}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics__reservation_usage ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics__referenced_tables {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Statistics Referenced Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics.referenced_tables}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics__referenced_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Table Copy Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy__source_tables {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Table Copy Source Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy.source_tables}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy__source_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Table Copy"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration.table_copy}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Table Copy Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__extract__source_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Extract Source Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__extract.source_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__extract__source_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__extract {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Extract"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration.extract}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__extract ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job.job_configuration}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Load"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration.load}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Load Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Load Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Query Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__table_definitions {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Query Table Definitions"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query.table_definitions}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__table_definitions ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Query"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration.query}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Query Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__default_dataset {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Query Default Dataset"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query.default_dataset}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__default_dataset ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration.labels}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_request {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_get_query_results_request}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_completed_event}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job.job_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status__additional_errors {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Status Additional Errors"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status.additional_errors}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status__additional_errors ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Status"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job.job_status}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status__error {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Status Error"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status.error}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status__error ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__referenced_views {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Statistics Referenced Views"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics.referenced_views}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__referenced_views ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Statistics"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job.job_statistics}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__reservation_usage {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Statistics Reservation Usage"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics.reservation_usage}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__reservation_usage ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__referenced_tables {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Statistics Referenced Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics.referenced_tables}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__referenced_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Table Copy Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy__source_tables {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Table Copy Source Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy.source_tables}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy__source_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Table Copy"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration.table_copy}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Table Copy Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__extract__source_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Extract Source Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__extract.source_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__extract__source_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__extract {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Extract"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration.extract}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__extract ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job.job_configuration}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Load"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration.load}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Load Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Load Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Query Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__table_definitions {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Query Table Definitions"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query.table_definitions}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__table_definitions ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Query"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration.query}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Query Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__default_dataset {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Query Default Dataset"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query.default_dataset}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__default_dataset ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration.labels}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job.job_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status__additional_errors {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Status Additional Errors"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status.additional_errors}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status__additional_errors ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Status"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job.job_status}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status__error {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Status Error"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status.error}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status__error ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics__referenced_views {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Statistics Referenced Views"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics.referenced_views}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics__referenced_views ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Statistics"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job.job_statistics}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics__reservation_usage {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Statistics Reservation Usage"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics.reservation_usage}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics__reservation_usage ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics__referenced_tables {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Statistics Referenced Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics.referenced_tables}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics__referenced_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Table Copy Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy__source_tables {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Table Copy Source Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy.source_tables}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy__source_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Table Copy"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration.table_copy}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Table Copy Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__extract__source_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Extract Source Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__extract.source_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__extract__source_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__extract {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Extract"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration.extract}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__extract ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job.job_configuration}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Load"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration.load}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Load Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Load Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Query Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__table_definitions {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Query Table Definitions"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query.table_definitions}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__table_definitions ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Query"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration.query}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Query Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__default_dataset {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Query Default Dataset"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query.default_dataset}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__default_dataset ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration.labels}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_get_query_results_response}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job.job_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status__additional_errors {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Status Additional Errors"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status.additional_errors}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status__additional_errors ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Status"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job.job_status}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status__error {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Status Error"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status.error}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status__error ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics__referenced_views {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Statistics Referenced Views"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics.referenced_views}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics__referenced_views ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Statistics"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job.job_statistics}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics__reservation_usage {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Statistics Reservation Usage"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics.reservation_usage}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics__reservation_usage ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics__referenced_tables {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Statistics Referenced Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics.referenced_tables}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics__referenced_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Table Copy Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy__source_tables {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Table Copy Source Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy.source_tables}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy__source_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Table Copy"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration.table_copy}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Table Copy Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__extract__source_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Extract Source Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__extract.source_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__extract__source_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__extract {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Extract"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration.extract}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__extract ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job.job_configuration}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Load"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration.load}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Load Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Load Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Query Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__table_definitions {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Query Table Definitions"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query.table_definitions}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__table_definitions ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Query"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration.query}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Query Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__default_dataset {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Query Default Dataset"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query.default_dataset}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__default_dataset ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration.labels}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response.resource}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__dataset_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response Resource Dataset Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource.dataset_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__dataset_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl__entries {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response Resource Acl Entries"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl.entries}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl__entries ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl__entries__view_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response Resource Acl Entries View Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl__entries.view_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl__entries__view_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__info {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource.info}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__info.labels}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_request {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_query_request}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_request__default_dataset {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Request Default Dataset"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_request.default_dataset}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_request__default_dataset ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request.resource}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__dataset_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request Resource Dataset Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource.dataset_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__dataset_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl__entries {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request Resource Acl Entries"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl.entries}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl__entries ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl__entries__view_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request Resource Acl Entries View Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl__entries.view_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl__entries__view_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__info {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource.info}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__info.labels}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request.resource}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__dataset_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request Resource Dataset Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource.dataset_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__dataset_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl__entries {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request Resource Acl Entries"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl.entries}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl__entries ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl__entries__view_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request Resource Acl Entries View Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl__entries.view_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl__entries__view_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__info {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource.info}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__info.labels}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource.job_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status__additional_errors {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Status Additional Errors"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status.additional_errors}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status__additional_errors ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Status"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource.job_status}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status__error {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Status Error"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status.error}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status__error ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics__referenced_views {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Statistics Referenced Views"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics.referenced_views}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics__referenced_views ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Statistics"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource.job_statistics}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics__reservation_usage {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Statistics Reservation Usage"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics.reservation_usage}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics__reservation_usage ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics__referenced_tables {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Statistics Referenced Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics.referenced_tables}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics__referenced_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Table Copy Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy__source_tables {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Table Copy Source Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy.source_tables}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy__source_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Table Copy"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration.table_copy}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Table Copy Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__extract__source_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Extract Source Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__extract.source_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__extract__source_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__extract {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Extract"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration.extract}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__extract ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource.job_configuration}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Load"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration.load}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Load Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Load Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Query Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__table_definitions {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Query Table Definitions"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query.table_definitions}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__table_definitions ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Query"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration.query}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Query Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__default_dataset {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Query Default Dataset"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query.default_dataset}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__default_dataset ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration.labels}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource.job_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status__additional_errors {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Status Additional Errors"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status.additional_errors}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status__additional_errors ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Status"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource.job_status}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status__error {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Status Error"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status.error}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status__error ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics__referenced_views {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Statistics Referenced Views"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics.referenced_views}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics__referenced_views ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Statistics"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource.job_statistics}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics__reservation_usage {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Statistics Reservation Usage"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics.reservation_usage}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics__reservation_usage ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics__referenced_tables {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Statistics Referenced Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics.referenced_tables}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics__referenced_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Table Copy Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy__source_tables {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Table Copy Source Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy.source_tables}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy__source_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Table Copy"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration.table_copy}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Table Copy Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__extract__source_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Extract Source Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__extract.source_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__extract__source_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__extract {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Extract"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration.extract}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__extract ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource.job_configuration}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Load"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration.load}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Load Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Load Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__destination_table {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Query Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query.destination_table}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__table_definitions {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Query Table Definitions"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query.table_definitions}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__table_definitions ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Query"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration.query}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Query Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query.destination_table_encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__default_dataset {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Query Default Dataset"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query.default_dataset}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__default_dataset ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration.labels}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__view {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Request Resource View"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource.view}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__view ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Request Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request.resource}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Request Resource Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource.encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__table_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Request Resource Table Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource.table_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__table_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__info {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Request Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource.info}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Request Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__info.labels}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__view {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Request Resource View"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource.view}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__view ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Request Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request.resource}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Request Resource Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource.encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__table_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Request Resource Table Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource.table_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__table_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__info {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Request Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource.info}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Request Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__info.labels}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_list_request {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Data List Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.table_data_list_request}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_list_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response.resource}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__dataset_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response Resource Dataset Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource.dataset_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__dataset_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl__entries {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response Resource Acl Entries"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl.entries}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl__entries ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl__entries__view_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response Resource Acl Entries View Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl__entries.view_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl__entries__view_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__info {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource.info}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__info.labels}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__view {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Response Resource View"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource.view}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__view ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Response Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response.resource}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__encryption {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Response Resource Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource.encryption}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__table_name {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Response Resource Table Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource.table_name}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__table_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__info {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Response Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource.info}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Response Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__info.labels}) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__status {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Status"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog.status}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__status ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog.servicedata_v1_bigquery}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.table_update_response}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response.job}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event.job}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response.job}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response.job}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.dataset_update_response}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response Resource Acl"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource.acl}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.dataset_update_request}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request Resource Acl"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource.acl}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.dataset_insert_request}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request Resource Acl"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource.acl}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request.resource}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response.resource}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.table_insert_request}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.table_update_request}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.dataset_insert_response}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response Resource Acl"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource.acl}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.table_insert_response}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_query_done_response}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_insert_request}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response {
    view_label: "Cloudaudit Googleapis Com Activity 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_insert_response}]) as cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response ;;
    relationship: one_to_one
  }
}

explore: cloudaudit_googleapis_com_data_access_20180621 {
  join: cloudaudit_googleapis_com_data_access_20180621__resource {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621.resource}]) as cloudaudit_googleapis_com_data_access_20180621__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__resource__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Resource Labels"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__resource.labels}]) as cloudaudit_googleapis_com_data_access_20180621__resource__labels ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__http_request {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Http Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621.http_request}]) as cloudaudit_googleapis_com_data_access_20180621__http_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__source_location {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Source Location"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621.source_location}]) as cloudaudit_googleapis_com_data_access_20180621__source_location ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__request_metadata {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Request Metadata"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog.request_metadata}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__request_metadata ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__request_metadata__request_attributes__headers {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Request Metadata Request Attributes Headers"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__request_metadata__request_attributes.headers}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__request_metadata__request_attributes__headers ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__request_metadata__request_attributes {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Request Metadata Request Attributes"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__request_metadata.request_attributes}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__request_metadata__request_attributes ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__request_metadata__request_attributes__auth {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Request Metadata Request Attributes Auth"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__request_metadata__request_attributes.auth}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__request_metadata__request_attributes__auth ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__authentication_info {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Authentication Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog.authentication_info}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__authentication_info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__authorization_info {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Authorization Info"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog.authorization_info}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__authorization_info ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__authorization_info__resource_attributes {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Authorization Info Resource Attributes"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__authorization_info.resource_attributes}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__authorization_info__resource_attributes ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__authorization_info__resource_attributes__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Authorization Info Resource Attributes Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__authorization_info__resource_attributes.labels}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__authorization_info__resource_attributes__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621.protopayload_auditlog}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__resource_location {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Resource Location"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog.resource_location}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__resource_location ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_list_request {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset List Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.dataset_list_request}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_list_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__view {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Response Resource View"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource.view}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__view ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Response Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response.resource}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Response Resource Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource.encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__table_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Response Resource Table Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource.table_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__table_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__info {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Response Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource.info}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Response Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__info.labels}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_read_events {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Data Read Events"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.table_data_read_events}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_read_events ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_read_events__table_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Data Read Events Table Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_read_events.table_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_read_events__table_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_query_response}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job.job_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status__additional_errors {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Status Additional Errors"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status.additional_errors}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status__additional_errors ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Status"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job.job_status}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status__error {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Status Error"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status.error}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status__error ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics__referenced_views {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Statistics Referenced Views"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics.referenced_views}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics__referenced_views ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Statistics"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job.job_statistics}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics__reservation_usage {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Statistics Reservation Usage"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics.reservation_usage}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics__reservation_usage ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics__referenced_tables {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Statistics Referenced Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics.referenced_tables}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics__referenced_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Table Copy Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy__source_tables {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Table Copy Source Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy.source_tables}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy__source_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Table Copy"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration.table_copy}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Table Copy Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__extract__source_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Extract Source Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__extract.source_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__extract__source_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__extract {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Extract"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration.extract}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__extract ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job.job_configuration}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Load"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration.load}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Load Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Load Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Query Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__table_definitions {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Query Table Definitions"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query.table_definitions}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__table_definitions ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Query"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration.query}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Query Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__default_dataset {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Query Default Dataset"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query.default_dataset}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__default_dataset ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job Job Configuration Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration.labels}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_request {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_get_query_results_request}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_completed_event}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job.job_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status__additional_errors {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Status Additional Errors"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status.additional_errors}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status__additional_errors ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Status"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job.job_status}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status__error {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Status Error"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status.error}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status__error ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__referenced_views {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Statistics Referenced Views"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics.referenced_views}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__referenced_views ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Statistics"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job.job_statistics}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__reservation_usage {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Statistics Reservation Usage"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics.reservation_usage}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__reservation_usage ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__referenced_tables {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Statistics Referenced Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics.referenced_tables}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__referenced_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Table Copy Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy__source_tables {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Table Copy Source Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy.source_tables}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy__source_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Table Copy"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration.table_copy}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Table Copy Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__extract__source_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Extract Source Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__extract.source_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__extract__source_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__extract {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Extract"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration.extract}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__extract ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job.job_configuration}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Load"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration.load}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Load Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Load Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Query Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__table_definitions {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Query Table Definitions"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query.table_definitions}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__table_definitions ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Query"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration.query}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Query Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__default_dataset {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Query Default Dataset"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query.default_dataset}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__default_dataset ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job Job Configuration Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration.labels}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job.job_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status__additional_errors {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Status Additional Errors"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status.additional_errors}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status__additional_errors ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Status"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job.job_status}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status__error {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Status Error"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status.error}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status__error ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics__referenced_views {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Statistics Referenced Views"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics.referenced_views}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics__referenced_views ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Statistics"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job.job_statistics}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics__reservation_usage {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Statistics Reservation Usage"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics.reservation_usage}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics__reservation_usage ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics__referenced_tables {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Statistics Referenced Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics.referenced_tables}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics__referenced_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Table Copy Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy__source_tables {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Table Copy Source Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy.source_tables}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy__source_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Table Copy"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration.table_copy}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Table Copy Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__extract__source_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Extract Source Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__extract.source_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__extract__source_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__extract {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Extract"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration.extract}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__extract ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job.job_configuration}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Load"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration.load}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Load Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Load Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Query Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__table_definitions {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Query Table Definitions"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query.table_definitions}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__table_definitions ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Query"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration.query}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Query Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__default_dataset {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Query Default Dataset"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query.default_dataset}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__default_dataset ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job Job Configuration Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration.labels}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Set Iam Policy Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.set_iam_policy_request}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request__update_mask {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Set Iam Policy Request Update Mask"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request.update_mask}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request__update_mask ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request__policy__bindings {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Set Iam Policy Request Policy Bindings"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request__policy.bindings}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request__policy__bindings ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request__policy {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Set Iam Policy Request Policy"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request.policy}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request__policy ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request__policy__audit_configs__audit_log_configs {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Set Iam Policy Request Policy Audit Configs Audit Log Configs"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request__policy__audit_configs.audit_log_configs}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request__policy__audit_configs__audit_log_configs ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request__policy__audit_configs {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Set Iam Policy Request Policy Audit Configs"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request__policy.audit_configs}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__set_iam_policy_request__policy__audit_configs ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_get_query_results_response}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job.job_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status__additional_errors {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Status Additional Errors"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status.additional_errors}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status__additional_errors ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Status"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job.job_status}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status__error {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Status Error"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status.error}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status__error ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics__referenced_views {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Statistics Referenced Views"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics.referenced_views}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics__referenced_views ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Statistics"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job.job_statistics}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics__reservation_usage {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Statistics Reservation Usage"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics.reservation_usage}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics__reservation_usage ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics__referenced_tables {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Statistics Referenced Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics.referenced_tables}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics__referenced_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Table Copy Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy__source_tables {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Table Copy Source Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy.source_tables}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy__source_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Table Copy"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration.table_copy}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Table Copy Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__extract__source_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Extract Source Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__extract.source_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__extract__source_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__extract {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Extract"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration.extract}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__extract ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job.job_configuration}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Load"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration.load}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Load Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Load Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Query Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__table_definitions {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Query Table Definitions"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query.table_definitions}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__table_definitions ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Query"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration.query}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Query Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__default_dataset {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Query Default Dataset"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query.default_dataset}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__default_dataset ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job Job Configuration Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration.labels}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response.resource}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__dataset_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response Resource Dataset Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource.dataset_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__dataset_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl__entries {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response Resource Acl Entries"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl.entries}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl__entries ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl__entries__view_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response Resource Acl Entries View Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl__entries.view_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl__entries__view_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__info {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource.info}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__info.labels}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_request {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_query_request}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_request__default_dataset {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Request Default Dataset"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_request.default_dataset}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_request__default_dataset ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__policy_response__bindings {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Policy Response Bindings"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__policy_response.bindings}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__policy_response__bindings ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__policy_response {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Policy Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.policy_response}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__policy_response ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__policy_response__audit_configs__audit_log_configs {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Policy Response Audit Configs Audit Log Configs"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__policy_response__audit_configs.audit_log_configs}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__policy_response__audit_configs__audit_log_configs ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__policy_response__audit_configs {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Policy Response Audit Configs"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__policy_response.audit_configs}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__policy_response__audit_configs ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request.resource}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__dataset_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request Resource Dataset Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource.dataset_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__dataset_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl__entries {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request Resource Acl Entries"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl.entries}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl__entries ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl__entries__view_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request Resource Acl Entries View Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl__entries.view_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl__entries__view_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__info {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource.info}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__info.labels}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request.resource}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__dataset_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request Resource Dataset Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource.dataset_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__dataset_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl__entries {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request Resource Acl Entries"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl.entries}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl__entries ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl__entries__view_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request Resource Acl Entries View Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl__entries.view_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl__entries__view_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__info {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource.info}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__info.labels}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource.job_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status__additional_errors {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Status Additional Errors"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status.additional_errors}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status__additional_errors ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Status"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource.job_status}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status__error {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Status Error"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status.error}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status__error ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics__referenced_views {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Statistics Referenced Views"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics.referenced_views}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics__referenced_views ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Statistics"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource.job_statistics}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics__reservation_usage {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Statistics Reservation Usage"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics.reservation_usage}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics__reservation_usage ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics__referenced_tables {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Statistics Referenced Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics.referenced_tables}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics__referenced_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Table Copy Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy__source_tables {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Table Copy Source Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy.source_tables}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy__source_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Table Copy"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration.table_copy}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Table Copy Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__extract__source_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Extract Source Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__extract.source_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__extract__source_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__extract {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Extract"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration.extract}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__extract ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource.job_configuration}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Load"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration.load}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Load Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Load Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Query Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__table_definitions {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Query Table Definitions"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query.table_definitions}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__table_definitions ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Query"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration.query}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Query Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__default_dataset {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Query Default Dataset"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query.default_dataset}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__default_dataset ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource Job Configuration Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration.labels}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource.job_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status__additional_errors {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Status Additional Errors"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status.additional_errors}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status__additional_errors ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Status"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource.job_status}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status__error {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Status Error"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status.error}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status__error ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics__referenced_views {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Statistics Referenced Views"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics.referenced_views}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics__referenced_views ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Statistics"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource.job_statistics}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics__reservation_usage {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Statistics Reservation Usage"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics.reservation_usage}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics__reservation_usage ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics__referenced_tables {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Statistics Referenced Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics.referenced_tables}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics__referenced_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Table Copy Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy__source_tables {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Table Copy Source Tables"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy.source_tables}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy__source_tables ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Table Copy"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration.table_copy}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Table Copy Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__extract__source_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Extract Source Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__extract.source_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__extract__source_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__extract {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Extract"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration.extract}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__extract ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource.job_configuration}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Load"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration.load}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Load Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Load Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__destination_table {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Query Destination Table"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query.destination_table}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__destination_table ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__table_definitions {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Query Table Definitions"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query.table_definitions}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__table_definitions ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Query"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration.query}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__destination_table_encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Query Destination Table Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query.destination_table_encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__destination_table_encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__default_dataset {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Query Default Dataset"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query.default_dataset}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__default_dataset ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource Job Configuration Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration.labels}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__view {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Request Resource View"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource.view}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__view ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Request Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request.resource}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Request Resource Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource.encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__table_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Request Resource Table Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource.table_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__table_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__info {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Request Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource.info}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Request Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__info.labels}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__view {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Request Resource View"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource.view}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__view ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Request Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request.resource}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Request Resource Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource.encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__table_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Request Resource Table Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource.table_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__table_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__info {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Request Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource.info}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Request Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__info.labels}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_list_request {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Data List Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.table_data_list_request}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_list_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response.resource}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__dataset_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response Resource Dataset Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource.dataset_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__dataset_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl__entries {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response Resource Acl Entries"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl.entries}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl__entries ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl__entries__view_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response Resource Acl Entries View Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl__entries.view_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl__entries__view_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__info {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource.info}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__info.labels}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__view {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Response Resource View"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource.view}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__view ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Response Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response.resource}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__encryption {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Response Resource Encryption"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource.encryption}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__encryption ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__table_name {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Response Resource Table Name"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource.table_name}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__table_name ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__info {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Response Resource Info"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource.info}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__info__labels {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Response Resource Info Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__info.labels}) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__info__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__status {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Status"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog.status}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__status ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__operation {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Operation"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621.operation}]) as cloudaudit_googleapis_com_data_access_20180621__operation ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog.servicedata_v1_bigquery}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.table_update_response}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Response Job"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response.job}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Completed Event Job"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event.job}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response Job"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response.job}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Get Query Results Response Job"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response.job}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.dataset_update_response}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Response Resource Acl"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource.acl}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.dataset_update_request}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Update Request Resource Acl"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource.acl}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.dataset_insert_request}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Request Resource Acl"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource.acl}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request.resource}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response.resource}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.table_insert_request}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Update Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.table_update_request}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.dataset_insert_response}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Dataset Insert Response Resource Acl"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource.acl}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Table Insert Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.table_insert_response}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Query Done Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_query_done_response}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Request"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_insert_request}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response {
    view_label: "Cloudaudit Googleapis Com Data Access 20180621: Protopayload Auditlog Servicedata V1 Bigquery Job Insert Response"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery.job_insert_response}]) as cloudaudit_googleapis_com_data_access_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response ;;
    relationship: one_to_one
  }
}
