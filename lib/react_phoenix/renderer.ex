defmodule ReactPhoenix.Renderer do
  def render_component(name, props) do
    {:ok, strProps} = JSX.encode props
    {:ok, result} = ReactPhoenix.JSContext.eval """
    React.renderToString(React.createElement(#{name}), #{strProps})
    """
    result
  end

  def load_as_javascript(code) do
    ReactPhoenix.JSContext.eval code
    nil
  end
end
