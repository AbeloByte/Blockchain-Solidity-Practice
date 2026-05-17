# 🌐 Module 2: Advanced Account & Address Operations

Welcome to the second module of my Solidity development logs! This module dives deep into address mechanics, external contract calling patterns, event logging, custom modifiers, transaction reverts, and fund distribution flows.

---

## 👤 Developer Profile

> **Name:** Duressa Shukuri  
> **Course:** Alchemy University - Solidity Core  
> **Focus:** Address Interactions, Payable Workflows & Security Guards  

---

## 📂 Workout Exercises

Here is a breakdown of all hands-on projects completed during this module, showcasing distinct technical implementations.

### 📞 External Contract Calls & Interfaces

| Directory | Core Objective | Custom Contract |
| :--- | :--- | :--- |
| `1 Call Function` | Communicating with an external target contract via static interface. | `Champion.sol` & `Companion.sol` |
| `2 Signature` | Low-level calls using manually hashed function selectors (`keccak256`). | `Companion.sol` |
| `3 With Signature` | Encoding multiple arguments (`uint256`, `bool`) in custom low-level calls. | `Companion.sol` |
| `4 Arbitrary Alert` | Directing arbitrary payloads to external address targets safely. | `Companion.sol` |
| `5 Fallback` | Triggering automatic handlers when calls do not match known functions. | `Companion.sol` & `Champion.sol` |

### 🔒 Custody Holdings (Escrow Project)

This multi-step project represents a complete decentralized escrow vault with dynamic mediator release conditions.

| Directory | Phase | Objective |
| :--- | :--- | :--- |
| `1 Setup` | Phase 1 | Standardizing variable slots (`fundingSource`, `payeeRecipient`, `mediatorReferee`). |
| `2 Constructor` | Phase 2 | Mapping deploy variables and initializing payment parameters. |
| `3 Funding` | Phase 3 | Configuring payable modifiers to accept deposit funds during creation. |
| `4 Approval` | Phase 4 | Constructing the transfer release logic and require constraints. |
| `5 Security` | Phase 5 | Restricting execution to mediator address. |
| `6 Events` | Phase 6 | Emitting persistent blockchain events (`ConsentGiven`) upon execution. |

### ⛔ Transaction Rollback Guards

| Directory | Core Objective | Custom Contract |
| :--- | :--- | :--- |
| `1 Constructor Revert` | Rollback deploy transactions if parameters violate sanity checks. | `DeployRollback.sol` |
| `2 Only Owner` | Guarding core routines with strict owner address comparisons. | `AdminRestriction.sol` |
| `3 Owner Modifier` | Refactoring authorization logic into reusable function modifiers. | `RestrictedAccess.sol` |

### 💸 Ether Fund Transfers

| Directory | Core Objective | Custom Contract |
| :--- | :--- | :--- |
| `1 Save Custodian` | Storing deployer address inside state variable slots. | `CustodianStorage.sol` |
| `2 Accept Funds` | Implementing empty `receive` fallback hooks to absorb raw Ether. | `FundReceiver.sol` |
| `3 Reward Admin` | Forwarding gratuity tips to administrative custodians using transfer hooks. | `AdminGratuity.sol` |
| `4 Altruistic Grants` | Transferring custom portions of contract balance to charitable targets. | `DonationVault.sol` |
| `5 Purge Contract` | Deleting contract bytecodes and forwarding leftover balances (`selfdestruct`). | `SelfPurge.sol` |

---

## 🛡️ Key Security Guidelines

> [!WARNING]
> **Low-level Call Dangers:** Low-level `.call()` functions do not revert automatically on failure; they return a boolean `success` state instead. Always explicitly require `success` to prevent silent execution failures!
>
> ```solidity
> (bool success, ) = target.call{value: amount}("");
> require(success, "Transfer failed");
> ```
