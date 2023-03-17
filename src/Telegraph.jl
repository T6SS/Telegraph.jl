module Telegraph

using Reexport

@reexport using Revise
@reexport using Base
#@reexport using RandomWalker
#@reexport using DataFrames
#@reexport using Random
#@reexport using Distributions
#@reexport using Chain

export
	telegraph_points,
	telegraph_time_dist,
	update,
	get_all_indices,
	get_indices,
	get_times


include("telegraph_structs.jl")
include("update.jl")
include("times_indices.jl")

end
