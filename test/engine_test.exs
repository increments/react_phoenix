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
    html = View.render(MyApp.PageView, "new.html", [])
    assert html == {:safe, "<div>foo</div>"}
  end

  test "render a js template with layout" do
    {:safe, data} = View.render(MyApp.PageView, "new.html",
      layout: {MyApp.PageView, "application.html"}
    )
    assert (to_string data) == "<html>\n<div>foo</div>\n</html>\n"
  end
end
