defmodule ReactPhoenix.Engine do
  @behaviour Phoenix.Template.Engine

  def compile(path, _name) do
    {:ok, html} = path |> read! |> ReactPhoenix.Renderer.render
    {:ok, {:safe, html}}
    # {:ok, html} = ReactPhoenix.Renderer.render(path |> read!)
      # |> EEx.compile_string(engine: Phoenix.HTML.Engine, file: path, line: 1)
    # {:ok, {:safe, html}}
    # {:ok, html}
  end

  defp read!(file_path) do
    file_path |> File.read!
  end
end
