// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract ValueStepper {
    uint public counter;

    constructor(uint _x) {
        counter = _x;
    }

     function increaseByOne() external {
        counter += 1;
    }

    function add(uint _value) external view returns (uint) {
        return counter + _value;
    }
}
