defmodule Hangman do
  alias Hangman.Game
  defdelegate new_game(), to: Game
  defdelegate tally(game), to: Game
  # defdelegate make_move(game, guess), to: Game

  def make_move(game, guess) do
    do_make_move(game, guess, guess =~ ~r/^[a-z]$/)
  end

  def do_make_move(_game, _guess, false) do
    raise "ERROR: Guess must be a single, lowercase ASCII character."
  end

  def do_make_move(game, guess, true) do
    game = Game.make_move(game, guess)
    {game, tally(game)}
  end
end
