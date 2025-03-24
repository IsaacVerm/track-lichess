# 1742830512000 is hardcoded and refers to Mon Mar 24 2025 15:35:12 GMT+0000
# that's the first time I started using my new approach of paying attention to the clock
# if this has to be updated you can use the code below to get the current timestamp in milliseconds and subtract x hours
# SINCE=$(($(date +%s) * 1000 - 4 * 60 * 60 * 1000))
# echo $SINCE

curl -X GET \
  -H "Accept: application/x-ndjson" \
  --get \
  --data "since=1742830512000" \
  --data "rated=true" \
  https://lichess.org/api/games/user/indexinator \
  > games.jsonl