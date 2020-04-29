defmodule Wax.MixProject do
  use Mix.Project

  def project do
    [
      app: :wax,
      description: "FIDO2 / WebAuthn server library",
      version: "0.2.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: Mix.compilers ++ [:asn],
      dialyzer: [plt_add_apps: [:mix]],
      docs: [
        main: "readme",
        extras: ["README.md", "CHANGELOG.md"]
      ],
      package: package(),
      source_url: "https://github.com/tanguilp/wax"
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Wax.Application, []}
    ]
  end

  defp deps do
    [
      {:jason, github: "michalmuskala/jason", tag: "v1.2.0"},
      {:httpoison, github: "edgurgel/httpoison", tag: "v1.6.0"},
      {:cbor, github: "yjh0502/cbor-erlang", ref: "b5c9dbc2de15753b2db15e13d88c11738c2ac292"},
      {:x509, github: "voltone/x509", tag: "v0.8.0"},
      {:dialyxir, "~> 1.0.0-rc.4", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end

  def package() do
    [
      files: ~w(asn1 lib .formatter.exs mix.exs README* LICENSE* CHANGELOG*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/tanguilp/wax"}
    ]
  end
end
