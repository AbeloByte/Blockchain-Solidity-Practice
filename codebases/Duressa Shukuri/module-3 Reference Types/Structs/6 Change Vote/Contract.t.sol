// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/RevisedBallotSelection.sol";

contract RevisedBallotSelectionTest is Test {
    RevisedBallotSelection public myRevisedBallotSelection;
    address votingAddr = address(2);

    function setUp() public {
        vm.startPrank(votingAddr);
        myRevisedBallotSelection = new RevisedBallotSelection();
    }

    function testVoteTwiceRevert() public {
        myRevisedBallotSelection.castBallot(RevisedBallotSelection.Choices.Affirmative);
        vm.expectRevert();
        myRevisedBallotSelection.castBallot(RevisedBallotSelection.Choices.Affirmative);
    }

    function testVoteChange() public {
        myRevisedBallotSelection.castBallot(RevisedBallotSelection.Choices.Negative);
        RevisedBallotSelection.Choices choice = myRevisedBallotSelection.findChoice(votingAddr);
        assertEq(uint(choice), uint(RevisedBallotSelection.Choices.Negative));

        myRevisedBallotSelection.reviseBallot(RevisedBallotSelection.Choices.Affirmative);
        choice = myRevisedBallotSelection.findChoice(votingAddr);
        assertEq(uint(choice), uint(RevisedBallotSelection.Choices.Affirmative));
    }
}
