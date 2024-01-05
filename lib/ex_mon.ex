defmodule ExMon do
  alias ExMon.Game
  alias ExMon.Game.Actions
  alias ExMon.Game.Status
  alias ExMon.Player

  @computer_name "Robotinik"
  @computer_moves [:move_avg, :move_rnd, :move_heal]

  def create_player(name, move_avg, move_heal, move_rnd) do
    Player.build(name, move_avg, move_heal, move_rnd)
  end

  def start_game(player) do
    @computer_name
    |> create_player(:punch, :kick, :heat)
    |> Game.start(player)

    Status.print_round_message(Game.info())
  end

  def make_move(move), do: handle_move(Game.info(), move)

  defp handle_move(%{status: :game_over} = info, _), do: Status.print_round_message(info)

  defp handle_move(_, move) do
    move
    |> Actions.fetch_move()
    |> do_move()

    computer_move(Game.info())
  end

  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)

  defp do_move({:ok, move}) do
    case move do
      :move_heal -> Actions.heal()
      move -> Actions.attack(move)
    end

    Status.print_round_message(Game.info())
  end

  defp computer_move(%{turn: :computer, status: :continue}) do
    move = {:ok, Enum.random(@computer_moves)}
    do_move(move)
  end

  defp computer_move(_), do: :ok
end
