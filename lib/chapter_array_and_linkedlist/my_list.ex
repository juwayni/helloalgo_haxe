defmodule HelloAlgo.ChapterArrayAndLinkedlist.MyList do
  @moduledoc """
  File: MyList.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  defstruct [:capacity, :arr, :size, :extend_ratio]

  def new() do
    %__MODULE__{
      capacity: 10,
      # array (stores list elements)
      arr: for(_ <- 0..9, do: 0),
      # list length (current number of elements)
      size: 0,
      # multiple for each expansion
      extend_ratio: 2
    }
  end

  @doc """
  Get list length (current number of elements)
  """
  def size(my_list), do: my_list.size

  @doc """
  Get list capacity
  """
  def capacity(my_list), do: my_list.capacity

  @doc """
  Access element at given index
  """
  def get(my_list, index) do
    if index < 0 or index >= my_list.size do
      raise "Index out of bounds"
    end

    Enum.at(my_list.arr, index)
  end

  @doc """
  Update element at given index
  """
  def set(my_list, num, index) do
    if index < 0 or index >= my_list.size do
      raise "Index out of bounds"
    end

    %{my_list | arr: List.replace_at(my_list.arr, index, num)}
  end

  @doc """
  Extend list capacity when full
  """
  def extend_capacity(my_list) do
    new_capacity = my_list.capacity * my_list.extend_ratio
    # Copy all elements and fill the rest with zeros
    new_arr = my_list.arr ++ for(_ <- 0..(new_capacity - my_list.capacity - 1), do: 0)
    %{my_list | arr: new_arr, capacity: new_capacity}
  end

  @doc """
  Add element at the end of the list
  """
  def add(my_list, num) do
    # Extend capacity if full
    my_list =
      if my_list.size == my_list.capacity do
        extend_capacity(my_list)
      else
        my_list
      end

    new_arr = List.replace_at(my_list.arr, my_list.size, num)
    %{my_list | arr: new_arr, size: my_list.size + 1}
  end

  @doc """
  Insert element at given index, shifting subsequent elements backward
  """
  def insert(my_list, num, index) do
    if index < 0 or index >= my_list.size do
      raise "Index out of bounds"
    end
    # Extend capacity if full
    my_list =
      if my_list.size == my_list.capacity do
        extend_capacity(my_list)
      else
        my_list
      end

    # Move all elements at and after index one position backward
    new_arr =
      my_list.arr
      |> List.delete_at(-1)
      |> List.insert_at(index, num)

    %{my_list | arr: new_arr, size: my_list.size + 1}
  end

  @doc """
  Delete element at given index, shifting subsequent elements forward
  """
  def remove(my_list, index) do
    if index < 0 or index >= my_list.size do
      raise "Index out of bounds"
    end

    num = Enum.at(my_list.arr, index)
    # Move all elements after index one position forward
    new_arr = List.delete_at(my_list.arr, index) ++ [0]
    {num, %{my_list | arr: new_arr, size: my_list.size - 1}}
  end

  @doc """
  Return a list of effective length containing the list's elements
  """
  def to_array(my_list) do
    Enum.take(my_list.arr, my_list.size)
  end

  def run() do
    # Initialize list
    nums = new()
    # Add elements at the end
    nums = add(nums, 1)
    nums = add(nums, 3)
    nums = add(nums, 2)
    nums = add(nums, 5)
    nums = add(nums, 4)

    IO.puts(
      "List nums = #{inspect(to_array(nums))}, capacity = #{capacity(nums)}, size = #{size(nums)}"
    )

    # Insert element in the middle
    nums = insert(nums, 6, 3)
    IO.puts("Insert number 6 at index 3, get nums = #{inspect(to_array(nums))}")

    # Delete element
    {_num, nums} = remove(nums, 3)
    IO.puts("Delete element at index 3, get nums = #{inspect(to_array(nums))}")

    # Access element
    num = get(nums, 1)
    IO.puts("Access element at index 1, get num = #{num}")

    # Update element
    nums = set(nums, 1, 1)
    IO.puts("Update element at index 1 to 1, get nums = #{inspect(to_array(nums))}")

    # Test extension mechanism
    nums =
      Enum.reduce(0..9, nums, fn i, acc ->
        # When i = 5, the list length will exceed the capacity, triggering expansion
        add(acc, i)
      end)

    IO.puts(
      "After expansion, list nums = #{inspect(to_array(nums))}, capacity = #{capacity(nums)}, size = #{size(nums)}"
    )
  end
end
