# ExMon

This code corresponding to the [Section 3 - Elixir e Phoenix do Zero by Rafael Camarda](https://www.udemy.com/course/elixir-e-phoenix-do-zero) lab.

> The project simulates a turn-based game (like Pokémon).

## Compilation, tests and runs

```bash
$ cd ex_mon
$ asdf install
$ mix compile
$ mix test
$ iex -S mix
```

## How to use?

```elixir
# creates a player with three movements
iex> player = ExMon.create_player("Raul", :kick, :cure, :punch)
# starts a game for the player
iex> ExMon.start_game(player)
# makes move for the player
iex> ExMon.make_move(:kick)
```

