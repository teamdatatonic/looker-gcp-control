view: bigquery_data_access {
  derived_table: {
    sql:
      SELECT
        *
      FROM
        `gcp_logs.cloudaudit_googleapis_com_data_access_*`
      WHERE
        {% condition date_filter %} PARSE_TIMESTAMP('%E4Y%m%d', _TABLE_SUFFIX) {% endcondition %} ;;
  }

  filter: date_filter {
    type: date
  }

  dimension: http_request {
    hidden: yes
    sql: ${TABLE}.httpRequest ;;
  }

  dimension: insert_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.insertId ;;
  }

  dimension: log_name {
    type: string
    sql: ${TABLE}.logName;;
  }

  dimension: operation {
    hidden: yes
    sql: ${TABLE}.operation ;;
  }

  dimension: protopayload_auditlog {
    hidden: yes
    sql: ${TABLE}.protopayload_auditlog ;;
  }

  dimension_group: receive_timestamp {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.receiveTimestamp ;;
  }

  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }

  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }

  dimension: source_location {
    hidden: yes
    sql: ${TABLE}.sourceLocation ;;
  }

  dimension_group: timestamp {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: trace {
    type: string
    sql: ${TABLE}.trace ;;
  }

  measure: number_of_queries {
    view_label: "BigQuery Data Access: Query Statistics"
    type: count
    drill_fields: [bigquery_data_access_authentication_info.user_id
                  , bigquery_data_access_job_statistics.start_time
                  , bigquery_data_access_resource_labels.project_id
                  , bigquery_data_access_query.query
                  , bigquery_data_access_job_statistics.billed_gigabytes
                  , bigquery_data_access_job_statistics.query_runtime
                  , bigquery_data_access_job_statistics.query_cost
                  , bigquery_data_access_job_status_error.code
                  , bigquery_data_access_job_status_error.message]
  }

  measure: number_of_expensive_queries {
    view_label: "BigQuery Data Access: Query Statistics"
    type: count
    filters: {
      field: bigquery_data_access_job_statistics.billed_gigabytes
      value: ">30"
    }
    drill_fields: [bigquery_data_access_authentication_info.user_id
                  , bigquery_data_access_job_statistics.start_time
                  , bigquery_data_access_resource_labels.project_id
                  , bigquery_data_access_query.query
                  , bigquery_data_access_job_statistics.billed_gigabytes
                  , bigquery_data_access_job_statistics.query_runtime
                  , bigquery_data_access_job_statistics.query_cost
                  , bigquery_data_access_job_status_error.code
                  , bigquery_data_access_job_status_error.message]
  }
}

view: bigquery_data_access_resource {
  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: type {
    hidden: yes
    type: string
    sql: ${TABLE}.type ;;
  }
}

view: bigquery_data_access_resource_labels {
  dimension: project_id {
    view_label: "BigQuery Data Access"
    type: string
    sql: ${TABLE}.project_id ;;
  }
}

view: bigquery_data_access_http_request {
  dimension: cache_fill_bytes {
    type: number
    sql: ${TABLE}.cacheFillBytes ;;
  }

  dimension: cache_hit {
    type: yesno
    sql: ${TABLE}.cacheHit ;;
  }

  dimension: cache_lookup {
    type: yesno
    sql: ${TABLE}.cacheLookup ;;
  }

  dimension: cache_validated_with_origin_server {
    type: yesno
    sql: ${TABLE}.cacheValidatedWithOriginServer ;;
  }

  dimension: latency {
    type: number
    sql: ${TABLE}.latency ;;
  }

  dimension: protocol {
    type: string
    sql: ${TABLE}.protocol ;;
  }

  dimension: referer {
    type: string
    sql: ${TABLE}.referer ;;
  }

  dimension: remote_ip {
    type: string
    sql: ${TABLE}.remoteIp ;;
  }

  dimension: request_method {
    type: string
    sql: ${TABLE}.requestMethod ;;
  }

  dimension: request_size {
    type: number
    sql: ${TABLE}.requestSize ;;
  }

  dimension: request_url {
    type: string
    sql: ${TABLE}.requestUrl ;;
  }

  dimension: response_size {
    type: number
    sql: ${TABLE}.responseSize ;;
  }

  dimension: server_ip {
    type: string
    sql: ${TABLE}.serverIp ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.userAgent ;;
  }
}

