defmodule HelloAlgo.ChapterStackAndQueue.Stack do
  @moduledoc """
  File: Stack.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  def run() do
    # Elixir's standard List can serve as a stack using:
    # [head | tail] - pattern matching for pop
    # [new_val | stack] - for push

    # Initialize stack
    stack = []

    # Push some values
    stack = [1 | stack]
    stack = [3 | stack]
    stack = [2 | stack]
    stack = [5 | stack]
    stack = [4 | stack]
    # Reversing for display to match Haxe's array-based display [bottom, ..., top]
    IO.puts("Stack stack = #{inspect(Enum.reverse(stack))}")

    # Peek at the top value
    peek = List.first(stack)
    IO.puts("Top element peek = #{peek}")

    # Pop a value from the top
    [pop_val | stack] = stack
    IO.puts("Popped element popVal = #{pop_val}")
    IO.puts("After popping, stack = #{inspect(Enum.reverse(stack))}")

    # Check size and emptiness
    size = length(stack)
    IO.puts("Stack length size = #{size}")

    is_empty = Enum.empty?(stack)
    IO.puts("Is stack empty = #{is_empty}")
  end
end
