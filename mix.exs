defmodule TestingAutomaticElixirRelease.MixProject do
  use Mix.Project

  def project do
    [
      app: :testing_automatic_elixir_release,
      version: "0.0.1",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      description: "A package that is used in the testing of an automatic Elixir pipeline",
      package: package(),

      source_url: "https://github.com/andimon/testing-automatic-elixir-release",
      docs: docs()
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
      {:ex_doc, "~> 0.31", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end


  defp package do
    [
      # These are required
      description: "Testing GitFlow setup",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/andimon/testing-automatic-elixir-release"},

      # Optional but recommended
      # maintainers: ["Andre Vella"],
      # files: ~w(lib mix.exs README.md CHANGELOG.md LICENSE)
    ]
  end
end