view: bigquery_data_access_source_location {
  dimension: file {
    type: string
    sql: ${TABLE}.file ;;
  }

  dimension: function {
    type: string
    sql: ${TABLE}.function ;;
  }

  dimension: line {
    type: number
    sql: ${TABLE}.line ;;
  }
}

view: bigquery_data_access_operation {
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: first {
    type: yesno
    sql: ${TABLE}.first ;;
  }

  dimension: last {
    type: yesno
    sql: ${TABLE}.last ;;
  }

  dimension: producer {
    type: string
    sql: ${TABLE}.producer ;;
  }
}

view: bigquery_data_access_request_metadata {
  dimension: caller_ip {
    type: string
    sql: ${TABLE}.callerIp ;;
  }

  dimension: caller_supplied_user_agent {
    type: string
    sql: ${TABLE}.callerSuppliedUserAgent ;;
  }
}

view: bigquery_data_access_authentication_info {
  dimension: authority_selector {
    hidden: yes
    type: string
    sql: ${TABLE}.authoritySelector ;;
  }

  dimension: user_id {
    label: "User ID"
    type: string
    sql: ${TABLE}.principalEmail ;;
  }

  dimension: is_service_account {
    type: yesno
    sql: (${user_id} LIKE '%gserviceaccount%') ;;

  }

  measure: number_of_active_users {
    description: "Excludes Service Accounts"
    type: count_distinct
    sql: ${user_id} ;;
    filters: {
      field: is_service_account
      value: "no"
    }
    drill_fields: [user_id]
  }
}

view: bigquery_data_authorization_info {
  dimension: granted {
    type: yesno
    sql: ${TABLE}.granted ;;
  }

  dimension: permission {
    type: string
    sql: ${TABLE}.permission ;;
  }

  dimension: resource {
    type: string
    sql: ${TABLE}.resource ;;
  }
}

view: bigquery_data_access_payload {
  dimension: authentication_info {
    hidden: yes
    sql: ${TABLE}.authenticationInfo ;;
  }

  dimension: authorization_info {
    hidden: yes
    sql: ${TABLE}.authorizationInfo ;;
  }

  dimension: method_name {
    type: string
    sql: ${TABLE}.methodName ;;
  }

  dimension: num_response_items {
    type: number
    sql: ${TABLE}.numResponseItems ;;
  }

  dimension: request_metadata {
    hidden: yes
    sql: ${TABLE}.requestMetadata ;;
  }

  dimension: resource_name {
    type: string
    sql: ${TABLE}.resourceName ;;
  }

  dimension: service_name {
    type: string
    sql: ${TABLE}.serviceName ;;
  }

  dimension: servicedata_v1_bigquery {
    hidden: yes
    sql: ${TABLE}.servicedata_v1_bigquery ;;
  }

  dimension: status {
    hidden: yes
    sql: ${TABLE}.status ;;
  }
}

view: bigquery_data_access_table_data_list_request {
  dimension: max_results {
    type: number
    sql: ${TABLE}.maxResults ;;
  }

  dimension: start_row {
    type: number
    sql: ${TABLE}.startRow ;;
  }
}

view: bigquery_data_access_job_completed_event {
  dimension: event_name {
    type: string
    sql: ${TABLE}.eventName ;;
  }

  dimension: job {
    hidden: yes
    sql: ${TABLE}.job ;;
  }
}

