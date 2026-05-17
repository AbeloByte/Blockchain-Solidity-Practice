// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract UserRecordLookup {
  struct Profile {
        uint accountBalance;
        bool isActive;
    }

    mapping(address => Profile) public profiles;

    function createUser() external {
        require(!profiles[msg.sender].isActive, "Profile already exists");

        profiles[msg.sender] = Profile(100, true);
    }

}
