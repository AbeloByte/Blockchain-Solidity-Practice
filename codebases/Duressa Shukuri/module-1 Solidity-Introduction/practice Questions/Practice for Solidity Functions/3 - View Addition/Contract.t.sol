// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/ReadAddition.sol";

contract ReadAdditionTest is Test {
    ReadAddition public myReadAddition;

    function setUp() public {
        myReadAddition = new ReadAddition(5);
    }

    function testConstructor() public {
        assertEq(myReadAddition.storedNumber(), 5);
    }

    function testIncrement() public {
        myReadAddition.stepUp();
        assertEq(myReadAddition.storedNumber(), 6);
    }

    function verifyComputeSum() public {
        uint y = myReadAddition.computeSum(5);
        assertEq(y, 10, "it should return the sum");
        assertEq(myReadAddition.storedNumber(), 5, "it should not affect storedNumber");
    }
}
