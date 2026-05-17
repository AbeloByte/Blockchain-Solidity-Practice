// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/OverloadedMultiplier.sol";

contract OverloadedMultiplierTest is Test {
    OverloadedMultiplier public myOverloadedMultiplier;

    function setUp() public {
        myOverloadedMultiplier = new OverloadedMultiplier();
    }

    function testDouble() public {
        assertEq(myOverloadedMultiplier.twice(2), 4);
        assertEq(myOverloadedMultiplier.twice(4), 8);
    }

    function testDoubleWithTwoParams() public {
        (uint x, uint y) = myOverloadedMultiplier.twice(2, 2);
        assertEq(x, 4);
        assertEq(y, 4);

        (uint x2, uint y2) = myOverloadedMultiplier.twice(5, 10);
        assertEq(x2, 10);
        assertEq(y2, 20);
    }
}
