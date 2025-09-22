defmodule TestingAutomaticElixirReleaseTwo.MixProject do
  use Mix.Project

  def project do
    [
      app: :testing_automatic_elixir_release_two,
      version: "0.0.1",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "A package that is used in the testing of an automatic Elixir pipeline",
      package: package(),
      source_url: "https://github.com/andimon/testing-automatic-elixir-release",
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.json": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.38.4", only: :dev, runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.18", only: :test}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package do
    [
      # These are required
      description: "Testing GitFlow setup",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/andimon/testing-automatic-elixir-release"}

      # Optional but recommended
      # maintainers: ["Andre Vella"],
      # files: ~w(lib mix.exs README.md CHANGELOG.md LICENSE)
    ]
  end
end
