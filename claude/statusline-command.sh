#!/bin/bash
input=$(cat)

# 5-hour rate limit usage (matches /usage). Optional: subscribers only, after first API response.
five_used=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
week_used=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

parts=()

if [ -n "$five_used" ]; then
    five_str=$(printf "5h: %.0f%% used" "$five_used")
    if [ -n "$five_reset" ]; then
        now=$(date +%s)
        remaining_sec=$((five_reset - now))
        if [ "$remaining_sec" -gt 0 ]; then
            remaining_min=$((remaining_sec / 60))
            # pace = fraction of the 5h window (18000s) that has ELAPSED, as a percent
            elapsed_sec=$((18000 - remaining_sec))
            [ "$elapsed_sec" -lt 0 ] && elapsed_sec=0
            pace=$((elapsed_sec * 100 / 18000))
            five_str=$(printf "%s, %dm left (pace %d%%)" "$five_str" "$remaining_min" "$pace")
        else
            five_str="$five_str, reset now"
        fi
    fi
    parts+=("$five_str")
fi

if [ -n "$week_used" ]; then
    parts+=("$(printf "week: %.0f%% used" "$week_used")")
fi

# Join non-empty parts with " | "
out=""
for p in "${parts[@]}"; do
    [ -n "$out" ] && out="$out | $p" || out="$p"
done
[ -n "$out" ] && echo "$out"
