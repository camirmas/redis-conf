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
end
