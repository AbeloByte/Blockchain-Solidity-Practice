// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract MemberRegistry {
       mapping(address => bool) public participants;

    function enrollParticipant(address member) external {
        participants[member] = true;
    }
}
