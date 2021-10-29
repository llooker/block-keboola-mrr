include: "/views/*.view.lkml"

explore: mrr_aggregated {

  label: "MRR Aggregated"

  join: company {
    type: left_outer
    sql_on: ${mrr_aggregated.company_id} = ${company.company_id} ;;
    relationship: many_to_one
  }
}
