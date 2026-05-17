// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

contract DynamicArraySum {
      function calculateSum(uint[] calldata dynamicItems) external pure returns (uint) {
        uint total = 0;

        for (uint i = 0; i < dynamicItems.length; i++) {
            total += dynamicItems[i];
        }

        return total;
    }
}
