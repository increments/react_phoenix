defmodule ReactPhoenix.Utils do
  def react_component(name, props, %{prerender: false}) do
    {:ok, strProps} = JSX.encode props
    "<div data-react-class=\'#{name}\' data-react-props=\'#{strProps}\' >"
    <> "" # TODO: inner element
    <> "</div>"
  end
end
