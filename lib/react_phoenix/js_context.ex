defmodule ReactPhoenix.JSContext do
  use GenServer

  def eval(code) do
    GenServer.call(:v8context, {:eval, code})
  end

  def call(f, args) do
    GenServer.call(:v8context, {:call, f, args})
  end

  def start_link do
    source =
      """
      var global = global || this;
      var self = self || this;
      var window = window || this;
      """
      <> File.read!("priv/react-0.14.0-beta3.min.js")

    {:ok, vm} = :erlang_v8.start_vm
    :erlang_v8.eval vm, source
    GenServer.start_link(__MODULE__, vm, name: :v8context)
  end

  def handle_call({:eval, code}, _from, vm) do
    result = :erlang_v8.eval vm, code
    {:reply, result, vm}
  end

  def handle_call({:call, f, args}, _from, vm) do
    result = :erlang_v8.call vm, args
    {:reply, result, vm}
  end
end
