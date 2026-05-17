// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/ElectionSystem.sol";

contract ElectionSystemTest is Test {
    ElectionSystem public electionSystem;
    bytes public _data = abi.encodePacked(bytes2(0x1337));
    address _target = address(1337);
    address member1 = address(2);
    address member2 = address(3);
    address nonMember = address(4);
    address[] authorizedElectors;

    function setUp() public {
        authorizedElectors.push(member1);
        authorizedElectors.push(member2);
        electionSystem = new ElectionSystem(authorizedElectors);
        electionSystem.submitMeasure(_target, _data);

        vm.prank(member1);
        electionSystem.submitBallot(0, true);
        vm.prank(member2);
        electionSystem.submitBallot(0, true);
    }

    function verifyProposalCreation() public {
        (,, uint yesCount, uint noCount) = electionSystem.measures(0);
        assertEq(yesCount, 2);
        assertEq(noCount, 0);
    }

    function testVoteNonMember() public {
        vm.prank(nonMember);
        vm.expectRevert();
        electionSystem.submitBallot(0, true);
    }
}
