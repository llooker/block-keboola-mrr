include: "//@{CONFIG_PROJECT_NAME}/product.view"

view: product {
  extends: [product_config]
}

view: product_core {
  sql_table_name: @{SCHEMA_NAME}.PRODUCT ;;

  dimension: product_id {
    label: "Product ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."PRODUCT_ID" ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}."PRODUCT" ;;
  }

  dimension: product_family {
    type: string
    sql: ${TABLE}."PRODUCT_FAMILY" ;;
  }

  measure: count {
    type: count
    drill_fields: [product_id, product, count]
  }
}