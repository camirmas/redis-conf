defmodule RedisConf.Worker do
  use GenServer

  def start_link(conn) do
    GenServer.start_link(__MODULE__, conn, name: __MODULE__)
  end

  def ping do
    GenServer.call(__MODULE__, :ping)
  end

  def handle_call(:ping, _, %{conn: conn} = state) do
    res = Redix.command!(conn, ["PING"])

    {:reply, res, state}
  end

  def init(conn) do
    IO.inspect conn
    {:ok, %{conn: conn}}
  end
end
