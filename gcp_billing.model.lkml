connection: "bq_metrics"

include: "*.view.lkml"         # include all views in this project
include: "billing.dashboard.lookml"  # include all dashboards in this project

explore: gcp_billing_export {
  view_label: "GCP Billing"
  label: "GCP Billing"

  join: gcp_billing_export_project {
    view_label: "GCP Billing"
    sql: LEFT JOIN UNNEST([${gcp_billing_export.project}]) AS gcp_billing_export_project ;;
    relationship: one_to_one
  }

  join: gcp_billing_export_labels {
    view_label: "GCP Billing"
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(project.labels) AS gcp_billing_export_labels ;;
  }

  join: gcp_billing_export_usage {
    view_label: "GCP Billing"
    sql: LEFT JOIN UNNEST([${gcp_billing_export.usage}]) AS gcp_billing_export_usage ;;
    relationship: one_to_one
  }

  join: gcp_billing_export_credits {
    view_label: "GCP Billing"
    sql: LEFT JOIN UNNEST(credits) AS gcp_billing_export_credits ;;
    relationship: one_to_many
  }

  join: gcp_billing_export_service {
    view_label: "GCP Billing"
    relationship: one_to_one
    sql: LEFT JOIN UNNEST([${gcp_billing_export.service}]) AS gcp_billing_export_service ;;
  }

  join: gcp_billing_export_sku {
    view_label: "GCP Billing"
    relationship: one_to_one
    sql: LEFT JOIN UNNEST([${gcp_billing_export.sku}]) AS gcp_billing_export_sku ;;
  }
}
