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
          {% elsif currency == 'EUR' %}
            <a href="{{ link }}"> €{{ rendered_value }}</a>
          {% else %}
            <a href="{{ link }}"> {{ rendered_value }} {{ currency._value }}</a>
          {% endif %} ;;
    drill_fields: [gcp_billing_export_project.name, product, resource_type, gcp_billing_export_usage.resource, gcp_billing_export_usage.total_usage, total_cost]
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
    drill_fields: [gcp_billing_export_project.name,resource_type]
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
  dimension: usage {
    type: number
    sql: ${TABLE}.amount ;;
  }

  measure: total_usage {
    description: "The units of Usage is the dimension 'Resource', please use the two together"
    type: sum
    sql: ${usage} ;;
  }

  dimension: resource {
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
