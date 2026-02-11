defmodule HelloAlgo.Modules.Vertex do
  @moduledoc """
  File: Vertex.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  defstruct val: 0

  @doc """
  Input value list vals, return vertex list vets
  """
  def vals_to_vets(vals) do
    Enum.map(vals, fn val -> %__MODULE__{val: val} end)
  end

  @doc """
  Input vertex list vets, return value list vals
  """
  def vets_to_vals(vets) do
    Enum.map(vets, fn vet -> vet.val end)
  end
end
