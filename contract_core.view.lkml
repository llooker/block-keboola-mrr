include: "//@{CONFIG_PROJECT_NAME}/contract.view"

view: contract {
  extends: [contract_config]
}

view: contract_core {
  sql_table_name: @{SCHEMA_NAME}.CONTRACT ;;

  dimension: contract_id {
    label: "Contract ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."CONTRACT_ID" ;;
  }

  dimension: company_id {
    type: string
    hidden: yes
    sql: ${TABLE}."COMPANY_ID" ;;
  }

  dimension: employee_id {
    type: string
    hidden: yes
    sql: ${TABLE}."EMPLOYEE_ID" ;;
  }

  dimension: contract {
    type: string
    sql: ${TABLE}."CONTRACT" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension_group: contract_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}."CONTRACT_END_DATE" ;;
  }

  dimension: contract_number {
    type: string
    sql: ${TABLE}."CONTRACT_NUMBER" ;;
  }

  dimension_group: contract_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}."CONTRACT_START_DATE" ;;
  }

  measure: count {
    type: count
    drill_fields: [company.company, contract, contract_number, employee.employee, contract_start_date, contract_line.contract_line_mrr]
  }
}