// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract UserRecordLookupTwo {
 struct Profile {
        uint accountBalance;
        bool isActive;
    }

    mapping(address => Profile) public profiles;

    function createUser() external {
        require(!profiles[msg.sender].isActive, "Profile already exists");

        profiles[msg.sender] = Profile(100, true);
    }

    function transfer(address recipient, uint amount) external {
        require(profiles[msg.sender].isActive, "Sender not isEnabled");
        require(profiles[recipient].isActive, "Recipient not isEnabled");
        require(profiles[msg.sender].accountBalance >= amount, "Insufficient accountBalance");

        profiles[msg.sender].accountBalance -= amount;
        profiles[recipient].accountBalance += amount;
    }

}
