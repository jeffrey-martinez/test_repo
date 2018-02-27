view: stc {
  sql_table_name: IKYL.stc ;;

  dimension: pkey {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(stc.State,stc.Type) ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: typecount {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  measure: type_sum {
    type: sum
    sql: ${typecount} ;;
  }

  measure: count {
    type: count
    drill_fields: [typecount, state, type]
  }
}
