explore: mrr_aggregated_core {
  hidden: yes
  extension: required
  label: "MRR Aggregated"

  join: company {
    type: left_outer
    sql_on: ${mrr_aggregated.company_id} = ${company.company_id} ;;
    relationship: many_to_one
  }
}
