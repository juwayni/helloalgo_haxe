defmodule HelloAlgo.Modules.ListNode do
  @moduledoc """
  File: ListNode.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  defstruct val: 0, next: nil

  @doc """
  Deserialize a list into a linked list
  """
  def list_to_linked_list(arr) when is_list(arr) do
    if is_nil(arr) || Enum.empty?(arr) do
      nil
    else
      # In Elixir, we use recursion to build the linked list
      [head_val | tail_vals] = arr
      %__MODULE__{val: head_val, next: list_to_linked_list(tail_vals)}
    end
  end

  @doc """
  Serialize a linked list into a list
  """
  def linked_list_to_list(head) do
    if is_nil(head) do
      []
    else
      [head.val | linked_list_to_list(head.next)]
    end
  end
end
