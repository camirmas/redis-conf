# RedisConf

Exercises with Redis for RedisConf18, advanced training session. Upon startup,
this application connects to redis on host `localhost` with port `6379`, then
creates a supervised worker that uses that connection pid.

Make sure to set up your `redis-server` with [rebloom](https://github.com/RedisLabsModules/rebloom)
in order to be able to call `RedisConf.BloomExercise.run`.

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/redis_conf](https://hexdocs.pm/redis_conf).
