defmodule HelloWorld do


  def aggregate(
  %{"uuid" => uuid,
"search.provider.procedure_id.requested" =>
[{%{"value" => procedure_id, "dental_pricing" => dental_pricing}, identity_token}],
"search.provider.sites_found" => [provider_sites]} = state) do
    state
    |> value
  end

  @medial_procedure Range.new(10000,19999)
  @dental_procedure Range.new(20000,30000)

  defp value(state) do
    md = @medial_procedure
    require IEx; IEx.pry

  blah = state["search.provider.procedure_id.requested"]
    |> hd()
    |> Tuple.to_list()
    |> hd()
    |> check_response
  end

  defp check_response(a) do
    cond do
      check_option_a(a) -> option_a(a)
      check_option_b(a) -> option_b(a)
      check_option_c(a) -> option_a(a)
      check_option_d(a) -> option_b(a)
      true -> "boom"
    end
  end

  defp check_option_a(a) do
    a["value"] > 1000 && a["value"] < 2000 && a["dental_pricing"] == true
  end

  def option_a(a) do
    # true
    {a["dental_pricing"], a["value"]}
  end

  defp check_option_b(a) do
    a["value"] > 1000 && a["value"] < 2000 && a["dental_pricing"] == false
  end

  def option_b(a) do
    {a["value"], a["dental_pricing"]}
  end

  defp check_option_c(a) do
    a["value"] > 2000 && a["dental_pricing"] == true
  end

  defp check_option_d(a) do
    a["value"] > 2000 && a["dental_pricing"] == false
  end

  def aggregate(%{"uuid" => uuid } = state) do
    'boom'
  end

  def aggregate(state) do
    state
  end

  def hello do
    :world
  end
end


