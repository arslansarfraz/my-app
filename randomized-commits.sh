#!/bin/bash

start_date="2021-01-01"
end_date="2025-08-20"

touch activity.log

current_date="$start_date"

while [[ "$current_date" < "$end_date" ]]; do
    # Get weekday (1 = Monday, 7 = Sunday)
    weekday=$(date -j -f "%Y-%m-%d" "$current_date" '+%u')
    if [[ $weekday -ge 6 ]]; then
        current_date=$(date -j -f "%Y-%m-%d" -v+1d "$current_date" +"%Y-%m-%d")
        continue
    fi

    # Random 0–3 commits per day
    commits_today=$(( RANDOM % 4 ))

    for ((i=0; i<commits_today; i++)); do
        hour=$(( RANDOM % 24 ))
        minute=$(( RANDOM % 60 ))
        second=$(( RANDOM % 60 ))
        commit_time=$(printf "%02d:%02d:%02d" $hour $minute $second)
        fake_datetime="$current_date $commit_time"

        echo "$fake_datetime – commit $i" >> activity.log
        export GIT_AUTHOR_DATE="$fake_datetime"
        export GIT_COMMITTER_DATE="$fake_datetime"
        git add activity.log
        git commit -m "Random commit on $fake_datetime"
    done

    # Increment current_date by 1 day (macOS format)
    current_date=$(date -j -f "%Y-%m-%d" -v+1d "$current_date" +"%Y-%m-%d")
done
