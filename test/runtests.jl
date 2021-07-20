using Telegraph
using Test

@testset "Telegraph.jl" begin
    λ₁ = .1
    λ₂ = .3
    Δt = 1e-2
    λ₁Δt = λ₁*Δt
    λ₂Δt = λ₂*Δt
    s = rand([0,1])
    # Single test 
    T = update(s,λ₁Δt,λ₂Δt)
    @test (T == 1) | (T == 0) # test output is either a 1 or a 0

    # Several test
    t = 100
    t⃗ = range(0,t,step=Δt)
    st⃗ = size(t⃗,1)
    st = rand([0,1])
    state = []
    push!(state,st)
    for i in 2:st⃗
            st = update(st,λ₁Δt,λ₂Δt)
            push!(state,st)
        end

    @test state isa Vector 
    @test minimum(state) == 0
    @test maximum(state) == 1
    @test size(state,1) == st⃗

    # test all indices
    gi = get_all_indices(state)
    @test gi isa Vector 
    @test gi[end] == st⃗
    @test gi[1] == 1

    # test indices
    gibm = get_indices(state, t⃗)
    @test gibm isa telegraph_points

    tele_time_dist = get_times(gibm,t⃗,st)
    @test tele_time_dist isa telegraph_time_dist





end
