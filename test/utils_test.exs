defmodule ReactPhoenixTest.Utils do
  use ExUnit.Case
  alias Phoenix.View
  import ReactPhoenix.Utils
  defmodule MyApp.PageView do
    use Phoenix.View, root: "test/fixtures/templates"
    use Phoenix.HTML
    import ReactPhoenix.Utils
  end

  test "react_component should render wrapper" do
    html = react_component "Hello", %{a: 1}, %{prerender: false}
    assert html == "<div data-react-class=\'Hello\' data-react-props=\'{\"a\":1}\' ></div>"
  end
end
