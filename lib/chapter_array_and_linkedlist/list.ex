defmodule HelloAlgo.ChapterArrayAndLinkedlist.ListModule do
  @moduledoc """
  File: List.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  def run() do
    # Initialize list
    nums = [1, 3, 2, 5, 4]
    IO.puts("\nList nums = [#{Enum.join(nums, ", ")}]")

    # Access element
    x = Enum.at(nums, 1)
    IO.puts("\nAccess element at index 1, get x = #{x}")

    # Update element
    nums = List.replace_at(nums, 1, 0)
    IO.puts("\nUpdate element at index 1 to 0, get nums = [#{Enum.join(nums, ", ")}]")

    # Clear list
    nums = []
    IO.puts("\nAfter clearing list nums = [#{Enum.join(nums, ", ")}]")

    # Append elements at the end
    nums = nums ++ [1]
    nums = nums ++ [3]
    nums = nums ++ [2]
    nums = nums ++ [5]
    nums = nums ++ [4]
    IO.puts("\nAfter adding elements nums = [#{Enum.join(nums, ", ")}]")

    # Insert element in the middle
    nums = List.insert_at(nums, 3, 6)
    IO.puts("\nInsert number 6 at index 3, get nums = [#{Enum.join(nums, ", ")}]")

    # Delete element
    nums = List.delete_at(nums, 3)
    IO.puts("\nDelete element at index 3, get nums = [#{Enum.join(nums, ", ")}]")

    # Traverse list by index
    _count_idx = Enum.reduce(0..(length(nums)-1), 0, fn i, acc -> acc + Enum.at(nums, i) end)
    # Directly traverse list elements
    _count_val = Enum.reduce(nums, 0, fn num, acc -> acc + num end)

    # Concatenate two lists
    nums1 = [6, 8, 7, 10, 9]
    nums = nums ++ nums1
    IO.puts("\nAfter concatenating nums1 to nums, get nums = [#{Enum.join(nums, ", ")}]")

    # Sort list in ascending order
    nums = Enum.sort(nums)
    IO.puts("\nAfter sorting list nums = [#{Enum.join(nums, ", ")}]")
  end
end
