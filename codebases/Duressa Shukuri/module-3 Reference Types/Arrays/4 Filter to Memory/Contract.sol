// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

contract VolatileArrayFilter {
      function filterEven(uint[] calldata originalArray)
        external
        pure
        returns (uint[] memory)
    {
        uint count = 0;

        // Count even originalArray
        for (uint i = 0; i < originalArray.length; i++) {
            if (originalArray[i] % 2 == 0) {
                count++;
            }
        }

        // Create memory array with exact size
        uint[] memory evens = new uint[](count);

        uint index = 0;

        // Fill array with even originalArray
        for (uint i = 0; i < originalArray.length; i++) {
            if (originalArray[i] % 2 == 0) {
                evens[index] = originalArray[i];
                index++;
            }
        }

        return evens;
    }
}
