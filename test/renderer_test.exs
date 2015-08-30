defmodule ReactPhoenixTest.Renderer do
  use ExUnit.Case
  alias Phoenix.View
  test "Renderer returns result" do
    {:ok, result} = ReactPhoenix.Renderer.render "React.renderToStaticMarkup(React.createElement('div', {}, 'foo'))"
    assert result == "<div>foo</div>"
  end
end
