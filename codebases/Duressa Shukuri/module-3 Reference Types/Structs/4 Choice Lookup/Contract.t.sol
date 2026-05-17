// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/BallotOptionLookup.sol";

contract BallotOptionLookupTest is Test {
    BallotOptionLookup public myBallotOptionLookup;
    address votingAddr = address(2);

    function setUp() public {
        vm.startPrank(votingAddr);
        myBallotOptionLookup = new BallotOptionLookup();
    }

    function testVoteYes() public {
        myBallotOptionLookup.castBallot(BallotOptionLookup.Choices.Affirmative);
        assertEq(myBallotOptionLookup.hasVoted(votingAddr), true, "it should register the address as having voted");
        BallotOptionLookup.Choices choice = myBallotOptionLookup.locateSelection(votingAddr);
        assertEq(uint(choice), uint(BallotOptionLookup.Choices.Affirmative), "it should find the voting choice for the voter");
    }

    function testVoteNo() public {
        myBallotOptionLookup.castBallot(BallotOptionLookup.Choices.Negative);
        assertEq(myBallotOptionLookup.hasVoted(votingAddr), true, "it should register the address as having voted");
        BallotOptionLookup.Choices choice = myBallotOptionLookup.locateSelection(votingAddr);
        assertEq(uint(choice), uint(BallotOptionLookup.Choices.Negative), "it should find the voting choice for the voter");
    }
}
