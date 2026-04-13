{% macro format_duration_minutes(minutes) %}
    CASE
        WHEN {{ minutes }} IS NULL THEN NULL
        ELSE
            (
                FLOOR({{ minutes }} / 60)::int || ' hour' ||
                CASE WHEN FLOOR({{ minutes }} / 60) = 1 THEN '' ELSE 's' END
                || ' and ' ||
                MOD({{ minutes }}, 60)::int || ' minute' ||
                CASE WHEN MOD({{ minutes}}, 60) = 1 THEN '' ELSE 's' END
            )
    END
{% endmacro %}