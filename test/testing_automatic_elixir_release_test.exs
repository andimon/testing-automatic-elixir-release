defmodule TestingAutomaticElixirReleaseTwoTest do
  use ExUnit.Case
  doctest TestingAutomaticElixirReleaseTwo

  test "greets the world" do
    assert TestingAutomaticElixirReleaseTwo.hello() == :world
  end
end
