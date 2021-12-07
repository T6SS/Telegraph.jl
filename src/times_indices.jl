# Get all state switing indices
function get_all_indices(state_time_series)
	tᵦ = []
	# Initialise first index
	push!(tᵦ,1)


	# Push body indices
	for i in 2:size(state_time_series,1)
		if state_time_series[i-1] == 0 && state_time_series[i] == 1
			push!(tᵦ,i)
		elseif state_time_series[i-1] == 1 && state_time_series[i] == 0
			push!(tᵦ,i)
		end
	end
	push!(tᵦ,size(state_time_series,1))
	return tᵦ
end


# Get indices per each state
function get_indices(state_time_series,t⃗)
	

	indss = get_all_indices(state_time_series)[1:end-1]


	# Separate times
	# If first state is membrane
	if state_time_series[1] == 0
		memᵢ = indss[1:2:end]
		basᵢ = indss[2:2:end]
	# If first state is basal
	else
		memᵢ = indss[2:2:end]
		basᵢ = indss[1:2:end]
	end


	return telegraph_points(memᵢ, basᵢ)
end


# Get associated times
function get_times(gi::telegraph_points,t⃗,s₀)
	t̄ = size(t⃗,1)
	tᵢ = sort(vcat(gi.i₀,gi.i₁,t̄))
	Δts = diff(t⃗[tᵢ])
	sΔts = size(Δts,1)
	
	# Turn times in each type
	if mod(sΔts,2) == 0
		rΔts = reshape(Δts,2,sΔts÷2)'
	elseif mod(sΔts,2) == 1
		push!(Δts,1)
		rΔts = reshape(Δts,2,(sΔts÷2+1))'
	else
		# Do nothing
		error("This is weird, this is supposeed to be divisible by 2, instead it is $(sΔts)")
	end

	# Which is s = 0 and which is s = 1
	if s₀ == 0
		return telegraph_time_dist(rΔts[:,1], rΔts[1:end-1,2])
	elseif s₀ == 1
		return telegraph_time_dist(rΔts[1:end-1,2],rΔts[:,1])     	
		
	else
		error("This is weird, this is supposeed to be divisible by 2, instead it is $(s₀)")
	end
end
