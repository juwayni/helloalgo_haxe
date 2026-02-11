defmodule HelloAlgo.ChapterBacktracking.PreOrderTraversalIIITemplate do
  @moduledoc """
  File: PreOrderTraversalIIITemplate.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.TreeNode
  alias HelloAlgo.Modules.PrintUtil

  @doc """
  Check if the current state (path) is a complete solution
  """
  def is_solution(state) do
    !Enum.empty?(state) and List.last(state).val == 7
  end

  @doc """
  General backtracking template applied to the tree traversal problem
  """
  def backtrack(state, choices, res) do
    # If current state is a solution, record it
    res = if is_solution(state), do: res ++ [state], else: res

    # Explore all possible choices from the current state
    Enum.reduce(choices, res, fn choice, acc_res ->
      # Pruning: check if choice is valid
      if choice != nil and choice.val != 3 do
        # Try: make a choice (add choice to state)
        new_state = state ++ [choice]
        # Recursively call backtrack with new choices (left and right children)
        backtrack(new_state, [choice.left, choice.right], acc_res)
      else
        acc_res
      end
    end)
  end

  def run() do
    root = TreeNode.list_to_tree([1, 7, 3, 4, 5, 6, 7])
    IO.puts("\nInitialized binary tree")
    PrintUtil.print_tree(root)

    # Standard backtracking execution
    res = backtrack([], [root], [])

    IO.puts("\nOutput all paths from root to nodes with value 7, excluding nodes with value 3")
    for p <- res do
      vals = Enum.map(p, & &1.val)
      IO.puts("[#{Enum.join(vals, ", ")}]")
    end
  end
end
