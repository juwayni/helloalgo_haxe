defmodule HelloAlgo.ChapterHashing.HashMapModule do
  @moduledoc """
  File: HashMap.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.PrintUtil

  def run() do
    # Initialize Elixir built-in Map
    hmap = %{}

    # Add operations
    hmap = Map.put(hmap, 12836, "Xiao Ha")
    hmap = Map.put(hmap, 15937, "Xiao Luo")
    hmap = Map.put(hmap, 16750, "Xiao Suan")
    hmap = Map.put(hmap, 13276, "Xiao Fa")
    hmap = Map.put(hmap, 10583, "Xiao Ya")
    IO.puts("\nAfter adding, hash map is\nKey -> Value")
    PrintUtil.print_dict(hmap)

    # Query operation
    name = Map.get(hmap, 15937)
    IO.puts("\nInput ID 15937, queried name: #{name}")

    # Delete operation
    hmap = Map.delete(hmap, 10583)
    IO.puts("\nAfter deleting 10583, hash map is\nKey -> Value")
    PrintUtil.print_dict(hmap)

    # Traverse hash map using keys and values
    IO.puts("\nTraverse Key->Value pairs")
    Enum.each(hmap, fn {key, val} ->
      IO.puts("#{key} -> #{val}")
    end)

    IO.puts("\nTraverse keys only")
    Enum.each(Map.keys(hmap), fn key ->
      IO.puts(key)
    end)

    IO.puts("\nTraverse values only")
    Enum.each(Map.values(hmap), fn val ->
      IO.puts(val)
    end)
  end
end
