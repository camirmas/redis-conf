defmodule RedisConf.HyperLogLogExercise do
  @moduledoc """
  Exercises working with HyperLogLog, a probabilistic data structure used to
  approximate the number of distinct elements in a set. See [PFADD](https://redis.io/commands/pfadd)
  and related docs for more info.

  ```
  PFADD key element [element ...]
  PFCOUNT key [key ...]
  ```
  """

  @doc """
  Displays basic functionality of the BF module. It creates a set of 10,000
  items, then asserts that the cardinality of the set is a certain number.
  Note that this is a probabilistic data structure, and thus has an expected
  error rate.
  """
  def run do
    RedisConf.command(["FLUSHALL"])
    items = 1..10000 |> Enum.map(fn _ -> Enum.random(1..10) end)
    {:ok, 1} = RedisConf.command(["PFADD", "stuff"] ++ items)
    {:ok, 10} = RedisConf.command(["PFCOUNT", "stuff"])
  end
end
