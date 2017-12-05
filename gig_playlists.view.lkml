view: gig_playlists {
  sql_table_name: IKYL.gig_playlists ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: artist {
    type: string
    sql: ${TABLE}.artist ;;
  }

  dimension: bpm {
    type: number
    sql: ${TABLE}.bpm ;;
  }

  dimension: deck {
    type: number
    sql: ${TABLE}.deck ;;
  }

  dimension: duration {
    type: string
    sql: ${TABLE}.duration ;;
  }

  dimension: end_time {
    type: string
    sql: ${TABLE}.end_time ;;
  }

  dimension_group: gig_id {
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
    datatype: date
    sql: ${TABLE}.gig_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: playlist_id {
    type: number
    sql: ${TABLE}.playlist_id ;;
  }

  dimension: start_time {
    type: string
    sql: ${TABLE}.start_time ;;
  }

  dimension: totalsong {
    type: number
    sql: ${TABLE}.totalsong ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
