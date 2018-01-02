view: stc {
  sql_table_name: IKYL.stc ;;

  dimension: typecount {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  measure: count {
    type: count
    drill_fields: [typecount, state, type]
  }

  measure: type_max {
    type: max
    sql: ${typecount}  ;;
  }
}
