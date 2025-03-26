cat games.json |
    jq 'map({
        id,
        moves: (.moves | split(" ")),
        clocks,
        evals: (.analysis | map(.eval))
    }) | map([.moves, .clocks, .evals] | transpose | map({move: .[0], clock: .[1], eval: .[2]}))' \
    > test.json