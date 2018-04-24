defmodule RedisConf.MixProject do
  use Mix.Project

  def project do
    [
      app: :redis_conf,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {RedisConf.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:redix, "~> 0.7.0"},
      {:faker, "~> 0.10"}
    ]
  end
end
