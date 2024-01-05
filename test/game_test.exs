defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.Game
  alias ExMon.Player

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Raul", :kick, :cure, :punch)
      computer = Player.build("Robotinik", :kick, :cure, :punch)

      assert {:ok, _} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("Raul", :kick, :cure, :punch)
      computer = Player.build("Robotinik", :kick, :cure, :punch)

      Game.start(computer, player)

      expected_response = %{
        status: :started,
        player: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :kick, move_rnd: :punch, move_heal: :cure},
          name: "Raul"
        },
        turn: :player,
        computer: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :kick, move_rnd: :punch, move_heal: :cure},
          name: "Robotinik"
        }
      }

      assert expected_response == Game.info()
    end
  end

  describe "update/1" do
    test "returns the game state updated" do
      player = Player.build("Raul", :kick, :cure, :punch)
      computer = Player.build("Robotinik", :kick, :cure, :punch)

      Game.start(computer, player)

      new_state = %{
        status: :started,
        player: %ExMon.Player{
          life: 85,
          moves: %{move_avg: :kick, move_rnd: :punch, move_heal: :cure},
          name: "Raul"
        },
        turn: :player,
        computer: %ExMon.Player{
          life: 50,
          moves: %{move_avg: :kick, move_rnd: :punch, move_heal: :cure},
          name: "Robotinik"
        }
      }

      Game.update(new_state)

      expected_response = %{new_state | status: :continue, turn: :computer}

      assert expected_response == Game.info()
    end
  end
end
