defmodule Servy.BearController do
  alias Servy.Wildthings
  alias Servy.Bear # Reviewing what has been aliased is also a way to see what is being used in the module.

  defp bear_item(b) do
    "<li>#{b.name} - #{b.type}</li>"
  end


  def index(conv) do
    bears =
      Wildthings.list_bears()
      # 3. Anonymous function options

      # 1. 'fn(x) -> foo(x) end' style
      |> Enum.filter(fn(b) -> Bear.is_not_brown(b) end)
      # 2. using 'capture' syntax with an &, and &1 args
      |> Enum.sort(&Bear.order_by_name(&1, &2))
      # 3. using capture syntax, but with function airty count
      |> Enum.map(&bear_item/1)
      |> Enum.join
   %{ conv | status: 200, resp_body: "<ul>#{bears}</ul>" }
  end

  def show(conv, %{"id" => id} ) do
    bear = Wildthings.get_bear(id)
    %{ conv | status: 200, resp_body: "Bear #{bear.id} is #{bear.name}" }
  end

  def create(conv,  %{ "name" => name, "type" => type}) do
        %{ conv |
              resp_body: "A #{type} bear with name #{name}.",
              status: 201 }
  end

  def delete(conv, %{ "id" => id }) do
    # _dw figure out this error message. How to read it?
    %{ conv | status: 403, resp_body: "Bear #{id} is dead/"}
  end
end