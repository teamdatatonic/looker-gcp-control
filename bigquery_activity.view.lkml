view: cloudaudit_googleapis_com_activity_20170915 {
  sql_table_name: gcp_logs.cloudaudit_googleapis_com_activity_20170915 ;;

  dimension: http_request {
    hidden: yes
    sql: ${TABLE}.httpRequest ;;
  }

  dimension: insert_id {
    type: string
    sql: ${TABLE}.insertId ;;
  }

  dimension: log_name {
    type: string
    sql: ${TABLE}.logName ;;
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

  measure: count {
    type: count
    drill_fields: [log_name]
  }
}

view: cloudaudit_googleapis_com_activity_20170915_resource {
  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_resource_labels {
  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_http_request {
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

view: cloudaudit_googleapis_com_activity_20170915_source_location {
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

view: cloudaudit_googleapis_com_activity_20170915_operation {
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

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_request_metadata {
  dimension: caller_ip {
    type: string
    sql: ${TABLE}.callerIp ;;
  }

  dimension: caller_supplied_user_agent {
    type: string
    sql: ${TABLE}.callerSuppliedUserAgent ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_authentication_info {
  dimension: authority_selector {
    type: string
    sql: ${TABLE}.authoritySelector ;;
  }

  dimension: principal_email {
    type: string
    sql: ${TABLE}.principalEmail ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_authorization_info {
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

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog {
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

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_update_response_resource_view {
  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_update_response_resource {
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

  dimension_group: expire {
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
    sql: ${TABLE}.expireTime ;;
  }

  dimension: info {
    hidden: yes
    sql: ${TABLE}.info ;;
  }

  dimension: schema_json {
    type: string
    sql: ${TABLE}.schemaJson ;;
  }

  dimension: table_name {
    hidden: yes
    sql: ${TABLE}.tableName ;;
  }

  dimension_group: truncate {
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
    sql: ${TABLE}.truncateTime ;;
  }

  dimension: view {
    hidden: yes
    sql: ${TABLE}.view ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_update_response_resource_table_name {
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

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_update_response_resource_info {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: friendly_name {
    type: string
    sql: ${TABLE}.friendlyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_dataset_update_response_resource {
  dimension: acl {
    hidden: yes
    sql: ${TABLE}.acl ;;
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

  dimension: dataset_name {
    hidden: yes
    sql: ${TABLE}.datasetName ;;
  }

  dimension: default_table_expire_duration {
    type: number
    sql: ${TABLE}.defaultTableExpireDuration ;;
  }

  dimension: info {
    hidden: yes
    sql: ${TABLE}.info ;;
  }

  dimension_group: update {
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
    sql: ${TABLE}.updateTime ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_dataset_update_response_resource_dataset_name {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_dataset_update_response_resource_acl_entries {
  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: group_email {
    type: string
    sql: ${TABLE}.groupEmail ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension: special_group {
    type: string
    sql: ${TABLE}.specialGroup ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.userEmail ;;
  }

  dimension: view_name {
    hidden: yes
    sql: ${TABLE}.viewName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_dataset_update_response_resource_acl_entries_view_name {
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

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_dataset_update_response_resource_info {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: friendly_name {
    type: string
    sql: ${TABLE}.friendlyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_dataset_update_request_resource {
  dimension: acl {
    hidden: yes
    sql: ${TABLE}.acl ;;
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

  dimension: dataset_name {
    hidden: yes
    sql: ${TABLE}.datasetName ;;
  }

  dimension: default_table_expire_duration {
    type: number
    sql: ${TABLE}.defaultTableExpireDuration ;;
  }

  dimension: info {
    hidden: yes
    sql: ${TABLE}.info ;;
  }

  dimension_group: update {
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
    sql: ${TABLE}.updateTime ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_dataset_update_request_resource_dataset_name {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_dataset_update_request_resource_acl_entries {
  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: group_email {
    type: string
    sql: ${TABLE}.groupEmail ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension: special_group {
    type: string
    sql: ${TABLE}.specialGroup ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.userEmail ;;
  }

  dimension: view_name {
    hidden: yes
    sql: ${TABLE}.viewName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_dataset_update_request_resource_acl_entries_view_name {
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

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_dataset_update_request_resource_info {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: friendly_name {
    type: string
    sql: ${TABLE}.friendlyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_insert_request_resource_view {
  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_insert_request_resource {
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

  dimension_group: expire {
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
    sql: ${TABLE}.expireTime ;;
  }

  dimension: info {
    hidden: yes
    sql: ${TABLE}.info ;;
  }

  dimension: schema_json {
    type: string
    sql: ${TABLE}.schemaJson ;;
  }

  dimension: table_name {
    hidden: yes
    sql: ${TABLE}.tableName ;;
  }

  dimension_group: truncate {
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
    sql: ${TABLE}.truncateTime ;;
  }

  dimension: view {
    hidden: yes
    sql: ${TABLE}.view ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_insert_request_resource_table_name {
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

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_insert_request_resource_info {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: friendly_name {
    type: string
    sql: ${TABLE}.friendlyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_update_request_resource_view {
  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_update_request_resource {
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

  dimension_group: expire {
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
    sql: ${TABLE}.expireTime ;;
  }

  dimension: info {
    hidden: yes
    sql: ${TABLE}.info ;;
  }

  dimension: schema_json {
    type: string
    sql: ${TABLE}.schemaJson ;;
  }

  dimension: table_name {
    hidden: yes
    sql: ${TABLE}.tableName ;;
  }

  dimension_group: truncate {
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
    sql: ${TABLE}.truncateTime ;;
  }

  dimension: view {
    hidden: yes
    sql: ${TABLE}.view ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_update_request_resource_table_name {
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

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_update_request_resource_info {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: friendly_name {
    type: string
    sql: ${TABLE}.friendlyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event {
  dimension: event_name {
    type: string
    sql: ${TABLE}.eventName ;;
  }

  dimension: job {
    hidden: yes
    sql: ${TABLE}.job ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_name {
  dimension: job_id {
    type: string
    sql: ${TABLE}.jobId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_status {
  dimension: error {
    hidden: yes
    sql: ${TABLE}.error ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_status_error {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_statistics {
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

  dimension: total_billed_bytes {
    type: number
    sql: ${TABLE}.totalBilledBytes ;;
  }

  dimension: total_processed_bytes {
    type: number
    sql: ${TABLE}.totalProcessedBytes ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_configuration {
  dimension: dry_run {
    type: yesno
    sql: ${TABLE}.dryRun ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_insert_response_resource_view {
  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_insert_response_resource {
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

  dimension_group: expire {
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
    sql: ${TABLE}.expireTime ;;
  }

  dimension: info {
    hidden: yes
    sql: ${TABLE}.info ;;
  }

  dimension: schema_json {
    type: string
    sql: ${TABLE}.schemaJson ;;
  }

  dimension: table_name {
    hidden: yes
    sql: ${TABLE}.tableName ;;
  }

  dimension_group: truncate {
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
    sql: ${TABLE}.truncateTime ;;
  }

  dimension: view {
    hidden: yes
    sql: ${TABLE}.view ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_insert_response_resource_table_name {
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

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_insert_response_resource_info {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: friendly_name {
    type: string
    sql: ${TABLE}.friendlyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_status {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_update_response {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_dataset_update_response {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_dataset_update_response_resource_acl {
  dimension: entries {
    hidden: yes
    sql: ${TABLE}.entries ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_dataset_update_request {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_dataset_update_request_resource_acl {
  dimension: entries {
    hidden: yes
    sql: ${TABLE}.entries ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_insert_request {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_update_request {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery {
  dimension: dataset_update_request {
    hidden: yes
    sql: ${TABLE}.datasetUpdateRequest ;;
  }

  dimension: dataset_update_response {
    hidden: yes
    sql: ${TABLE}.datasetUpdateResponse ;;
  }

  dimension: job_completed_event {
    hidden: yes
    sql: ${TABLE}.jobCompletedEvent ;;
  }

  dimension: table_insert_request {
    hidden: yes
    sql: ${TABLE}.tableInsertRequest ;;
  }

  dimension: table_insert_response {
    hidden: yes
    sql: ${TABLE}.tableInsertResponse ;;
  }

  dimension: table_update_request {
    hidden: yes
    sql: ${TABLE}.tableUpdateRequest ;;
  }

  dimension: table_update_response {
    hidden: yes
    sql: ${TABLE}.tableUpdateResponse ;;
  }
}

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job {
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

view: cloudaudit_googleapis_com_activity_20170915_protopayload_auditlog_servicedata_v1_bigquery_table_insert_response {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}