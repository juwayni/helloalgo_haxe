defmodule HelloAlgo.ChapterStackAndQueueTest do
  use ExUnit.Case

  alias HelloAlgo.ChapterStackAndQueue.{Stack, Queue, ArrayStack, ArrayQueue, LinkedListStack, LinkedListQueue, Deque, ArrayDeque, LinkedListDeque}

  test "Stack run" do
    Stack.run()
  end

  test "Queue run" do
    Queue.run()
  end

  test "ArrayStack run" do
    ArrayStack.run()
  end

  test "ArrayQueue run" do
    ArrayQueue.run()
  end

  test "LinkedListStack run" do
    LinkedListStack.run()
  end

  test "LinkedListQueue run" do
    LinkedListQueue.run()
  end

  test "Deque run" do
    Deque.run()
  end

  test "ArrayDeque run" do
    ArrayDeque.run()
  end

  test "LinkedListDeque run" do
    LinkedListDeque.run()
  end
end
