// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/InputParameters.sol";

contract InputParametersTest is Test {
    InputParameters public myInputParameters;

    function setUp() public {
        myInputParameters = new InputParameters(5);
    }

    function verifySetup() public {
        assertEq(myInputParameters.storedValue(), 5);
    }
}
