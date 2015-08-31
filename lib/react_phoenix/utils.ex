defmodule ReactPhoenix.Utils do
  def react_component(name, props, %{prerender: false}) do
    {:ok, strProps} = JSX.encode props
    "<div data-react-class=\'#{name}\' data-react-props=\'#{strProps}\' >"
    <> "</div>"
  end

  def react_component(name, props) do
    react_component(name, props, %{prerender: false})
  end

  def react_component(name, props, %{prerender: true}) do
    {:ok, strProps} = JSX.encode props
    "<div data-react-class=\'#{name}\' data-react-props=\'#{strProps}\' >"
    <> ReactPhoenix.Renderer.render_component(name, props)
    <> "</div>"
  end
end
