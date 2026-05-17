// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract ReadAddition {
    uint public storedNumber;

    constructor(uint _x) {
        storedNumber = _x;
    }

     function stepUp() external {
        storedNumber += 1;
    }

    function computeSum(uint _addend) external view returns (uint) {
        return storedNumber + _addend;
    }
}
