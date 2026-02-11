defmodule HelloAlgo.ChapterTree.BinaryTree do
  @moduledoc """
  File: BinaryTree.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.TreeNode
  alias HelloAlgo.Modules.PrintUtil

  def run() do
    # Initialize binary tree manually by creating nodes and setting references
    n4 = %TreeNode{val: 4}
    n5 = %TreeNode{val: 5}
    n2 = %TreeNode{val: 2, left: n4, right: n5}
    n3 = %TreeNode{val: 3}
    n1 = %TreeNode{val: 1, left: n2, right: n3}

    IO.puts("\nInitialized binary tree\n")
    PrintUtil.print_tree(n1)

    # Insertion demonstration
    p = %TreeNode{val: 0}
    # Insert node P between n1 and n2 by making n2 a child of P
    # Since it's immutable, we rebuild n1
    p = %{p | left: n2}
    n1_inserted = %{n1 | left: p}
    IO.puts("\nAfter inserting node P\n")
    PrintUtil.print_tree(n1_inserted)

    # Deletion demonstration
    # Delete node P by pointing n1's left directly back to n2
    n1_deleted = %{n1_inserted | left: n2}
    IO.puts("\nAfter deleting node P\n")
    PrintUtil.print_tree(n1_deleted)
  end
end
