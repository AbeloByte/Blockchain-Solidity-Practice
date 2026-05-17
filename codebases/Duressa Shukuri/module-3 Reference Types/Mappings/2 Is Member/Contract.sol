// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract MemberValidator {
    mapping(address => bool) public participants;

    function enrollParticipant(address member) external {
        participants[member] = true;
    }

    function checkParticipant(address member) external view returns (bool) {
        return participants[member];
    }
}
