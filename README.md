# Simple Pendulum Simulation with DifferentialEquations.jl

[![CI Pipeline](https://github.com/digvijay1992/simple-pendulum-sciml/actions/workflows/ci.yml/badge.svg)](https://github.com/digvijay1992/simple-pendulum-sciml/actions/workflows/ci.yml)

## 📌 Overview

This repository contains a **simple pendulum simulation** using Julia's `DifferentialEquations.jl` and `ModelingToolkit.jl` packages. The simulation solves the nonlinear pendulum differential equation and visualizes the results.

## 🎯 Features

- ✅ Solves nonlinear pendulum ODE system
- ✅ Generates `pendulum.png` visualization
- ✅ CI pipeline with GitHub Actions
- ✅ Multi-version Julia testing (1.10, 1.11, 1.12)

## 🚀 Quick Start

### Prerequisites
- Julia 1.10 or higher
- Git

### Local Setup

```bash
# Clone the repository
git clone https://github.com/digvijay1992/simple-pendulum-sciml.git
cd simple-pendulum-sciml

# Install dependencies
julia -e 'using Pkg; Pkg.add(["DifferentialEquations", "ModelingToolkit", "Plots"])'

# Run simulation
julia A2P1.jl
