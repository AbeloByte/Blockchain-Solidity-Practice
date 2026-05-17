// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

contract BallotMemory {
	 enum Choices { Affirmative, Negative }

    struct Ballot {
        Choices choice;
        address voter;
    }

    function castBallot(Choices choice)
        external
        view
        returns (Ballot memory)
    {
        return Ballot(choice, msg.sender);
    }
}
