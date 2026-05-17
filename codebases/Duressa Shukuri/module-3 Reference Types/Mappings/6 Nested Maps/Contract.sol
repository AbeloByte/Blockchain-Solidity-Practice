// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract NestedRosterLookup {
   enum ConnectionTypes { Unacquainted, Friend, Family }

    mapping(address => mapping(address => ConnectionTypes)) public affiliations;

    function connectWith(address other, ConnectionTypes connectionType) external {
        affiliations[msg.sender][other] = connectionType;
    }
}
