defmodule HelloAlgo.ChapterStackAndQueue.Queue do
  @moduledoc """
  File: Queue.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  def run() do
    # Enqueue at rear, Dequeue from front

    # Initialize queue
    que = []

    # Enqueue elements
    que = que ++ [1]
    que = que ++ [3]
    que = que ++ [2]
    que = que ++ [5]
    que = que ++ [4]
    IO.puts("Queue que = #{inspect(que)}")

    # Access the front element
    front = List.first(que)
    IO.puts("Front element front = #{front}")

    # Dequeue an element
    [pop_val | que] = que
    IO.puts("Dequeued element popVal = #{pop_val}")
    IO.puts("After dequeueing, que = #{inspect(que)}")

    # Get length
    size = length(que)
    IO.puts("Queue length size = #{size}")

    # Check if empty
    is_empty = Enum.empty?(que)
    IO.puts("Is queue empty = #{is_empty}")
  end
end
