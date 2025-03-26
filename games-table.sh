cat games.json |
    jq 'map({
        id,
        moves: (.moves | split(" ")),
        clocks,
        evals: (.analysis | map(.eval))
    })' \
    > test.json