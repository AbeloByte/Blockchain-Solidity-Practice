// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract Companion {
    function makeContact(address hero) external {
           (bool success, ) = hero.call("0x12345678");
        require(success);
    }
}
