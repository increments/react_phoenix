# Phoenix Template Engine for Haml

> Powered by [Calliope](https://github.com/nurugger07/calliope)

## Usage

  1. Add `{:react_phoenix, "~> 0.1.1"}` to your deps in `mix.exs`.
     If you generated your app from the Phoenix master branch,
     add react_phoenix's master branch to your deps instead.
     `{:react_phoenix, github: "chrismccord/react_phoenix"}`
  2. Add the following your Phoenix `config/config.exs`

```elixir
  config :phoenix, :template_engines,
    haml: ReactPhoenix.Engine
```
