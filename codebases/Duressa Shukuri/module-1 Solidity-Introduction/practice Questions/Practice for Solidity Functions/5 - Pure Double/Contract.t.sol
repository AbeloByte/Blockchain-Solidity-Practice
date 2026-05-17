// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/PureMultiplier.sol";

contract PureMultiplierTest is Test {
    PureMultiplier public myPureMultiplier;

    function setUp() public {
        myPureMultiplier = new PureMultiplier();
    }

    function verifyTwice() public {
        assertEq(myPureMultiplier.twice(2), 4);
        assertEq(myPureMultiplier.twice(4), 8);
    }
}
