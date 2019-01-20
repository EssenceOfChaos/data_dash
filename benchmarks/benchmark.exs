## Simple example ##
list = Enum.to_list(1..10_000)
map_fun = fn i -> [i, i * i] end

Benchee.run(%{
  "flat_map"    => fn -> Enum.flat_map(list, map_fun) end,
  "map.flatten" => fn -> list |> Enum.map(map_fun) |> List.flatten() end
})

## Multiple Inputs ##
# map_fun = fn i -> [i, i * i] end

# inputs = %{
#   "small list" => Enum.to_list(1..100),
#   "medium list" => Enum.to_list(1..10_000),
#   "large list" => Enum.to_list(1..1_000_000)
# }

# Benchee.run(
#   %{
#     "flat_map" => fn list -> Enum.flat_map(list, map_fun) end,
#     "map.flatten" => fn list -> list |> Enum.map(map_fun) |> List.flatten() end
#   },
#   inputs: inputs
# )

## Run from console ##
# mix run benchmarks/benchmark.exs
