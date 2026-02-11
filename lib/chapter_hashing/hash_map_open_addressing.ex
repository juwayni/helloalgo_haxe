defmodule HelloAlgo.ChapterHashing.HashMapOpenAddressing do
  @moduledoc """
  File: HashMapOpenAddressing.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.ChapterHashing.Pair

  defstruct [:size_val, :capacity_val, :load_thres, :extend_ratio, :buckets, :tombstone]

  @doc """
  Constructor for hash map using open addressing (linear probing)
  """
  def new() do
    capacity = 4
    tombstone = Pair.new(-1, "-1")
    %__MODULE__{
      size_val: 0,
      capacity_val: capacity,
      load_thres: 2.0 / 3.0,
      extend_ratio: 2,
      buckets: for(_ <- 1..capacity, do: nil),
      tombstone: tombstone
    }
  end

  @doc """
  Hash function to map key to an array index
  """
  defp hash_func(hmap, key) do
    rem(key, hmap.capacity_val)
  end

  @doc """
  Calculate current load factor
  """
  defp load_factor(hmap) do
    hmap.size_val / hmap.capacity_val
  end

  @doc """
  Search for the bucket index corresponding to the key using linear probing
  """
  defp find_bucket(hmap, key) do
    index = hash_func(hmap, key)
    do_find_bucket(hmap, key, index, -1, 0)
  end

  defp do_find_bucket(hmap, key, index, first_tombstone, count) do
    # Search linearly until an empty slot is found
    if count >= hmap.capacity_val do
      # Full circle, return where to insert if needed
      if first_tombstone != -1, do: first_tombstone, else: index
    else
      pair = Enum.at(hmap.buckets, index)
      cond do
        is_nil(pair) ->
          # Key not found, return index for insertion
          if first_tombstone != -1, do: first_tombstone, else: index

        pair.key == key ->
          # If the key matches, return the index
          # Note: Optimization for tombstone relocation is omitted for functional simplicity
          index

        pair == hmap.tombstone ->
          # Keep track of the first tombstone encountered for potential insertion
          new_first_tombstone = if first_tombstone == -1, do: index, else: first_tombstone
          do_find_bucket(hmap, key, rem(index + 1, hmap.capacity_val), new_first_tombstone, count + 1)

        true ->
          # Move to the next index
          do_find_bucket(hmap, key, rem(index + 1, hmap.capacity_val), first_tombstone, count + 1)
      end
    end
  end

  @doc """
  Query the value associated with the given key
  """
  def get(hmap, key) do
    index = find_bucket(hmap, key)
    pair = Enum.at(hmap.buckets, index)
    if !is_nil(pair) && pair != hmap.tombstone && pair.key == key do
      pair.val
    else
      ""
    end
  end

  @doc """
  Add or update a key-value pair
  """
  def put(hmap, key, val) do
    # Extend if load factor exceeds threshold
    hmap = if load_factor(hmap) > hmap.load_thres, do: extend(hmap), else: hmap
    index = find_bucket(hmap, key)
    pair = Enum.at(hmap.buckets, index)

    if !is_nil(pair) && pair != hmap.tombstone && pair.key == key do
      # If key already exists, update its value
      new_pair = %{pair | val: val}
      %{hmap | buckets: List.replace_at(hmap.buckets, index, new_pair)}
    else
      # Otherwise, insert a new pair
      new_pair = Pair.new(key, val)
      %{hmap | buckets: List.replace_at(hmap.buckets, index, new_pair), size_val: hmap.size_val + 1}
    end
  end

  @doc """
  Delete a key-value pair by marking its slot with a tombstone
  """
  def remove(hmap, key) do
    index = find_bucket(hmap, key)
    pair = Enum.at(hmap.buckets, index)
    if !is_nil(pair) && pair != hmap.tombstone && pair.key == key do
      %{hmap | buckets: List.replace_at(hmap.buckets, index, hmap.tombstone), size_val: hmap.size_val - 1}
    else
      hmap
    end
  end

  @doc """
  Extend the hash map capacity and rehash all active entries
  """
  defp extend(hmap) do
    old_buckets = hmap.buckets
    new_capacity = hmap.capacity_val * hmap.extend_ratio
    tombstone = hmap.tombstone

    # Initialize new hash map with larger capacity
    new_hmap = %{hmap |
      capacity_val: new_capacity,
      buckets: for(_ <- 1..new_capacity, do: nil),
      size_val: 0
    }

    Enum.reduce(old_buckets, new_hmap, fn pair, acc_hmap ->
      if !is_nil(pair) && pair != tombstone do
        put(acc_hmap, pair.key, pair.val)
      else
        acc_hmap
      end
    end)
  end

  @doc """
  Print current state of all buckets
  """
  def print(hmap) do
    Enum.each(hmap.buckets, fn
      nil -> IO.puts("None")
      pair when pair == hmap.tombstone -> IO.puts("TOMBSTONE")
      pair -> IO.puts("#{pair.key} -> #{pair.val}")
    end)
  end

  def run() do
    # Initialize hash map
    hashmap = new()

    # Add various ID-to-name mappings
    hashmap = put(hashmap, 12836, "Xiao Ha")
    hashmap = put(hashmap, 15937, "Xiao Luo")
    hashmap = put(hashmap, 16750, "Xiao Suan")
    hashmap = put(hashmap, 13276, "Xiao Fa")
    hashmap = put(hashmap, 10583, "Xiao Ya")
    IO.puts("\nAfter adding, hash map is\nKey -> Value")
    print(hashmap)

    # Lookup an entry
    name = get(hashmap, 13276)
    IO.puts("\nInput ID 13276, queried name: #{name}")

    # Remove an entry
    hashmap = remove(hashmap, 16750)
    IO.puts("\nAfter deleting 16750, hash map is\nKey -> Value")
    print(hashmap)
  end
end
