defmodule ReactPhoenix.Engine do
  @behaviour Phoenix.Template.Engine

  def compile(path, _name) do
    {:ok, html} =
      path
      |> read!
      |> ReactPhoenix.JSContext.eval
    html |> EEx.compile_string(engine: Phoenix.HTML.Engine, file: path, line: 1)
  end

  defp read!(file_path) do
    file_path |> File.read!
  end
end
