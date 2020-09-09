defmodule HelloWorldTest do
  use ExUnit.Case
  doctest HelloWorld

  @state %{}

  test "greets the world" do
    assert HelloWorld.hello() == :world
  end

test "medical procedure=true & pricing=true == publish to queue" do
  state = {}
  assert state == {}
end

test "medical procedure=true & pricing=false == don't publish" do
end

test "dental procedure=true & dental_pricing=true == publish" do
end

test "dental procedure=true & dental_pricing=false == don't publish" do
end


#   test "aggregate" do
#     state = %{}
#     assert HelloWorld.aggregate(state) == @state
#     assert is_map(state) == true
#   end

#   test "aggregate 2" do
#     state = %{"uuid" => '1203'}
#     assert HelloWorld.aggregate(state) == 'boom'
#   end

#   test 'aggregate 3' do
#     state = %{"uuid" => '1232',
# "search.provider.procedure_id.requested" =>
# [{%{"value" => "1231", "dental_pricing" => true}, '13032094204'}],
# "search.provider.sites_found" => ['1']}
#     assert HelloWorld.aggregate(state) == "1231"
#   end

  @mid_value 1001
  @pricing true

  test "value > 1000 & < 2000 & pricing=true == publish to TUPLE" do
    state =  %{"uuid" => 'uuid', "search.provider.procedure_id.requested" => [{%{"value" => @mid_value, "dental_pricing" => @pricing}, 'identity_token'}], "search.provider.sites_found" => ['1']}
    assert HelloWorld.aggregate(state) == {true, 1001}
  end

  @pricing false
  test "value > 1000 & < 2000 & pricing=false == publish to STRING" do
    state =  %{"uuid" => 'uuid', "search.provider.procedure_id.requested" => [{%{"value" => @mid_value, "dental_pricing" => @pricing}, 'identity_token'}], "search.provider.sites_found" => ['1']}
    assert HelloWorld.aggregate(state) == {1001, false}
  end

  @mid_value 2001
  @pricing true
  test "value > 2000 & dental_pricing=true == publish to TUPLE" do
      state =  %{"uuid" => 'uuid', "search.provider.procedure_id.requested" => [{%{"value" => @mid_value, "dental_pricing" => @pricing}, 'identity_token'}], "search.provider.sites_found" => ['1']}
    assert HelloWorld.aggregate(state) == {true, 2001}
  end

  @pricing false
  test "value > 2000 & dental_pricing=false == publish to STRING" do
    state =  %{"uuid" => 'uuid', "search.provider.procedure_id.requested" => [{%{"value" => @mid_value, "dental_pricing" => @pricing}, 'identity_token'}], "search.provider.sites_found" => ['1']}
    assert HelloWorld.aggregate(state) == {2001, false}
  end

end
