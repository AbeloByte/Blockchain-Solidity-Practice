// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

contract StaticArraySum {
       function calculateSum(uint[5] memory itemsList) external pure returns (uint) {
        uint total = 0;

        for (uint i = 0; i < 5; i++) {
            total += itemsList[i];
        }

        return total;
    }
}
