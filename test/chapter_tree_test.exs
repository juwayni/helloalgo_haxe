defmodule HelloAlgo.ChapterTreeTest do
  use ExUnit.Case

  alias HelloAlgo.ChapterTree.{BinaryTree, BinaryTreeBfs, BinaryTreeDfs, BinarySearchTree, AVLTree, ArrayBinaryTree}

  test "BinaryTree run" do
    BinaryTree.run()
  end

  test "BinaryTreeBfs run" do
    BinaryTreeBfs.run()
  end

  test "BinaryTreeDfs run" do
    BinaryTreeDfs.run()
  end

  test "BinarySearchTree run" do
    BinarySearchTree.run()
  end

  test "AVLTree run" do
    AVLTree.run()
  end

  test "ArrayBinaryTree run" do
    ArrayBinaryTree.run()
  end
end
