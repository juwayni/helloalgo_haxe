defmodule HelloAlgo.ChapterBacktracking.BacktrackingTemplate do
  @moduledoc """
  File: BacktrackingTemplate.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Determine whether the current state is a solution
  """
  def is_solution?(state) do
    _ = state
    false
  end

  @doc """
  Record the current state as a valid solution
  """
  def record_solution(state, res) do
    res ++ [state]
  end

  @doc """
  Determine whether the current state is still valid
  """
  def is_valid?(state) do
    _ = state
    true
  end

  @doc """
  Update current state based on selection
  """
  def make_choice(state, choice) do
    state ++ [choice]
  end

  @doc """
  Backtrack by undoing the choice to restore state
  """
  def undo_choice(state, _choice) do
    # In functional Elixir, we typically return the previous state
    # but here's a conceptual "pop"
    List.delete_at(state, -1)
  end

  @doc """
  Backtracking algorithm template
  """
  def backtrack(state, choices, res) do
    # Check if a solution is reached
    res = if is_solution?(state) do
      record_solution(state, res)
    else
      res
    end

    # Iterate through all available choices
    Enum.reduce(choices, res, fn choice, current_res ->
      # Pruning: check if choice is valid
      if is_valid?(state) do
        # Make choice
        next_state = make_choice(state, choice)
        # Recurse
        updated_res = backtrack(next_state, choices, current_res)
        # Undo choice (happens naturally due to immutability, but conceptually):
        # _ = undo_choice(next_state, choice)
        updated_res
      else
        current_res
      end
    end)
  end

  def run() do
    IO.puts("Backtracking algorithm template")
  end
end
