defmodule ReactPhoenix.Utils do
  def react_component(name, props) do
    react_component(name, props, prerender: false)
  end

  def react_component(name, props, opts) do
    {:ok, strProps} = JSX.encode props

    "<div data-react-class=\'#{name}\' data-react-props=\'#{strProps}\' >"
    <> (if opts[:prerender] do
        ReactPhoenix.Renderer.render_component(name, props)
      else
        ""
      end)
    <> "</div>"
  end
end
