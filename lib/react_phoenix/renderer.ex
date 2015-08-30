defmodule ReactPhoenix.Renderer do
  def render(code) do
    ReactPhoenix.JSContext.eval code
  end
end
