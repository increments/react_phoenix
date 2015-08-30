defmodule ReactPhoenixTest.Renderer do
  use ExUnit.Case
  alias Phoenix.View
  test "Renderer returns result" do
    {:ok, result} = ReactPhoenix.Renderer.render "React.renderToStaticMarkup(React.createElement('div', {}, 'foo'))"
    assert result == "<div>foo</div>"
  end
end

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

defmodule ReactPhoenixTest do
  # Engine
  use ExUnit.Case
  alias Phoenix.View
  import ReactPhoenix.Utils

  defmodule MyApp.PageView do
    use Phoenix.View, root: "test/fixtures/templates"
    use Phoenix.HTML
    import ReactPhoenix.Utils
  end

  test "render a js template without layout" do
    {:ok, html} = View.render(MyApp.PageView, "new.html", [])
    assert html == {:safe, "<div>foo</div>"}
  end

  test "render a js template with layout" do
    html = View.render(MyApp.PageView, "new.html",
      layout: {MyApp.PageView, "application.html"}
    )
  end
end
