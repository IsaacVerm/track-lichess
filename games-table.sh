cat games.json |
    jq 'map({
        id,
        moves: (.moves | split(" ")),
        clocks,
        evals: (.analysis | map(.eval))
    }) | map(.id as $game_id | [.moves, .clocks, .evals] | transpose | map({game_id: $game_id, move: .[0], clock: .[1], eval: .[2]}))' \
    > test.json