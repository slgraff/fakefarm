defmodule GuardClauses do
  @moduledoc """
  Documentation for GuardClauses.
  """

  @doc """
  Hello world.

  ## Examples

      iex> GuardClauses.hello()
      :world

  """
  def hello do
    :world
  end

  def publish_pricing(procedure_id, price_bool) do
    String.to_integer(procedure_id) < 20000 && price_bool == true
  end

  # def check_type(string) do
  #   string == "1"
  # end

  # def number(string) when check_type(string) do
  #   String.to_integer(string)
  # end
end
