// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/ValueStepper.sol";

contract ValueStepperTest is Test {
    ValueStepper public myValueStepper;

    function setUp() public {
        myValueStepper = new ValueStepper(5);
    }

    function testConstructor() public {
        assertEq(myValueStepper.counter(), 5);
    }

    function verifyIncrease() public {
        myValueStepper.increaseByOne();
        assertEq(myValueStepper.counter(), 6);
    }
}
