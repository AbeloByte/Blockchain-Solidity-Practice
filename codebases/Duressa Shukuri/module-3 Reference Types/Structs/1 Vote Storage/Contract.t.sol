// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/BallotStorage.sol";

contract BallotStorageTest is Test {
    BallotStorage public myBallotStorage;
    address votingAddr = address(2);

    function setUp() public {
        vm.startPrank(votingAddr);
        myBallotStorage = new BallotStorage();
    }

    function testVoteYes() public {
        myBallotStorage.castBallot(BallotStorage.Choices.Affirmative);
        (BallotStorage.Choices selectionVal, address voter) = myBallotStorage.ballotRecord();
        assertEq(uint(selectionVal), uint(BallotStorage.Choices.Affirmative), "it should set the ballotRecord to Affirmative");
        assertEq(voter, votingAddr, "it should set the voter to the msg.sender");
    }

    function testVoteNo() public {
        myBallotStorage.castBallot(BallotStorage.Choices.Negative);
        (BallotStorage.Choices selectionVal, address voter) = myBallotStorage.ballotRecord();
        assertEq(uint(selectionVal), uint(BallotStorage.Choices.Negative), "it should set the ballotRecord to Negative");
        assertEq(voter, votingAddr, "it should set the voter to the msg.sender");
    }
}
