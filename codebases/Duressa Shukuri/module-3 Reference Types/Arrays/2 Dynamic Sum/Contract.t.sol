// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/DynamicArraySum.sol";

contract DynamicArraySumTest is Test {
    DynamicArraySum public myDynamicArraySum;
    uint256[] arr;

    function setUp() public {
        myDynamicArraySum = new DynamicArraySum();
    }

    function testSum1() public {
        arr.push(5);
        assertEq(myDynamicArraySum.calculateSum(arr), 5);
    }

    function testSum2() public {
        arr.push(1);
        arr.push(1);
        arr.push(1);
        assertEq(myDynamicArraySum.calculateSum(arr), 3);
    }

    function testSum3() public {
        arr.push(5);
        arr.push(5);
        arr.push(5);
        arr.push(5);
        arr.push(5);
        assertEq(myDynamicArraySum.calculateSum(arr), 25);
    }
}
