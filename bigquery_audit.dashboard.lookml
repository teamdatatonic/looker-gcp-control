- dashboard: bigquery_audit
  title: BigQuery Audit
  layout: newspaper
  elements:
  - name: Failed Queries
    title: Failed Queries
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: single_value
    fields:
    - bigquery_data_access.number_of_queries
    filters:
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_job_completed_event.event_name: query_job_completed
      bigquery_data_access_job_status.query_failed: 'Yes'
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    series_types: {}
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_statistics.total_query_cost
        name: 'BigQuery Data Access: Query Statistics Total Query Cost'
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: bigquery_data_access.number_of_queries
        name: 'BigQuery Data Access: Query Statistics Number of Queries'
    column_spacing_ratio:
    column_group_spacing_ratio:
    listen:
      User: bigquery_data_access_authentication_info.user_id
      Project: bigquery_data_access_resource_labels.project_id
      Is Service Account: bigquery_data_access_authentication_info.is_service_account
      Date: bigquery_data_access_job_statistics.start_date
    row: 0
    col: 12
    width: 4
    height: 3
  - name: Data Scanned
    title: Data Scanned
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: single_value
    fields:
    - bigquery_data_access_job_statistics.total_billed_terabytes
    filters:
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_job_completed_event.event_name: query_job_completed
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    series_types: {}
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_statistics.total_query_cost
        name: 'BigQuery Data Access: Query Statistics Total Query Cost'
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: bigquery_data_access.number_of_queries
        name: 'BigQuery Data Access: Query Statistics Number of Queries'
    column_spacing_ratio:
    column_group_spacing_ratio:
    single_value_title: Scanned (TB)
    listen:
      User: bigquery_data_access_authentication_info.user_id
      Project: bigquery_data_access_resource_labels.project_id
      Is Service Account: bigquery_data_access_authentication_info.is_service_account
      Date: bigquery_data_access_job_statistics.start_date
    row: 0
    col: 4
    width: 4
    height: 3
  - name: Successful Queries
    title: Successful Queries
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: single_value
    fields:
    - bigquery_data_access.number_of_queries
    filters:
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_job_completed_event.event_name: query_job_completed
      bigquery_data_access_job_status.query_failed: 'No'
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    series_types: {}
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_statistics.total_query_cost
        name: 'BigQuery Data Access: Query Statistics Total Query Cost'
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: bigquery_data_access.number_of_queries
        name: 'BigQuery Data Access: Query Statistics Number of Queries'
    column_spacing_ratio:
    column_group_spacing_ratio:
    listen:
      User: bigquery_data_access_authentication_info.user_id
      Project: bigquery_data_access_resource_labels.project_id
      Is Service Account: bigquery_data_access_authentication_info.is_service_account
      Date: bigquery_data_access_job_statistics.start_date
    row: 0
    col: 8
    width: 4
    height: 3
  - name: Avg Query Runtime
    title: Avg Query Runtime
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: single_value
    fields:
    - bigquery_data_access_job_statistics.average_query_runtime
    filters:
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_job_completed_event.event_name: query_job_completed
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    series_types: {}
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_statistics.total_query_cost
        name: 'BigQuery Data Access: Query Statistics Total Query Cost'
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: bigquery_data_access.number_of_queries
        name: 'BigQuery Data Access: Query Statistics Number of Queries'
    column_spacing_ratio:
    column_group_spacing_ratio:
    single_value_title: Avg. Query Runtime (sec)
    listen:
      User: bigquery_data_access_authentication_info.user_id
      Project: bigquery_data_access_resource_labels.project_id
      Is Service Account: bigquery_data_access_authentication_info.is_service_account
      Date: bigquery_data_access_job_statistics.start_date
    row: 0
    col: 20
    width: 4
    height: 3
  - name: Total Queries
    title: Total Queries
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: looker_line
    fields:
    - bigquery_data_access.number_of_queries
    - bigquery_data_access_job_statistics.total_query_cost
    - bigquery_data_access_job_statistics.start_date
    fill_fields:
    - bigquery_data_access_job_statistics.start_date
    filters:
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_job_completed_event.event_name: query_job_completed
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    series_types: {}
    y_axes:
    - label:
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: bigquery_data_access_job_statistics.total_query_cost
        name: 'BigQuery Data Access: Query Statistics Total Query Cost'
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: bigquery_data_access.number_of_queries
        name: 'BigQuery Data Access: Query Statistics Number of Queries'
    column_spacing_ratio:
    column_group_spacing_ratio:
    listen:
      User: bigquery_data_access_authentication_info.user_id
      Project: bigquery_data_access_resource_labels.project_id
      Is Service Account: bigquery_data_access_authentication_info.is_service_account
      Date: bigquery_data_access_job_statistics.start_date
    row: 3
    col: 0
    width: 12
    height: 7
  - name: Total Cost
    title: Total Cost
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: single_value
    fields:
    - bigquery_data_access_job_statistics.total_query_cost
    filters:
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_job_completed_event.event_name: query_job_completed
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    series_types: {}
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_statistics.total_query_cost
        name: 'BigQuery Data Access: Query Statistics Total Query Cost'
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: bigquery_data_access.number_of_queries
        name: 'BigQuery Data Access: Query Statistics Number of Queries'
    column_spacing_ratio:
    column_group_spacing_ratio:
    listen:
      User: bigquery_data_access_authentication_info.user_id
      Project: bigquery_data_access_resource_labels.project_id
      Is Service Account: bigquery_data_access_authentication_info.is_service_account
      Date: bigquery_data_access_job_statistics.start_date
    row: 0
    col: 0
    width: 4
    height: 3
  - name: Most Expensive Queries (> 30GB scanned)
    title: Most Expensive Queries (> 30GB scanned)
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: table
    fields:
    - bigquery_data_access_authentication_info.user_id
    - bigquery_data_access_resource_labels.project_id
    - bigquery_data_access_query.query
    - bigquery_data_access_job_statistics.query_cost
    - bigquery_data_access_job_statistics.query_runtime
    filters:
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_job_completed_event.event_name: query_job_completed
      bigquery_data_access_job_statistics.billed_gigabytes: ">30"
    sorts:
    - bigquery_data_access_job_statistics.query_cost desc
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      User: bigquery_data_access_authentication_info.user_id
      Project: bigquery_data_access_resource_labels.project_id
      Is Service Account: bigquery_data_access_authentication_info.is_service_account
    row: 18
    col: 0
    width: 24
    height: 8
  - name: Biggest Users
    title: Biggest Users
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: table
    fields:
    - bigquery_data_access_authentication_info.user_id
    - bigquery_data_access_job_statistics.total_billed_gigabytes
    - bigquery_data_access_job_statistics.average_billed_gigabytes
    - bigquery_data_access_job_statistics.total_query_cost
    - bigquery_data_access.number_of_queries
    - bigquery_data_access.number_of_expensive_queries
    filters:
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_job_completed_event.event_name: query_job_completed
    sorts:
    - bigquery_data_access_job_statistics.total_query_cost desc
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      User: bigquery_data_access_authentication_info.user_id
      Project: bigquery_data_access_resource_labels.project_id
      Is Service Account: bigquery_data_access_authentication_info.is_service_account
      Date: bigquery_data_access_job_statistics.start_date
    row: 10
    col: 0
    width: 12
    height: 8
  - name: Biggest Projects
    title: Biggest Projects
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: table
    fields:
    - bigquery_data_access_job_statistics.total_billed_gigabytes
    - bigquery_data_access_job_statistics.average_billed_gigabytes
    - bigquery_data_access_job_statistics.total_query_cost
    - bigquery_data_access.number_of_queries
    - bigquery_data_access_resource_labels.project_id
    - bigquery_data_access.number_of_expensive_queries
    filters:
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_job_completed_event.event_name: query_job_completed
    sorts:
    - bigquery_data_access_job_statistics.total_query_cost desc
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      User: bigquery_data_access_authentication_info.user_id
      Project: bigquery_data_access_resource_labels.project_id
      Is Service Account: bigquery_data_access_authentication_info.is_service_account
      Date: bigquery_data_access_job_statistics.start_date
    row: 10
    col: 12
    width: 12
    height: 8
  - name: Queries > 30 GB
    title: Queries > 30 GB
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: single_value
    fields:
    - bigquery_data_access.number_of_expensive_queries
    filters:
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_job_completed_event.event_name: query_job_completed
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Queries > 30 GB
    listen:
      User: bigquery_data_access_authentication_info.user_id
      Project: bigquery_data_access_resource_labels.project_id
      Is Service Account: bigquery_data_access_authentication_info.is_service_account
      Date: bigquery_data_access_job_statistics.start_date
    row: 0
    col: 16
    width: 4
    height: 3
  - name: Number of Active Users
    title: Number of Active Users
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: looker_column
    fields:
    - bigquery_data_access_authentication_info.number_of_active_users
    - bigquery_data_access_job_statistics.start_date
    fill_fields:
    - bigquery_data_access_job_statistics.start_date
    filters:
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_job_completed_event.event_name: query_job_completed
    sorts:
    - bigquery_data_access_job_statistics.start_date desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      User: bigquery_data_access_authentication_info.user_id
      Project: bigquery_data_access_resource_labels.project_id
      Is Service Account: bigquery_data_access_authentication_info.is_service_account
      Date: bigquery_data_access_job_statistics.start_date
    row: 3
    col: 12
    width: 12
    height: 7
  filters:
  - name: Project
    title: Project
    type: field_filter
    default_value: ''
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    field: bigquery_data_access_resource_labels.project_id
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: User
    title: User
    type: field_filter
    default_value: ''
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    field: bigquery_data_access_authentication_info.user_id
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Is Service Account
    title: Is Service Account
    type: field_filter
    default_value: ''
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    field: bigquery_data_access_authentication_info.is_service_account
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Date
    title: Date
    type: field_filter
    default_value: 30 days
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    field: bigquery_data_access_job_statistics.start_date
    listens_to_filters: []
    allow_multiple_values: true
    required: false
