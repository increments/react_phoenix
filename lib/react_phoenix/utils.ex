defmodule ReactPhoenix.Utils do
  def react_component(name, props) do
    react_component(name, props, prerender: false)
  end

  def react_component(name, props, opts) do
    {:ok, strProps} = JSX.encode props
    embeddedAttrs = "data-react-class=\'#{name}\' data-react-props=\'#{strProps}\'"

    if opts[:prerender] do
      html = ReactPhoenix.Renderer.render_component(name, props)
      Regex.replace ~r/^(\<(\w+)\s)/, html, "\\0#{embeddedAttrs} "
    else
      "<div #{embeddedAttrs}></div>"
    end
  end
end