view: bigquery_data_access_job_name {
  dimension: job_id {
    type: string
    sql: ${TABLE}.jobId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: bigquery_data_access_job_status {
  dimension: error {
    hidden: yes
    sql: ${TABLE}.error ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: query_failed {
    type: yesno
    sql: ${error} IS NOT NULL ;;
}
}

view: bigquery_data_access_job_status_error {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

}

view: bigquery_data_access_job_statistics {
  dimension: billing_tier {
    type: number
    sql: ${TABLE}.billingTier ;;
  }

  dimension_group: create {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.createTime ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.endTime ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.startTime ;;
  }

  dimension: billed_bytes {
    type: number
    sql: ${TABLE}.totalBilledBytes ;;
  }

  dimension: processed_bytes {
    type: number
    sql: ${TABLE}.totalProcessedBytes ;;
  }

  dimension: billed_gigabytes {
    type: number
    sql: 1.0*${billed_bytes}/1000000000 ;;
  }

  dimension: billed_terabytes {
    type: number
    sql: 1.0*${billed_bytes}/1000000000000 ;;
  }

  measure: total_billed_gigabytes {
    type: sum
    view_label: "BigQuery Data Access: Query Statistics"
    sql: ${billed_gigabytes} ;;
    value_format_name: decimal_2
    drill_fields: [bigquery_data_access_authentication_info.user_id
      , bigquery_data_access_job_statistics.start_time
      , bigquery_data_access_resource_labels.project_id
      , bigquery_data_access_query.query
      , bigquery_data_access_job_statistics.billed_gigabytes
      , bigquery_data_access_job_statistics.query_runtime
      , bigquery_data_access_job_statistics.query_cost
      , bigquery_data_access_job_status_error.code
      , bigquery_data_access_job_status_error.message]
  }

  measure: total_billed_terabytes {
    type: sum
    view_label: "BigQuery Data Access: Query Statistics"
    sql: ${billed_terabytes} ;;
    value_format_name: decimal_2
    drill_fields: [bigquery_data_access_authentication_info.user_id
      , bigquery_data_access_job_statistics.start_time
      , bigquery_data_access_resource_labels.project_id
      , bigquery_data_access_query.query
      , bigquery_data_access_job_statistics.billed_gigabytes
      , bigquery_data_access_job_statistics.query_runtime
      , bigquery_data_access_job_statistics.query_cost
      , bigquery_data_access_job_status_error.code
      , bigquery_data_access_job_status_error.message]
  }

  measure: average_billed_gigabytes {
    type: average
    view_label: "BigQuery Data Access: Query Statistics"
    sql: ${billed_gigabytes} ;;
    value_format_name: decimal_2
    drill_fields: [bigquery_data_access_authentication_info.user_id
      , bigquery_data_access_job_statistics.start_time
      , bigquery_data_access_resource_labels.project_id
      , bigquery_data_access_query.query
      , bigquery_data_access_job_statistics.billed_gigabytes
      , bigquery_data_access_job_statistics.query_runtime
      , bigquery_data_access_job_statistics.query_cost
      , bigquery_data_access_job_status_error.code
      , bigquery_data_access_job_status_error.message]
  }

  measure: average_billed_terabytes {
    type: average
    view_label: "BigQuery Data Access: Query Statistics"
    sql: ${billed_terabytes} ;;
    value_format_name: decimal_2
    drill_fields: [bigquery_data_access_authentication_info.user_id
      , bigquery_data_access_job_statistics.start_time
      , bigquery_data_access_resource_labels.project_id
      , bigquery_data_access_query.query
      , bigquery_data_access_job_statistics.billed_gigabytes
      , bigquery_data_access_job_statistics.query_runtime
      , bigquery_data_access_job_statistics.query_cost
      , bigquery_data_access_job_status_error.code
      , bigquery_data_access_job_status_error.message]
  }

  dimension: query_cost {
    type: number
    sql: 5.0*${billed_bytes}/1000000000000 ;;
    value_format_name: usd
  }

  measure: total_query_cost {
    type: sum
    sql: ${query_cost} ;;
    value_format_name: usd
    drill_fields: [bigquery_data_access_authentication_info.user_id
      , bigquery_data_access_job_statistics.start_time
      , bigquery_data_access_resource_labels.project_id
      , bigquery_data_access_query.query
      , bigquery_data_access_job_statistics.billed_gigabytes
      , bigquery_data_access_job_statistics.query_runtime
      , bigquery_data_access_job_statistics.query_cost
      , bigquery_data_access_job_status_error.code
      , bigquery_data_access_job_status_error.message]
  }

  measure: average_query_cost {
    type: average
    sql: ${query_cost} ;;
    value_format_name: usd
    drill_fields: [bigquery_data_access_authentication_info.user_id
      , bigquery_data_access_job_statistics.start_time
      , bigquery_data_access_resource_labels.project_id
      , bigquery_data_access_query.query
      , bigquery_data_access_job_statistics.billed_gigabytes
      , bigquery_data_access_job_statistics.query_runtime
      , bigquery_data_access_job_statistics.query_cost
      , bigquery_data_access_job_status_error.code
      , bigquery_data_access_job_status_error.message]
  }

  dimension: query_runtime {
    type: number
    sql: 1.0*TIMESTAMP_DIFF(${end_raw}, ${start_raw}, MILLISECOND)/1000 ;;
    value_format_name: decimal_1
  }

  measure: average_query_runtime {
    type: average
    sql: ${query_runtime} ;;
    value_format_name: decimal_1
    drill_fields: [bigquery_data_access_authentication_info.user_id
      , bigquery_data_access_job_statistics.start_time
      , bigquery_data_access_resource_labels.project_id
      , bigquery_data_access_query.query
      , bigquery_data_access_job_statistics.billed_gigabytes
      , bigquery_data_access_job_statistics.query_runtime
      , bigquery_data_access_job_statistics.query_cost
      , bigquery_data_access_job_status_error.code
      , bigquery_data_access_job_status_error.message]
  }
}

view: bigquery_data_access_job_configuration {
  dimension: dry_run {
    type: yesno
    sql: ${TABLE}.dryRun ;;
  }

  dimension: query {
    hidden: yes
    sql: ${TABLE}.query ;;
  }
}

view: bigquery_data_access_query_destination_table {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }

  dimension: table_id {
    type: string
    sql: ${TABLE}.tableId ;;
  }
}

view: bigquery_data_access_query_table_definitions {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: source_uris {
    type: string
    sql: ${TABLE}.sourceUris ;;
  }
}

view: bigquery_data_access_query {
  dimension: create_disposition {
    type: string
    sql: ${TABLE}.createDisposition ;;
  }

  dimension: default_dataset {
    hidden: yes
    sql: ${TABLE}.defaultDataset ;;
  }

  dimension: destination_table {
    hidden: yes
    sql: ${TABLE}.destinationTable ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: table_definitions {
    hidden: yes
    sql: ${TABLE}.tableDefinitions ;;
  }

  dimension: write_disposition {
    type: string
    sql: ${TABLE}.writeDisposition ;;
  }
}

view: bigquery_data_access_query_default_dataset {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: bigquery_data_access_protopayload_auditlog_status {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: bigquery_data_access_servicedata {
  dimension: job_completed_event {
    hidden: yes
    sql: ${TABLE}.jobCompletedEvent ;;
  }

  dimension: job_get_query_results_request {
    hidden: yes
    sql: ${TABLE}.jobGetQueryResultsRequest ;;
  }

  dimension: job_get_query_results_response {
    hidden: yes
    sql: ${TABLE}.jobGetQueryResultsResponse ;;
  }

  dimension: job_insert_request {
    hidden: yes
    sql: ${TABLE}.jobInsertRequest ;;
  }

  dimension: job_insert_response {
    hidden: yes
    sql: ${TABLE}.jobInsertResponse ;;
  }

  dimension: job_query_request {
    hidden: yes
    sql: ${TABLE}.jobQueryRequest ;;
  }

  dimension: job_query_response {
    hidden: yes
    sql: ${TABLE}.jobQueryResponse ;;
  }

  dimension: table_data_list_request {
    hidden: yes
    sql: ${TABLE}.tableDataListRequest ;;
  }
}


view: bigquery_data_access_job {
  dimension: job_configuration {
    hidden: yes
    sql: ${TABLE}.jobConfiguration ;;
  }

  dimension: job_name {
    hidden: yes
    sql: ${TABLE}.jobName ;;
  }

  dimension: job_statistics {
    hidden: yes
    sql: ${TABLE}.jobStatistics ;;
  }

  dimension: job_status {
    hidden: yes
    sql: ${TABLE}.jobStatus ;;
  }
}
