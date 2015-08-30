defmodule ReactPhoenix.Renderer do
  def render(code) do
    ReactPhoenix.JSContext.eval code
  end

  def load_as_javascript(code) do
    ReactPhoenix.JSContext.eval code
    nil
  end
end
