connection: "djthesis"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"
week_start_day: sunday

# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=5.0
# NOTE: for BigQuery specific considerations

explore: library_20171127 {
  label: "DJ Jeffty's Song Library"
  join:  gig_playlists {
    type: inner
    relationship: many_to_one
    sql_on: ${library_20171127.name} =  ${gig_playlists.name}
      AND ${library_20171127.artist} = ${gig_playlists.artist} ;;
  }
  join: calendar {
    type: inner
    relationship:  many_to_one
    sql_on: ${gig_playlists.gig_id_raw} = ${calendar.event_raw} ;;
  }
  }



# explore: library {
#   join: jan_six_seventeen {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${library.name} = ${jan_six_seventeen.name} AND ${library.artist} = ${jan_six_seventeen.artist} ;;
#   }
# }
