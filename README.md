# *S*-Bandwidth and PST on Quantum Networks

These are the slides, code, and other resources I used for
[my talk](https://event.fourwaves.com/aupac-2025-mun/abstracts/18308273-782c-424f-bf41-e808a6d8bada)
at the [Atlantic Undergraduate Physics and Astronomy Conference 2025](https://scienceatlantic.ca/news/aupac-2025/)
in Newfoundland about perfect state transfer on quantum spin networks. The
LaTeX code and slides are in [`pst_quantum_networks_aupac2025.tex`](pst_quantum_networks_aupac2025.tex)
and [`pst_quantum_networks_aupac2025.pdf`](pst_quantum_networks_aupac2025.pdf), respectively.
(You can also manually compile the LaTeX code yourself with LuaLaTex by running
[`build_tex.sh`](build_tex.sh).) Finally, my official presentation abstract is
available at [`presentation_abstract.pdf`](presentation_abstract.pdf).

Plots and graphics used (including [a photo of my cat!](misc_graphics/ash.jpg))
are stored in the subdirectories. Julia code for simulating state transfer
between qubits in quantum networks can be found at
[`pst_code_plots/c4_perfect_state_transfer`](pst_code_plots/c4_perfect_state_transfer)
(be mindful of the dependencies listed therein if you wish to run it yourself).

I would like to thank the organizers of AUPAC 2025 for the opportunity to
present my work, as well as express my gratitude to my research supervisors,
Drs. Nathaniel Johnston and Sarah Plosker. In the same line of research, we are
also developing a Julia library to model various aspects of quantum state
transfer at [QuantumStateTransfer.jl](https://github.com/Luis-Varona/QuantumStateTransfer.jl)&#x2014;stay tuned!
