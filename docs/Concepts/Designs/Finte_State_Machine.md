---
title: Finite State Machine
description:
date: 2024-11-13
---

# Finite State Machine (FSM)

A finite state machine or **finite automaton** is a mathematical model of computation. It is an abstract machine that can be in exactly one of a finite number of states at any given time. The FSM can change from one state to another in response to some inputs; the change from one state to another is called a _transition_. An FSM is defined by a list of its states, its initial state, and the conditions for each transition

- Part of the "automata theory"
- Used in many applications like compilers, network protocols, and digital circuits
- Used to design the control unit of computers

_Example:_ Traffic lights

- States: Red, Yellow, Green
- Transitions: Red -> Green -> Yellow -> Red
- Inputs: Traffic, Timer

## Characteristics of FSM

- We have a fixed set of states that the machine can be in
- The machine can only be in one state at a time
- A sequence of inputs is sent to the machine
- Each state has a set of transitions and every transition is associated with an input and pointing to a state

## Types of FSM

1. **Deterministic Finite Automaton (DFA)**
2. **Non-Deterministic Finite Automaton (NFA)**
3. **epsilon-NFA (ε-NFA)**: An NFA that can transition to a new state without consuming any input
4. **Mealy Machine**
5. **Mealy Machine**: A Mealy machine is a finite-state machine whose output values are determined both by its current state and the current inputs
6. **Moore Machine**: A Moore machine is a finite-state machine whose output values are determined only by its current state

### Deterministic Finite Automaton (DFA)

DFA is a finite state machine that accepts/rejects finite strings of symbols and only produces a unique computation (or run) of the automaton for each input string. It is deterministic in the sense that it produces the unique computation for any given input string

- It is the simplest model of computation
- It has a very limited memory
