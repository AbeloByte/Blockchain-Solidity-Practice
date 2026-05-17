// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/BallotCollection.sol";

contract BallotCollectionTest is Test {
    BallotCollection public myBallotCollection;
    address votingAddr = address(2);

    function setUp() public {
        vm.startPrank(votingAddr);
        myBallotCollection = new BallotCollection();
    }

    function testVoteYes() public {
        myBallotCollection.castBallot(BallotCollection.Choices.Affirmative);
        (BallotCollection.Choices choice, address voter) = myBallotCollection.ballotRecords(0);
        assertEq(uint(choice), uint(BallotCollection.Choices.Affirmative), "it should set the vote to Affirmative");
        assertEq(voter, votingAddr, "it should set the voter to the msg.sender");
    }

    function testVoteNo() public {
        myBallotCollection.castBallot(BallotCollection.Choices.Negative);
        (BallotCollection.Choices choice, address voter) = myBallotCollection.ballotRecords(0);
        assertEq(uint(choice), uint(BallotCollection.Choices.Negative), "it should set the vote to Negative");
        assertEq(voter, votingAddr, "it should set the voter to the msg.sender");
    }
}
