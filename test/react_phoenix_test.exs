defmodule ReactPhoenixTest do
  use ExUnit.Case
  alias Phoenix.View

  test "react_component should render wrapper" do
    html = ReactPhoenix.Utils.react_component "Hello", %{a: 1}, %{prerender: false}
    assert html == "<div data-react-class=\'Hello\' data-react-props=\'{\"a\":1}\' ></div>"
  end

  # defmodule MyApp.PageView do
  #   use Phoenix.View, root: "test/fixtures/templates"
  #   use Phoenix.HTML
  # end
  #
  # test "render a jsx template with layout" do
  #   html = View.render(MyApp.PageView, "new.html",
  #     message: "hi",
  #     layout: {MyApp.PageView, "application.html"}
  #   )
  #   assert html == {:safe, [[["" | "<html><body>"], "" | "<h2>New Template</h2>"] | "</body></html>"]}
  # end
  #
  # test "render a jsx template without layout" do
  #   html = View.render(MyApp.PageView, "new.html", [])
  #   assert html == {:safe, ["" | "<h2>New Template</h2>"]}
  # end
end
