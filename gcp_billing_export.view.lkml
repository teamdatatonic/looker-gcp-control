view: gcp_billing_export {
  sql_table_name: gcp_logs.gcp_billing_export_002831_A42942_C36931 ;;

  parameter: date_view {
    type: unquoted
    default_value: "Day"
    allowed_value: {
      label: "Year"
      value: "YEAR"
    }
    allowed_value: {
      label: "Month"
      value: "MONTH"
    }
    allowed_value: {
      label: "Day"
      value: "DATE"
    }
  }

  dimension: billing_date {
    type: string
    sql: EXTRACT({% parameter date_view %} from ${start_raw}) ;;
  }

  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.billing_account_id ;;
  }

  dimension: cost {
    description: "The cost associated to a Resource, between Start Date and End Date"
    type: number
    sql: ${TABLE}.cost ;;
  }

  measure: total_cost {
    description: "The total cost associated to the Resource, between the Start Date and End Date"
    type: sum
    sql: ${TABLE}.cost ;;
    value_format_name: decimal_2
    html: {% if currency._value == 'GBP' %}
            <a href="{{ link }}"> £{{ rendered_value }}</a>
          {% elsif currency == 'USD' %}
            <a href="{{ link }}"> ${{ rendered_value }}</a>
          {% elsif currency == 'EUR' %}
            <a href="{{ link }}"> €{{ rendered_value }}</a>
          {% else %}
            <a href="{{ link }}"> {{ rendered_value }} {{ currency._value }}</a>
          {% endif %} ;;
    drill_fields: [gcp_billing_export_project.name, product, resource_category, resource_type, gcp_billing_export_usage.unit, gcp_billing_export_usage.total_usage, total_cost]
  }

  dimension: credits {
    hidden: yes
    sql: ${TABLE}.credits ;;
  }

  dimension: currency {
    description: "The currency the cost was billed in"
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: currency_conversion_rate {
    type: number
    sql: ${TABLE}.currency_conversion_rate ;;
  }

  dimension_group: end {
    description: "Time at which the cost associated with a resource ended"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      month_num,
      week_of_year,
      day_of_month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_time ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: product {
    description: "The GCP Product, e.g. BigQuery, Dataflow, App Engine"
    type: string
    sql: ${TABLE}.product ;;
    drill_fields: [gcp_billing_export_project.name,resource_category,resource_type]
  }

  dimension: resource_category {
    type: string
    description: "Provides an additional layer of granularity above Resource type."
    drill_fields: [resource_type]
    sql:
      CASE
        WHEN (${product} = "Compute Engine"
              AND ${resource_type} LIKE '%Licensing%') THEN 'Compute Engine License'
        WHEN (${product} = "Compute Engine"
              AND ${resource_type} LIKE '%Network%') THEN 'Networking'
        WHEN (${product} = "Compute Engine"
              AND (${resource_type} LIKE '%instance%'
                  or ${resource_type} LIKE '%Instance%')) THEN 'Compute Engine Instance'
        WHEN (${product} = "Compute Engine"
              AND ${resource_type} LIKE '%PD%') THEN 'Compute Engine Storage'
        WHEN (${product} = "Compute Engine"
              AND ${resource_type} LIKE '%Intel%') THEN 'Compute Engine Instance'
        WHEN (${product} = "Compute Engine"
              AND ${resource_type} LIKE '%Storage%') THEN 'Compute Engine Storage'
        WHEN (${product} = "Compute Engine"
              AND ${resource_type} LIKE '%Ip%') THEN 'Networking'
        WHEN (${product} = "BigQuery"
              AND ${resource_type} LIKE '%Storage%') THEN 'BigQuery Storage'
        WHEN (${product} = "BigQuery"
              AND ${resource_type} = "Analysis") THEN 'BigQuery Analysis'
        WHEN (${product} = "BigQuery"
              AND ${resource_type} = 'Streaming Insert') THEN 'BigQuery Streaming'
        WHEN (${product} = 'Cloud Storage'
              AND ${resource_type} LIKE '%Storage%') THEN 'GCS Storage'
        WHEN (${product} = 'Cloud Storage'
              AND ${resource_type} LIKE '%Download%') THEN 'GCS Download'
        WHEN (${product} = 'Cloud Dataflow'
              AND ${resource_type} LIKE '%PD%') THEN 'Dataflow PD'
        WHEN (${product} = 'Cloud Dataflow'
              AND (${resource_type} LIKE '%vCPU%'
                    OR ${resource_type} LIKE '%RAM%')) THEN 'Dataflow Compute'
        ELSE ${product}
      END  ;;
  }

  dimension: project {
    hidden: yes
    sql: ${TABLE}.project ;;
  }

  dimension: resource_type {
    description: "The most granular level of detail"
    type: string
    sql: ${TABLE}.resource_type ;;
  }

  dimension_group: start {
    description: "Time at which the cost associated with a resource started"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      month_num,
      week_of_year,
      day_of_month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_time ;;
  }

  dimension: usage {
    hidden: yes
    sql: ${TABLE}.usage ;;
  }
}

view: gcp_billing_export_credits {
  dimension: credit_amount {
    group_label: "Credits"
    description: "The amount of credit given to account"
    type: number
    sql: ${TABLE}.amount ;;
  }

  measure: total_credit {
    description: "The total credit given to the billing account"
    type: number
    sql: ${credit_amount} ;;
  }

  dimension: credit_name {
    group_label: "Credits"
    description: "Nmae of the credit applied to account"
    type: string
    sql: ${TABLE}.name ;;
  }
}

view: gcp_billing_export_usage {
  dimension: usage {
    group_label: "Resource Usage"
    type: number
    sql: ${TABLE}.amount ;;
  }

  measure: total_usage {
    description: "The units of Usage is the dimension 'Resource', please use the two together"
    type: sum
    sql: ${usage} ;;
  }

  dimension: unit {
    group_label: "Resource Usage"
    type: string
    sql: ${TABLE}.unit ;;
  }
}

view: gcp_billing_export_project {
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: name {
    label: "Project Name"
    type: string
    sql: ${TABLE}.name ;;
    drill_fields: [gcp_billing_export.product, gcp_billing_export.resource_category, gcp_billing_export.resource_type]
  }
}

view: gcp_billing_export_labels {
  dimension: label_key {
    group_label: "Labels"
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: label_value {
    group_label: "Labels"
    type: string
    sql: ${TABLE}.value ;;
  }
}
