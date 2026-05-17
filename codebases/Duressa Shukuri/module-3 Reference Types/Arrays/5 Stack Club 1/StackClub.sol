// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

contract StackSociety {
    address[] public participants;

    function enrollParticipant(address newMember) external {
        participants.push(newMember);
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
