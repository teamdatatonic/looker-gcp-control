- dashboard: billing
  title: Billing
  layout: newspaper
  elements:
  - name: Total Billing Last Month
    title: Total Billing Last Month
    model: gcp_billing
    explore: gcp_billing_export
    type: single_value
    fields:
    - gcp_billing_export.total_cost
    filters:
      gcp_billing_export.is_last_month: 'Yes'
    sorts:
    - gcp_billing_export.total_cost desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: budget
      label: Budget
      expression: '750'
      value_format:
      value_format_name: gbp_0
      _kind_hint: dimension
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Project: gcp_billing_export_project.name
      Service: gcp_billing_export_service.description
    row: 0
    col: 12
    width: 6
    height: 6
  - name: Total Billing This Month
    title: Total Billing This Month
    model: gcp_billing
    explore: gcp_billing_export
    type: single_value
    fields:
    - gcp_billing_export.total_cost
    filters:
      gcp_billing_export.usage_start_date: 1 months
    sorts:
    - gcp_billing_export.total_cost desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: budget
      label: Budget
      expression: '750'
      value_format:
      value_format_name: gbp_0
      _kind_hint: dimension
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Project: gcp_billing_export_project.name
      Service: gcp_billing_export_service.description
    row: 0
    col: 0
    width: 6
    height: 6
  - name: Billing by Project
    title: Billing by Project
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_column
    fields:
    - gcp_billing_export_project.name
    - gcp_billing_export.total_cost
    - gcp_billing_export.usage_start_date
    pivots:
    - gcp_billing_export_project.name
    fill_fields:
    - gcp_billing_export.usage_start_date
    filters:
      gcp_billing_export.usage_start_date: 30 days
    sorts:
    - gcp_billing_export.total_cost desc 0
    - gcp_billing_export_project.name
    limit: 500
    column_limit: 50
    stacking: normal
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    column_group_spacing_ratio:
    hidden_series: []
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    listen:
      Project: gcp_billing_export_project.name
      Service: gcp_billing_export_service.description
    row: 6
    col: 0
    width: 12
    height: 11
  - name: Billing by Service
    title: Billing by Service
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_column
    fields:
    - gcp_billing_export_service.description
    - gcp_billing_export.total_cost
    - gcp_billing_export.usage_start_date
    pivots:
    - gcp_billing_export_service.description
    fill_fields:
    - gcp_billing_export.usage_start_date
    filters:
      gcp_billing_export.usage_start_date: 30 days
    sorts:
    - gcp_billing_export.total_cost desc 0
    - gcp_billing_export_service.description
    limit: 500
    column_limit: 50
    stacking: percent
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_series: []
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    column_group_spacing_ratio:
    listen:
      Project: gcp_billing_export_project.name
      Service: gcp_billing_export_service.description
    row: 6
    col: 12
    width: 12
    height: 11
  - name: Billing by Service This Month
    title: Billing by Service This Month
    model: gcp_billing
    explore: gcp_billing_export
    type: table
    fields:
    - gcp_billing_export.total_cost
    - gcp_billing_export_service.description
    filters:
      gcp_billing_export.usage_start_date: 1 months
    sorts:
    - gcp_billing_export.total_cost desc
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    show_null_points: true
    point_style: none
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_series: []
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    listen:
      Project: gcp_billing_export_project.name
      Service: gcp_billing_export_service.description
    row: 17
    col: 12
    width: 12
    height: 8
  - name: Billing by Project This Month
    title: Billing by Project This Month
    model: gcp_billing
    explore: gcp_billing_export
    type: table
    fields:
    - gcp_billing_export_project.name
    - gcp_billing_export.total_cost
    filters:
      gcp_billing_export.usage_start_date: 1 months
    sorts:
    - gcp_billing_export.total_cost desc
    - gcp_billing_export_project.name
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    show_null_points: true
    point_style: none
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_series: []
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    listen:
      Project: gcp_billing_export_project.name
      Service: gcp_billing_export_service.description
    row: 17
    col: 0
    width: 12
    height: 8
  - title: Billing This Year
    name: Billing This Year
    model: gcp_billing
    explore: gcp_billing_export
    type: single_value
    fields:
    - gcp_billing_export.total_cost
    filters:
      gcp_billing_export.usage_start_year: 1 years
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 0
    col: 18
    width: 6
    height: 6
    listen:
      Project: gcp_billing_export_project.name
      Service: gcp_billing_export_service.description
  - name: Billing by Month
    title: Billing by Month
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_column
    fields:
    - gcp_billing_export.total_cost
    - gcp_billing_export.usage_start_month
    fill_fields:
    - gcp_billing_export.usage_start_month
    filters:
      gcp_billing_export.usage_start_date: 12 months
    sorts:
    - gcp_billing_export.usage_start_month desc
    limit: 500
    column_limit: 50
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    row: 25
    col: 0
    width: 24
    height: 8
    listen:
      Project: gcp_billing_export_project.name
      Service: gcp_billing_export_service.description
  - name: Predicted Total Monthly Costs
    title: Predicted Total Monthly Costs
    model: gcp_billing
    explore: gcp_billing_export
    type: single_value
    fields:
    - gcp_billing_export.usage_start_date
    - gcp_billing_export.total_cost
    fill_fields:
    - gcp_billing_export.usage_start_date
    filters:
      gcp_billing_export_service.description: ''
      gcp_billing_export_project.name: ''
      gcp_billing_export.usage_start_date: 1 months
    sorts:
    - gcp_billing_export.usage_start_date
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: x_bar
      label: x_bar
      expression: mean(${gcp_billing_export.total_cost})
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cov
      label: cov
      expression: sum((${day}-${y_bar})*(${gcp_billing_export.total_cost}-${x_bar}))
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: var
      label: var
      expression: sum((${gcp_billing_export.total_cost}-${x_bar})*(${gcp_billing_export.total_cost}-${x_bar}))
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: beta
      label: beta
      expression: "${cov}/${var}"
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: number
    - table_calculation: alpha
      label: alpha
      expression: "${y_bar}-${beta}*${x_bar}"
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: number
    - table_calculation: predicted_cost
      label: Predicted Cost
      expression: "${alpha} + ${beta}*${day}"
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: number
    - table_calculation: total_cost
      label: Total cost
      expression: sum(${gcp_billing_export.total_cost})
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: actual_cumulative_cost
      label: Actual Cumulative Cost
      expression: running_total(${gcp_billing_export.total_cost})
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: predicted_cumulative_cost
      label: Predicted Cumulative Cost
      expression: running_total(if(extract_days(${gcp_billing_export.usage_start_date})>
        extract_days(now()),${predicted_cost},${gcp_billing_export.total_cost}))
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: day
      label: Day
      expression: extract_days(${gcp_billing_export.usage_start_date})
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: number
    - table_calculation: y_bar
      label: y_bar
      expression: mean(${day})
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: number
    - table_calculation: total_predicted_costs
      label: Total Predicted Costs
      expression: max(${predicted_cumulative_cost})
      value_format:
      value_format_name: gbp_0
      _kind_hint: dimension
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
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
    series_types: {}
    hidden_fields:
    - day
    - y_bar
    - x_bar
    - cov
    - var
    - beta
    - alpha
    - gcp_billing_export.total_cost
    - total_cost
    - predicted_cost
    - predicted_cumulative_cost
    - actual_cumulative_cost
    hidden_series:
    - predicted_cost
    single_value_title: Predicted Total Monthly Cost
    row: 0
    col: 6
    width: 6
    height: 6
    listen:
      Project: gcp_billing_export_project.name
      Service: gcp_billing_export_service.description
  filters:
  - name: Service
    title: Service
    type: field_filter
    default_value: ''
    model: gcp_billing
    explore: gcp_billing_export
    field: gcp_billing_export_service.description
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Project
    title: Project
    type: field_filter
    default_value: ''
    model: gcp_billing
    explore: gcp_billing_export
    field: gcp_billing_export_project.name
    listens_to_filters: []
    allow_multiple_values: true
    required: false
