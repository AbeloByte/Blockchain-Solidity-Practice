// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/DeployRollback.sol";

contract DeployRollbackTest is Test {
    DeployRollback public myDeployRollback;

    function testSuccess() public {
        myDeployRollback = new DeployRollback{ value: 1 ether }();
        assertFalse(address(myDeployRollback) == address(0));
    }

    function testFailure() public {
        myDeployRollback = new DeployRollback{ value: 0.5 ether }();
        assertEq(address(myDeployRollback), address(0));
    }
}
