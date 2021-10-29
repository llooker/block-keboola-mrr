view: contract_line {
  sql_table_name: @{SCHEMA_NAME}.CONTRACT_LINE ;;

  set: company_contract_product {
    fields: [
      company.company,
      contract.contract_id,
      product.product
    ]
  }

  dimension: contract_line_id {
    label: "Contract Line ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."CONTRACT_LINE_ID" ;;
  }

  dimension: contract_id {
    type: string
    hidden: yes
    sql: ${TABLE}."CONTRACT_ID" ;;
  }

  dimension: product_id {
    type: string
    hidden: yes
    sql: ${TABLE}."PRODUCT_ID" ;;
  }

  dimension: contract_line_currency {
    type: string
    sql: ${TABLE}."CONTRACT_LINE_CURRENCY" ;;
  }

  dimension_group: contract_line_end {
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
    sql: ${TABLE}."CONTRACT_LINE_END_DATE" ;;
  }

  dimension_group: contract_line_start {
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
    sql: ${TABLE}."CONTRACT_LINE_START_DATE" ;;
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

  measure: contract_line_quantity {
    type: sum
    sql: ${contract_line_quantity_dimension} ;;
    value_format: "#,##0"
    drill_fields: [company_contract_product*, contract_line_quantity]
  }

  measure: contract_line_unit_price {
    type: sum
    sql: ${contract_line_unit_price_dimension} ;;
    value_format: "#,##0"
    drill_fields: [company_contract_product*, contract_line_unit_price]
  }

  measure: contract_line_mrr {
    description: "Current MRR of the line"
    label: "Contract Line MRR"
    type: sum
    sql: (${contract_line_unit_price_dimension} * ${contract_line_quantity_dimension});;
    value_format: "#,##0"
    drill_fields: [company_contract_product*, contract_line_mrr]
  }

  measure: count {
    type: count
    drill_fields: [company_contract_product*, count]
  }
}
