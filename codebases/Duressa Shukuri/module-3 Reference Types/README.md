# 📊 Module 3: Reference & Complex Data Structures

Welcome to the third module of my blockchain journey! This directory contains my solutions for managing complex on-chain structures, dynamic collections, lookup tables, custom data records, and state transitions.

---

## 👤 Developer Profile

> **Name:** Duressa Shukuri  
> **Course:** Alchemy University - Solidity Core  
> **Focus:** Reference Types, Key-Value Mappings, Custom Structs & Storage/Memory Layouts  

---

## 📂 Workout Exercises

Here is the structured roadmap of the exercises solved throughout this module.

### 📋 List Collections (Arrays)

| Directory | Core Objective | Custom Contract |
| :--- | :--- | :--- |
| `1 Fixed Sum` | Summing numbers in fixed-length arrays. | `StaticArraySum.sol` |
| `2 Dynamic Sum` | Dynamically sizing arrays and computing sums at runtime. | `DynamicArraySum.sol` |
| `3 Filter to Storage` | Filtering array elements and saving evens to persistent storage. | `PersistentArrayFilter.sol` |
| `4 Filter to Memory` | Filtering array elements dynamically into memory lists to save gas. | `VolatileArrayFilter.sol` |
| `5 Stack Club 1` | Creating stack-based participant rosters. | `StackSociety.sol` |
| `6 Stack Club 2` | Adding expulsion mechanisms to participant rosters. | `StackSociety.sol` |

### 🔍 Lookup Dictionaries (Mappings)

| Directory | Core Objective | Custom Contract |
| :--- | :--- | :--- |
| `1 Add Member` | Storing and adding authorized user addresses. | `MemberRegistry.sol` |
| `2 Is Member` | Validating if an address is enrolled in the lookup mapping. | `MemberValidator.sol` |
| `3 Remove Member` | Setting lookups to false to expel enrolled user addresses. | `MemberExcluder.sol` |
| `4 Map Structs` | Mapping user addresses to rich, custom profile records. | `UserRecordLookup.sol` |
| `5 Map Structs 2` | Adding modify, search, and update tools to profile records. | `UserRecordLookupTwo.sol` |
| `6 Nested Maps` | Modeling mutual connections using multi-keyed nested mappings. | `NestedRosterLookup.sol` |

### 🗳️ Custom Records (Structs)

| Directory | Core Objective | Custom Contract |
| :--- | :--- | :--- |
| `1 Vote Storage` | Tracking ballot choices in storage slots. | `BallotStorage.sol` |
| `2 Vote Memory` | Loading custom ballot structures temporarily into memory. | `BallotMemory.sol` |
| `3 Vote Array` | Maintaining dynamic arrays of custom ballot records. | `BallotCollection.sol` |
| `4 Choice Lookup` | Querying specific choices from ballot array records. | `BallotOptionLookup.sol` |
| `5 Single Vote` | Restricting voting access to prevent duplicate submissions. | `SingleBallotSelection.sol` |
| `6 Change Vote` | Enabling electors to revise their ballot options dynamically. | `RevisedBallotSelection.sol` |

---

## 💡 Important Storage Rules

In Solidity, understanding where complex reference types reside is critical for secure programming and gas optimization.

> [!IMPORTANT]
> **Storage vs Memory:**
> - `storage` variables represent persistent state slots. Modifying them commits updates directly to the blockchain forever.
> - `memory` variables are volatile, temporary, and exist only for the duration of a function execution. They are completely deleted when the call finishes, making them significantly cheaper to execute!
