defmodule ReactPhoenix.Renderer do
  def render(str) do
    # {:ok, vm} = :erlang_v8.start_vm(file:"node_modules/react/dist/react.min.js")
    # {:ok, ret} = erlang_v8.eval vm, "React.renderToString(React.createElement('div', {}))"
    # WIP
    str
  end
  def preload(js_path) do
    # WIP
  end
end
