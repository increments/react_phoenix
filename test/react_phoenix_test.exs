defmodule ReactPhoenixTest do
  use ExUnit.Case
  alias Phoenix.View

  test "react_component should render wrapper" do
    html = ReactPhoenix.Utils.react_component "Hello", %{a: 1}, %{prerender: false}
    assert html == "<div data-react-class=\'Hello\' data-react-props=\'{\"a\":1}\' ></div>"
  end

  test "JSContext.eval evals javascript" do
    {:ok, result} = ReactPhoenix.JSContext.eval "React.renderToStaticMarkup(React.createElement('div', {}))"
    assert result == "<div></div>"
  end

  test "Renderer returns result" do
    {:ok, result} = ReactPhoenix.Renderer.render "React.renderToStaticMarkup(React.createElement('div', {}, 'foo'))"
    assert result == "<div>foo</div>"
  end

  defmodule MyApp.PageView do
    use Phoenix.View, root: "test/fixtures/templates"
    use Phoenix.HTML

    def to_json do
      JSX.encode %{a: 1}
    end
  end

  test "render a js template without layout" do
    {:ok, html} = View.render(MyApp.PageView, "new.html", [])
    assert html == {:safe, "<div>foo</div>"}
  end

  # test "render a js template with layout" do
  #   html = View.render(MyApp.PageView, "new.html",
  #     message: "hi",
  #     layout: {MyApp.PageView, "application.html"}
  #   )
  #   assert html == {:safe, [[["" | "<html><body>"], "" | "<h2>New Template</h2>"] | "</body></html>"]}
  # end
end
