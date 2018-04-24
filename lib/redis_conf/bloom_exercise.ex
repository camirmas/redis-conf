defmodule RedisConf.BloomExercise do
  @moduledoc """
  An exercise working with a Bloom Filter, a probabilistic data structure used to
  determine if an item is in a set. See the [rebloom](https://github.com/RedisLabsModules/rebloom#building-and-loading-rebloom)
  module for more info.

  ```
  BF.INSERT {key} [CAPACITY {cap}] [ERROR {error}] [NOCREATE] ITEMS {item...}
  BF.EXISTS {key} {item}
  ```
  """

  @doc """
  Displays basic functionality of the BF module. It creates a set of 10,000
  items, then asserts that the set contains/doesn't contain certain items.
  Note that this is a probabilistic data structure, and thus has an expected
  error rate.
  """
  def run do
    RedisConf.command(["FLUSHALL"])
    items = 1..10000 |> Enum.map(fn _ -> Enum.random(1..10) end)
    RedisConf.command(["BF.INSERT", "filter", "ITEMS"] ++ items)

    {:ok, 1} = RedisConf.command(["BF.EXISTS", "filter", "3"]) # 3 is in set
    {:ok, 0} = RedisConf.command(["BF.EXISTS", "filter", "11"]) # 11 is not in set
  end
end
