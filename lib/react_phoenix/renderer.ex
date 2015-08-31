defmodule ReactPhoenix.Renderer do
  def render_component(name, props) do
    {:ok, strProps} = JSX.encode props
    {:ok, result} = ReactPhoenix.JSContext.eval """
    React.renderToString(React.createElement(#{name}), #{strProps})
    """
    result
  end
end
