defmodule RedisConf do
  @moduledoc """
  Documentation for RedisConf.
  """

  @doc """
  Sends PING
  """
  def ping do
    RedisConf.Worker.ping
  end

  def command(args) do
    RedisConf.Worker.command(args)
  end
end
