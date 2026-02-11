defmodule HelloAlgo.ChapterHeapTest do
  use ExUnit.Case

  alias HelloAlgo.ChapterHeap.{HeapModule, MyHeap, TopK}

  test "Heap run" do
    HeapModule.run()
  end

  test "MyHeap run" do
    MyHeap.run()
  end

  test "TopK run" do
    TopK.run()
  end
end
