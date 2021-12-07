function update(s::Union{Int,Bool},λ₀::Float64,λ₁::Float64)
	τ = rand() 
	if s == 0
		if τ < λ₀
			s = 1
		end
	elseif s == 1
		if τ < λ₁
			s = 0
		end
	else
		error("What state are you in? Answer: $(s)")
	end
	return s
end
