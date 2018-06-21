view: cloudaudit_googleapis_com_activity_20180621 {
  sql_table_name: bq_metrics.cloudaudit_googleapis_com_activity_20180621 ;;

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

  dimension: span_id {
    type: string
    sql: ${TABLE}.spanId ;;
  }

  dimension: text_payload {
    type: string
    sql: ${TABLE}.textPayload ;;
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

view: cloudaudit_googleapis_com_activity_20180621__resource {
  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__resource__labels {
  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__http_request {
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

view: cloudaudit_googleapis_com_activity_20180621__source_location {
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

view: cloudaudit_googleapis_com_activity_20180621__operation {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__request_metadata {
  dimension: caller_ip {
    type: string
    sql: ${TABLE}.callerIp ;;
  }

  dimension: caller_network {
    type: string
    sql: ${TABLE}.callerNetwork ;;
  }

  dimension: caller_supplied_user_agent {
    type: string
    sql: ${TABLE}.callerSuppliedUserAgent ;;
  }

  dimension: request_attributes {
    hidden: yes
    sql: ${TABLE}.requestAttributes ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__request_metadata__request_attributes__headers {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__request_metadata__request_attributes {
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: auth {
    hidden: yes
    sql: ${TABLE}.auth ;;
  }

  dimension: fragment {
    type: string
    sql: ${TABLE}.fragment ;;
  }

  dimension: headers {
    hidden: yes
    sql: ${TABLE}.headers ;;
  }

  dimension: host {
    type: string
    sql: ${TABLE}.host ;;
  }

  dimension: method {
    type: string
    sql: ${TABLE}.method ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
  }

  dimension: protocol {
    type: string
    sql: ${TABLE}.protocol ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: scheme {
    type: string
    sql: ${TABLE}.scheme ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension_group: time {
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
    sql: ${TABLE}.time ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__request_metadata__request_attributes__auth {
  dimension: access_levels {
    type: string
    sql: ${TABLE}.accessLevels ;;
  }

  dimension: audiences {
    type: string
    sql: ${TABLE}.audiences ;;
  }

  dimension: presenter {
    type: string
    sql: ${TABLE}.presenter ;;
  }

  dimension: principal {
    type: string
    sql: ${TABLE}.principal ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__authentication_info {
  dimension: authority_selector {
    type: string
    sql: ${TABLE}.authoritySelector ;;
  }

  dimension: principal_email {
    type: string
    sql: ${TABLE}.principalEmail ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__authorization_info {
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

  dimension: resource_attributes {
    hidden: yes
    sql: ${TABLE}.resourceAttributes ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__authorization_info__resource_attributes {
  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: service {
    type: string
    sql: ${TABLE}.service ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__authorization_info__resource_attributes__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_google_protobuf_struct {
  dimension: log {
    type: string
    sql: ${TABLE}.log ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog {
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

  dimension: resource_location {
    hidden: yes
    sql: ${TABLE}.resourceLocation ;;
  }

  dimension: resource_name {
    type: string
    sql: ${TABLE}.resourceName ;;
  }

  dimension: service_name {
    type: string
    sql: ${TABLE}.serviceName ;;
  }

  dimension: servicedata_google_protobuf_struct {
    hidden: yes
    sql: ${TABLE}.servicedata_google_protobuf_struct ;;
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__resource_location {
  dimension: current_locations {
    type: string
    sql: ${TABLE}.currentLocations ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_list_request {
  dimension: list_all {
    type: yesno
    sql: ${TABLE}.listAll ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__view {
  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource {
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

  dimension: encryption {
    hidden: yes
    sql: ${TABLE}.encryption ;;
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

  dimension: view {
    hidden: yes
    sql: ${TABLE}.view ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__table_name {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__info {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: friendly_name {
    type: string
    sql: ${TABLE}.friendlyName ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response__resource__info__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_read_events {
  dimension: referenced_fields {
    type: string
    sql: ${TABLE}.referencedFields ;;
  }

  dimension: table_name {
    hidden: yes
    sql: ${TABLE}.tableName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_read_events__table_name {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response {
  dimension: job {
    hidden: yes
    sql: ${TABLE}.job ;;
  }

  dimension: total_results {
    type: number
    sql: ${TABLE}.totalResults ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_name {
  dimension: job_id {
    type: string
    sql: ${TABLE}.jobId ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status__additional_errors {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status {
  dimension: additional_errors {
    hidden: yes
    sql: ${TABLE}.additionalErrors ;;
  }

  dimension: error {
    hidden: yes
    sql: ${TABLE}.error ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_status__error {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics__referenced_views {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics {
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

  dimension: referenced_tables {
    hidden: yes
    sql: ${TABLE}.referencedTables ;;
  }

  dimension: referenced_views {
    hidden: yes
    sql: ${TABLE}.referencedViews ;;
  }

  dimension: reservation_usage {
    hidden: yes
    sql: ${TABLE}.reservationUsage ;;
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

  dimension: total_load_output_bytes {
    type: number
    sql: ${TABLE}.totalLoadOutputBytes ;;
  }

  dimension: total_processed_bytes {
    type: number
    sql: ${TABLE}.totalProcessedBytes ;;
  }

  dimension: total_slot_ms {
    type: number
    sql: ${TABLE}.totalSlotMs ;;
  }

  dimension: total_tables_processed {
    type: number
    sql: ${TABLE}.totalTablesProcessed ;;
  }

  dimension: total_views_processed {
    type: number
    sql: ${TABLE}.totalViewsProcessed ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics__reservation_usage {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: slot_ms {
    type: number
    sql: ${TABLE}.slotMs ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_statistics__referenced_tables {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy__source_tables {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy {
  dimension: create_disposition {
    type: string
    sql: ${TABLE}.createDisposition ;;
  }

  dimension: destination_table {
    hidden: yes
    sql: ${TABLE}.destinationTable ;;
  }

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: source_tables {
    hidden: yes
    sql: ${TABLE}.sourceTables ;;
  }

  dimension: write_disposition {
    type: string
    sql: ${TABLE}.writeDisposition ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__table_copy__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__extract__source_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__extract {
  dimension: destination_uris {
    type: string
    sql: ${TABLE}.destinationUris ;;
  }

  dimension: source_table {
    hidden: yes
    sql: ${TABLE}.sourceTable ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration {
  dimension: dry_run {
    type: yesno
    sql: ${TABLE}.dryRun ;;
  }

  dimension: extract {
    hidden: yes
    sql: ${TABLE}.`extract` ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: load {
    hidden: yes
    sql: ${TABLE}.load ;;
  }

  dimension: query {
    hidden: yes
    sql: ${TABLE}.query ;;
  }

  dimension: table_copy {
    hidden: yes
    sql: ${TABLE}.tableCopy ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load {
  dimension: create_disposition {
    type: string
    sql: ${TABLE}.createDisposition ;;
  }

  dimension: destination_table {
    hidden: yes
    sql: ${TABLE}.destinationTable ;;
  }

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: schema_json {
    type: string
    sql: ${TABLE}.schemaJson ;;
  }

  dimension: source_uris {
    type: string
    sql: ${TABLE}.sourceUris ;;
  }

  dimension: write_disposition {
    type: string
    sql: ${TABLE}.writeDisposition ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__load__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__table_definitions {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: source_uris {
    type: string
    sql: ${TABLE}.sourceUris ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query {
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

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: query_priority {
    type: string
    sql: ${TABLE}.queryPriority ;;
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__query__default_dataset {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job__job_configuration__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_request {
  dimension: max_results {
    type: number
    sql: ${TABLE}.maxResults ;;
  }

  dimension: start_row {
    type: number
    sql: ${TABLE}.startRow ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event {
  dimension: event_name {
    type: string
    sql: ${TABLE}.eventName ;;
  }

  dimension: job {
    hidden: yes
    sql: ${TABLE}.job ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_name {
  dimension: job_id {
    type: string
    sql: ${TABLE}.jobId ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status__additional_errors {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status {
  dimension: additional_errors {
    hidden: yes
    sql: ${TABLE}.additionalErrors ;;
  }

  dimension: error {
    hidden: yes
    sql: ${TABLE}.error ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status__error {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__referenced_views {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics {
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

  dimension: referenced_tables {
    hidden: yes
    sql: ${TABLE}.referencedTables ;;
  }

  dimension: referenced_views {
    hidden: yes
    sql: ${TABLE}.referencedViews ;;
  }

  dimension: reservation_usage {
    hidden: yes
    sql: ${TABLE}.reservationUsage ;;
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

  dimension: total_load_output_bytes {
    type: number
    sql: ${TABLE}.totalLoadOutputBytes ;;
  }

  dimension: total_processed_bytes {
    type: number
    sql: ${TABLE}.totalProcessedBytes ;;
  }

  dimension: total_slot_ms {
    type: number
    sql: ${TABLE}.totalSlotMs ;;
  }

  dimension: total_tables_processed {
    type: number
    sql: ${TABLE}.totalTablesProcessed ;;
  }

  dimension: total_views_processed {
    type: number
    sql: ${TABLE}.totalViewsProcessed ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__reservation_usage {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: slot_ms {
    type: number
    sql: ${TABLE}.slotMs ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__referenced_tables {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy__source_tables {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy {
  dimension: create_disposition {
    type: string
    sql: ${TABLE}.createDisposition ;;
  }

  dimension: destination_table {
    hidden: yes
    sql: ${TABLE}.destinationTable ;;
  }

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: source_tables {
    hidden: yes
    sql: ${TABLE}.sourceTables ;;
  }

  dimension: write_disposition {
    type: string
    sql: ${TABLE}.writeDisposition ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__table_copy__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__extract__source_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__extract {
  dimension: destination_uris {
    type: string
    sql: ${TABLE}.destinationUris ;;
  }

  dimension: source_table {
    hidden: yes
    sql: ${TABLE}.sourceTable ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration {
  dimension: dry_run {
    type: yesno
    sql: ${TABLE}.dryRun ;;
  }

  dimension: extract {
    hidden: yes
    sql: ${TABLE}.`extract` ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: load {
    hidden: yes
    sql: ${TABLE}.load ;;
  }

  dimension: query {
    hidden: yes
    sql: ${TABLE}.query ;;
  }

  dimension: table_copy {
    hidden: yes
    sql: ${TABLE}.tableCopy ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load {
  dimension: create_disposition {
    type: string
    sql: ${TABLE}.createDisposition ;;
  }

  dimension: destination_table {
    hidden: yes
    sql: ${TABLE}.destinationTable ;;
  }

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: schema_json {
    type: string
    sql: ${TABLE}.schemaJson ;;
  }

  dimension: source_uris {
    type: string
    sql: ${TABLE}.sourceUris ;;
  }

  dimension: write_disposition {
    type: string
    sql: ${TABLE}.writeDisposition ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__load__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__table_definitions {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: source_uris {
    type: string
    sql: ${TABLE}.sourceUris ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query {
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

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: query_priority {
    type: string
    sql: ${TABLE}.queryPriority ;;
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__default_dataset {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_name {
  dimension: job_id {
    type: string
    sql: ${TABLE}.jobId ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status__additional_errors {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status {
  dimension: additional_errors {
    hidden: yes
    sql: ${TABLE}.additionalErrors ;;
  }

  dimension: error {
    hidden: yes
    sql: ${TABLE}.error ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_status__error {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics__referenced_views {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics {
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

  dimension: referenced_tables {
    hidden: yes
    sql: ${TABLE}.referencedTables ;;
  }

  dimension: referenced_views {
    hidden: yes
    sql: ${TABLE}.referencedViews ;;
  }

  dimension: reservation_usage {
    hidden: yes
    sql: ${TABLE}.reservationUsage ;;
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

  dimension: total_load_output_bytes {
    type: number
    sql: ${TABLE}.totalLoadOutputBytes ;;
  }

  dimension: total_processed_bytes {
    type: number
    sql: ${TABLE}.totalProcessedBytes ;;
  }

  dimension: total_slot_ms {
    type: number
    sql: ${TABLE}.totalSlotMs ;;
  }

  dimension: total_tables_processed {
    type: number
    sql: ${TABLE}.totalTablesProcessed ;;
  }

  dimension: total_views_processed {
    type: number
    sql: ${TABLE}.totalViewsProcessed ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics__reservation_usage {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: slot_ms {
    type: number
    sql: ${TABLE}.slotMs ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_statistics__referenced_tables {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy__source_tables {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy {
  dimension: create_disposition {
    type: string
    sql: ${TABLE}.createDisposition ;;
  }

  dimension: destination_table {
    hidden: yes
    sql: ${TABLE}.destinationTable ;;
  }

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: source_tables {
    hidden: yes
    sql: ${TABLE}.sourceTables ;;
  }

  dimension: write_disposition {
    type: string
    sql: ${TABLE}.writeDisposition ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__table_copy__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__extract__source_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__extract {
  dimension: destination_uris {
    type: string
    sql: ${TABLE}.destinationUris ;;
  }

  dimension: source_table {
    hidden: yes
    sql: ${TABLE}.sourceTable ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration {
  dimension: dry_run {
    type: yesno
    sql: ${TABLE}.dryRun ;;
  }

  dimension: extract {
    hidden: yes
    sql: ${TABLE}.`extract` ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: load {
    hidden: yes
    sql: ${TABLE}.load ;;
  }

  dimension: query {
    hidden: yes
    sql: ${TABLE}.query ;;
  }

  dimension: table_copy {
    hidden: yes
    sql: ${TABLE}.tableCopy ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load {
  dimension: create_disposition {
    type: string
    sql: ${TABLE}.createDisposition ;;
  }

  dimension: destination_table {
    hidden: yes
    sql: ${TABLE}.destinationTable ;;
  }

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: schema_json {
    type: string
    sql: ${TABLE}.schemaJson ;;
  }

  dimension: source_uris {
    type: string
    sql: ${TABLE}.sourceUris ;;
  }

  dimension: write_disposition {
    type: string
    sql: ${TABLE}.writeDisposition ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__load__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__table_definitions {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: source_uris {
    type: string
    sql: ${TABLE}.sourceUris ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query {
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

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: query_priority {
    type: string
    sql: ${TABLE}.queryPriority ;;
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__query__default_dataset {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job__job_configuration__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response {
  dimension: job {
    hidden: yes
    sql: ${TABLE}.job ;;
  }

  dimension: total_results {
    type: number
    sql: ${TABLE}.totalResults ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_name {
  dimension: job_id {
    type: string
    sql: ${TABLE}.jobId ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status__additional_errors {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status {
  dimension: additional_errors {
    hidden: yes
    sql: ${TABLE}.additionalErrors ;;
  }

  dimension: error {
    hidden: yes
    sql: ${TABLE}.error ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_status__error {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics__referenced_views {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics {
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

  dimension: referenced_tables {
    hidden: yes
    sql: ${TABLE}.referencedTables ;;
  }

  dimension: referenced_views {
    hidden: yes
    sql: ${TABLE}.referencedViews ;;
  }

  dimension: reservation_usage {
    hidden: yes
    sql: ${TABLE}.reservationUsage ;;
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

  dimension: total_load_output_bytes {
    type: number
    sql: ${TABLE}.totalLoadOutputBytes ;;
  }

  dimension: total_processed_bytes {
    type: number
    sql: ${TABLE}.totalProcessedBytes ;;
  }

  dimension: total_slot_ms {
    type: number
    sql: ${TABLE}.totalSlotMs ;;
  }

  dimension: total_tables_processed {
    type: number
    sql: ${TABLE}.totalTablesProcessed ;;
  }

  dimension: total_views_processed {
    type: number
    sql: ${TABLE}.totalViewsProcessed ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics__reservation_usage {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: slot_ms {
    type: number
    sql: ${TABLE}.slotMs ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_statistics__referenced_tables {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy__source_tables {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy {
  dimension: create_disposition {
    type: string
    sql: ${TABLE}.createDisposition ;;
  }

  dimension: destination_table {
    hidden: yes
    sql: ${TABLE}.destinationTable ;;
  }

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: source_tables {
    hidden: yes
    sql: ${TABLE}.sourceTables ;;
  }

  dimension: write_disposition {
    type: string
    sql: ${TABLE}.writeDisposition ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__table_copy__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__extract__source_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__extract {
  dimension: destination_uris {
    type: string
    sql: ${TABLE}.destinationUris ;;
  }

  dimension: source_table {
    hidden: yes
    sql: ${TABLE}.sourceTable ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration {
  dimension: dry_run {
    type: yesno
    sql: ${TABLE}.dryRun ;;
  }

  dimension: extract {
    hidden: yes
    sql: ${TABLE}.`extract` ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: load {
    hidden: yes
    sql: ${TABLE}.load ;;
  }

  dimension: query {
    hidden: yes
    sql: ${TABLE}.query ;;
  }

  dimension: table_copy {
    hidden: yes
    sql: ${TABLE}.tableCopy ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load {
  dimension: create_disposition {
    type: string
    sql: ${TABLE}.createDisposition ;;
  }

  dimension: destination_table {
    hidden: yes
    sql: ${TABLE}.destinationTable ;;
  }

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: schema_json {
    type: string
    sql: ${TABLE}.schemaJson ;;
  }

  dimension: source_uris {
    type: string
    sql: ${TABLE}.sourceUris ;;
  }

  dimension: write_disposition {
    type: string
    sql: ${TABLE}.writeDisposition ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__load__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__table_definitions {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: source_uris {
    type: string
    sql: ${TABLE}.sourceUris ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query {
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

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: query_priority {
    type: string
    sql: ${TABLE}.queryPriority ;;
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__query__default_dataset {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job__job_configuration__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__dataset_name {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl__entries {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl__entries__view_name {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__info {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: friendly_name {
    type: string
    sql: ${TABLE}.friendlyName ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__info__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_request {
  dimension: default_dataset {
    hidden: yes
    sql: ${TABLE}.defaultDataset ;;
  }

  dimension: dry_run {
    type: yesno
    sql: ${TABLE}.dryRun ;;
  }

  dimension: max_results {
    type: number
    sql: ${TABLE}.maxResults ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_request__default_dataset {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__dataset_name {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl__entries {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl__entries__view_name {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__info {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: friendly_name {
    type: string
    sql: ${TABLE}.friendlyName ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__info__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__dataset_name {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl__entries {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl__entries__view_name {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__info {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: friendly_name {
    type: string
    sql: ${TABLE}.friendlyName ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__info__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_name {
  dimension: job_id {
    type: string
    sql: ${TABLE}.jobId ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status__additional_errors {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status {
  dimension: additional_errors {
    hidden: yes
    sql: ${TABLE}.additionalErrors ;;
  }

  dimension: error {
    hidden: yes
    sql: ${TABLE}.error ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_status__error {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics__referenced_views {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics {
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

  dimension: referenced_tables {
    hidden: yes
    sql: ${TABLE}.referencedTables ;;
  }

  dimension: referenced_views {
    hidden: yes
    sql: ${TABLE}.referencedViews ;;
  }

  dimension: reservation_usage {
    hidden: yes
    sql: ${TABLE}.reservationUsage ;;
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

  dimension: total_load_output_bytes {
    type: number
    sql: ${TABLE}.totalLoadOutputBytes ;;
  }

  dimension: total_processed_bytes {
    type: number
    sql: ${TABLE}.totalProcessedBytes ;;
  }

  dimension: total_slot_ms {
    type: number
    sql: ${TABLE}.totalSlotMs ;;
  }

  dimension: total_tables_processed {
    type: number
    sql: ${TABLE}.totalTablesProcessed ;;
  }

  dimension: total_views_processed {
    type: number
    sql: ${TABLE}.totalViewsProcessed ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics__reservation_usage {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: slot_ms {
    type: number
    sql: ${TABLE}.slotMs ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_statistics__referenced_tables {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy__source_tables {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy {
  dimension: create_disposition {
    type: string
    sql: ${TABLE}.createDisposition ;;
  }

  dimension: destination_table {
    hidden: yes
    sql: ${TABLE}.destinationTable ;;
  }

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: source_tables {
    hidden: yes
    sql: ${TABLE}.sourceTables ;;
  }

  dimension: write_disposition {
    type: string
    sql: ${TABLE}.writeDisposition ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__table_copy__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__extract__source_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__extract {
  dimension: destination_uris {
    type: string
    sql: ${TABLE}.destinationUris ;;
  }

  dimension: source_table {
    hidden: yes
    sql: ${TABLE}.sourceTable ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration {
  dimension: dry_run {
    type: yesno
    sql: ${TABLE}.dryRun ;;
  }

  dimension: extract {
    hidden: yes
    sql: ${TABLE}.`extract` ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: load {
    hidden: yes
    sql: ${TABLE}.load ;;
  }

  dimension: query {
    hidden: yes
    sql: ${TABLE}.query ;;
  }

  dimension: table_copy {
    hidden: yes
    sql: ${TABLE}.tableCopy ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load {
  dimension: create_disposition {
    type: string
    sql: ${TABLE}.createDisposition ;;
  }

  dimension: destination_table {
    hidden: yes
    sql: ${TABLE}.destinationTable ;;
  }

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: schema_json {
    type: string
    sql: ${TABLE}.schemaJson ;;
  }

  dimension: source_uris {
    type: string
    sql: ${TABLE}.sourceUris ;;
  }

  dimension: write_disposition {
    type: string
    sql: ${TABLE}.writeDisposition ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__load__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__table_definitions {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: source_uris {
    type: string
    sql: ${TABLE}.sourceUris ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query {
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

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: query_priority {
    type: string
    sql: ${TABLE}.queryPriority ;;
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__query__default_dataset {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource__job_configuration__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_name {
  dimension: job_id {
    type: string
    sql: ${TABLE}.jobId ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status__additional_errors {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status {
  dimension: additional_errors {
    hidden: yes
    sql: ${TABLE}.additionalErrors ;;
  }

  dimension: error {
    hidden: yes
    sql: ${TABLE}.error ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_status__error {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics__referenced_views {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics {
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

  dimension: referenced_tables {
    hidden: yes
    sql: ${TABLE}.referencedTables ;;
  }

  dimension: referenced_views {
    hidden: yes
    sql: ${TABLE}.referencedViews ;;
  }

  dimension: reservation_usage {
    hidden: yes
    sql: ${TABLE}.reservationUsage ;;
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

  dimension: total_load_output_bytes {
    type: number
    sql: ${TABLE}.totalLoadOutputBytes ;;
  }

  dimension: total_processed_bytes {
    type: number
    sql: ${TABLE}.totalProcessedBytes ;;
  }

  dimension: total_slot_ms {
    type: number
    sql: ${TABLE}.totalSlotMs ;;
  }

  dimension: total_tables_processed {
    type: number
    sql: ${TABLE}.totalTablesProcessed ;;
  }

  dimension: total_views_processed {
    type: number
    sql: ${TABLE}.totalViewsProcessed ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics__reservation_usage {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: slot_ms {
    type: number
    sql: ${TABLE}.slotMs ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_statistics__referenced_tables {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy__source_tables {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy {
  dimension: create_disposition {
    type: string
    sql: ${TABLE}.createDisposition ;;
  }

  dimension: destination_table {
    hidden: yes
    sql: ${TABLE}.destinationTable ;;
  }

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: source_tables {
    hidden: yes
    sql: ${TABLE}.sourceTables ;;
  }

  dimension: write_disposition {
    type: string
    sql: ${TABLE}.writeDisposition ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__table_copy__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__extract__source_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__extract {
  dimension: destination_uris {
    type: string
    sql: ${TABLE}.destinationUris ;;
  }

  dimension: source_table {
    hidden: yes
    sql: ${TABLE}.sourceTable ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration {
  dimension: dry_run {
    type: yesno
    sql: ${TABLE}.dryRun ;;
  }

  dimension: extract {
    hidden: yes
    sql: ${TABLE}.`extract` ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: load {
    hidden: yes
    sql: ${TABLE}.load ;;
  }

  dimension: query {
    hidden: yes
    sql: ${TABLE}.query ;;
  }

  dimension: table_copy {
    hidden: yes
    sql: ${TABLE}.tableCopy ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load {
  dimension: create_disposition {
    type: string
    sql: ${TABLE}.createDisposition ;;
  }

  dimension: destination_table {
    hidden: yes
    sql: ${TABLE}.destinationTable ;;
  }

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: schema_json {
    type: string
    sql: ${TABLE}.schemaJson ;;
  }

  dimension: source_uris {
    type: string
    sql: ${TABLE}.sourceUris ;;
  }

  dimension: write_disposition {
    type: string
    sql: ${TABLE}.writeDisposition ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__load__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__destination_table {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__table_definitions {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: source_uris {
    type: string
    sql: ${TABLE}.sourceUris ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query {
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

  dimension: destination_table_encryption {
    hidden: yes
    sql: ${TABLE}.destinationTableEncryption ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: query_priority {
    type: string
    sql: ${TABLE}.queryPriority ;;
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__destination_table_encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__query__default_dataset {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource__job_configuration__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__view {
  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource {
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

  dimension: encryption {
    hidden: yes
    sql: ${TABLE}.encryption ;;
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

  dimension: view {
    hidden: yes
    sql: ${TABLE}.view ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__table_name {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__info {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: friendly_name {
    type: string
    sql: ${TABLE}.friendlyName ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request__resource__info__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__view {
  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource {
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

  dimension: encryption {
    hidden: yes
    sql: ${TABLE}.encryption ;;
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

  dimension: view {
    hidden: yes
    sql: ${TABLE}.view ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__table_name {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__info {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: friendly_name {
    type: string
    sql: ${TABLE}.friendlyName ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request__resource__info__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_data_list_request {
  dimension: max_results {
    type: number
    sql: ${TABLE}.maxResults ;;
  }

  dimension: start_row {
    type: number
    sql: ${TABLE}.startRow ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__dataset_name {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl__entries {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl__entries__view_name {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__info {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: friendly_name {
    type: string
    sql: ${TABLE}.friendlyName ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__info__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__view {
  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource {
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

  dimension: encryption {
    hidden: yes
    sql: ${TABLE}.encryption ;;
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

  dimension: view {
    hidden: yes
    sql: ${TABLE}.view ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__encryption {
  dimension: kms_key_name {
    type: string
    sql: ${TABLE}.kmsKeyName ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__table_name {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__info {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: friendly_name {
    type: string
    sql: ${TABLE}.friendlyName ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response__resource__info__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__status {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery {
  dimension: dataset_insert_request {
    hidden: yes
    sql: ${TABLE}.datasetInsertRequest ;;
  }

  dimension: dataset_insert_response {
    hidden: yes
    sql: ${TABLE}.datasetInsertResponse ;;
  }

  dimension: dataset_list_request {
    hidden: yes
    sql: ${TABLE}.datasetListRequest ;;
  }

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

  dimension: job_query_done_response {
    hidden: yes
    sql: ${TABLE}.jobQueryDoneResponse ;;
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

  dimension: table_data_read_events {
    hidden: yes
    sql: ${TABLE}.tableDataReadEvents ;;
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_response {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_response__job {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response__job {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_get_query_results_response__job {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_response__resource__acl {
  dimension: entries {
    hidden: yes
    sql: ${TABLE}.entries ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_update_request__resource__acl {
  dimension: entries {
    hidden: yes
    sql: ${TABLE}.entries ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_request__resource__acl {
  dimension: entries {
    hidden: yes
    sql: ${TABLE}.entries ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request__resource {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response__resource {
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

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_request {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_update_request {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__dataset_insert_response__resource__acl {
  dimension: entries {
    hidden: yes
    sql: ${TABLE}.entries ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__table_insert_response {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_query_done_response {
  dimension: job {
    hidden: yes
    sql: ${TABLE}.job ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_request {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}

view: cloudaudit_googleapis_com_activity_20180621__protopayload_auditlog__servicedata_v1_bigquery__job_insert_response {
  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }
}
