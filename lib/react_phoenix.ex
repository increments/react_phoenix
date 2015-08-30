defmodule ReactPhoenix do
  use Application
  def start(_type, _args) do
    IO.puts "ReactPhoenix started!"
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      worker(ReactPhoenix.JSContext, [])
    ], [
      strategy: :one_for_one,
      name: ReactPhoenix.Supervisor
    ])
  end
end
