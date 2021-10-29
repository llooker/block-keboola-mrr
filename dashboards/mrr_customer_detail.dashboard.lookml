- dashboard: mrr_customer_detail
  title: MRR Customer Detail
  layout: newspaper
  elements:
  - name: ''
    type: text
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Customer Profile</b></font>
    row: 0
    col: 6
    width: 12
    height: 2
  - name: 'PoweredBy'
    type: text
    body_text: <a href="https://keboola.com" target="_blank"> <img src="https://keboola-resources.s3.amazonaws.com/poweredByKeboola.png"
      width="100%"/>
    row: 0
    col: 18
    width: 6
    height: 2
  - title: Current MRR
    name: Current MRR
    model: block_keboola_mrr_v2
    explore: mrr
    type: single_value
    fields: [mrr.contract_line_mrr]
    filters:
      mrr.date_month: this month
    limit: 500
    series_types: {}
    listen:
      Customer: company.company
    row: 2
    col: 0
    width: 6
    height: 3
  - title: MRR by Product Family
    name: MRR by Product Family
    model: block_keboola_mrr_v2
    explore: mrr
    type: looker_area
    fields: [mrr.contract_line_mrr, mrr.date_month, product.product_family]
    pivots: [product.product_family]
    fill_fields: [mrr.date_month]
    filters:
      mrr.date_month: 9 months
    sorts: [mrr.date_month desc, product.product_family]
    limit: 500
    total: true
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
        __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml
        __LINE_NUM: 61
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: Customer Success - mrr.contract_line_mrr,
            id: Customer Success - mrr.contract_line_mrr, name: Customer Success,
            __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml, __LINE_NUM: 67},
          {axisId: Keboola Add-ons - mrr.contract_line_mrr, id: Keboola Add-ons -
              mrr.contract_line_mrr, name: Keboola Add-ons, __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml,
            __LINE_NUM: 69}, {axisId: Keboola Subscription - mrr.contract_line_mrr,
            id: Keboola Subscription - mrr.contract_line_mrr, name: Keboola Subscription,
            __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml, __LINE_NUM: 72},
          {axisId: Looker subscription - mrr.contract_line_mrr, id: Looker subscription
              - mrr.contract_line_mrr, name: Looker subscription, __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml,
            __LINE_NUM: 74}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml,
        __LINE_NUM: 67}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    label_value_format: "# ###,k"
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#353b49"
    listen:
      Customer: company.company
    row: 11
    col: 0
    width: 12
    height: 7
  - title: Annualized
    name: Annualized
    model: block_keboola_mrr_v2
    explore: mrr
    type: single_value
    fields: [mrr.contract_line_mrr]
    filters:
      mrr.date_month: this month
    limit: 500
    dynamic_fields: [{table_calculation: annualized, label: Annualized, expression: "${mrr.contract_line_mrr}*12",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    value_format: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields: [mrr.contract_line_mrr]
    listen:
      Customer: company.company
    row: 2
    col: 6
    width: 6
    height: 3
  - title: Y/Y ARR Change
    name: Y/Y ARR Change
    model: block_keboola_mrr_v2
    explore: mrr_aggregated
    type: looker_column
    fields: [mrr_aggregated.gross_mrr, mrr_aggregated.date_year]
    filters:
      mrr_aggregated.date_year: 5 years
      mrr_aggregated.gross_mrr: ">0"
      mrr_aggregated.date_month_name: December
    sorts: [mrr_aggregated.date_year]
    limit: 500
    dynamic_fields: [{table_calculation: yy_change, label: Y/Y Change, expression: "${mrr_aggregated.gross_mrr}\
          \ / offset(${mrr_aggregated.gross_mrr},-1)", value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, _type_hint: number}, {table_calculation: arr, label: ARR,
        expression: "${mrr_aggregated.gross_mrr} * 12", value_format: "# ##0,k", value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
        __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml
        __LINE_NUM: 162
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: arr, id: arr, name: ARR,
            __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml, __LINE_NUM: 168}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear, __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml,
        __LINE_NUM: 168}, {label: !!null '', orientation: right, series: [{axisId: yy_change,
            id: yy_change, name: Y/Y Change, __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml,
            __LINE_NUM: 172}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml,
        __LINE_NUM: 172}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types:
      yy_change: scatter
    point_style: circle
    series_colors:
      arr: "#353b49"
      yy_change: "#1ea8df"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [mrr_aggregated.gross_mrr]
    listen:
      Customer: company.company
    row: 11
    col: 12
    width: 12
    height: 7
  - title: MRR Changes History
    name: MRR Changes History
    model: block_keboola_mrr_v2
    explore: mrr_aggregated
    type: looker_column
    fields: [mrr_aggregated.gross_mrr_change, mrr_aggregated.date_month, mrr_aggregated.gross_mrr]
    fill_fields: [mrr_aggregated.date_month]
    filters:
      mrr_aggregated.date_month: 9 months
    sorts: [mrr_aggregated.date_month desc]
    limit: 500
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
        __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml
        __LINE_NUM: 228
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: mrr_aggregated.gross_mrr_change,
            id: mrr_aggregated.gross_mrr_change, name: Gross MRR Change, __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml,
            __LINE_NUM: 234}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, type: linear, __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml,
        __LINE_NUM: 234}, {label: '', orientation: right, series: [{axisId: mrr_aggregated.gross_mrr,
            id: mrr_aggregated.gross_mrr, name: Gross MRR, __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml,
            __LINE_NUM: 238}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml,
        __LINE_NUM: 238}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    label_value_format: "# ### ###"
    series_types:
      mrr_aggregated.gross_mrr: area
    point_style: none
    series_colors:
      Downgrade - mrr_aggregated.gross_mrr_change: "#ed6168"
      Net New - mrr_aggregated.gross_mrr_change: "#33a02c"
      Upgrade - mrr_aggregated.gross_mrr_change: "#b2df8a"
      mrr_aggregated.gross_mrr: "#33a02c"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Customer: company.company
    row: 5
    col: 0
    width: 12
    height: 6
  - title: LTV (Contracted)
    name: LTV (Contracted)
    model: block_keboola_mrr_v2
    explore: mrr
    type: single_value
    fields: [mrr.contract_line_mrr]
    limit: 500
    column_limit: 50
    series_types: {}
    listen:
      Customer: company.company
    row: 2
    col: 18
    width: 6
    height: 3
  - name: Customer Position by Current MRR
    title: Customer Position by Current MRR
    merged_queries:
    - model: block_keboola_mrr_v2
      explore: mrr_aggregated
      type: table
      fields: [company.company, mrr_aggregated.gross_mrr]
      filters:
        mrr_aggregated.date_month: this month
      sorts: [mrr_aggregated.gross_mrr desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields: []
    - model: block_keboola_mrr_v2
      explore: mrr_aggregated
      type: table
      fields: [company.company, mrr_aggregated.gross_mrr]
      filters:
        mrr_aggregated.date_month: this month
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: company.company
        source_field_name: company.company
        __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml
        __LINE_NUM: 318
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: mrr_aggregated.gross_mrr,
            id: mrr_aggregated.gross_mrr, name: MRR Aggregated, __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml,
            __LINE_NUM: 325}, {axisId: q1_mrr_aggregated.gross_mrr, id: q1_mrr_aggregated.gross_mrr,
            name: MRR Aggregated, __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml,
            __LINE_NUM: 327}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: block-keboola-mrr/mrr_customer_detail.dashboard.lookml,
        __LINE_NUM: 325}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hide_legend: true
    legend_position: center
    series_types:
      mrr_aggregated.gross_mrr: area
    point_style: none
    series_colors:
      q1_mrr_aggregated.gross_mrr: "#ed6168"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    type: looker_column
    column_limit: 50
    listen:
    -
    - Customer: company.company
    row: 5
    col: 12
    width: 12
    height: 6
  - title: LTV up to date
    name: LTV up to date
    model: block_keboola_mrr_v2
    explore: mrr
    type: single_value
    fields: [mrr.contract_line_mrr]
    filters:
      mrr.date_month: before 0 months ago
    limit: 500
    column_limit: 50
    series_types: {}
    listen:
      Customer: company.company
    row: 2
    col: 12
    width: 6
    height: 3
  - name: 'Title'
    type: text
    title_text: ''
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Subscription Revenue</b></font>
    row: 0
    col: 0
    width: 6
    height: 2
  filters:
  - name: Customer
    title: Customer
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: true
    model: block_keboola_mrr_v2
    explore: mrr_aggregated
    listens_to_filters: []
    field: company.company