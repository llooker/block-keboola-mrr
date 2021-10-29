include: "//@{CONFIG_PROJECT_NAME}/mrr_aggregated.view"

view: mrr_aggregated {
  extends: [mrr_aggregated_config]
}

view: mrr_aggregated_core {
  label: "MRR Aggregated"
  sql_table_name: @{SCHEMA_NAME}.MRR_AGGREGATED ;;

  dimension: mrr_aggregated_id {
    label: "MRR Aggregated ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."MRR_AGGREGATED_ID" ;;
  }

  dimension: company_id {
    hidden: yes
    type: string
    sql: ${TABLE}."COMPANY_ID" ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}."CURRENCY" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}."DATE" ;;
  }

  dimension: gross_action {
    description: "Type of MRR change"
    type: string
    sql: ${TABLE}."GROSS_ACTION" ;;
  }

  dimension: ARR_bucket {
    label: "ARR Bucket"
    type: tier
    tiers: [25000,50000,75000,100000]
    sql: ${TABLE}."GROSS_MRR"*12 ;;
    style: relational
    value_format: "#,k"
    view_label: ""
  }

  dimension: gross_mrr_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."GROSS_MRR" ;;
  }

  dimension: gross_mrr_change_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."GROSS_MRR_CHANGE" ;;
  }

  dimension: previous_gross_mrr_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."PREVIOUS_GROSS_MRR" ;;
  }

  dimension: customer_active {
    description: "Customer is active if his/her MRR is above 0"
    type: yesno
    sql: ${gross_mrr_dimension} > 0 ;;
  }

  dimension: count_change_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."COUNT_CHANGE" ;;
  }

  measure: count_change {
    description: "Calculates change of MRR: no change = 0, decrees = -1, increase = 1"
    type: sum
    sql: ${count_change_dimension} ;;
    drill_fields: [company.company, gross_action]
  }

  measure: customer_count {
    description: "Number of active customers"
    type: count_distinct
    sql: ${company_id};;
    view_label: ""
    filters: {
      field: customer_active
      value: "Yes"
    }
    drill_fields: [company.company, gross_mrr,gross_mrr]
  }

  measure: gross_mrr {
    label: "Gross MRR"
    type: sum
    sql: ${gross_mrr_dimension} ;;
    value_format: "#,##0"
    drill_fields: [company.company, gross_mrr]
  }

  measure: previous_gross_mrr {
    label: "Previous Gross MRR"
    type: sum
    sql: ${previous_gross_mrr_dimension} ;;
    value_format: "#,##0"
    drill_fields: [company.company, previous_gross_mrr]
  }

  measure: gross_mrr_change {
    description: "Change in Gross MRR vs previous month"
    label: "Gross MRR Change"
    type: sum
    sql: ${gross_mrr_change_dimension} ;;
    value_format: "#,##0"
    drill_fields: [company.company, gross_mrr_change]
  }

  measure: gross_mrr_AVG {
    label: "Gross MRR AVG"
    type: average
    sql: ${gross_mrr_dimension} ;;
    value_format: "#,##0"
    drill_fields: [company.company, gross_mrr_AVG]
  }

  measure: count {
    type: count
    drill_fields: [mrr_aggregated_id, count]
  }
}