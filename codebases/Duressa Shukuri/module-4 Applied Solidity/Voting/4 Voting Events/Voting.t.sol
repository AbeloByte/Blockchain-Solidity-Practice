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
    }

    function verifyProposalCreation() public {
        vm.recordLogs();

        electionSystem.submitMeasure(_target, _data);

        Vm.Log[] memory entries = vm.getRecordedLogs();

        assertEq(entries.length, 1, "there should only be one event emitted");
        assertEq(entries[0].topics[0], keccak256("MeasureCreated(uint256)"), "the first topic should be the name of the event, MeasureCreated(uint256)");
        assertEq(abi.decode(entries[0].data, (uint)), 0, "the data in the event should be the proposal id, 0");
    }

    function testVote() public {
        electionSystem.submitMeasure(_target, _data);

        vm.recordLogs();

        address voter = address(2);
        vm.startPrank(voter);
        electionSystem.submitBallot(0, true);
        electionSystem.submitBallot(0, true);

        Vm.Log[] memory entries = vm.getRecordedLogs();

        assertEq(entries.length, 2, "there should be two vote cast events emitted");
        assertEq(entries[1].topics[0], keccak256("BallotCast(uint256,address)"), "the first topic should be the name of the event, BallotCast(uint256,address)");
    }
}
