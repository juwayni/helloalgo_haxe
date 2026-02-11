defmodule HelloAlgo.ChapterHashingTest do
  use ExUnit.Case

  alias HelloAlgo.ChapterHashing.{Pair, SimpleHash, ArrayHashMap, HashMapModule, HashMapChaining, HashMapOpenAddressing, BuiltInHash}

  test "Pair run" do
    Pair.run()
  end

  test "SimpleHash run" do
    SimpleHash.run()
  end

  test "ArrayHashMap run" do
    ArrayHashMap.run()
  end

  test "HashMapModule run" do
    HashMapModule.run()
  end

  test "HashMapChaining run" do
    HashMapChaining.run()
  end

  test "HashMapOpenAddressing run" do
    HashMapOpenAddressing.run()
  end

  test "BuiltInHash run" do
    BuiltInHash.run()
  end
end
