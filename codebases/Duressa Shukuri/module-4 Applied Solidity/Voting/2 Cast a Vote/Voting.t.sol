// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/ElectionSystem.sol";

contract ElectionSystemTest is Test {
    ElectionSystem public electionSystem;
     bytes public _data = abi.encodePacked(bytes2(0x1337));
    address _target = address(1337);

    function setUp() public {
        electionSystem = new ElectionSystem();
        electionSystem.submitMeasure(_target, _data);
        electionSystem.submitBallot(0, true);
        electionSystem.submitBallot(0, true);
        electionSystem.submitBallot(0, false);
    }

    function verifyProposalCreation() public {
        (address target, bytes memory data, uint yesCount, uint noCount) = electionSystem.measures(0);
        assertEq(target, _target);
        assertEq(data, _data);
        assertEq(yesCount, 2);
        assertEq(noCount, 1);
    }
}
