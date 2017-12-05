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
  join:  comb_gigs_dec16jan17 {
    type: inner
    relationship: many_to_one
    sql_on: ${library_20171127.name} =  ${comb_gigs_dec16jan17.name}
      AND ${library_20171127.artist} = ${comb_gigs_dec16jan17.artist} ;;
  }
  join: eventcal {
    type: inner
    relationship:  many_to_one
    sql_on: ${comb_gigs_dec16jan17.gig_date} = ${eventcal.date_raw} ;;
  }

  join: gig_2016_12_09_ {
    type: inner
    relationship: many_to_one
    sql_on: ${library_20171127.name} =  ${gig_2016_12_09_.name}
    AND ${library_20171127.artist} = ${gig_2016_12_09_.artist} ;;
  }
  join: gig_2016_12_10_ {
    type: inner
    relationship: many_to_one
    sql_on: ${library_20171127.name} =  ${gig_2016_12_10_.name}
    AND ${library_20171127.artist} = ${gig_2016_12_10_.artist} ;;
  }
}

explore: calendar {}

explore: eventcal {}

explore: comb_gigs_dec16jan17 {}

# explore: library {
#   join: jan_six_seventeen {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${library.name} = ${jan_six_seventeen.name} AND ${library.artist} = ${jan_six_seventeen.artist} ;;
#   }
# }
