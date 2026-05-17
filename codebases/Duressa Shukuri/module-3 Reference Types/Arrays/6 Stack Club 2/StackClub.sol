// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

contract StackSociety {
  address[] public participants;

    constructor() {
        participants.push(msg.sender);
    }

    function enrollParticipant(address newMember) external {
        require(isParticipant(msg.sender), "Not a member");

        participants.push(newMember);
    }

    function removeLastMember() external {
        require(isParticipant(msg.sender), "Not a member");

        participants.pop();
    }

    function isParticipant(address member) public view returns (bool) {
        for (uint i = 0; i < participants.length; i++) {
            if (participants[i] == member) {
                return true;
            }
        }

        return false;
    }
}
