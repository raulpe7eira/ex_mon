defmodule ExMon.Player do
  @fields [:life, :moves, :name]

  @enforce_keys @fields
  defstruct @fields

  @max_life 100

  def build(name, move_avg, move_heal, move_rnd) do
    %__MODULE__{
      life: @max_life,
      moves: %{
        move_avg: move_avg,
        move_heal: move_heal,
        move_rnd: move_rnd
      },
      name: name
    }
  end
end
