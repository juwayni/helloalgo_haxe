defmodule HelloAlgo.ChapterArrayAndLinkedlist.Array do
  @moduledoc """
  File: Array.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Randomly access an element from the array
  """
  def random_access(nums) do
    # Randomly pick a number in the range [0, nums.length - 1]
    random_index = :rand.uniform(Enum.count(nums)) - 1
    # Get and return the random element
    Enum.at(nums, random_index)
  end

  @doc """
  Extend array length by creating a new larger array and copying elements
  """
  def extend(nums, enlarge) do
    # In Elixir, we append zeros to the list
    # Return the extended new array
    nums ++ List.duplicate(0, enlarge)
  end

  @doc """
  Insert element num at index of the array
  """
  def insert(nums, num, index) do
    # Move all elements at and after index one position backward
    # (Achieved by List.insert_at and then deleting the last overflow element if fixed size was intended,
    # but here we follow the Haxe logic of shifting)
    List.insert_at(nums, index, num) |> List.delete_at(-1)
  end

  @doc """
  Delete the element at index by shifting subsequent elements forward
  """
  def remove(nums, index) do
    # Move all elements after index one position forward
    List.delete_at(nums, index) ++ [0]
  end

  @doc """
  Traverse array using various methods
  """
  def traverse(nums) do
    # Traverse array by index
    Enum.each(0..(length(nums) - 1), fn i -> _num = Enum.at(nums, i) end)
    # Directly traverse array elements
    Enum.each(nums, fn _num -> :ok end)
  end

  @doc """
  Search for specified element in array and return its index
  """
  def find(nums, target) do
    Enum.find_index(nums, fn x -> x == target end) || -1
  end

  def run() do
    # Initialize array
    arr = for _ <- 0..4, do: 0
    IO.puts("Array arr = #{inspect(arr)}")

    nums = [1, 3, 2, 5, 4]
    IO.puts("Array nums = #{inspect(nums)}")

    # Random access
    random_num = random_access(nums)
    IO.puts("Get random element in nums: #{random_num}")

    # Length extension
    nums = extend(nums, 3)
    IO.puts("Extend array length to 8, get nums = #{inspect(nums)}")

    # Insert element
    nums = insert(nums, 6, 3)
    IO.puts("Insert number 6 at index 3, get nums = #{inspect(nums)}")

    # Delete element
    nums = remove(nums, 2)
    IO.puts("Delete element at index 2, get nums = #{inspect(nums)}")

    # Traverse array
    traverse(nums)

    # Search element
    index = find(nums, 3)
    IO.puts("Search for element 3 in nums, get index = #{index}")
  end
end
