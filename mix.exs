defmodule ExVCR.Mixfile do
  use Mix.Project

  @source_url "https://github.com/Two-Front/exvcr"
  @version "0.13.2"

  def project do
    [
      app: :exvcr,
      version: @version,
      source_url: @source_url,
      elixir: "~> 1.3",
      deps: deps(),
      docs: docs(),
      description: description(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test]
    ]
  end

  def application do
    [applications: [:meck, :exactor], mod: {ExVCR.Application, []}]
  end

  def deps do
    [
      {:meck, "~> 0.8"},
      {:exactor, "~> 2.2"},
      {:jsx, "~> 3.0"},
      {:ibrowse, "4.4.0", optional: true},
      {:httpotion, "~> 3.1", optional: true},
      {:httpoison, "~> 1.0", optional: true},
      {:finch, "~> 0.8.0", optional: true},
      {:excoveralls, "~> 0.13", only: :test},
      {:http_server, github: "parroty/http_server", only: [:dev, :test]},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description do
    """
    (Fork of the original ExVCR; Work aroudn for JSX dependency)
    HTTP request/response recording library for elixir, inspired by VCR.
    """
  end

  defp package do
    [
      maintainers: ["aditya7iyengar"],
      organization: "two_front",
      licenses: ["Two Front"]
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url,
      extras: [
        "CHANGELOG.md",
        "README.md"
      ]
    ]
  end
end
