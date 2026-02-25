#!/bin/bash

readonly today=$(date '+%m-%d')
readonly bash_birthday="06-08"

days_until() {
    local year=$(date '+%Y')
    local today_full=$(date -d "$year-$today" +%s)
    local future=$(date -d "$year-$bash_birthday" +%s)
    (( today_full > future )) && future=$(date -d "$((year + 1))-$bash_birthday" +%s)
    local seconds_per_day=86400
    echo $(( (future - today_full) / seconds_per_day ))
}

info() {
    echo "Bash was born on June 8, 1989."
    echo "Let's continue enjoying Bash!"
}

if [[ "$today" == "$bash_birthday" ]]; then
    echo "🎂 Happy Birthday, Bash!"
    info
else
    echo "📅 Today is $today."
    info
    echo "Bash's birthday is in $(days_until) days!"
fi