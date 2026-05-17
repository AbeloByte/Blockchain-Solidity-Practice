// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

contract BallotStorage {
	enum Choices { Affirmative, Negative }

    struct Ballot {
        Choices selectionVal;
        address voter;
    }

    Ballot public ballotRecord;

    function castBallot(Choices selectionVal) external {
        ballotRecord = Ballot(selectionVal, msg.sender);
    }
}
