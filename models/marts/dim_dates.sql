with dates as (
    {{ dbt_date.get_date_dimension("2011-05-31", "2014-07-07") }}
)
    
select 
    dates.date_day as complete_date
    , dates.year_number
    , dates.day_of_week_iso as day_of_week
    , dates.day_of_week_name
    , dates.day_of_week_name_short
    , dates.day_of_month
    , dates.month_of_year
    , dates.month_name
    , dates.month_name_short
from dates as dates