// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/SingleBallotSelection.sol";

contract SingleBallotSelectionTest is Test {
    SingleBallotSelection public mySingleBallotSelection;
    address votingAddr = address(2);

    function setUp() public {
        vm.startPrank(votingAddr);
        mySingleBallotSelection = new SingleBallotSelection();
    }

    function testVoteYes() public {
        mySingleBallotSelection.castBallot(SingleBallotSelection.Choices.Affirmative);
        assertEq(mySingleBallotSelection.votedBefore(votingAddr), true, "it should register the address as having voted");
        SingleBallotSelection.Choices choice = mySingleBallotSelection.findChoice(votingAddr);
        assertEq(uint(choice), uint(SingleBallotSelection.Choices.Affirmative), "it should find the voting choice for the voter");
    }

    function testVoteNo() public {
        mySingleBallotSelection.castBallot(SingleBallotSelection.Choices.Negative);
        assertEq(mySingleBallotSelection.votedBefore(votingAddr), true, "it should register the address as having voted");
        SingleBallotSelection.Choices choice = mySingleBallotSelection.findChoice(votingAddr);
        assertEq(uint(choice), uint(SingleBallotSelection.Choices.Negative), "it should find the voting choice for the voter");
    }
}
