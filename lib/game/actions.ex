defmodule ExMon.Game.Actions do
  alias ExMon.Game
  alias ExMon.Game.Actions.Attack
  alias ExMon.Game.Actions.Heal

  def attack(move) do
    case Game.turn() do
      :player -> Attack.attack_opponent(:computer, move)
      :computer -> Attack.attack_opponent(:player, move)
    end
  end

  def heal() do
    case Game.turn() do
      :player -> Heal.heal_life(:computer)
      :computer -> Heal.heal_life(:player)
    end
  end

  def fetch_move(move) do
    Game.player()
    |> Map.get(:moves)
    |> Enum.find_value({:error, move}, fn {key, value} ->
      if value == move, do: {:ok, key}
    end)
  end
end
