defmodule HelloAlgo.ChapterHashing.ArrayHashMap do
  @moduledoc """
  File: ArrayHashMap.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.ChapterHashing.Pair

  defstruct [:buckets]

  @doc """
  Constructor for fixed-size array-based hash map
  """
  def new() do
    # Initialize with 100 null slots
    %__MODULE__{buckets: for(_ <- 0..99, do: nil)}
  end

  @doc """
  Hash function to map key to an array index
  """
  defp hash_func(key) do
    # Ensure index is positive using rem logic
    Integer.mod(key, 100)
  end

  @doc """
  Query the value associated with the given key
  """
  def get(hmap, key) do
    index = hash_func(key)
    pair = Enum.at(hmap.buckets, index)
    if is_nil(pair), do: "", else: pair.val
  end

  @doc """
  Add or update a key-value pair in the hash map
  """
  def put(hmap, key, val) do
    pair = Pair.new(key, val)
    index = hash_func(key)
    %{hmap | buckets: List.replace_at(hmap.buckets, index, pair)}
  end

  @doc """
  Delete a key-value pair from the hash map
  """
  def remove(hmap, key) do
    index = hash_func(key)
    %{hmap | buckets: List.replace_at(hmap.buckets, index, nil)}
  end

  @doc """
  Return all key-value pairs present in the map
  """
  def entry_set(hmap) do
    hmap.buckets |> Enum.reject(&is_nil/1)
  end

  @doc """
  Return all keys present in the map
  """
  def key_set(hmap) do
    hmap.buckets |> Enum.reject(&is_nil/1) |> Enum.map(& &1.key)
  end

  @doc """
  Return all values present in the map
  """
  def value_set(hmap) do
    hmap.buckets |> Enum.reject(&is_nil/1) |> Enum.map(& &1.val)
  end

  @doc """
  Print all non-empty buckets
  """
  def print(hmap) do
    hmap.buckets
    |> Enum.each(fn
      nil -> :ok
      pair -> IO.puts("#{pair.key} -> #{pair.val}")
    end)
  end

  def run() do
    # Initialize hash map
    hmap = new()

    # Add various names mapped to IDs
    hmap = put(hmap, 12836, "Xiao Ha")
    hmap = put(hmap, 15937, "Xiao Luo")
    hmap = put(hmap, 16750, "Xiao Suan")
    hmap = put(hmap, 13276, "Xiao Fa")
    hmap = put(hmap, 10583, "Xiao Ya")
    IO.puts("\nAfter adding, hash map is\nKey -> Value")
    print(hmap)

    # Retrieve a value
    name = get(hmap, 15937)
    IO.puts("\nInput ID 15937, queried name: #{name}")

    # Remove a value
    hmap = remove(hmap, 10583)
    IO.puts("\nAfter deleting 10583, hash map is\nKey -> Value")
    print(hmap)

    # Demonstration of traversal methods
    IO.puts("\nTraverse Key->Value pairs")
    for pair <- entry_set(hmap) do
      IO.puts("#{pair.key} -> #{pair.val}")
    end

    IO.puts("\nTraverse keys only")
    for key <- key_set(hmap) do
      IO.puts(key)
    end

    IO.puts("\nTraverse values only")
    for val <- value_set(hmap) do
      IO.puts(val)
    end
  end
end
