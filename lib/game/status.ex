defmodule ExMon.Game.Status do
  def print_round_message(%{status: :started} = info) do
    IO.puts("====== The game is started ======")
    IO.inspect(info)
    IO.puts("---------------------------------")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("====== It's #{player} turn ======")
    IO.inspect(info)
    IO.puts("---------------------------------")
  end

  def print_round_message(%{status: :game_over, turn: player} = info) do
    IO.puts("====== Game over, the #{player} win \\o/ ======")
    IO.inspect(info)
    IO.puts("---------------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("====== Invalid move: #{move} ======")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("====== The Player attacked the computer dealing #{damage} damage ======")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("====== The Computer attacked the player dealing #{damage} damage ======")
  end

  def print_move_message(player, :heal, life) do
    IO.puts("====== The #{player} healled itself to #{life} life points ======")
  end
end
