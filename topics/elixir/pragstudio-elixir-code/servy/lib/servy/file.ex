defmodule Servy.File do
  def handle_file({:ok, contents}, conv) do
    %{ conv | resp_body: contents, status: 200 }
  end

  def handle_file({:error, :enoent }, conv) do
    %{ conv | resp_body: "File Not found", status: 404 }
  end

  def handle_file({:error, reason } , conv) do
   %{ conv | resp_body: reason, status: 500 }
  end
end