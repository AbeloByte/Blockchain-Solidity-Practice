// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/TruthValues.sol";

contract TruthValuesTest is Test {
    TruthValues public myTruthValues;

    function setUp() public {
        myTruthValues = new TruthValues();
    }

    function verifyLogicalStates() public {
        assertEq(myTruthValues.isTrueValue(), true);
        assertEq(myTruthValues.isFalseValue(), false);
    }
}
