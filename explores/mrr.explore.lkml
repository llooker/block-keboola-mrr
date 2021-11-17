include: "/views/*.view.lkml"

explore: mrr {

  description: "Contains only contracts with MRR."
  label: "MRR"

  join: contract_line {
    type: left_outer
    sql_on: ${mrr.contract_line_id} = ${contract_line.contract_line_id} ;;
    relationship: many_to_one
  }

  join: contract {
    type: left_outer
    sql_on: ${contract_line.contract_id} = ${contract.contract_id} ;;
    relationship: many_to_one
  }

  join: employee {
    type: left_outer
    sql_on: ${contract.employee_id} = ${employee.employee_id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${contract_line.product_id} = ${product.product_id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${contract.company_id} = ${company.company_id} ;;
    relationship: many_to_one
  }
}
