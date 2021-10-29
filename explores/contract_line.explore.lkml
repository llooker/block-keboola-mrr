include: "/views/*.view.lkml"
explore: contract_line {

  description: "Contains also contracts without MRR."

  join: contract {
    type: left_outer
    sql_on: ${contract_line.contract_id} = ${contract.contract_id} ;;
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

  join: employee {
    type: left_outer
    sql_on: ${contract.employee_id} = ${employee.employee_id} ;;
    relationship: many_to_one
  }
}
