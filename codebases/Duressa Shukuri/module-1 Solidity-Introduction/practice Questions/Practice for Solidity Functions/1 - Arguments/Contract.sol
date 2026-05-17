// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract InputParameters {
    uint public storedValue;

    constructor(uint _storedValue) {
        storedValue = _storedValue;
    }

     function stepUp() external {
        storedValue += 1;
    }

    function calculateSum(uint _addend) external view returns (uint) {
        return storedValue + _addend;
    }
}
