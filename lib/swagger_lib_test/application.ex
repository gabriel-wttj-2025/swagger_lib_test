defmodule SwaggerLibTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SwaggerLibTestWeb.Telemetry,
      SwaggerLibTest.Repo,
      {DNSCluster, query: Application.get_env(:swagger_lib_test, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SwaggerLibTest.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: SwaggerLibTest.Finch},
      # Start a worker by calling: SwaggerLibTest.Worker.start_link(arg)
      # {SwaggerLibTest.Worker, arg},
      # Start to serve requests, typically the last entry
      SwaggerLibTestWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SwaggerLibTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SwaggerLibTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
