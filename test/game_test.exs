defmodule GameTest do
  use ExUnit.Case

  alias Hangman.Game

  test "new_game returns structure" do
    game = Game.new_game()

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "new_game letters are lower case" do
    game = Game.new_game()

    assert format_letters(game.letters) == game.letters
  end

  defp format_letters(letters) do
    letters
    |> List.to_string()
    |> String.downcase(:ascii)
    |> String.codepoints()
  end
end
