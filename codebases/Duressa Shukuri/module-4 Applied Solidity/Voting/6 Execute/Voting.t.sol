// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/ElectionSystem.sol";

contract Target {
    address public sender;

    function mint() external {
        sender = msg.sender;
    }
}

contract ElectionSystemTest is Test {
    ElectionSystem public electionSystem;
    Target public target;
    address[] authorizedElectors;

    function setUp() public {
        target = new Target();

        for(uint160 i = 2; i <= 11; i++) {
            authorizedElectors.push(address(i));
        }
        electionSystem = new ElectionSystem(authorizedElectors);
        electionSystem.submitMeasure(address(target), abi.encodeWithSignature("mint()"));

        for(uint160 i = 2; i <= 10; i++) {
            vm.prank(address(i));
            electionSystem.submitBallot(0, true);
        }
    }

    function testStateBefore() public {
        assertEq(target.sender(), address(0), "the target should not have been called until 10 supporting votes");
    }

    function testStateAfter() public {
        vm.prank(address(11));
        electionSystem.submitBallot(0, true);
        assertEq(target.sender(), address(electionSystem), "the proposal should have been executed after 10 supporting votes");
    }
}
