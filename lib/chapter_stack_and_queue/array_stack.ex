defmodule HelloAlgo.ChapterStackAndQueue.ArrayStack do
  @moduledoc """
  File: ArrayStack.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  defstruct [:stack]

  @doc """
  Constructor to initialize an array-based stack
  """
  def new() do
    %__MODULE__{stack: []}
  end

  @doc """
  Get the number of elements in the stack
  """
  def size(s), do: length(s.stack)

  @doc """
  Check if the stack is empty
  """
  def is_empty?(s), do: size(s) == 0

  @doc """
  Add an element to the top of the stack
  """
  def push(s, item) do
    %{s | stack: s.stack ++ [item]}
  end

  @doc """
  Remove and return the top element from the stack
  """
  def pop(s) do
    if is_empty?(s), do: raise "Stack is empty"
    # Remove from top (end of list in our array representation)
    {List.last(s.stack), %{s | stack: List.delete_at(s.stack, -1)}}
  end

  @doc """
  Access the top element without removing it
  """
  def peek(s) do
    if is_empty?(s), do: raise "Stack is empty"
    List.last(s.stack)
  end

  @doc """
  Return all stack elements as a list for display
  """
  def to_list(s), do: s.stack

  def run() do
    # Initialize stack
    stack = new()
    # Push some values
    stack = push(stack, 1)
    stack = push(stack, 3)
    stack = push(stack, 2)
    stack = push(stack, 5)
    stack = push(stack, 4)
    IO.puts("Stack stack = [#{Enum.join(to_list(stack), ", ")}]")

    # Peek top value
    peek_val = peek(stack)
    IO.puts("Top element peek = #{peek_val}")

    # Pop top value
    {pop_val, stack} = pop(stack)
    IO.puts("Popped element popVal = #{pop_val}")
    IO.puts("After popping, stack = [#{Enum.join(to_list(stack), ", ")}]")

    # Check size and emptiness
    IO.puts("Stack length size = #{size(stack)}")
    IO.puts("Is stack empty = #{is_empty?(stack)}")
  end
end
