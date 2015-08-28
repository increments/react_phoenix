defmodule ReactPhoenix.Mixfile do
  use Mix.Project

  def project do
    [
      app: :react_phoenix,
      version: "0.1.2",
      elixir: "~> 1.0.1 or ~> 1.1",
      deps: deps,
      package: [
        contributors: ["Chris McCord"],
        licenses: ["MIT"],
        links: %{github: "https://github.com/chrismccord/react_phoenix"}
      ],
      description: """
      Phoenix Template Engine for ReactJSX
      """
    ]
  end

  def application do
    [applications: [:phoenix, :calliope]]
  end

  defp deps do
    [
      {:phoenix, "~> 0.17"},
      {:phoenix_html, "~> 2.1"},
      {:cowboy, "~> 1.0.0", only: [:dev, :test]},
      {:calliope, "~> 0.3.0"}
    ]
  end
end
