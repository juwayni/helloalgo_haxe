defmodule HelloAlgo.ChapterHashing.BuiltInHash do
  @moduledoc """
  File: BuiltInHash.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.ListNode

  def run() do
    # Haxe doesn't have a universal built-in 'hash' function for all types,
    # but Elixir/Erlang has a built-in phash2 function for all types.

    num = 3
    # For integers, the value itself is often used as a hash
    hash_num = :erlang.phash2(num)
    IO.puts("Hash value of integer #{num} is #{hash_num}")

    bol = true
    # For booleans, we can map true/false to 1/0
    hash_bol = :erlang.phash2(bol)
    IO.puts("Hash value of boolean #{bol} is #{hash_bol}")

    dec = 3.14159
    # For floats, we can use Std.string or other methods
    hash_dec = :erlang.phash2(dec)
    IO.puts("Hash value of float #{dec} is #{hash_dec}")

    str_val = "Hello Algorithm"
    # String objects have their own identity, and we can generate a simple hash
    hash_str = :erlang.phash2(str_val)
    IO.puts("Hash value of string \"#{str_val}\" is #{hash_str}")

    obj = %ListNode{val: 0}
    # In Haxe, object hashing is typically handled internally by Map<Object, T>
    hash_obj = :erlang.phash2(obj)
    IO.puts("Hash value of ListNode object is #{hash_obj}")
  end
end
