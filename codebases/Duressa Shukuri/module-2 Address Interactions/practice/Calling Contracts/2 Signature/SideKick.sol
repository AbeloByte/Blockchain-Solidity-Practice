// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract Companion {
    function raiseAlarm(address hero) external {
        bytes4 signature = bytes4(keccak256("alarm()"));

        (bool success, ) = hero.call(abi.encodePacked(signature));

        require(success);
    }
}
