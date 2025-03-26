cat games.json |
    jq 'map({
        id,
        player_white: .players.white.user.id,
        player_black: .players.black.user.id,
        moves: (.moves | split(" ")),
        clocks,
        evals: (.analysis | map(.eval))
    }) | map(.id as $game_id |
            .player_white as $player_white |
            .player_black as $player_black |
            [.moves, .clocks, .evals] |
            transpose |
            map({game_id: $game_id,
                player_white: $player_white,
                player_black: $player_black,
                move: .[0], 
                clock: .[1],
                eval: .[2]}))' \
    > test.json