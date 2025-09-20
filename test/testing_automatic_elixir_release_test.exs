defmodule TestingAutomaticElixirReleaseTest do
  use ExUnit.Case
  doctest TestingAutomaticElixirRelease

  test "greets the world" do
    assert TestingAutomaticElixirRelease.hello() == :world
  end
end
