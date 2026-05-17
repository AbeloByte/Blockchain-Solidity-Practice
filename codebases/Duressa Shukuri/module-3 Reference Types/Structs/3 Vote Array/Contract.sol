// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

contract BallotCollection {
	 enum Choices { Affirmative, Negative }

    struct Ballot {
        Choices choice;
        address voter;
    }

    Ballot[] public ballotRecords;

    function castBallot(Choices choice) external {
        ballotRecords.push(Ballot(choice, msg.sender));
    }
}
