defmodule HelloAlgo.ChapterSortingTest do
  use ExUnit.Case

  alias HelloAlgo.ChapterSorting.{SelectionSort, BubbleSort, InsertionSort, MergeSort, QuickSort, HeapSort, BucketSort, CountingSort, RadixSort}

  test "SelectionSort run" do
    SelectionSort.run()
  end

  test "BubbleSort run" do
    BubbleSort.run()
  end

  test "InsertionSort run" do
    InsertionSort.run()
  end

  test "MergeSort run" do
    MergeSort.run()
  end

  test "QuickSort run" do
    QuickSort.run()
  end

  test "HeapSort run" do
    HeapSort.run()
  end

  test "BucketSort run" do
    BucketSort.run()
  end

  test "CountingSort run" do
    CountingSort.run()
  end

  test "RadixSort run" do
    RadixSort.run()
  end
end
