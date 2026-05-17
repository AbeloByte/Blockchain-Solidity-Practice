// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract OverloadedMultiplier {
    function twice(uint x) public pure returns (uint) {
        return x * 2;
    }

    function twice(uint x, uint y) external pure returns (uint, uint) {
        return (twice(x), twice(y));
    }
}
