defmodule ReactPhoenixTest do
  # Engine
  use ExUnit.Case
  alias Phoenix.View

  defmodule MyApp.PageView do
    use Phoenix.View, root: "test/fixtures/templates"
    use Phoenix.HTML
    import ReactPhoenix.Utils
  end

  test "render a js template without layout" do
    {:safe, html} = View.render(MyApp.PageView, "new.html", [])
    assert (to_string html) == "<div>foo</div>"
  end

  test "render a js template with layout" do
    {:safe, data} = View.render(MyApp.PageView, "new.html",
      layout: {MyApp.PageView, "application.html"}
    )
    assert (to_string data) == "<html>\n<div>foo</div>\n</html>\n"
  end

  test "render as prerender: false" do
    {:safe, data} = View.render(MyApp.PageView, "util.html",
      layout: {MyApp.PageView, "application.html"}
    )
    assert (to_string data) == "<html>\n<div>\n  <div data-react-class='Hello' data-react-props='{\"a\":1}' ></div>\n</div>\n\n</html>\n"
  end

  test "render as prerender: true" do
    ReactPhoenix.Renderer.load_as_javascript """
    var Hello = React.createClass({render: function(){return React.createElement('div', {}, "hello")}})
    """

    {:safe, data} = View.render(MyApp.PageView, "util-prerender.html",
      layout: {MyApp.PageView, "application.html"}
    )
    assert (to_string data) != "<html>\n<div>\n  <div data-react-class='Hello' data-react-props='{\"a\":1}' ></div>\n</div>\n\n</html>\n"
  end
end
