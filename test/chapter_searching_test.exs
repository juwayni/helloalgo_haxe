defmodule HelloAlgo.ChapterSearchingTest do
  use ExUnit.Case

  alias HelloAlgo.ChapterSearching.{LinearSearch, BinarySearch, BinarySearchInsertion, BinarySearchEdge, TwoSum, HashingSearch}

  test "LinearSearch run" do
    LinearSearch.run()
  end

  test "BinarySearch run" do
    BinarySearch.run()
  end

  test "BinarySearchInsertion run" do
    BinarySearchInsertion.run()
  end

  test "BinarySearchEdge run" do
    BinarySearchEdge.run()
  end

  test "TwoSum run" do
    TwoSum.run()
  end

  test "HashingSearch run" do
    HashingSearch.run()
  end
end
