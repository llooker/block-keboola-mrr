include: "//@{CONFIG_PROJECT_NAME}/mrr.view"

view: mrr {
  extends: [mrr_config]
}

view: mrr_core {
  sql_table_name: @{SCHEMA_NAME}.MRR ;;
  label: "MRR"

  set: company_contract_employee {
    fields: [
      company.company,
      contract.contract_id,
      employee.employee
    ]
  }

  dimension: mrr_id {
    label: "MRR ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."MRR_ID" ;;
  }

  dimension: contract_line_id {
    type: string
    hidden: yes
    sql: ${TABLE}."CONTRACT_LINE_ID" ;;
  }

  dimension: contract_line_currency {
    type: string
    sql: ${TABLE}."CONTRACT_LINE_CURRENCY" ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}."DATE" ;;
  }

  dimension: contract_line_quantity_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."CONTRACT_LINE_QUANTITY" ;;
  }

  dimension: contract_line_unit_price_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."CONTRACT_LINE_UNIT_PRICE" ;;
  }

  dimension: previous_contract_line_quantity_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."PREVIOUS_CONTRACT_LINE_QUANTITY" ;;
  }

  dimension: previous_contract_line_unit_price_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."PREVIOUS_CONTRACT_LINE_UNIT_PRICE" ;;
  }

  measure: contract_line_quantity {
    description: "Quantity according to the selected month"
    type: sum
    sql: ${contract_line_quantity_dimension} ;;
    value_format: "#,##0"
  }

  measure: contract_line_unit_price {
    description: "Unit price according to the selected month"
    type: sum
    sql: ${contract_line_unit_price_dimension} ;;
    value_format: "#,##0"
  }

  measure: contract_line_mrr {
    description: "MRR value according to the selected month"
    label: "Contract Line MRR"
    type: sum
    sql: (${contract_line_unit_price_dimension} * ${contract_line_quantity_dimension});;
    value_format: "#,##0"
    drill_fields: [company_contract_employee*, contract_line_mrr, previous_contract_line_mrr]
  }

  measure: previous_contract_line_quantity {
    description: "Value of previous month"
    type: sum
    sql: ${previous_contract_line_quantity_dimension} ;;
    value_format: "#,##0"
    drill_fields: [company_contract_employee*, previous_contract_line_quantity]
  }

  measure: previous_contract_line_unit_price {
    description: "Value of the previous month"
    type: sum
    sql: ${previous_contract_line_unit_price_dimension} ;;
    value_format: "#,##0"
    drill_fields: [company_contract_employee*, previous_contract_line_unit_price]
  }

  measure: previous_contract_line_mrr {
    description: "Value of the previous month"
    type: sum
    sql: (${previous_contract_line_unit_price_dimension} * ${previous_contract_line_quantity_dimension});;
    value_format: "#,##0"
    drill_fields: [company_contract_employee*, contract_line_mrr, previous_contract_line_mrr]
  }

  measure: count {
    type: count
    drill_fields: [company_contract_employee*, count]
  }

  dimension: contract_line_change {
    description: "Type of action based on the line's MRR value change"
    type: string
    case: {
      when: {
        sql: ${previous_contract_line_unit_price_dimension} * ${previous_contract_line_quantity_dimension} =  ${contract_line_unit_price_dimension} * ${contract_line_quantity_dimension} ;;
        label: "No Change"
      }
      when: {
        sql: ${previous_contract_line_unit_price_dimension} * ${previous_contract_line_quantity_dimension} = 0 ;;
        label: "Net New"
      }
      when: {
        sql: ${contract_line_unit_price_dimension} * ${contract_line_quantity_dimension} = 0 ;;
        label: "Churn"
      }
      when: {
        sql: ${previous_contract_line_unit_price_dimension} * ${previous_contract_line_quantity_dimension} >  ${contract_line_unit_price_dimension} * ${contract_line_quantity_dimension} ;;
        label: "Downgrade"
      }
      when: {
        sql: ${previous_contract_line_unit_price_dimension} * ${previous_contract_line_quantity_dimension} <  ${contract_line_unit_price_dimension} * ${contract_line_quantity_dimension} ;;
        label: "Upgrade"
      }
      else: "No Change"
    }
  }
}