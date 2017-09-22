view: gcp_billing_export {
  sql_table_name: gcp_logs.gcp_billing_export_002831_A42942_C36931 ;;

  parameter: date_view {
    type: string
    suggestions: ["Year","Month","Week","Day"]
  }


  dimension: billing_date {
    sql: CASE
          WHEN {% parameter date_view %} = 'Year' THEN ${end_year}
          WHEN {% parameter date_view %} = 'Month' THEN ${end_month}
          WHEN {% parameter date_view %} = 'Week' THEN ${end_week}
          ELSE ${end_date}
        END;;
  }

  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.billing_account_id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  measure: total_cost {
    type: sum
    sql: ${TABLE}.cost ;;
    value_format_name: decimal_2
    html: {% if currency._value == 'GBP' %}
            <a href="{{ link }}"> £{{ rendered_value }}</a>
          {% elsif currency == 'USD' %}
            <a href="{{ link }}"> ${{ rendered_value }}</a>
          {% else %}
            <a href="{{ link }}"> {{ rendered_value }}</a>
          {% endif %};;
    drill_fields: [gcp_billing_export_project.name, product, resource_type, total_cost]
  }

  dimension: credits {
    hidden: yes
    sql: ${TABLE}.credits ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: currency_conversion_rate {
    type: number
    sql: ${TABLE}.currency_conversion_rate ;;
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
    sql: ${TABLE}.end_time ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
    drill_fields: [resource_type]
  }

  dimension: project {
    hidden: yes
    sql: ${TABLE}.project ;;
  }

  dimension: resource_type {
    type: string
    sql: ${TABLE}.resource_type ;;
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
    sql: ${TABLE}.start_time ;;
  }

  dimension: usage {
    hidden: yes
    sql: ${TABLE}.usage ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: gcp_billing_export_credits {
  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}

view: gcp_billing_export_usage {
  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: unit {
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
    type: string
    sql: ${TABLE}.name ;;
    drill_fields: [gcp_billing_export.product, gcp_billing_export.resource_type]
  }
}

view: gcp_billing_export_labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}
