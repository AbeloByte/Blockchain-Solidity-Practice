// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/StaticArraySum.sol";

contract StaticArraySumTest is Test {
    StaticArraySum public myStaticArraySum;

    function setUp() public {
        myStaticArraySum = new StaticArraySum();
    }

    function testSum1() public {
        uint256[5] memory arr = [uint(1), 1, 1, 1, 1];
        assertEq(myStaticArraySum.calculateSum(arr), 5);
    }

    function testSum2() public {
        uint256[5] memory arr = [uint(1), 2, 3, 4, 5];
        assertEq(myStaticArraySum.calculateSum(arr), 15);
    }
}
