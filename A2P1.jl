# Simple pendulum ODE problem with external torque
using Pkg
Pkg.activate(".")

using DifferentialEquations, ModelingToolkit, Plots

# Define the equations and variables
function pendulum!(du, u, p, t)
    θ, ω = u                    # θ: angle, ω: angular velocity
    g, l, m, Mt = p             # g: gravity, l: length, m: mass, Mt: external torque
    du[1] = ω
    du[2] = -(3*g)/(2*l) * sin(θ) + 3/(m*l^2) * Mt
end

# Initial conditions
u0 = [0.01, 0.0]               # Small initial angle (rad), zero angular velocity

# Parameters: [g, l, m, Mt]
p = [9.81, 1.0, 1.0, 0.1]     # Earth's gravity, 1m length, 1kg mass, 0.1 Nm torque

# Time span for simulation (0 to 10 seconds)
tspan = (0.0, 10.0)

# Define and solve the ODE problem
prob = ODEProblem(pendulum!, u0, tspan, p)
sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8)

# Create plots
p1 = plot(sol, idxs=(0,1), xlabel="Time (s)", ylabel="Angular Position (rad)", 
          title="Simple Pendulum with External Torque", label="Position", linewidth=2)
p2 = plot(sol, idxs=(0,2), xlabel="Time (s)", ylabel="Angular Velocity (rad/s)",
          label="Velocity", linewidth=2)

# Combine plots
pic = plot(p1, p2, layout=(2,1), size=(800,600))

# Save the figure
outfp = joinpath(@__DIR__, "pendulum.png")
savefig(pic, outfp)

println("Simulation complete! Plot saved as: ", outfp)