connection: "djthesis"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"
week_start_day: sunday

# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=5.0
# NOTE: for BigQuery specific considerations

explore: library_20171127 {
  join: gig_2016_12_09_ {
    type: inner
    relationship: many_to_one
    sql_on: COALESCE(${library_20171127.name}) =  ${gig_2016_12_09_.name} AND COALESCE(${library_20171127.artist}) = ${gig_2016_12_09_.artist} ;;
  }
}

# explore: library {
#   join: jan_six_seventeen {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${library.name} = ${jan_six_seventeen.name} AND ${library.artist} = ${jan_six_seventeen.artist} ;;
#   }
# }
