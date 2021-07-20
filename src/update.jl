function update(s::Int,λ₁Δt::Float64,λ₂Δt::Float64)
	τ = rand()
	if s == 0
		if τ < λ₁Δt
			s = 1
		end
	elseif s == 1
		if τ < λ₂Δt
			s = 0
		end
	else
		error("What state are you in? Answer: $(s)")
	end
	return s::Int
end
