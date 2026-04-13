with movies_sources as (
    select * from {{ source('movies_sources', 'movies') }}
)

select
    ms.movie_id,
    ms.title,
    ms.vote_average,
    ms.release_date,
    ms.revenue,
    {{ format_duration_minutes('ms.runtime') }} as movie_runtime,
    ms.budget
from movies_sources ms