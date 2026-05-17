// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/PositiveIntegers.sol";

contract PositiveIntegersTest is Test {
    PositiveIntegers public myPositiveIntegers;

    function setUp() public {
        myPositiveIntegers = new PositiveIntegers();
    }

    function testA() public {
        assertLt(myPositiveIntegers.a(), 256);
    }

    function testB() public {
        assertGe(myPositiveIntegers.b(), 256);
    }

    function testSum() public {
        assertEq(myPositiveIntegers.a() + myPositiveIntegers.b(), myPositiveIntegers.sum());
    }
}
