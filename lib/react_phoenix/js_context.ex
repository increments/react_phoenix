defmodule ReactPhoenix.JSContext do
  use GenServer

  def eval(code) do
    GenServer.call(:v8context, {:eval, code})
  end

  def start_link do
    {:ok, vm} = :erlang_v8.start_vm(file: "priv/react-0.14.0-beta3.min.js")
    GenServer.start_link(__MODULE__, vm, name: :v8context)
  end

  def handle_call({:eval, code}, _from, vm) do
    result = :erlang_v8.eval vm, code
    {:reply, result, vm}
  end
end
