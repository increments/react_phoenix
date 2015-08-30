defmodule ReactPhoenix.Engine do
  @behaviour Phoenix.Template.Engine

  def compile(path, _name) do
    {:safe, ReactPhoenix.Renderer.render(path |> read!)}
  end

  defp read!(file_path) do
    file_path |> File.read!
  end
end
