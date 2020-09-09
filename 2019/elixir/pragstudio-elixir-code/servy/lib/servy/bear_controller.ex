defmodule Servy.BearController do
  alias Servy.Wildthings
  # alias Servy.Bear # Reviewing what has been aliased is also a way to see what is being used in the module.

  import Servy.View, only: [render: 3]

  def index(conv) do
    bears = Wildthings.list_bears()
    render(conv, "index.eex", bears: bears)
  end

  def show(conv, %{"id" => id} ) do
    bear = Wildthings.get_bear(id)
    render(conv, "show.eex", bear: bear)
  end

  def create(conv,  %{ "name" => name, "type" => type}) do
        %{ conv |
              resp_body: "A #{type} bear with name #{name}.",
              status: 201 }

        %{ conv | resp_body: "Created a #{type} bear named #{name}!", status: 201}
  end

  def delete(conv, %{ "id" => id }) do
    # _dw figure out this error message. How to read it?
    %{ conv | status: 403, resp_body: "Bear #{id} is dead"}
  end
end