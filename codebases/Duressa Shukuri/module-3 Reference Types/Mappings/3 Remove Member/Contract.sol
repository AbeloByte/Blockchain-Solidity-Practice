// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract MemberExcluder {
  mapping(address => bool) public participants;

    function enrollParticipant(address member) external {
        participants[member] = true;
    }

    function expelParticipant(address member) external {
        participants[member] = false;
    }

    function checkParticipant(address member) external view returns (bool) {
        return participants[member];
    }
}
