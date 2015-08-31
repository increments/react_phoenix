defmodule ReactPhoenixTest.Renderer do
  use ExUnit.Case
  test "Renderer returns result" do
    {:ok, result} = ReactPhoenix.JSContext.eval "React.renderToStaticMarkup(React.createElement('div', {}, 'foo'))"
    assert result == "<div>foo</div>"
  end
end
