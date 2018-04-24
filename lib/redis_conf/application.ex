defmodule RedisConf.Application do
  @moduledoc false

  use Application

  @host Application.get_env(:redis_conf, :host)
  @port Application.get_env(:redis_conf, :port)

  def start(_type, _args) do
    # Start Redis
    {:ok, conn} = Redix.start_link(host: @host, port: @port)

    children = [
      {RedisConf.Worker, conn}
    ]

    opts = [strategy: :one_for_one, name: RedisConf.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
