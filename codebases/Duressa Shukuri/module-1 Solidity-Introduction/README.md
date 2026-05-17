# 🚀 Module 1: Solidity Developer Essentials

Welcome to the foundational module of my blockchain development learning log! This directory showcases my personal implementations of Solidity primitive types, state management, and functional features.

---

## 👤 Developer Profile

> **Name:** Duressa Shukuri  
> **Course:** Alchemy University - Solidity Core  
> **Focus:** Smart Contract Fundamentals & Data Architecture  

---

## 📂 Workout Exercises

Below is a detailed breakdown of the worksheets and programming assignments completed during this unit.

### 🔢 Core Data Types

| Directory | Core Objective | Custom Contract |
| :--- | :--- | :--- |
| `1 - Booleans` | Storing and verifying binary conditions (`true`/`false`). | `TruthValues.sol` |
| `2 - Unsigned Integers` | Initializing non-negative numeric parameters (`uint256`). | `PositiveIntegers.sol` |
| `3 - Signed Integers` | Manipulating positive and negative integer boundaries (`int256`). | `SignedNumbers.sol` |
| `4 - String Literals` | Storing small and large arbitrary text messages. | `TextLiterals.sol` |
| `5 - Enum` | Defining closed sets of user-defined selection constants. | `CustomEnums.sol` |

### 🛠️ Solidity Functions & Scope

| Directory | Core Objective | Custom Contract |
| :--- | :--- | :--- |
| `1 - Arguments` | Passing values to constructors and reading them via views. | `InputParameters.sol` |
| `2 - Increment` | Constructing state counters and mathematical updates. | `ValueStepper.sol` |
| `3 - View Addition` | Constructing non-modifying read calculations with view decorators. | `ReadAddition.sol` |
| `4 - Console Log` | Emitting logs and terminal updates for debugging environments. | `ConsoleLogger.sol` |
| `5 - Pure Double` | Executing algorithmic computations that do not touch the state. | `PureMultiplier.sol` |
| `6 - Double Overload` | Overloading matching function names using diverse call signatures. | `OverloadedMultiplier.sol` |

---

## 🎯 Technical Objectives & Takeaways

In this module, I successfully explored and consolidated:
- **State vs Memory Storage:** Learning where data lives on-chain.
- **Gas Optimization Basics:** Harnessing HSL boundaries, `uint8` positioning, and string limits.
- **Function Visibilities & Mutability:** Selecting appropriate scopes (`external`, `public`) and state mutabilities (`view`, `pure`).

> [!TIP]
> **Key Insight:** `pure` functions are entirely free of state context and cannot read nor write to the blockchain. Use them for utilities and standalone computations to minimize gas consumption!
