defmodule HelloAlgo.ChapterArrayAndLinkedlistTest do
  use ExUnit.Case

  alias HelloAlgo.ChapterArrayAndLinkedlist.{Array, LinkedList, ListModule, MyList}

  test "Array run" do
    Array.run()
  end

  test "LinkedList run" do
    LinkedList.run()
  end

  test "List run" do
    ListModule.run()
  end

  test "MyList run" do
    MyList.run()
  end
end
