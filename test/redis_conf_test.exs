defmodule RedisConfTest do
  use ExUnit.Case

  test "pings Redis" do
    assert RedisConf.ping == "PONG"
  end
end
