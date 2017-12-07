view: calendar {
  sql_table_name: IKYL.calendar ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age_group {
    type: string
    sql: ${TABLE}.age_group ;;
  }

  dimension_group: booked {
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
    sql: ${TABLE}.booked_on ;;
  }

  dimension: latlong {
      type: location
      sql_latitude: ${TABLE}.latitude ;;
      sql_longitude:${TABLE}.longitude ;;
    }

  dimension: client {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.event_on ;;
  }

  dimension: event_title {
    type: string
    sql: ${TABLE}.event_title ;;
  }

  dimension: gratuity {
    type: number
    sql: ${TABLE}.gratuity ;;
  }

  dimension: hourly_rate {
    type: number
    sql: ${TABLE}.hourly_rate ;;
  }

  dimension: hours {
    type: number
    sql: ${TABLE}.hours ;;
  }

  dimension: invoice_id {
    type: number
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location {
    type: number
    sql: ${TABLE}.location ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: total_hours {
    type: number
    sql: ${TABLE}.total_hours ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: venue {
    type: string
    sql: ${TABLE}.venue ;;
  }

  measure: count {
    type: count
    html: {{rendered_value}}|| {{event_month_name._rendered_value}} ;;
    drill_fields: [id, event_title, event_date, client]
  }
}
