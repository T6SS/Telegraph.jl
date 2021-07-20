module Telegraph

using Reexport

@reexport RandomWalker
@reexport DataFrames
@reexport Random
@reexport Distributions

export
	update,
	get_all_indices,
	get_indices,
	get_times


include("telegraph_structs.jl")
include("update.jl")
include("times_indices.jl")
end
