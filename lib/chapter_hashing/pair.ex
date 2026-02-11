defmodule HelloAlgo.ChapterHashing.Pair do
  @moduledoc """
  File: Pair.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  defstruct [:key, :val]

  def new(key, val) do
    %__MODULE__{key: key, val: val}
  end

  def run() do
    p = new(1, "test")
    IO.puts("Pair: #{p.key} -> #{p.val}")
  end
end
