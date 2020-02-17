defmodule GuardClausesTest do
  use ExUnit.Case
  doctest GuardClauses

  test "greets the world" do
    assert GuardClauses.hello() == :world
  end

  test 'this makes it into the thing' do
    string = "1"
    assert GuardClauses.number(string) == 1
  end
end
