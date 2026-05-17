// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/BallotMemory.sol";

contract BallotMemoryTest is Test {
    BallotMemory public myBallotMemory;
    address votingAddr = address(2);

    function setUp() public {
        vm.startPrank(votingAddr);
        myBallotMemory = new BallotMemory();
    }

    function testVoteYes() public {
        BallotMemory.Ballot memory vote = myBallotMemory.castBallot(BallotMemory.Choices.Affirmative);
        assertEq(uint(vote.choice), uint(BallotMemory.Choices.Affirmative), "it should set the vote to Affirmative");
        assertEq(vote.voter, votingAddr, "it should set the voter to the msg.sender");
    }

    function testVoteNo() public {
        BallotMemory.Ballot memory vote = myBallotMemory.castBallot(BallotMemory.Choices.Negative);
        assertEq(uint(vote.choice), uint(BallotMemory.Choices.Negative), "it should set the vote to Negative");
        assertEq(vote.voter, votingAddr, "it should set the voter to the msg.sender");
    }
}
