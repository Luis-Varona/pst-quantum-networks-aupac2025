# %%
using ImageIO, ImageMagick, ImageShow, OpenCV
using FileIO
using Plots
using Plots.PlotMeasures


# %%
function main()
    C_4 = cycle_graph(4)
    u = 1
    steps = 0:(π / 200):5
    
    transfer_amplitude = state_transfer(C_4, u, steps)
    transfer_fidelity = abs2.(transfer_amplitude)
    
    amplitude_plot = plot(
        steps,
        real.(transfer_amplitude),
        imag.(transfer_amplitude),
        xlabel="Time",
        ylabel="Real",
        zlabel="Imaginary",
        labels=["to itself" "to node 2" "to node 3" "to node 4"],
        title="Transfer Amplitude from Node 1 on the Cycle Graph C₄",
        lc=[:dodgerblue :pink :crimson :green],
        lw=[2 8 2 2],
        la=[1 0.75 1 1],
        legend=(0.8, 0.8),
        titlelocation=(0.48, 0.96),
        top_margin=-35px,
        bottom_margin=-55px,
        left_margin=-35px,
        size=(640, 640),
        dpi=300,
    )
    
    io = IOBuffer()
    png(amplitude_plot, io)
    amplitude_plot = load(io)[26:1825, 61:1860]
    
    fidelity_plot = plot(
        steps,
        transfer_fidelity,
        xlabel="Time",
        ylabel="Fidelity",
        labels=["to itself" "to node 2" "to node 3" "to node 4"],
        title="Transfer Fidelity from Node 1 on the Cycle Graph C₄",
        lc=[:dodgerblue :pink :crimson :green],
        lw=[2 8 2 2],
        la=[1 0.75 1 1],
        legend=(0.88, 1.09),
        titlelocation=(0.38, 1.09),
        top_margin=35px,
        left_margin=10px,
        size=(800, 600),
        dpi=300,
    )
    
    save("pst_code_plots/c4_transfer_amplitude.png", amplitude_plot)
    save("pst_code_plots/c4_transfer_fidelity.png", fidelity_plot)
end


# %%
function state_transfer(
    A::AbstractMatrix{<:Real}, # Adjacency matrix of quantum network
    u::Int, # Index of source qubit
    steps::AbstractRange{<:Real}, # Measurement times
)
    U(t::Real) = exp(im * t * A) # Transition matrix describing unitary evolution
    ϕ = falses(size(A, 1))
    ϕ[u] = true
    
    transfer_amplitude = vcat(map(U -> ϕ' * U, U.(steps))...)
    return transfer_amplitude
end


# %%
function cycle_graph(n::Int)
    A = falses(n, n)
    
    for i in 1:n
        j = i % n + 1
        A[i, j] = true
        A[j, i] = true
    end
    
    return A
end


# %%
main()