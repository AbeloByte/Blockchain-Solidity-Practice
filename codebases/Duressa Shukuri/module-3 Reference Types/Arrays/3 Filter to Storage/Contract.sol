// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

contract PersistentArrayFilter {
    uint[] public evenStorageArray;

    function filterEven(uint[] calldata originalArray) external {
        for (uint i = 0; i < originalArray.length; i++) {
            if (originalArray[i] % 2 == 0) {
                evenStorageArray.push(originalArray[i]);
            }
        }
    }
}
