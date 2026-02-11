defmodule HelloAlgo.ChapterStackAndQueue.Deque do
  @moduledoc """
  File: Deque.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  def run() do
    # In Haxe, the standard Array can act as a deque using:
    # push() - Add to rear
    # pop() - Remove from rear
    # unshift() - Add to front
    # shift() - Remove from front

    # Initialize deque
    deq = []

    # Enqueue elements
    deq = deq ++ [2] # Add to rear
    deq = deq ++ [5]
    deq = deq ++ [4]
    deq = [3 | deq]  # Add to front
    deq = [1 | deq]
    IO.puts("Deque deque = #{inspect(deq)}")

    # Access elements
    front = List.first(deq) # Front element
    IO.puts("Front element front = #{front}")
    rear = List.last(deq) # Rear element
    IO.puts("Rear element rear = #{rear}")

    # Dequeue elements
    [pop_front | deq] = deq # Dequeue from front
    IO.puts("Popped front element popFront = #{pop_front}")
    IO.puts("After popping front, deque = #{inspect(deq)}")

    pop_rear = List.last(deq) # Dequeue from rear
    deq = List.delete_at(deq, -1)
    IO.puts("Popped rear element popRear = #{pop_rear}")
    IO.puts("After popping rear, deque = #{inspect(deq)}")

    # Get length
    size = length(deq)
    IO.puts("Deque length size = #{size}")

    # Check if empty
    is_empty = Enum.empty?(deq)
    IO.puts("Is deque empty = #{is_empty}")
  end
end
